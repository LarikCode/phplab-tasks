<?php
/**
 * TODO
 *  Write DPO statements to create following tables:
 *
 *  # airports
 *   - id (unsigned int, autoincrement)
 *   - name (varchar)
 *   - code (varchar)
 *   - city_id (relation to the cities table)
 *   - state_id (relation to the states table)
 *   - address (varchar)
 *   - timezone (varchar)
 *
 *  # cities
 *   - id (unsigned int, autoincrement)
 *   - name (varchar)
 *
 *  # states
 *   - id (unsigned int, autoincrement)
 *   - name (varchar)
 */

/** @var \PDO $pdo */
require_once './pdo_ini.php';

// cities
$sql = <<<'SQL'
CREATE TABLE `cities` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`)
);
SQL;
$pdo->exec($sql);

// TODO states
$sql = <<<'SQL'
CREATE TABLE `states` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`)
);
SQL;
$pdo->exec($sql);

// TODO airports
$sql = <<<'SQL'
CREATE TABLE `airports` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`code` VARCHAR(10) NOT NULL COLLATE 'utf8_general_ci',
	`address` VARCHAR(120) NOT NULL COLLATE 'utf8_general_ci',
	`timezone` VARCHAR(50) NOT NULL COLLATE 'utf8_general_ci',
	`cityId` INT(10) UNSIGNED NOT NULL,
	`stateId` INT(10) UNSIGNED NOT NULL,
	PRIMARY KEY (`id`),
	FOREIGN KEY (`cityId`) REFERENCES cities (`id`),
	FOREIGN KEY (`stateId`) REFERENCES states (`id`)
);
SQL;
$pdo->exec($sql);