CREATE DATABASE ocsweb;
USE ocsweb;


CREATE TABLE hardware (
  DEVICEID VARCHAR(255) NOT NULL,
  NAME VARCHAR(255) default NULL,
  WORKGROUP VARCHAR(255) default NULL,
  OSNAME VARCHAR(255) default NULL,
  OSVERSION VARCHAR(255) default NULL,
  OSCOMMENTS VARCHAR(255) default NULL,
  PROCESSORT VARCHAR(255) default NULL,
  PROCESSORS INTEGER default 0,
  PROCESSORN SMALLINT default NULL,
  MEMORY INTEGER default NULL,
  SWAP INTEGER default NULL,
  IPADDR VARCHAR(255) default NULL,
  ETIME DATETIME default NULL,
  LASTDATE DATETIME default NULL,
  LASTCOME DATETIME default NULL,
  QUALITY DECIMAL(4,3) default 0,
  FIDELITY BIGINT default 1,
  USERID VARCHAR(255) default NULL,
  `TYPE` INTEGER default NULL,
  DESCRIPTION VARCHAR(255) default NULL,
  WINCOMPANY VARCHAR(255) default NULL,
  WINOWNER VARCHAR(255) default NULL,
  WINPRODID VARCHAR(255) default NULL,
  USERAGENT VARCHAR(50) default NULL,
  CHECKSUM INTEGER default 0,
  PRIMARY KEY  (DEVICEID),
  INDEX NAME (NAME),
  INDEX CHECKSUM (CHECKSUM)  
) ENGINE=INNODB ;

CREATE TABLE accesslog (
  ID INTEGER NOT NULL auto_increment,
  DEVICEID VARCHAR(255) default NULL,
  USERID VARCHAR(255) default NULL,
  LOGDATE DATETIME default NULL,
  PROCESSES TEXT,
  PRIMARY KEY  (ID, DEVICEID),
  FOREIGN KEY (DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=INNODB ;

CREATE TABLE accountinfo (
  DEVICEID VARCHAR(255) NOT NULL,
  TAG VARCHAR(255) default 'NA',
  PRIMARY KEY  (DEVICEID),
  FOREIGN KEY (DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE,
  INDEX TAG (TAG)
) ENGINE=INNODB ;

CREATE TABLE deploy (
  NAME VARCHAR(255) NOT NULL,
  CONTENT LONGBLOB NOT NULL,
  PRIMARY KEY  (NAME)
) ENGINE=MYISAM ;

CREATE TABLE netmap (
  IP VARCHAR(15) NOT NULL,
  MAC VARCHAR(17) NOT NULL,
  MASK VARCHAR(15) NOT NULL,
  NETID VARCHAR(15) NOT NULL,
  DATE TIMESTAMP default CURRENT_TIMESTAMP,
  PRIMARY KEY  (MAC),
  INDEX IP (IP),
  INDEX NETID (NETID)
) ENGINE=INNODB ;

CREATE TABLE bios (
  DEVICEID VARCHAR(255) NOT NULL,
  SMANUFACTURER VARCHAR(255) default NULL,
  SMODEL VARCHAR(255) default NULL,
  SSN VARCHAR(255) default NULL,
  `TYPE` VARCHAR(255) default NULL,
  BMANUFACTURER VARCHAR(255) default NULL,
  BVERSION VARCHAR(255) default NULL,
  BDATE VARCHAR(255) default NULL,
  PRIMARY KEY  (DEVICEID),
  INDEX SSN (SSN),
  FOREIGN KEY (DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=INNODB ;

CREATE TABLE tag (
  TAG_NAME VARCHAR(255) default NULL,
  LOGIN VARCHAR(255) default NULL,
  PRIMARY KEY  (TAG_NAME, LOGIN)
) ENGINE=MYISAM ;

CREATE TABLE config (
  NAME VARCHAR(50) NOT NULL,
  IVALUE INTEGER default NULL,
  TVALUE VARCHAR(255) default NULL,
  COMMENTS TEXT,
  PRIMARY KEY (NAME)
) ENGINE=MYISAM ;

CREATE TABLE controllers (
  ID INTEGER NOT NULL auto_increment,
  DEVICEID VARCHAR(255) default NULL,
  MANUFACTURER VARCHAR(255) default NULL,
  NAME VARCHAR(255) default NULL,
  CAPTION VARCHAR(255) default NULL,
  DESCRIPTION VARCHAR(255) default NULL,
  VERSION VARCHAR(255) default NULL,
  `TYPE` VARCHAR(255) default NULL,
  PRIMARY KEY  (ID, DEVICEID),
  FOREIGN KEY (DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=INNODB ;

CREATE TABLE devices (
  DEVICEID VARCHAR(255) NOT NULL,
  NAME VARCHAR(50) NOT NULL,
  IVALUE INTEGER default NULL,
  TVALUE VARCHAR(255) default NULL,
  COMMENTS TEXT,
  PRIMARY KEY  (DEVICEID, NAME),
  INDEX TVALUE (TVALUE),
  FOREIGN KEY (DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=INNODB ;

CREATE TABLE drives (
  ID INTEGER NOT NULL auto_increment,
  DEVICEID VARCHAR(255) default NULL,
  LETTER VARCHAR(255) default NULL,
  `TYPE` VARCHAR(255) default NULL,
  FILESYSTEM VARCHAR(255) default NULL,
  TOTAL INTEGER default NULL,
  FREE INTEGER default NULL,
  NUMFILES INTEGER default NULL,
  VOLUMN VARCHAR(255) default NULL,
  PRIMARY KEY  (ID, DEVICEID),
  FOREIGN KEY (DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=INNODB ;

CREATE TABLE files (
  NAME VARCHAR(255) NOT NULL,
  VERSION VARCHAR(255) NOT NULL,
  OS VARCHAR(255) NOT NULL,
  CONTENT LONGBLOB NOT NULL,
  PRIMARY KEY  (NAME, OS, VERSION)
) ENGINE=MYISAM ;

CREATE TABLE inputs (
  ID INTEGER NOT NULL auto_increment,
  DEVICEID VARCHAR(255) default NULL,
  `TYPE` VARCHAR(255) default NULL,
  MANUFACTURER VARCHAR(255) default NULL,
  CAPTION VARCHAR(255) default NULL,
  DESCRIPTION VARCHAR(255) default NULL,
  INTERFACE VARCHAR(255) default NULL,
  POINTTYPE VARCHAR(255) default NULL,
  PRIMARY KEY  (ID, DEVICEID),
  FOREIGN KEY (DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=INNODB ;

CREATE TABLE memories (
  ID INTEGER NOT NULL auto_increment,
  DEVICEID VARCHAR(255) default NULL,
  CAPTION VARCHAR(255) default NULL,
  DESCRIPTION VARCHAR(255) default NULL,
  CAPACITY VARCHAR(255) default NULL,
  PURPOSE VARCHAR(255) default NULL,
  `TYPE` VARCHAR(255) default NULL,
  SPEED VARCHAR(255) default NULL,
  NUMSLOTS SMALLINT default NULL,
  PRIMARY KEY  (ID, DEVICEID),
  FOREIGN KEY (DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=INNODB ;

CREATE TABLE modems (
  ID INTEGER NOT NULL auto_increment,
  DEVICEID VARCHAR(255) default NULL,
  NAME VARCHAR(255) default NULL,
  MODEL VARCHAR(255) default NULL,
  DESCRIPTION VARCHAR(255) default NULL,
  `TYPE` VARCHAR(255) default NULL,
  PRIMARY KEY  (ID, DEVICEID),
  FOREIGN KEY (DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=INNODB ;

CREATE TABLE monitors (
  ID INTEGER NOT NULL auto_increment,
  DEVICEID VARCHAR(255) default NULL,
  MANUFACTURER VARCHAR(255) default NULL,
  CAPTION VARCHAR(255) default NULL,
  DESCRIPTION VARCHAR(255) default NULL,
  `TYPE` VARCHAR(255) default NULL,
  SERIAL VARCHAR(255) default NULL,
  PRIMARY KEY  (ID, DEVICEID),
  FOREIGN KEY (DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=INNODB ;


CREATE TABLE networks (
  ID INTEGER NOT NULL auto_increment,
  DEVICEID VARCHAR(255) default NULL,
  DESCRIPTION VARCHAR(255) default NULL,
  `TYPE` VARCHAR(255) default NULL,
  TYPEMIB VARCHAR(255) default NULL,
  SPEED VARCHAR(255) default NULL,
  MACADDR VARCHAR(255) default NULL,
  `STATUS` VARCHAR(255) default NULL,
  IPADDRESS VARCHAR(255) default NULL,
  IPMASK VARCHAR(255) default NULL,
  IPGATEWAY VARCHAR(255) default NULL,
  IPSUBNET VARCHAR(255) default NULL,
  IPDHCP VARCHAR(255) default NULL,
  PRIMARY KEY  (ID, DEVICEID),
  FOREIGN KEY (DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE,
  INDEX MACADDR (MACADDR),
  INDEX IPSUBNET (IPSUBNET)
) ENGINE=INNODB ;

CREATE TABLE operators (
  ID VARCHAR(255) NOT NULL default '',
  FIRSTNAME VARCHAR(255) default NULL,
  LASTNAME VARCHAR(255) default NULL,
  PASSWD VARCHAR(50) default NULL,
  ACCESSLVL INTEGER default NULL,
  COMMENTS text,
  PRIMARY KEY  (ID)
) ENGINE=MYISAM ;

CREATE TABLE ports (
  ID INTEGER NOT NULL auto_increment,
  DEVICEID VARCHAR(255) default NULL,
  `TYPE` VARCHAR(255) default NULL,
  NAME VARCHAR(255) default NULL,
  CAPTION VARCHAR(255) default NULL,
  DESCRIPTION VARCHAR(255) default NULL,
  PRIMARY KEY  (ID, DEVICEID),
  FOREIGN KEY (DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=INNODB ;

CREATE TABLE printers (
  ID INTEGER NOT NULL auto_increment,
  DEVICEID VARCHAR(255) default NULL,
  NAME VARCHAR(255) default NULL,
  DRIVER VARCHAR(255) default NULL,
  PORT VARCHAR(255) default NULL,
  PRIMARY KEY  (ID, DEVICEID),
  FOREIGN KEY (DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=INNODB ;

CREATE TABLE regconfig (
  ID INTEGER NOT NULL auto_increment,
  NAME VARCHAR(255) default NULL,
  REGTREE INTEGER default NULL,
  REGKEY text,
  REGVALUE VARCHAR(255) default NULL,
  PRIMARY KEY  (ID),
  KEY NAME (NAME)
) ENGINE=MYISAM ;

CREATE TABLE registry (
  ID INTEGER NOT NULL auto_increment,
  DEVICEID VARCHAR(255) default NULL,
  NAME VARCHAR(255) default NULL,
  REGVALUE VARCHAR(255) default NULL,
  PRIMARY KEY  (ID),
  FOREIGN KEY (DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE,
  KEY NAME (NAME)
) ENGINE=INNODB ;

CREATE TABLE slots (
  ID INTEGER NOT NULL auto_increment,
  DEVICEID VARCHAR(255) default NULL,
  NAME VARCHAR(255) default NULL,
  DESCRIPTION VARCHAR(255) default NULL,
  DESIGNATION VARCHAR(255) default NULL,
  PURPOSE VARCHAR(255) default NULL,
  `STATUS` VARCHAR(255) default NULL,
  PSHARE tinyint(4) default NULL,
  PRIMARY KEY  (ID),
  FOREIGN KEY (DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=INNODB ;

CREATE TABLE softwares (
  ID INTEGER NOT NULL auto_increment,
  DEVICEID VARCHAR(255) default NULL,
  PUBLISHER VARCHAR(255) default NULL,
  NAME VARCHAR(255) default NULL,
  VERSION VARCHAR(255) default NULL,
  FOLDER text,
  COMMENTS text,
  FILENAME VARCHAR(255) default NULL,
  FILESIZE INTEGER default '0',
  SOURCE INTEGER default NULL,
  PRIMARY KEY  (ID),
  INDEX NAME (NAME),
  FOREIGN KEY (DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=INNODB ;

CREATE TABLE `sounds` (
  ID INTEGER NOT NULL auto_increment,
  DEVICEID VARCHAR(255) default NULL,
  MANUFACTURER VARCHAR(255) default NULL,
  NAME VARCHAR(255) default NULL,
  DESCRIPTION VARCHAR(255) default NULL,
  PRIMARY KEY  (ID),
  FOREIGN KEY (DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=INNODB ;

CREATE TABLE storages (
  ID INTEGER NOT NULL auto_increment,
  DEVICEID VARCHAR(255) default NULL,
  MANUFACTURER VARCHAR(255) default NULL,
  NAME VARCHAR(255) default NULL,
  MODEL VARCHAR(255) default NULL,
  DESCRIPTION VARCHAR(255) default NULL,
  `TYPE` VARCHAR(255) default NULL,
  DISKSIZE INTEGER default NULL,
  PRIMARY KEY  (ID),
  FOREIGN KEY (DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=INNODB ;

CREATE TABLE videos (
  ID INTEGER NOT NULL auto_increment,
  DEVICEID VARCHAR(255) default NULL,
  NAME VARCHAR(255) default NULL,
  CHIPSET VARCHAR(255) default NULL,
  MEMORY VARCHAR(255) default NULL,
  RESOLUTION VARCHAR(255) default NULL,
  PRIMARY KEY  (ID),
  FOREIGN KEY (DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=INNODB ;

CREATE TABLE devicetype (
  ID INTEGER NOT NULL auto_increment,
  NAME VARCHAR(255) default NULL,
  PRIMARY KEY  (ID)
) ENGINE=MYISAM ;

CREATE TABLE subnet (
  NETID VARCHAR(15) NOT NULL,
  NAME VARCHAR(255),
  ID INTEGER,
  MASK VARCHAR(255),
  PRIMARY KEY (NETID)
) ENGINE=MYISAM ;

CREATE TABLE locks(
  DEVICEID VARCHAR(255) NOT NULL,
  ID INTEGER DEFAULT NULL,
  SINCE TIMESTAMP,
  PRIMARY KEY(DEVICEID),
  INDEX SINCE (SINCE)
) ENGINE=HEAP ;

CREATE TABLE dico_cat(
  NAME VARCHAR(255) NOT NULL,
  PERMANENT TINYINT DEFAULT 0,
  PRIMARY KEY(NAME)
) ENGINE=MYISAM ;

CREATE TABLE dico_ignored(
  EXTRACTED VARCHAR(255) NOT NULL,
  PRIMARY KEY(EXTRACTED)
) ENGINE=MYISAM ;

CREATE TABLE dico_soft( 
  EXTRACTED VARCHAR(255) NOT NULL,
  FORMATTED VARCHAR(255) NOT NULL,
  PRIMARY KEY(EXTRACTED)
) ENGINE=MYISAM ;

CREATE TABLE deleted_equiv(
  DATE TIMESTAMP, 
  DELETED VARCHAR(255) NOT NULL,
  EQUIVALENT VARCHAR(255) default NULL
) ENGINE=MYISAM ;

ALTER TABLE monitors ADD COLUMN SERIAL VARCHAR(255);
ALTER TABLE netmap ADD COLUMN MASK VARCHAR(15);
ALTER TABLE netmap ADD COLUMN NETID VARCHAR(15);
ALTER TABLE netmap ADD INDEX NETID (NETID);
ALTER TABLE netmap ADD COLUMN DATE TIMESTAMP;
ALTER TABLE networks ADD COLUMN IPSUBNET VARCHAR(15);
ALTER TABLE networks ADD INDEX IPSUBNET (IPSUBNET);
ALTER TABLE networks ADD INDEX MACADDR (MACADDR);
ALTER TABLE hardware ADD COLUMN CHECKSUM INTEGER default NULL;
ALTER TABLE hardware CHANGE COLUMN CHECKSUM CHECKSUM INTEGER default 0;

alter table hardware engine="INNODB";
alter table accesslog engine="INNODB";
alter table bios engine="INNODB";
alter table memories engine="INNODB";
alter table slots engine="INNODB";
alter table registry engine="INNODB";
alter table controllers engine="INNODB";
alter table monitors engine="INNODB";
alter table ports engine="INNODB";
alter table storages engine="INNODB";
alter table drives engine="INNODB";
alter table inputs engine="INNODB";
alter table modems engine="INNODB";
alter table networks engine="INNODB";
alter table printers engine="INNODB";
alter table sounds engine="INNODB";
alter table videos engine="INNODB";
alter table softwares engine="INNODB";
alter table accountinfo engine="INNODB";
alter table netmap engine="INNODB";
alter table devices engine="INNODB";
alter table locks engine="HEAP";

ALTER TABLE accesslog ADD FOREIGN KEY(DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE bios ADD FOREIGN KEY(DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE memories ADD FOREIGN KEY(DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE slots ADD FOREIGN KEY(DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE registry ADD FOREIGN KEY(DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE controllers ADD FOREIGN KEY(DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE monitors ADD FOREIGN KEY(DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE ports ADD FOREIGN KEY(DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE storages ADD FOREIGN KEY(DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE drives ADD FOREIGN KEY(DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE inputs ADD FOREIGN KEY(DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE modems ADD FOREIGN KEY(DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE networks ADD FOREIGN KEY(DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE printers ADD FOREIGN KEY(DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE sounds ADD FOREIGN KEY(DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE videos ADD FOREIGN KEY(DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE softwares ADD FOREIGN KEY(DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE accountinfo ADD FOREIGN KEY(DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE devices ADD FOREIGN KEY(DEVICEID) REFERENCES hardware(DEVICEID) ON UPDATE CASCADE ON DELETE CASCADE;

DELETE FROM `config` WHERE name='GUI_VERSION';
DELETE FROM `config` WHERE NAME='IP_MIN_QUALITY';

INSERT INTO `config` VALUES ('FREQUENCY', 0, '', 'Specify the frequency (days) of inventories. (0: inventory at each login. -1: no inventory)');
INSERT INTO `config` VALUES ('IPDISCOVER', 2, '', 'Max number of computers per gateway retrieving IP on the network');
INSERT INTO `config` VALUES ('REGISTRY', 0, '', 'Activates or not the registry query function');
INSERT INTO `config` VALUES ('IPDISCOVER_MAX_ALIVE', 7, '','Max number of days before an Ip Discover computer is replaced');
INSERT INTO `config` VALUES ('DEPLOY', 1, '', 'Activates or not the automatic deployment option');
INSERT INTO `config` VALUES ('UPDATE', 0, '', 'Activates or not the update feature');
INSERT INTO `config` VALUES ('GUI_VERSION', 0, '4014', 'Version of the installed GUI and database');
INSERT INTO `config` VALUES ('TRACE_DELETED', 0, '', 'Trace deleted/duplicated computers (Activated by GLPI)');
INSERT INTO `config` VALUES ('LOGLEVEL', 0, '', 'ocs engine loglevel');
INSERT INTO `config` VALUES ('AUTO_DUPLICATE_LVL', 7, '', 'Trace deleted/duplicated computers (Activated by GLPI)');
INSERT INTO `config` VALUES ('DOWNLOAD', 0, '', 'Activate softwares auto deployment feature (not yet implemented');

INSERT INTO `operators` VALUES ('admin','admin','admin','admin',1, 'Default administrator account');

GRANT ALL PRIVILEGES ON ocsweb.* TO ocs IDENTIFIED BY 'ocs';
GRANT ALL PRIVILEGES ON ocsweb.* TO ocs@localhost IDENTIFIED BY 'ocs';
