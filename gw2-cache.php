<?php

require_once "/home/jonrc/GuildWars2/linkshell-variables.php";
require_once "/home/jonrc/GuildWars2/MySQL.php";

class Gw2Cache
{
    var $mysql;
    var $item_types;

    function Gw2Cache($mysql)
    {
        $this->mysql = $mysql;
		$this->item_types = $this->LoadItemTypes();
    }

	function LoadItemTypes()
	{
		if (! $this->mysql ) return null;
        $result = $this->mysql->query("SELECT * FROM gw2_item_types;");
		if ( null == $result )
		{
			$this->mysql->printError();
			return null;
		}
		$type_to_id_mapping = array();
		while ( $row = $result->fetch() )
		{
			$type_to_id_mapping[$row['type_name']] = $row['id'];
		}
		return $type_to_id_mapping;
	}

	function RunQuery($query)
	{
		if (! $this->mysql ) return null;
		$result = $this->mysql->query($query);
		if ( null == $result )
		{
			$this->mysql->printError();
		}
		return $result;
	}

	function InsertQuery($query)
	{
		//echo 'Calling: <PRE>'.$query."</PRE>";
		return $this->RunQuery($query);
	}
    function IsItemCached($itemId)
	{
        if ( !isset($itemId) || $itemId < 1 )
        {
            return false;
        }
		$result = $this->RunQuery("SELECT id FROM gw2_item WHERE id=".$itemId.";");
		if ( null == $result ) return false;
		$row = $result->fetch();
		if (! $row ) return false;
		return ( $row['id'] == $itemId );
	}
	function IsSkinCached($skinId)
	{
        if ( !isset($skinId) || $skinId < 1 )
        {
            return false;
        }
		$result = $this->RunQuery("SELECT id from gw2_skin WHERE id=".$skinId.";");
		if ( null == $result ) return false;
		$row = $result->fetch();
		if (! $row ) return false;
		return ( $row['id'] == $skinId );
	}

    function LoadItem($itemId)
    {
		$result = $this->RunQuery("SELECT *,gw2_item_types.type_name as type FROM gw2_item INNER JOIN (gw2_item_rarity, gw2_item_types) ON (gw2_item.item_rarity=gw2_item_rarity.id AND gw2_item.item_type=gw2_item_types.id) WHERE gw2_item.id=".$itemId.";");
		if ( null == $result ) return false;
		$row = $result->fetch();
		// should translate things back as appropriate

		return $row;
    }

	function LoadSkin($skinId)
	{
		$result = $this->RunQuery("SELECT * FROM gw2_skin WHERE id=".$skinId.";");
		if ( null == $result ) return false;
		$row = $result->fetch();
		// Should translate skin type and flags
		return $row;
	}

    function DetermineItemTypeId($item_type)
	{
		$result = $this->RunQuery("SELECT id FROM gw2_item_types WHERE type_name = '".$item_type."';");
		if ( null == $result ) return false;
		$row = $result->fetch();
		if (! $row ) return false;
		return $row['id'];
	}

    function DetermineItemRarityId($item_rarity)
	{
		$result = $this->RunQuery("SELECT id FROM gw2_item_rarity WHERE rarity = '".$item_rarity."';");
		if (null == $result ) return false;
		$row = $result->fetch();
		if (! $row ) return false;
		return $row['id'];
	}

	function DetermineItemFlag($item_flag)
	{
		$result = $this->RunQuery("SELECT id FROM gw2_item_flags WHERE flag = '".$item_flag."';");
		if ( null == $result ) return false;
		$row = $result->fetch();
		if (! $row ) return false;
		return $row['id'];
	}

	function DetermineItemFlags($item_flags)
	{
		$overallflags = 0;
		foreach ($item_flags as $item_flag)
		{
			$overallflags = $overallflags | $this->DetermineItemFlag($item_flag);
		}
		return $overallflags;
	}

	function DetermineItemGameType($game_type)
	{
		$result = $this->RunQuery("SELECT id FROM gw2_game_types WHERE game_type = '".$game_type."';");
		if ( null == $result ) return false;
		$row = $result->fetch();
		if (! $row ) return false;
		return $row['id'];
	}

	function DetermineItemGameTypes($game_types)
	{
		$overallGameTypes = 0;
		foreach ($game_types as $game_type)
		{
			$overallGameTypes = $overallGameTypes | $this->DetermineItemGameType($game_type);
		}
		return $overallGameTypes;
	}

	function DetermineItemRestriction($restriction)
	{
		$result = $this->RunQuery("SELECT id FROM gw2_item_restrictions WHERE name = '".$restriction."';");
		if ( null == $result ) return false;
		$row = $result->fetch();
		if (! $row ) return false;
		return $row['id'];
	}

    function DetermineArmorSlot($armor_type)
	{
		$result = $this->RunQuery("SELECT id FROM gw2_armor_type WHERE name='".mysql_real_escape_string($armor_type)."';");
		if ( null == $result ) return false;
		$row = $result->fetch();
		if (! $row ) return false;
		return $row['id'];
	}

    function DetermineArmorWeightClass($armor_weight_class)
	{
		$result = $this->RunQuery("SELECT id FROM gw2_armor_weight_class WHERE name='".mysql_real_escape_string($armor_weight_class)."';");
		if ( null == $result ) return false;
		$row = $result->fetch();
		if (! $row ) return false;
		return $row['id'];
	}

	function DetermineItemRestrictions($restrictions)
	{
		$overallRestrictions = 0;
		foreach ($restrictions as $restriction)
		{
			$overallRestrictions = $overallRestrictions | $this->DetermineItemGameType($restriction);
		}
		return $overallRestrictions;
	}

    function StoreItem($item)
    {
        if ( $this->IsItemCached($item['id']) ) { return true; }
        if (! $this->mysql ) return false;
		$item_type_id = $this->DetermineItemTypeId($item['type']);
		if (! $item_type_id ) return false;
		$item_rarity_id = $this->DetermineItemRarityId($item['rarity']);
		if (! $item_rarity_id ) return false;
		$item_flags = $this->DetermineItemFlags($item['flags']);
		$item_game_types = $this->DetermineItemGameTypes($item['game_types']);
		$item_restrictions = $this->DetermineItemRestrictions($item['restrictions']);
		$result = $this->RunQuery("START TRANSACTION;");

		$query = "INSERT INTO gw2_item SET "
		        ."id=".$item['id']
				.",item_type=".$item_type_id
				.",chat_link='".mysql_real_escape_string($item['chat_link'])."'"
				.",name='".mysql_real_escape_string($item['name'])."'"
				.",icon='".mysql_real_escape_string($item['icon'])."'"
				.",item_rarity=".$item_rarity_id
				.",vendor_value=".$item['vendor_value']
				.",game_types=".$item_game_types
				.",restrictions=".$item_restrictions;
		if ( isset($item['default_skin']) )
		{
			$query = $query
			       .",default_skin=".$item['default_skin'];
		}
		if ( isset($item['description']) )
		{
			$query = $query
			       .",description='".mysql_real_escape_string($item['description'])."'";
		}
		$result = $this->InsertQuery($query);
		if ( null == $result )
		{
			$this->RunQuery("ROLLBACK;");
			return false;
		}
		if ( $item['type'] == 'Armor' )
		{
			$slot = $this->DetermineArmorSlot($item['details']['type']);
			if (! $slot ) { $this->RunQuery("ROLLBACK"); return false; }
			$weight = $this->DetermineArmorWeightClass($item['details']['weight_class']);
			if (! $weight ) { $this->RunQuery("ROLLBACK"); return false; }
			$query = "INSERT INTO gw2_item_armor SET"
			        ." id=".$item['id']
					.",slot=".$slot
					.",weight=".$weight
					.",defense=".$item['details']['defense'];
			if ( isset($item['details']['suffix_item_id']) )
			{
				$query = $query
				       .",suffix_item_id=".$item['details']['suffix_item_id'];
			}
			if ( isset($item['details']['secondary_suffix_item_id']) )
			{
				$query = $query
				       .",secondary_suffix_item_id='".mysql_real_escape_string($item['details']['secondary_suffix_item_id'])."'";
			}
			$result = $this->InsertQuery($query);
			if ( null == $result )
			{
				$this->RunQuery("ROLLBACK;");
				return false;
			}
		}
		$this->RunQuery("COMMIT;");
		return true;
    }

    function DetermineSkinType($type)
    {
		$result = $this->RunQuery("SELECT id FROM gw2_skin_type WHERE name = '".$type."';");
		if ( null == $result ) return false;
		$row = $result->fetch();
		if (! $row ) return false;
		return $row['id'];
    }

    function DetermineSkinFlag($skin_flag)
    {
		$result = $this->RunQuery("SELECT id FROM gw2_skin_type WHERE name = '".$type."';");
		if ( null == $result ) return false;
		$row = $result->fetch();
		if (! $row ) return false;
		return $row['id'];
    }

    function DetermineSkinFlags($skin_flags)
    {
        $result_flags = 0;
        foreach ($skin_flags as $skin_flag)
        {
            $result_flags |= $this->DetermineSkinFlag($skin_flag);
        }
        return $result_flags;
    }

	function StoreSkin($skin)
	{
        if ( $this->IsItemCached($item['id']) ) { return true; }
        if (! $this->mysql ) return false;
		$item_rarity_id = $this->DetermineItemRarityId($skin['rarity']);
        if (! $item_rarity_id ) return false;
        $skin_type = $this->DetermineSkinType($skin['type']);
        if (! $skin_type ) return false;
        $skin_flags = $this->DetermineSkinFlags($skin['flags']);
        $skin_restrictions = $this->DetermineItemRestrictions($skin['restrictions']);
        $query = "INSERT INTO gw2_skin SET"
                ." id=".$skin['id']
                .",name='".mysql_real_escape_string($skin['name'])."'"
                .",skin_type=".$skin_type
                .",flags=".$skin_flags
                .",restrictions=".$skin_restrictions
                .",icon='".mysql_real_escape_string($skin['icon'])."'"
                .",rarity=".$item_rarity_id;
        if ( isset($skin['description']) )
        {
            $query = $query
                    .",description='".mysql_real_escape_string($skin['description'])."'";
        }
        $result = $this->InsertQuery($query);
        if ( null == $result )
        {
            return false;
        }
        return true;
	}
}

?>
