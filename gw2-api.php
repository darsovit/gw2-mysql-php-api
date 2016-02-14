<?php

require_once "/home/jonrc/GuildWars2/linkshell-variables.php";

class Gw2Api
{
    const baseApi1 = "https://api.guildwars2.com/v1/";
    const baseApi2 = "https://api.guildwars2.com/v2/";
	var $gw2cache;

    function Gw2Api($gw2cache)
	{
		$this->gw2cache = $gw2cache;
	}

    static function getApiOutput($url)
    {
    	$apiOutput = fopen($url, "r");
    	if (! $apiOutput )
    	{
    		return false;
    	}
    
    	$item_content = "";
    	while (! feof($apiOutput) )
    	{
    		$item_content .= fgets($apiOutput);
    	}
    	fclose($apiOutput);
    	return json_decode($item_content, true);
    }
    
    static function getItemsApi()
    {
    	return self::baseApi2."items";
    }
    
    static function getItemApi($itemId)
    {
    	return self::baseApi2."items/".$itemId;
    }
   
    static function getSkinApi($skinId)
	{
		return self::baseApi2."skins/".$skinId;
	}

    function getItemInfo($itemId)
    {
		$itemInfo = $this->gw2cache->LoadItem($itemId);
		if ( !$itemInfo )
		{
		    $itemInfo = self::getApiOutput( self::getItemApi($itemId) );
			$this->gw2cache->StoreItem($itemInfo);
		}
    	return $itemInfo;
    }

	function getSkinInfo($skinId)
	{
		$skinInfo = $this->gw2cache->LoadSkin($skinId);
		if ( !$skinInfo )
		{
			$skinInfo = self::getApiOutput( self::getSkinApi($skinId) );
			$this->gw2cache->StoreSkin($skinInfo);
		}
		return $skinInfo;
	}
}

?>
