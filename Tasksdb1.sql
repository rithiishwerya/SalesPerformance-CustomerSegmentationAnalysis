--------------------------------------------------------
--  DDL for Table STAFF
--------------------------------------------------------

  CREATE TABLE "TASKSDB"."STAFF" 
   (	"ID" NUMBER(10,0), 
	"NAME" VARCHAR2(30 BYTE), 
	"PHONE" NUMBER(30,0), 
	"DEPT" VARCHAR2(30 BYTE) DEFAULT 'DEPT_DEFAULT', 
	"EMAIL" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into TASKSDB.STAFF
SET DEFINE OFF;
Insert into TASKSDB.STAFF (ID,NAME,PHONE,DEPT,EMAIL) values (1,'staff1',987654321,'computer','default@gmail.com');
Insert into TASKSDB.STAFF (ID,NAME,PHONE,DEPT,EMAIL) values (2,'staff2',987654322,'science','default@gmail.com');
Insert into TASKSDB.STAFF (ID,NAME,PHONE,DEPT,EMAIL) values (3,'staff3',987654323,'biology',null);
Insert into TASKSDB.STAFF (ID,NAME,PHONE,DEPT,EMAIL) values (4,'staff3',null,'computer','zzz@gmail.com');
Insert into TASKSDB.STAFF (ID,NAME,PHONE,DEPT,EMAIL) values (5,'staff5',987654325,'english','default@gmail.com');
Insert into TASKSDB.STAFF (ID,NAME,PHONE,DEPT,EMAIL) values (6,'staff6',93765643201,'computer','default@gmail.com');
Insert into TASKSDB.STAFF (ID,NAME,PHONE,DEPT,EMAIL) values (7,'staff7',9876574322,'DEPT_DEFAULT',null);
--------------------------------------------------------
--  DDL for Index SYS_C008325
--------------------------------------------------------

  CREATE UNIQUE INDEX "TASKSDB"."SYS_C008325" ON "TASKSDB"."STAFF" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008326
--------------------------------------------------------

  CREATE UNIQUE INDEX "TASKSDB"."SYS_C008326" ON "TASKSDB"."STAFF" ("PHONE") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table STAFF
--------------------------------------------------------

  ALTER TABLE "TASKSDB"."STAFF" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "TASKSDB"."STAFF" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "TASKSDB"."STAFF" ADD UNIQUE ("PHONE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
