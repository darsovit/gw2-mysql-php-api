pragma foreign_key=ON;
drop table gw2_weapon_skin;
drop table gw2_armor_skin;
drop table gw2_skin;
drop table gw2_skin_type;
drop table gw2_skin_flags;

drop table gw2_item_infusion_slots;
drop table gw2_item_infusion_slot;
drop table gw2_item_infusion_flags;
drop table gw2_item_infix_upgrade_attributes;
drop table gw2_item_infix_upgrade;
drop table gw2_infix_buff;
drop table gw2_infix_attribute;
drop table gw2_infix_attribute_types;
drop table gw2_item_weapon;
drop table gw2_weapon_dmg_type;
drop table gw2_weapon_type;
drop table gw2_item_upgrade_bonuses;
drop table gw2_upgrade_bonuses;
drop table gw2_item_upgrades;
drop table gw2_upgrade_infusion_flags;
drop table gw2_upgrade_flags;
drop table gw2_upgrade_type;
drop table gw2_item_trinket;
drop table gw2_trinket_type;
drop table gw2_item_salvage_kits;
drop table gw2_item_miniature;
drop table gw2_item_gizmo;
drop table gw2_gizmo_type;
drop table gw2_item_gathering;
drop table gw2_gathering_type;
drop table gw2_item_container;
drop table gw2_container_type;
drop table gw2_item_consumable;
drop table gw2_consumable_unlock_type;
drop table gw2_consumable_type;
drop table gw2_item_bag;
drop table gw2_item_back;
drop table gw2_item_armor;
drop table gw2_armor_weight_class;
drop table gw2_armor_type;
drop table gw2_item;
drop table gw2_item_restrictions;
drop table gw2_game_types;
drop table gw2_item_flags;
drop table gw2_item_rarity;
drop table gw2_item_types;
drop table gw2_build;

SELECT 'DONE DROPPING ROWS' AS '';

create table gw2_build (
	id INTEGER NOT NULL PRIMARY KEY
);

create table gw2_item_types
(
	id INTEGER NOT NULL,
	type_name TEXT NOT NULL,
	display_name TEXT NOT NULL,
	PRIMARY KEY (id)
);
BEGIN;
INSERT INTO gw2_item_types(type_name,display_name) VALUES("Armor","Armor");
INSERT INTO gw2_item_types(type_name,display_name) VALUES("Back", "Back item");
INSERT INTO gw2_item_types(type_name,display_name) VALUES("Bag","Bag");
INSERT INTO gw2_item_types(type_name,display_name) VALUES("Consumable","Consumable");
INSERT INTO gw2_item_types(type_name,display_name) VALUES("Container","Container");
INSERT INTO gw2_item_types(type_name,display_name) VALUES("CraftingMaterial", "Crafting Material");
INSERT INTO gw2_item_types(type_name,display_name) VALUES("Gathering", "Gathering tool");
INSERT INTO gw2_item_types(type_name,display_name) VALUES("Gizmo","Gizmo");
INSERT INTO gw2_item_types(type_name,display_name) VALUES("MiniPet", "Miniature");
INSERT INTO gw2_item_types(type_name,display_name) VALUES("Tool", "Salvage kit");
INSERT INTO gw2_item_types(type_name,display_name) VALUES("Trait", "Trait guide");
INSERT INTO gw2_item_types(type_name,display_name) VALUES("Trinket","Trinket");
INSERT INTO gw2_item_types(type_name,display_name) VALUES("Trophy","Trophy");
INSERT INTO gw2_item_types(type_name,display_name) VALUES("UpgradeComponent","Upgrade Component");
INSERT INTO gw2_item_types(type_name,display_name) VALUES("Weapon","Weapon");
COMMIT;

create table gw2_item_rarity
(
	id INTEGER NOT NULL,
	rarity TEXT NOT NULL,
	color TEXT NOT NULL,
	PRIMARY KEY (id)
);

BEGIN;
INSERT INTO gw2_item_rarity(rarity,color) VALUES("Junk","Grey");
INSERT INTO gw2_item_rarity(rarity,color) VALUES("Basic","White");
INSERT INTO gw2_item_rarity(rarity,color) VALUES("Fine","Blue");
INSERT INTO gw2_item_rarity(rarity,color) VALUES("Masterwork","Green");
INSERT INTO gw2_item_rarity(rarity,color) VALUES("Rare","Yellow");
INSERT INTO gw2_item_rarity(rarity,color) VALUES("Exotic","Orange");
INSERT INTO gw2_item_rarity(rarity,color) VALUES("Ascended","Pink");
INSERT INTO gw2_item_rarity(rarity,color) VALUES("Legendary","Purple");
COMMIT;

create table gw2_item_flags
(
	id INTEGER NOT NULL,
	flag TEXT NOT NULL,
	PRIMARY KEY (id)
);
BEGIN;
INSERT INTO gw2_item_flags VALUES(1,"AccountBindOnUse");
INSERT INTO gw2_item_flags VALUES(2,"AccountBound");
INSERT INTO gw2_item_flags VALUES(4,"HideSuffix");
INSERT INTO gw2_item_flags VALUES(8,"MonsterOnly");
INSERT INTO gw2_item_flags VALUES(16,"NoMysticForge");
INSERT INTO gw2_item_flags VALUES(32,"NoSalvage");
INSERT INTO gw2_item_flags VALUES(64,"NoSell");
INSERT INTO gw2_item_flags VALUES(128,"NotUpgradeable");
INSERT INTO gw2_item_flags VALUES(256,"NoUnderwater");
INSERT INTO gw2_item_flags VALUES(512,"SoulbindOnAcquire");
INSERT INTO gw2_item_flags VALUES(1024,"SoulBindOnUse");
INSERT INTO gw2_item_flags VALUES(2048,"Unique");
COMMIT;

create table gw2_game_types
(
	id INTEGER NOT NULL,
	game_type TEXT NOT NULL,
	description TEXT NOT NULL,
	PRIMARY KEY (id)
);
BEGIN;
INSERT INTO gw2_game_types VALUES(1,"Activity","Activities");
INSERT INTO gw2_game_types VALUES(2,"Dungeon","Dungeon");
INSERT INTO gw2_game_types VALUES(4,"Pve","PvE");
INSERT INTO gw2_game_types VALUES(8,"Pvp","PvP");
INSERT INTO gw2_game_types VALUES(16,"PvpLobby","Heart of the Mists");
INSERT INTO gw2_game_types VALUES(32,"Wvw","WvW");
COMMIT;

CREATE TABLE gw2_item_restrictions
(
	id INTEGER NOT NULL,
	name TEXT NOT NULL,
	PRIMARY KEY (id)
);
BEGIN;
INSERT INTO gw2_item_restrictions VALUES(1,   "Asura");
INSERT INTO gw2_item_restrictions VALUES(2,   "Charr");
INSERT INTO gw2_item_restrictions VALUES(4,   "Human");
INSERT INTO gw2_item_restrictions VALUES(8,   "Norn");
INSERT INTO gw2_item_restrictions VALUES(16,  "Sylvari");
INSERT INTO gw2_item_restrictions VALUES(32,  "Elementalist");
INSERT INTO gw2_item_restrictions VALUES(64,  "Engineer");
INSERT INTO gw2_item_restrictions VALUES(128, "Guardian");
INSERT INTO gw2_item_restrictions VALUES(256, "Mesmer");
INSERT INTO gw2_item_restrictions VALUES(512, "Necromancer");
INSERT INTO gw2_item_restrictions VALUES(1024,"Ranger");
INSERT INTO gw2_item_restrictions VALUES(2048,"Thief");
INSERT INTO gw2_item_restrictions VALUES(4096,"Warrior");
COMMIT;

create table gw2_item (
	id INTEGER NOT NULL,
	item_type INTEGER NOT NULL,
	chat_link TEXT NOT NULL,
	name TEXT NOT NULL,
	icon TEXT NOT NULL,
	item_rarity INTEGER NOT NULL,
	item_level INTEGER NOT NULL,
	vendor_value INTEGER NOT NULL,
	game_types INTEGER NOT NULL,
	restrictions INTEGER NOT NULL,
	default_skin INTEGER,
	description TEXT,
	PRIMARY KEY (id),
	FOREIGN KEY (item_type) REFERENCES gw2_item_types(id),
	FOREIGN KEY (item_rarity) REFERENCES gw2_item_rarity(id)
);

CREATE TABLE gw2_armor_type
(
	id INTEGER NOT NULL,
	name TEXT NOT NULL,
	PRIMARY KEY(id)
);

INSERT INTO gw2_armor_type(name) VALUES('Boots');
INSERT INTO gw2_armor_type(name) VALUES('Coat');
INSERT INTO gw2_armor_type(name) VALUES('Gloves');
INSERT INTO gw2_armor_type(name) VALUES('Helm');
INSERT INTO gw2_armor_type(name) VALUES('HelmAquatic');
INSERT INTO gw2_armor_type(name) VALUES('Leggings');
INSERT INTO gw2_armor_type(name) VALUES('Shoulders');

CREATE TABLE gw2_armor_weight_class
(
	id INTEGER NOT NULL,
	name TEXT NOT NULL,
	PRIMARY KEY(id)
);
INSERT INTO gw2_armor_weight_class(name) VALUES('Heavy');
INSERT INTO gw2_armor_weight_class(name) VALUES('Medium');
INSERT INTO gw2_armor_weight_class(name) VALUES('Light');
INSERT INTO gw2_armor_weight_class(name) VALUES('Clothing');

CREATE TABLE gw2_item_armor
(
	id INTEGER NOT NULL,
    slot INTEGER NOT NULL,
	weight INTEGER NOT NULL,
	defense INTEGER NOT NULL,
	suffix_item_id INTEGER,
	secondary_suffix_item_id TEXT,
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES gw2_item(id),
	FOREIGN KEY (slot) REFERENCES gw2_armor_type(id),
	FOREIGN KEY (weight) REFERENCES gw2_armor_weight_class(id)
);

CREATE TABLE gw2_item_back
(
	id INTEGER NOT NULL,
	suffix_item_id INTEGER,
	secondary_suffix_item_id TEXT,
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES gw2_item(id)
);

CREATE TABLE gw2_item_bag
(
	id INTEGER NOT NULL,
	bag_size INTEGER NOT NULL,
	no_sell_or_sort INTEGER NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES gw2_item(id)
);

CREATE TABLE gw2_consumable_type
(
	id INTEGER NOT NULL,
	name TEXT NOT NULL,
	PRIMARY KEY (id)
);
BEGIN;
INSERT INTO gw2_consumable_type(name) VALUES("AppearanceChange");
INSERT INTO gw2_consumable_type(name) VALUES("Booze");
INSERT INTO gw2_consumable_type(name) VALUES("ContractNpc");
INSERT INTO gw2_consumable_type(name) VALUES("Food");
INSERT INTO gw2_consumable_type(name) VALUES("Generic");
INSERT INTO gw2_consumable_type(name) VALUES("Halloween");
INSERT INTO gw2_consumable_type(name) VALUES("Immediate");
INSERT INTO gw2_consumable_type(name) VALUES("Transmutation");
INSERT INTO gw2_consumable_type(name) VALUES("Unlock");
INSERT INTO gw2_consumable_type(name) VALUES("UpgradeRemoval");
INSERT INTO gw2_consumable_type(name) VALUES("Utility");
INSERT INTO gw2_consumable_type(name) VALUES("TeleportToFriend");
COMMIT;

CREATE TABLE gw2_consumable_unlock_type
(
	id INTEGER NOT NULL,
	name TEXT NOT NULL,
	PRIMARY KEY (id)
);
BEGIN;
INSERT INTO gw2_consumable_unlock_type(name) VALUES("BagSlot");
INSERT INTO gw2_consumable_unlock_type(name) VALUES("BankTab");
INSERT INTO gw2_consumable_unlock_type(name) VALUES("CollectibleCapacity");
INSERT INTO gw2_consumable_unlock_type(name) VALUES("Content");
INSERT INTO gw2_consumable_unlock_type(name) VALUES("CraftingRecipe");
INSERT INTO gw2_consumable_unlock_type(name) VALUES("Dye");
INSERT INTO gw2_consumable_unlock_type(name) VALUES("Outfit");
INSERT INTO gw2_consumable_unlock_type(name) VALUES("GliderSkin");
INSERT INTO gw2_consumable_unlock_type(name) VALUES("Champion");
COMMIT;

CREATE TABLE gw2_item_consumable
(
	id INTEGER NOT NULL,
	type_name INTEGER NOT NULL,
	description TEXT,
	duration_ms int(10),
	unlock_type INTEGER,
	color_id INTEGER,
	recipe_id INTEGER,
	PRIMARY KEY(id),
	FOREIGN KEY (id) REFERENCES gw2_item(id),
	FOREIGN KEY (type_name) REFERENCES gw2_consumable_type(id),
	FOREIGN KEY (unlock_type) REFERENCES gw2_consumable_unlock_type(id)
);

CREATE TABLE gw2_container_type
(
	id INTEGER NOT NULL,
	name TEXT NOT NULL,
	PRIMARY KEY (id)
);
BEGIN;
INSERT INTO gw2_container_type(name) VALUES("Default");
INSERT INTO gw2_container_type(name) VALUES("GiftBox");
INSERT INTO gw2_container_type(name) VALUES("OpenUI");
COMMIT;

CREATE TABLE gw2_item_container
(
	id INTEGER NOT NULL,
	type_name INTEGER NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES gw2_item(id),
	FOREIGN KEY (type_name) REFERENCES gw2_container_type(id)
);

CREATE TABLE gw2_gathering_type
(
	id INTEGER NOT NULL,
	name TEXT NOT NULL,
	PRIMARY KEY (id)
);
BEGIN;
INSERT INTO gw2_gathering_type(name) VALUES("Foraging");
INSERT INTO gw2_gathering_type(name) VALUES("Logging");
INSERT INTO gw2_gathering_type(name) VALUES("Mining");
COMMIT;

CREATE TABLE gw2_item_gathering
(
	id INTEGER NOT NULL,
	type_name INTEGER NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES gw2_item(id),
	FOREIGN KEY (type_name) REFERENCES gw2_gathering_type(id)
);

CREATE TABLE gw2_gizmo_type
(
	id INTEGER NOT NULL,
	name TEXT NOT NULL,
	PRIMARY KEY (id)
);
BEGIN;
INSERT INTO gw2_gizmo_type(name) VALUES("Default");
INSERT INTO gw2_gizmo_type(name) VALUES("ContainerKey");
INSERT INTO gw2_gizmo_type(name) VALUES("RentableContractNpc");
INSERT INTO gw2_gizmo_type(name) VALUES("UnlimitedConsumable");
COMMIT;

CREATE TABLE gw2_item_gizmo
(
	id INTEGER NOT NULL,
	type_name INTEGER NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES gw2_item(id),
	FOREIGN KEY (type_name) REFERENCES gw2_gizmo_type(id)
);

CREATE TABLE gw2_item_miniature
(
	id INTEGER NOT NULL,
	minipet_id INTEGER NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES gw2_item(id)
);

CREATE TABLE gw2_item_salvage_kits
(
	id INTEGER NOT NULL,
	charges INTEGER NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES gw2_item(id)
);

CREATE TABLE gw2_trinket_type
(
	id INTEGER NOT NULL,
	name TEXT NOT NULL,
	PRIMARY KEY (id)
);
BEGIN;
INSERT INTO gw2_trinket_type(name) VALUES("Accessory");
INSERT INTO gw2_trinket_type(name) VALUES("Amulet");
INSERT INTO gw2_trinket_type(name) VALUES("Ring");
COMMIT;

CREATE TABLE gw2_item_trinket
(
	id INTEGER NOT NULL,
	type_name INTEGER NOT NULL,
	suffix_item_id INTEGER,
	secondary_suffix_item_id TEXT,
    PRIMARY KEY (id),
	FOREIGN KEY (id) REFERENCES gw2_item(id),
	FOREIGN KEY (type_name) REFERENCES gw2_trinket_type(id)
);

CREATE TABLE gw2_upgrade_type
(
	id INTEGER NOT NULL,
	name TEXT NOT NULL,
	PRIMARY KEY (id)
);
BEGIN;
INSERT INTO gw2_upgrade_type(name) VALUES("Default");
INSERT INTO gw2_upgrade_type(name) VALUES("Gem");
INSERT INTO gw2_upgrade_type(name) VALUES("Rune");
INSERT INTO gw2_upgrade_type(name) VALUES("Sigil");
COMMIT;

CREATE TABLE gw2_upgrade_flags
(
	id int NOT NULL,
	name TEXT NOT NULL,
	PRIMARY KEY (id)
);
BEGIN;
INSERT INTO gw2_upgrade_flags VALUES(1, "Axe");
INSERT INTO gw2_upgrade_flags VALUES(2, "Dagger");
INSERT INTO gw2_upgrade_flags VALUES(4, "Focus");
INSERT INTO gw2_upgrade_flags VALUES(8, "Greatsword");
INSERT INTO gw2_upgrade_flags VALUES(16,"Hammer");
INSERT INTO gw2_upgrade_flags VALUES(32,"Harpoon");
INSERT INTO gw2_upgrade_flags VALUES(64,"LongBow");
INSERT INTO gw2_upgrade_flags VALUES(128,"Mace");
INSERT INTO gw2_upgrade_flags VALUES(256,"Pistol");
INSERT INTO gw2_upgrade_flags VALUES(512,"Rifle");
INSERT INTO gw2_upgrade_flags VALUES(1024,"Scepter");
INSERT INTO gw2_upgrade_flags VALUES(2048,"Shield");
INSERT INTO gw2_upgrade_flags VALUES(4096,"ShortBow");
INSERT INTO gw2_upgrade_flags VALUES(8192,"Speargun");
INSERT INTO gw2_upgrade_flags VALUES(16384,"Staff");
INSERT INTO gw2_upgrade_flags VALUES(32768,"Sword");
INSERT INTO gw2_upgrade_flags VALUES(65536,"Torch");
INSERT INTO gw2_upgrade_flags VALUES(131072,"Trident");
INSERT INTO gw2_upgrade_flags VALUES(262144,"Warhorn");
INSERT INTO gw2_upgrade_flags VALUES(524288,"HeavyArmor");
INSERT INTO gw2_upgrade_flags VALUES(1048576,"MediumArmor");
INSERT INTO gw2_upgrade_flags VALUES(2097152,"LightArmor");
INSERT INTO gw2_upgrade_flags VALUES(4194304,"Trinket");
COMMIT;

CREATE TABLE gw2_upgrade_infusion_flags
(
	id int NOT NULL,
	name TEXT NOT NULL,
	PRIMARY KEY (id)
);
BEGIN;
INSERT INTO gw2_upgrade_infusion_flags VALUES(1, "Defense");
INSERT INTO gw2_upgrade_infusion_flags VALUES(2, "Offense");
INSERT INTO gw2_upgrade_infusion_flags VALUES(4, "Utility");
INSERT INTO gw2_upgrade_infusion_flags VALUES(8, "Agony");
COMMIT;

CREATE TABLE gw2_item_upgrades
(
	id INTEGER NOT NULL,
    type_name INTEGER NOT NULL,
	flags int(10) NOT NULL,
	infusion_upgrade_flags INTEGER NOT NULL,
	suffix TEXT NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY (id) REFERENCES gw2_item(id),
	FOREIGN KEY (infusion_upgrade_flags) REFERENCES gw2_upgrade_infusion_flags(id)
);

CREATE TABLE gw2_upgrade_bonuses
(
	id INTEGER NOT NULL,
	bonus_from_rune TEXT,
	PRIMARY KEY (id)
);

CREATE TABLE gw2_item_upgrade_bonuses
(
	upgrade_id INT NOT NULL,
	bonus_id INT NOT NULL,
	PRIMARY KEY(upgrade_id,bonus_id),
	FOREIGN KEY(upgrade_id) REFERENCES gw2_item_upgrades(id),
	FOREIGN KEY(bonus_id) REFERENCES gw2_upgrade_bonuses(id)
);

CREATE TABLE gw2_weapon_type
(
	id INTEGER NOT NULL,
	name TEXT NOT NULL,
	PRIMARY KEY(id)
);
BEGIN;
INSERT INTO gw2_weapon_type(name) VALUES("Axe");
INSERT INTO gw2_weapon_type(name) VALUES("Dagger");
INSERT INTO gw2_weapon_type(name) VALUES("Mace");
INSERT INTO gw2_weapon_type(name) VALUES("Pistol");
INSERT INTO gw2_weapon_type(name) VALUES("Scepter");
INSERT INTO gw2_weapon_type(name) VALUES("Sword");
INSERT INTO gw2_weapon_type(name) VALUES("Focus");
INSERT INTO gw2_weapon_type(name) VALUES("Shield");
INSERT INTO gw2_weapon_type(name) VALUES("Torch");
INSERT INTO gw2_weapon_type(name) VALUES("Warhorn");
INSERT INTO gw2_weapon_type(name) VALUES("Greatsword");
INSERT INTO gw2_weapon_type(name) VALUES("Hammer");
INSERT INTO gw2_weapon_type(name) VALUES("LongBow");
INSERT INTO gw2_weapon_type(name) VALUES("Rifle");
INSERT INTO gw2_weapon_type(name) VALUES("ShortBow");
INSERT INTO gw2_weapon_type(name) VALUES("Staff");
INSERT INTO gw2_weapon_type(name) VALUES("Harpoon");
INSERT INTO gw2_weapon_type(name) VALUES("Speargun");
INSERT INTO gw2_weapon_type(name) VALUES("Trident");
INSERT INTO gw2_weapon_type(name) VALUES("LargeBundle");
INSERT INTO gw2_weapon_type(name) VALUES("SmallBundle");
INSERT INTO gw2_weapon_type(name) VALUES("Toy");
INSERT INTO gw2_weapon_type(name) VALUES("TwoHandedToy");
COMMIT;

CREATE TABLE gw2_weapon_dmg_type
(
	id INTEGER NOT NULL,
	name TEXT NOT NULL,
	PRIMARY KEY(id)
);
BEGIN;
INSERT INTO gw2_weapon_dmg_type(name) VALUES("Fire");
INSERT INTO gw2_weapon_dmg_type(name) VALUES("Ice");
INSERT INTO gw2_weapon_dmg_type(name) VALUES("Lightning");
INSERT INTO gw2_weapon_dmg_type(name) VALUES("Physical");
INSERT INTO gw2_weapon_dmg_type(name) VALUES("Choking");
COMMIT;

CREATE TABLE gw2_item_weapon
(
	id INTEGER NOT NULL,
	weapon_type INTEGER NOT NULL,
	weapon_dmg_type INTEGER NOT NULL,
	min_power int NOT NULL,
	max_power int NOT NULL,
	defense   int NOT NULL,
	suffix_item_id int,
	secondary_suffix_item_id int,
	PRIMARY KEY(id),
	FOREIGN KEY(weapon_type) REFERENCES gw2_weapon_type(id),
	FOREIGN KEY(weapon_dmg_type) REFERENCES gw2_weapon_dmg_type(id)
);

CREATE TABLE gw2_infix_attribute_types
(
	id INTEGER NOT NULL,
	name TEXT NOT NULL,
	display TEXT NOT NULL,
	PRIMARY KEY(id)
);
BEGIN;
INSERT INTO gw2_infix_attribute_types(name,display) VALUES("BoonDuration", "Concentration");
INSERT INTO gw2_infix_attribute_types(name,display) VALUES("ConditionDamage", "Condition Damage");
INSERT INTO gw2_infix_attribute_types(name,display) VALUES("CritDamage", "Ferocity");
INSERT INTO gw2_infix_attribute_types(name,display) VALUES("Healing", "Healing Power");
INSERT INTO gw2_infix_attribute_types(name,display) VALUES("Power", "Power");
INSERT INTO gw2_infix_attribute_types(name,display) VALUES("Precision", "Precision");
INSERT INTO gw2_infix_attribute_types(name,display) VALUES("Toughness", "Toughness");
INSERT INTO gw2_infix_attribute_types(name,display) VALUES("Vitality", "Vitality");
COMMIT;
CREATE TABLE gw2_infix_attribute
(
	id int NOT NULL,
	attr_type INTEGER NOT NULL,
	modifier int NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(attr_type) REFERENCES gw2_infix_attribute_types(id)
);

CREATE TABLE gw2_infix_buff
(
	id int NOT NULL,
	skill_id int NOT NULL,
	description TEXT NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE gw2_item_infix_upgrade
(
	id int NOT NULL,
	buff_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY(id) REFERENCES gw2_item(id),
	FOREIGN KEY(buff_id) REFERENCES gw2_infix_buff(id)
);

CREATE TABLE gw2_item_infix_upgrade_attributes
(
	id INT NOT NULL,
	attr_id INT NOT NULL,
	PRIMARY KEY(id,attr_id),
	FOREIGN KEY(id) REFERENCES gw2_item_infix_upgrade(id),
	FOREIGN KEY(attr_id) REFERENCES gw2_infix_attribute(id)
);

CREATE TABLE gw2_item_infusion_flags
(
	id INTEGER NOT NULL,
	name TEXT NOT NULL,
	PRIMARY KEY(id)
);
BEGIN;
INSERT INTO gw2_item_infusion_flags(name) VALUES("Defense");
INSERT INTO gw2_item_infusion_flags(name) VALUES("Offense");
INSERT INTO gw2_item_infusion_flags(name) VALUES("Utility");
INSERT INTO gw2_item_infusion_flags(name) VALUES("Agony");
COMMIT;

CREATE TABLE gw2_item_infusion_slot
(
	id int NOT NULL,
	flags INTEGER NOT NULL,
	item_id int,
	PRIMARY KEY(id),
	FOREIGN KEY(flags) REFERENCES gw2_item_infusion_flags(id),
	FOREIGN KEY(item_id) REFERENCES gw2_item(id)
);

CREATE TABLE gw2_item_infusion_slots
(
	item_id INTEGER NOT NULL,
	infusion_slot_id INT NOT NULL,
	PRIMARY KEY(item_id,infusion_slot_id),
	FOREIGN KEY(item_id) REFERENCES gw2_item(id),
	FOREIGN KEY(infusion_slot_id) REFERENCES gw2_item_infusion_slot(id)
);

CREATE TABLE gw2_skin_type
(
	id INTEGER not null,
	name TEXT not null,
	primary key(id)
);
insert into gw2_skin_type(name) VALUES("Armor");
insert into gw2_skin_type(name) VALUES("Weapon");
insert into gw2_skin_type(name) VALUES("Back");

CREATE TABLE gw2_skin_flags
(
	id INTEGER not null,
	name TEXT not null,
	primary key(id)
);
insert into gw2_skin_flags values(1, "ShowInWardrobe");
insert into gw2_skin_flags values(2, "NoCost");
insert into gw2_skin_flags values(4, "HideIfLocked");
insert into gw2_skin_flags values(8, "OverrideRarity");

CREATE TABLE gw2_skin
(
	id INTEGER NOT NULL,
	name TEXT NOT NULL,
	skin_type INTEGER NOT NULL,
	flags INTEGER NOT NULL,
    restrictions int not null,
	icon TEXT NOT NULL,
    rarity INTEGER not null,
	description TEXT,
	primary key(id),
	foreign key(skin_type) references gw2_skin_type(id),
	foreign key(rarity) references gw2_item_rarity(id)
);

CREATE TABLE gw2_armor_skin
(
	id INTEGER not null,
    armor_type INTEGER not null,
	weight_class INTEGER not null,
    primary key(id),
	foreign key(id) references gw2_skin(id),
    foreign key(armor_type) references gw2_armor_type(id),
	foreign key(weight_class) references gw2_armor_weight_class(id)
);

CREATE TABLE gw2_weapon_skin
(
	id INTEGER not null,
	weapon_type INTEGER not null,
	damage_type INTEGER not null,
	primary key(id),
	foreign key(id) references gw2_skin(id),
	foreign key(weapon_type) references gw2_weapon_type(id),
	foreign key(damage_type) references gw2_weapon_dmg_type(id)
);

