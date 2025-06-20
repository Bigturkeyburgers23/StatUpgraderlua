DELETE FROM `creature_template` WHERE `entry` = 90000;

INSERT INTO `creature_template` (
    `entry`, `name`, `subname`, `IconName`,
    `minlevel`, `maxlevel`, `faction`, `npcflag`, `speed_walk`, `speed_run`,
    `scale`, `rank`, `unit_class`, `unit_flags`, `unit_flags2`, `dynamicflags`,
    `type`, `type_flags`, `AIName`, `ScriptName`
) VALUES (
    90000, 'Stat Upgrader', 'Upgrades Stats', 'Speak',
    80, 80, 35, 1, 1.0, 1.14286,
    1.0, 0, 1, 0, 0, 0,
    7, 0, '', 'StatGiver'
);