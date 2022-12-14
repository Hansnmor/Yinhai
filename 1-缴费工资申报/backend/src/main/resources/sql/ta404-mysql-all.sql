
DROP VIEW IF EXISTS V_DICT;

DROP VIEW IF EXISTS V_CUSTOMRESOURCE;

DROP VIEW IF EXISTS V_RESOURCECATEGORY;

DROP TABLE IF EXISTS FREEBUSYJOBMG;

DROP TABLE IF EXISTS TAACCESSDENYLOG;

DROP TABLE IF EXISTS TAACCESSSYSTEM;

DROP TABLE IF EXISTS TAAREA;

DROP TABLE IF EXISTS TAAVATAR;

DROP TABLE IF EXISTS TAAUDIT;

DROP TABLE IF EXISTS TACUSTOMORG;

DROP TABLE IF EXISTS TACUSTOMORGTYPENAME;

DROP TABLE IF EXISTS TACUSTOMORGUSER;

DROP TABLE IF EXISTS TACUSTOMRESOURCE;

DROP TABLE IF EXISTS TADICT;

DROP TABLE IF EXISTS TADYNAMICREST;

DROP TABLE IF EXISTS TAEXAMINE;

DROP TABLE IF EXISTS TAEXAMINELOCKED;

DROP TABLE IF EXISTS TAEXAMINECHILD;

DROP TABLE IF EXISTS TAEXTENDSETTING;

DROP TABLE IF EXISTS TAJOBDATASOURCEMG;

DROP TABLE IF EXISTS TALOGINFAILLOG;

DROP TABLE IF EXISTS TALOGINHISTORYLOG;

DROP TABLE IF EXISTS TALOGINSTATLOG;

DROP TABLE IF EXISTS TAMSGCHAT;

DROP TABLE IF EXISTS TAMSGLETTER;

DROP TABLE IF EXISTS TAMSGNOTICE;

DROP TABLE IF EXISTS TAMSGNOTICEANNEX;

DROP TABLE IF EXISTS TAMSGNOTICESTATE;

DROP TABLE IF EXISTS TAOBJECTTAGS;

DROP TABLE IF EXISTS TAONLINELOG;

DROP TABLE IF EXISTS TAONLINESTATLOG;

DROP TABLE IF EXISTS TAORG;

DROP TABLE IF EXISTS TAORGMG;

DROP TABLE IF EXISTS TAORGOPLOG;

DROP TABLE IF EXISTS TARESOURCE;

DROP TABLE IF EXISTS TARESOURCECATEGORY;

DROP TABLE IF EXISTS TARESOURCEUI;

DROP TABLE IF EXISTS TARESOURCEURL;

DROP TABLE IF EXISTS TAROLE;

DROP TABLE IF EXISTS TAROLEAUTHORITY;

DROP TABLE IF EXISTS TAROLEURLAUTHORITY;

DROP TABLE IF EXISTS TAROLEUSER;

DROP TABLE IF EXISTS TAROLEWORKBENCH;

DROP TABLE IF EXISTS TASERVEREXCEPTIONLOG;

DROP TABLE IF EXISTS TASYSCONFIG;

DROP TABLE IF EXISTS TATAG;

DROP TABLE IF EXISTS TATAGGROUP;

DROP TABLE IF EXISTS TAURL;

DROP TABLE IF EXISTS TAUSER;

DROP TABLE IF EXISTS TAUSERCONNECTION;

DROP TABLE IF EXISTS TAUSERORG;

DROP TABLE IF EXISTS TAUSERRESOURCE;

DROP TABLE IF EXISTS TAUSERWORKBENCH;

DROP TABLE IF EXISTS TAZOOKEEPERADDRESSMG;

DROP TABLE IF EXISTS TATEMPLATE;

DROP TABLE IF EXISTS seq;

DROP FUNCTION IF EXISTS seq;

/*==============================================================*/
/* Table: TAACCESSSYSTEM                                        */
/*==============================================================*/
create table TAACCESSSYSTEM
(
    ID                varchar(36)  not null comment '????????????id',
    SYSCODE           varchar(20)  not null comment '????????????',
    SYSNAME           varchar(100) not null comment '????????????',
    SPELL             varchar(30) comment '????????????',
    PROTOCOL          varchar(10) comment '????????????',
    DOMAIN            varchar(100) comment '?????????ip',
    PORT              varchar(5) comment '??????',
    CONTEXTPATH       varchar(30) comment '?????????',
    PORTALSYSTEM      varchar(1) comment '??????????????????',
    MENUSERVICE       varchar(200) comment '????????????',
    PROVIDER          varchar(50) comment '???????????????',
    EFFECTIVE         varchar(1)   not null comment '????????????',
    REGTIME           datetime comment '????????????',
    MODIFYTIME        datetime comment '????????????',
    BACKGROUNDADDRESS varchar(100) comment '????????????',
    FIELD01            varchar(1000) comment '????????????01',
    FIELD02            varchar(1000) comment '????????????02',
    FIELD03            varchar(1000) comment '????????????03',
    FIELD04            varchar(1000) comment '????????????04',
    FIELD05            varchar(1000) comment '????????????05',
    FIELD06            varchar(1000) comment '????????????06',
    FIELD07            varchar(1000) comment '????????????07',
    FIELD08            varchar(1000) comment '????????????08',
    FIELD09            varchar(1000) comment '????????????09',
    FIELD10            varchar(1000) comment '????????????10',
    primary key (ID)
);

alter table TAACCESSSYSTEM comment '???????????????';

/*==============================================================*/
/* Table: TAAREA                                                */
/*==============================================================*/
create table TAAREA
(
    AREAID     varchar(36)  not null comment '????????????ID',
    PARENTID   varchar(36)  not null comment '??????ID',
    AREANAME   varchar(100) not null comment '??????????????????',
    AREACODE   varchar(20)  not null comment '??????????????????',
    IDPATH     varchar(1024) not null comment '????????????ID?????????',
    NAMEPATH   text not null comment '????????????????????????',
    AREALEVEL  numeric(2, 0) comment '??????????????????',
    SPELL      varchar(100) comment '????????????',
    CREATEUSER varchar(36)  not null comment '?????????',
    AREAORDER  numeric(20, 0) comment '?????????',
    EFFECTIVE  varchar(1)   not null comment '????????????',
    CREATETIME datetime     not null comment '????????????',
    MODIFYTIME datetime     not null comment '????????????',
    DESTORY    varchar(1) comment '????????????',
    primary key (AREAID)
);

alter table TAAREA comment '???????????????';

/*==============================================================*/
/* Table: TAAVATAR                                              */
/*==============================================================*/
create table TAAVATAR
(
    USERID     varchar(36) not null comment '??????id',
    AVATAR     longblob comment '??????base64',
    UPDATETIME datetime    not null comment '????????????',
    primary key (USERID, UPDATETIME)
);

alter table TAAVATAR comment '???????????????';


/*==============================================================*/
/* Table: TACUSTOMORG                                           */
/*==============================================================*/
create table TACUSTOMORG
(
    CUSTOMORGID         varchar(36) not null comment '???????????????id',
    PARENTID            varchar(36) comment '??????????????????id',
    CUSTOMCODE          varchar(255) comment '???????????????',
    CUSTOMORGTYPENAMEID varchar(36) not null comment '?????????????????????id',
    EFFECTIVE           varchar(1)  not null comment '????????????',
    ORDERNO             numeric(10, 0) comment '?????????',
    CUSTOMORGNAME       varchar(255) comment '?????????????????????',
    CUSTOMORGPATHID     varchar(1024) comment '?????????????????????id',
    CUSTOMORGPATH       varchar(1024) comment '????????????????????????',
    CREATEUSER          varchar(36) comment '?????????',
    CREATETIME          datetime    not null comment '????????????',
    UPDATETIME          datetime    not null comment '????????????',
    DESTORY             varchar(1)  not null comment '????????????',
    SPELL               varchar(255) comment '????????????',
    ORGMANAGER          varchar(36) comment '???????????????',
    ORGCODE             varchar(18) comment '????????????',
    CONTACTS            varchar(36) comment '???????????????',
    ADDRESS             varchar(450) comment '????????????',
    TEL                 varchar(20) comment '????????????',
    FIELD01             varchar(1000) comment '????????????01',
    FIELD02             varchar(1000) comment '????????????02',
    FIELD03             varchar(1000) comment '????????????03',
    FIELD04             varchar(1000) comment '????????????04',
    FIELD05             varchar(1000) comment '????????????05',
    FIELD06             varchar(1000) comment '????????????06',
    FIELD07             varchar(1000) comment '????????????07',
    FIELD08             varchar(1000) comment '????????????08',
    FIELD09             varchar(1000) comment '????????????09',
    FIELD10             varchar(1000) comment '????????????10',
    primary key (CUSTOMORGID)
);

alter table TACUSTOMORG comment '??????????????????';

/*==============================================================*/
/* Table: TACUSTOMORGTYPENAME                                   */
/*==============================================================*/
create table TACUSTOMORGTYPENAME
(
    CUSTOMORGTYPENAMEID   varchar(36) not null comment '???????????????????????????ID',
    CUSTOMORGTYPENAME     varchar(36) comment '???????????????????????????',
    EFFECTIVE             varchar(1)  not null comment '????????????',
    CREATEUSER            varchar(36) not null comment '?????????',
    CREATETIME            datetime    not null comment '????????????',
    UPDATETIME            datetime    not null comment '????????????',
    DESTORY               varchar(1)  not null comment '????????????',
    CUSTOMORGTYPENAMECODE varchar(255) comment '?????????????????????????????????',
    CUSTOMORGTYPENAMEDESC varchar(255) comment '?????????????????????????????????',
    primary key (CUSTOMORGTYPENAMEID)
);

alter table TACUSTOMORGTYPENAME comment '??????????????????????????????';

/*==============================================================*/
/* Table: TACUSTOMORGUSER                                       */
/*==============================================================*/
create table TACUSTOMORGUSER
(
    CUSTOMORGID varchar(36) not null comment '???????????????ID',
    USERID      varchar(36) not null comment '??????Id',
    primary key (CUSTOMORGID, USERID)
);

alter table TACUSTOMORGUSER comment '??????????????????????????????';

/*==============================================================*/
/* Table: TACUSTOMRESOURCE                                      */
/*==============================================================*/
create table TACUSTOMRESOURCE
(
    CUSTOMRESOURCEID varchar(36)  not null comment '???????????????Id',
    RESOURCENAME     varchar(450) not null comment '????????????',
    PARENTID         varchar(36)  not null comment '???Id',
    CODE             varchar(100) comment '????????????',
    RESOURCECONTENT  varchar(255) comment '?????????????????????',
    RESOURCECATEGORY varchar(32) comment '??????????????????',
    EFFECTIVE        varchar(1)   not null comment '????????????',
    ADDTIME          datetime comment '????????????',
    MODIFYTIME       datetime comment '????????????',
    `SYSTEM`           varchar(36) comment '??????????????????',
    primary key (CUSTOMRESOURCEID)
);

alter table TACUSTOMRESOURCE comment '??????????????????';

/*==============================================================*/
/* Table: TADICT                                                */
/*==============================================================*/
create table TADICT
(
    NAME        varchar(50)   not null comment '????????????',
    TYPE        varchar(50)   not null comment '????????????',
    LABEL       varchar(50)   not null comment '????????????',
    VALUE       varchar(50)    not null comment '????????????',
    PARENTVALUE varchar(50) comment '???????????????',
    SORT        numeric(4, 0) not null comment '??????',
    AUTHORITY   varchar(20)   not null comment '????????????',
    CSSCLASS    varchar(128),
    CSSSTYLE    varchar(128) comment 'css??????',
    REMARKS     varchar(256) comment '??????',
    CREATEDATE  datetime      not null comment '????????????',
    CREATEUSER  varchar(36)   not null comment '?????????',
    VERSION     varchar(10)   not null comment '??????',
    STATUS      varchar(2)    not null comment '????????????',
    FIELD01     varchar(10) comment '????????????1',
    FIELD02     varchar(10) comment '????????????2',
    FIELD03     varchar(10) comment '????????????3',
    FIELD04     varchar(10) comment '????????????4',
    FIELD05     varchar(10) comment '????????????5',
    `SYSTEM`      varchar(2)    not null comment '????????????',
    NEWTYPE     varchar(2)    not null comment '??????????????????',
    primary key (TYPE, VALUE)
);

alter table TADICT comment '???????????????';

/*==============================================================*/
/* Table: TAEXTENDSETTING                                       */
/*==============================================================*/
create table TAEXTENDSETTING
(
    FIELDID        varchar(10) not null comment '????????????',
    TYPE           varchar(2)  not null comment '????????????',
    EFFECTIVE      varchar(1)  not null comment '????????????',
    HIDE           varchar(1) comment '????????????',
    DISPLAYTEXT    varchar(150) comment '????????????',
    TITEXT         varchar(1500) comment '??????????????????',
    ORDERNO        numeric(10, 0) comment '????????????',
    REQUIRED       varchar(1) comment '????????????',
    UNCHANGEABLE   varchar(1) comment '????????????',
    FORMTYPE       varchar(20) comment '??????????????????',
    CONTENTSIZE    numeric(16, 0) comment '????????????',
    VALIDREG       varchar(1000) comment '???????????????',
    CONNECTAA10    varchar(30) comment '????????????',
    PROTECTPRIVACY varchar(1) comment '????????????',
    PROTECTPRIVACYRULE varchar(20) comment '??????????????????',
    FORMID         varchar(10) comment '????????????',
    MORE           varchar(1) comment '??????????????????????????????',
    primary key (FIELDID, TYPE)
);

alter table TAEXTENDSETTING comment '?????????????????????';

/*==============================================================*/
/* Table: TALOGINHISTORYLOG                                     */
/*==============================================================*/
create table TALOGINHISTORYLOG
(
    LOGID            varchar(36)  not null comment '??????ID',
    USERID           varchar(36)  not null comment '??????ID',
    LOGINTIME        datetime(6)     not null comment '????????????',
    LOGOUTTIME       datetime(6)   not null comment '????????????',
    CLIENTIP         varchar(200) not null comment '?????????IP',
    SESSIONID        varchar(200) not null comment '?????????SessionID',
    SERVERIP         varchar(200) comment '?????????IP',
    SYSPATH          varchar(50) comment '????????????',
    CLIENTSYSTEM     varchar(50) comment '?????????????????????',
    CLIENTBROWSER    varchar(50) comment '????????????????????????',
    CLIENTSCREENSIZE varchar(50) comment '??????????????????',
    HASHVERITY       varchar(200) comment 'hash ??????',
    primary key (LOGID)
);

alter table TALOGINHISTORYLOG comment '?????????????????????';

/*==============================================================*/
/* Table: TALOGINSTATLOG                                        */
/*==============================================================*/
create table TALOGINSTATLOG
(
    STATDATE    varchar(20) not null comment '???????????????YYYY-MM-DD???',
    POINTINTIME varchar(20) not null comment '???????????????HH:MM???',
    LOGINNUM    numeric(15, 0) comment '?????????????????????????????????',
    HASHVERITY  varchar(200) comment 'hash ??????',
    primary key (STATDATE, POINTINTIME)
);

alter table TALOGINSTATLOG comment '?????????????????????';

/*==============================================================*/
/* Table: TAOBJECTTAGS                                          */
/*==============================================================*/
create table TAOBJECTTAGS
(
    OBJECTID   varchar(36) not null comment '????????????????????????????????????????????????',
    OBJECTTYPE varchar(3)  not null comment '????????????????????????????????????',
    TAGID      varchar(36) not null,
    primary key (OBJECTID, OBJECTTYPE, TAGID)
);

alter table TAOBJECTTAGS comment '?????????';

/*==============================================================*/
/* Table: TAONLINELOG                                           */
/*==============================================================*/
create table TAONLINELOG
(
    LOGID            varchar(36)  not null comment '????????????',
    USERID           varchar(36)  not null comment '????????????',
    LOGINTIME        datetime(6)     not null comment '????????????',
    CURRESOURCE      varchar(1000) comment '????????????',
    CLIENTIP         varchar(200) not null comment '?????????ip??????',
    SESSIONID        varchar(200) not null comment '???????????????sessionId',
    SYSPATH          varchar(50) comment '????????????',
    SERVERIP         varchar(200) comment '?????????ip??????',
    CLIENTSYSTEM     varchar(50) comment '???????????????????????????',
    CLIENTBROWSER    varchar(50) comment '????????????????????????',
    CLIENTSCREENSIZE varchar(50) comment '??????????????????????????????',
    HASHVERITY       varchar(200) comment 'hash ??????',
    primary key (LOGID)
);

alter table TAONLINELOG comment '?????????????????????';

/*==============================================================*/
/* Table: TAONLINESTATLOG                                       */
/*==============================================================*/
create table TAONLINESTATLOG
(
    STATDATE    varchar(20) not null comment '???????????????YYYY-MM-DD???',
    POINTINTIME varchar(20) not null comment '???????????????HH:MM???',
    LOGINNUM    numeric(15, 0) comment '???????????????',
    HASHVERITY  varchar(200) comment 'hash ??????',
    primary key (STATDATE, POINTINTIME)
);

alter table TAONLINESTATLOG comment '?????????????????????';

/*==============================================================*/
/* Table: TAORG                                                 */
/*==============================================================*/
create table TAORG
(
    ORGID      varchar(36)    not null comment '????????????',
    ORGNAME    varchar(200)   not null comment '????????????',
    SPELL      varchar(100)   not null comment '????????????????????????????????????????????????MZB???',
    PARENTID   varchar(36)    not null comment '???????????????',
    IDPATH     varchar(1024)  not null comment '??????????????????',
    NAMEPATH   varchar(1024)  not null comment '??????????????????',
    CUSTOMNO   varchar(30) comment '???????????????',
    ORDERNO    numeric(10, 0) not null comment '?????????',
    ORGLEVEL   numeric(16, 0) comment '????????????',
    AREA       varchar(36) comment '??????????????????',
    EFFECTIVE  varchar(1)     not null comment '?????????',
    ORGTYPE    varchar(2)     not null comment '???????????????????????????????????????????????????????????????',
    CREATEUSER varchar(36)    not null comment '?????????',
    CREATETIME datetime comment '????????????',
    MODIFYTIME datetime comment '??????????????????',
    ORGMANAGER varchar(36) comment '???????????????',
    ORGCODE    varchar(18) comment '????????????',
    CONTACTS   varchar(36) comment '???????????????',
    ADDRESS    varchar(450) comment '???????????????',
    TEL        varchar(20) comment '???????????????',
    DESTORY    varchar(1) comment '????????????',
    FIELD01    varchar(1000) comment '????????????1',
    FIELD02    varchar(1000) comment '????????????2',
    FIELD03    varchar(1000) comment '????????????3',
    FIELD04    varchar(1000) comment '????????????4',
    FIELD05    varchar(1000) comment '????????????5',
    FIELD06    varchar(1000) comment '????????????6',
    FIELD07    varchar(1000) comment '????????????7',
    FIELD08    varchar(1000) comment '????????????8',
    FIELD09    varchar(1000) comment '????????????9',
    FIELD10    varchar(1000) comment '????????????10',
    primary key (ORGID)
);

alter table TAORG comment '???????????????';

/*==============================================================*/
/* Table: TAORGMG                                               */
/*==============================================================*/
create table TAORGMG
(
    ROLEID     varchar(36) not null comment '??????ID',
    ORGID      varchar(36) not null comment '??????ID',
    EFFECTTIME datetime comment '?????????',
    primary key (ROLEID, ORGID)
);

alter table TAORGMG comment '???????????????';

/*==============================================================*/
/* Table: TAORGOPLOG                                            */
/*==============================================================*/
create table TAORGOPLOG
(
    LOGID             varchar(36) not null comment '??????ID',
    BATCHNO           varchar(36) not null comment '???????????????',
    OPTYPE            varchar(2)  not null comment '????????????',
    INFLUENCEBODYTYPE varchar(2)  not null comment '??????????????????',
    INFLUENCEBODY     varchar(36) not null comment '????????????',
    OPBODYTYPE        varchar(2) comment '??????????????????',
    OPSUBJECT         varchar(36) comment '????????????',
    CHANGECONTENT     longblob comment '????????????',
    OPTIME            datetime(6)    not null comment '????????????',
    OPUSER            varchar(36) not null comment '?????????',
    ISPERMISSION      varchar(1)  not null comment '????????????',
    HASHVERITY        varchar(200) comment 'hash ??????',
    SESSIONID         varchar(200) comment 'sessionid',
    primary key (LOGID)
);

alter table TAORGOPLOG comment '?????????????????????';

/*==============================================================*/
/* Table: TARESOURCE                                            */
/*==============================================================*/
create table TARESOURCE
(
    RESOURCEID        varchar(36)   not null comment '????????????ID',
    PRESOURCEID       varchar(36)   not null comment '??????????????????ID',
    NAME              varchar(100)  not null comment '????????????',
    CODE              varchar(30) comment '???????????????',
    SYSCODE           varchar(20)   not null comment '??????????????????',
    URL               varchar(100) comment '????????????',
    ORDERNO           numeric(10, 0) comment '?????????',
    IDPATH            varchar(1024) not null comment '??????ID??????',
    NAMEPATH          varchar(1024) not null comment '??????????????????',
    RESOURCELEVEL     varchar(2)    not null comment '??????????????????',
    ICON              varchar(30) comment '????????????',
    ICONCOLOR         varchar(7) comment '????????????',
    SECURITYPOLICY    varchar(2)    not null comment '????????????',
    SECURITYLEVEL     numeric(4, 0) not null comment '??????????????????',
    RESOURCETYPE      varchar(2)    not null comment '????????????',
    EFFECTIVE         varchar(1)    not null comment '?????????',
    ISDISPLAY         varchar(1) comment '????????????',
    ISFILEDSCONTROL   varchar(1) comment '????????????????????????',
    CREATEDATE        datetime      not null comment '????????????',
    CREATEUSER        varchar(36)   not null comment '?????????',
    UIAUTHORITYPOLICY varchar(2) comment '??????????????????',
    FIELD01           varchar(10) comment '????????????01',
    FIELD02           varchar(10) comment '????????????02',
    FIELD03           varchar(10) comment '????????????03',
    FIELD04           varchar(10) comment '????????????04',
    FIELD05           varchar(10) comment '????????????05',
    FIELD06           varchar(10) comment '????????????06',
    FIELD07           varchar(10) comment '????????????07',
    FIELD08           varchar(10) comment '????????????08',
    FIELD09           varchar(10) comment '????????????09',
    FIELD10           varchar(10) comment '????????????10',
    WORKBENCH varchar (1) comment '?????????????????????',
    IMAGE             longblob comment '?????????????????????????????????',

    primary key (RESOURCEID)
);

alter table TARESOURCE comment '???????????????';

/*==============================================================*/
/* Table: TARESOURCECATEGORY                                    */
/*==============================================================*/
create table TARESOURCECATEGORY
(
    CATEGORYID      varchar(36)  not null comment '??????ID',
    CATEGORYNAME    varchar(300) not null comment '????????????',
    EFFECTIVE       varchar(1)   not null comment '?????????',
    CODE            varchar(100) comment '????????????',
    CATEGORYCONTENT varchar(255) comment '????????????',
    primary key (CATEGORYID)
);

alter table TARESOURCECATEGORY comment '???????????????';

/*==============================================================*/
/* Table: TARESOURCEUI                                          */
/*==============================================================*/
create table TARESOURCEUI
(
    PAGEELEMENTID   varchar(36) not null comment '??????????????????ID',
    RESOURCEID      varchar(36) not null comment '????????????ID',
    ELENMENTNAME    varchar(20) not null comment '??????????????????',
    ELEMENTID       varchar(30) not null comment '????????????ID',
    CODE            varchar(20) comment '???????????????',
    AUTHORITYPOLICY varchar(2)  not null comment '????????????',
    CREATEUSER      varchar(36) not null comment '?????????',
    CREATEDATE      datetime    not null comment '????????????',
    FIELD01         varchar(10) comment '????????????01',
    FIELD02         varchar(10) comment '????????????02',
    FIELD03         varchar(10) comment '????????????03',
    EFFECTIVE       varchar(1)  not null comment '?????????',
    primary key (PAGEELEMENTID)
);

alter table TARESOURCEUI comment '???????????????';

/*==============================================================*/
/* Table: TARESOURCEURL                                         */
/*==============================================================*/
create table TARESOURCEURL
(
    RESOURCEID      varchar(36)  not null comment '????????????ID',
    URLID           varchar(36)  not null comment '??????ID',
    AUTHORITYPOLICY varchar(1)   not null comment '??????????????????',
    primary key (URLID,RESOURCEID)
);

alter table TARESOURCEURL comment '???????????????';

/*==============================================================*/
/* Table: TAROLE                                                */
/*==============================================================*/
create table TAROLE
(
    ROLEID        varchar(36)  not null comment '??????id',
    ROLENAME      varchar(150) not null comment '????????????',
    ISADMIN       varchar(1) comment '??????????????????',
    ROLELEVEL     numeric(32, 0) comment '????????????',
    ORGID         varchar(36)  not null comment '??????id',
    ROLETYPE      varchar(2)   not null comment '????????????',
    EFFECTIVE     varchar(1)   not null comment '????????????',
    EFFECTIVETIME datetime comment '????????????',
    CREATEUSER    varchar(36) comment '?????????',
    CREATETIME    datetime comment '????????????',
    ROLEDESC      varchar(150) comment '???????????????',
    ROLESIGN      varchar(2) comment '????????????',
    SUBORDINATE   varchar(1) comment '??????',
    primary key (ROLEID)
);

alter table TAROLE comment '?????????';

/*==============================================================*/
/* Table: TAROLEAUTHORITY                                       */
/*==============================================================*/
create table TAROLEAUTHORITY
(
    ROLEID        varchar(36) not null comment '??????id',
    RESOURCEID    varchar(36) not null comment '??????id',
    RESOURCETYPE  varchar(1)  not null comment '????????????',
    USEPERMISSION varchar(1) comment '??????????????????',
    REPERMISSION  varchar(1) comment '????????????',
    REAUTHRITY    varchar(1) comment '???????????????',
    CREATEUSER    varchar(36) comment '?????????',
    CREATETIME    datetime comment '????????????',
    EFFECTTIME    datetime comment '????????????',
    primary key (ROLEID, RESOURCEID, RESOURCETYPE)
);

alter table TAROLEAUTHORITY comment '???????????????';

/*==============================================================*/
/* Table: TAROLEURLAUTHORITY                                    */
/*==============================================================*/
create table TAROLEURLAUTHORITY
(
    ROLEID     varchar(36) not null comment '??????id',
    URLID      varchar(36) not null comment '??????id',
    RESOURCEID varchar(36) not null comment '??????id',
    primary key (ROLEID, URLID, RESOURCEID)
);

/*==============================================================*/
/* Table: TAROLEUSER                                            */
/*==============================================================*/
create table TAROLEUSER
(
    USERID      varchar(36) not null comment '??????id',
    ROLEID      varchar(36) not null comment '??????id',
    DEFAULTROLE varchar(1) comment '????????????',
    CREATEUSER  varchar(36) not null comment '?????????',
    CREATETIME  datetime    not null comment '????????????',
    primary key (ROLEID, USERID)
);

alter table TAROLEUSER comment '?????????????????????';

/*==============================================================*/
/* Table: TAROLEWORKBENCH                                       */
/*==============================================================*/
create table TAROLEWORKBENCH
(
    ROLEID        varchar(36) not null comment '??????id',
    WORKBENCHJSON TEXT comment '???????????????',
    primary key (ROLEID)
);

alter table TAROLEWORKBENCH comment '?????????????????????';

/*==============================================================*/
/* Table: TASERVEREXCEPTIONLOG                                  */
/*==============================================================*/
create table TASERVEREXCEPTIONLOG
(
    LOGID            varchar(50) not null comment '??????id',
    IPADDRESS        varchar(100) comment 'ip??????',
    PORT             varchar(10) comment '?????????',
    EXCEPTIONNAME    varchar(255) comment '????????????',
    CONTENT          longblob comment '????????????',
    CREATETIME       datetime(6) comment '????????????',
    SYSPATH          varchar(50) comment '???????????????',
    CLIENTIP         varchar(50) comment '?????????ip',
    URL              varchar(100) comment '????????????',
    MENUID           varchar(50) comment '??????id',
    MENUNAME         varchar(30) comment '????????????',
    USERAGENT        varchar(200),
    EXCEPTIONTYPE    varchar(2) comment '????????????',
    REQUESTPARAMETER longblob comment '????????????',
    HASHVERITY       varchar(200) comment 'hash ??????',
    USERID           varchar(36) comment 'userid',
    primary key (LOGID)
);

alter table TASERVEREXCEPTIONLOG comment '????????????????????????';

/*==============================================================*/
/* Table: TATAG                                                 */
/*==============================================================*/
create table TATAG
(
    TAGID      varchar(36) not null comment '??????id',
    TAGNAME    varchar(255) comment '?????????',
    TAGGROUPID varchar(36) comment '?????????id',
    CREATETIME datetime    not null comment '????????????',
    EFFECTIVE  varchar(1)  not null comment '????????????',
    CREATEUSER varchar(36) not null comment '?????????',
    DESTORY    varchar(1)  not null comment '????????????',
    UPDATETIME datetime    not null comment '????????????',
    primary key (TAGID)
);

alter table TATAG comment '?????????';

/*==============================================================*/
/* Table: TATAGGROUP                                            */
/*==============================================================*/
create table TATAGGROUP
(
    TAGGROUPID   varchar(36)  not null comment '?????????id',
    TAGGROUPNAME varchar(255) not null comment '???????????????',
    EFFECTIVE    varchar(1)   not null comment '????????????',
    CREATEUSER   varchar(36)  not null comment '?????????',
    CREATETIME   datetime     not null comment '????????????',
    UPDATETIME   datetime     not null comment '????????????',
    DESTORY      varchar(1)   not null comment '????????????'
);

alter table TATAGGROUP comment '????????????';

/*==============================================================*/
/* Table: TAUSER                                                */
/*==============================================================*/
create table TAUSER
(
    USERID             varchar(36)  not null comment '????????????',
    LOGINID            varchar(30)  not null comment '????????????',
    PASSWORD           varchar(256) not null comment '????????????',
    PASSWORDDEFAULTNUM numeric(16, 0) comment '??????????????????',
    PWDLASTMODIFYDATE  datetime comment '????????????????????????',
    ISLOCK             varchar(1) comment '????????????',
    ORDERNO            numeric(10, 0) comment '?????????',
    NAME               varchar(450) not null comment '??????',
    SEX                varchar(2) comment '??????',
    IDCARDTYPE         varchar(2) comment '????????????',
    IDCARDNO           varchar(30) comment '????????????',
    MOBILE             varchar(20) comment '????????????',
    CREATEUSER         varchar(36) comment '?????????',
    CREATETIME         datetime comment '????????????',
    MODIFYTIME         datetime comment '????????????',
    DESTORY            varchar(1)   not null comment '????????????',
    ACCOUNTSOURCE      varchar(2) comment '??????????????????',
    EFFECTIVE          varchar(1)   not null comment '????????????',
    EFFECTIVETIME      datetime comment '????????????',
    JOBNUMBER          varchar(15) comment '??????',
    STATE              varchar(10) comment '????????????',
    BIRTHPLACE         varchar(12) comment '?????????????????????????????????',
    ADDRESS            varchar(450) comment '????????????',
    ZIPCODE            varchar(10) comment '????????????',
    EMAIL              varchar(100) comment '????????????',
    PHONE              varchar(20) comment '????????????',
    EDUCATION          varchar(30) comment '??????',
    GRADUATESCHOOL     varchar(150) comment '????????????',
    WORKPLACE          varchar(300) comment '????????????',
    FIELD01            varchar(1000) comment '????????????01',
    FIELD02            varchar(1000) comment '????????????02',
    FIELD03            varchar(1000) comment '????????????03',
    FIELD04            varchar(1000) comment '????????????04',
    FIELD05            varchar(1000) comment '????????????05',
    FIELD06            varchar(1000) comment '????????????06',
    FIELD07            varchar(1000) comment '????????????07',
    FIELD08            varchar(1000) comment '????????????08',
    FIELD09            varchar(1000) comment '????????????09',
    FIELD10            varchar(1000) comment '????????????10',
    primary key (USERID)
);

alter table TAUSER comment '?????????';

/*==============================================================*/
/* Table: TAUSERCONNECTION                                             */
/*==============================================================*/

create table TAUSERCONNECTION (userId varchar(255) not null comment '????????????id',
                               providerId varchar(255) not null comment '?????????id',
                               providerUserId varchar(255) not null comment '???????????????id',
                               `rank` int not null comment '???????????????????????????????????????',
                               displayName varchar(255) comment '??????????????????',
                               profileUrl varchar(512) comment '????????????',
                               imageUrl varchar(512) comment '????????????',
                               accessToken varchar(512) not null comment '??????token',
                               secret varchar(512) comment '??????????????????',
                               refreshToken varchar(512) comment '??????token',
                               expireTime bigint comment '????????????',
                               primary key (userId, providerId, providerUserId))
    ENGINE=InnoDB DEFAULT CHARSET=utf8;
create unique index UserConnectionRank on TAUSERCONNECTION(userId, providerId, `rank`);

alter table TAUSERCONNECTION comment '??????????????????social???????????????';

/*==============================================================*/
/* Table: TAUSERORG                                             */
/*==============================================================*/
create table TAUSERORG
(
    USERID   varchar(32) not null comment '??????id',
    ORGID    varchar(32) not null comment '??????id',
    ISDIRECT varchar(1)  not null comment '????????????',
    primary key (USERID, ORGID)
);

alter table TAUSERORG comment '?????????????????????';

/*==============================================================*/
/* Table: TAUSERRESOURCE                                             */
/*==============================================================*/
create table tauserresource
(
    userid     varchar(36) not null comment '??????id',
    resourceid varchar(36) not null comment '??????id',
    createtime timestamp   not null comment '????????????',
    primary key (userid, resourceid)
);

alter table TAUSERRESOURCE comment '???????????????';

/*==============================================================*/
/* Table: TAUSERWORKBENCH                                       */
/*==============================================================*/
create table TAUSERWORKBENCH
(
    USERID        varchar(36) not null comment '??????id',
    WORKBENCHJSON TEXT comment '???????????????',
    LASTCHOOSEWORKBENCH TEXT comment '?????????????????????????????????',
    primary key (USERID)
);

alter table TAUSERWORKBENCH comment '?????????????????????';

/*==============================================================*/
/* Table: TAZOOKEEPERADDRESSMG                                       */
/*==============================================================*/
create table TAZOOKEEPERADDRESSMG
(
    ZKID         varchar(36) not null comment '????????????ID',
    ZKADDRESS    varchar(200) comment '??????????????????',
    APPNAME      varchar(60) comment '????????????',
    APPNAMESPACE varchar(30) comment '????????????',
    CONNECTFLAG  varchar(1) comment '????????????',
    primary key (ZKID)
);

alter table TAZOOKEEPERADDRESSMG comment 'ZK??????????????????';

/*==============================================================*/
/* Table: TAJOBDATASOURCEMG                                       */
/*==============================================================*/
create table TAJOBDATASOURCEMG
(
    DATASOURCEID   varchar(36) not null comment '?????????ID',
    DATASOURCENAME varchar(60) comment '???????????????',
    DRIVER         varchar(200) comment '???????????????',
    URL            varchar(200) comment '?????????URL',
    USERNAME       varchar(450) comment '???????????????',
    PASSWORD       varchar(100) comment '???????????????',
    primary key (DATASOURCEID)
);

alter table TAJOBDATASOURCEMG comment '???????????????????????????';

/*==============================================================*/
/* Table: FREEBUSYJOBMG                                       */
/*==============================================================*/
create table FREEBUSYJOBMG
(
    ID         varchar(36) not null comment '????????????ID',
    JOBNAME    varchar(60) comment '????????????',
    FREEMOMENT varchar(20) comment '????????????',
    BUSYMOMENT varchar(20) comment '????????????',
    SERVERIPS  varchar(200) comment '?????????IP??????',
    ZKID       varchar(36) comment 'zk????????????ID',
    primary key (ID)
);

alter table FREEBUSYJOBMG comment '??????????????????';



/*==============================================================*/
/* Table: TASYSCONFIG                                           */
/*==============================================================*/
create table tasysconfig
(
    id              varchar(36) not null comment '????????????id',
    fieldname       varchar(100) comment '????????????',
    defaultvalue    varchar(800) comment '?????????',
    originalvalue   varchar(800) comment '???????????????',
    datatype        varchar(1) comment '????????????',
    functiontype    varchar(1) comment '??????????????????',
    collectionname  varchar(100) comment '????????????',
    collectiondatas varchar(2000) comment '?????????',
    flag            numeric(10) comment '????????????',
    configcomment   varchar(1024) comment '??????',
    createtime      datetime comment '????????????',
    updatetime      datetime comment '????????????',
    opuserid        varchar(36) comment '???????????????id',
    opusername      varchar(36) comment '?????????????????????',
    primary key (id)
);

alter table TASYSCONFIG comment '????????????';


/*==============================================================*/
/* Table: taexamine ?????????                                       */
/*==============================================================*/

create table taexamine
(
    id             varchar(36) not null comment '??????id',
    opuserid       varchar(50) comment '?????????id',
    checkstatus    varchar(1)  not null comment '???????????????0???????????????1????????????, 2: ?????????)',
    checkmsg       varchar(200) comment '????????????',
    createtime     datetime    not null comment '????????????',
    updatetime     datetime comment '????????????',
    opname         varchar(50) comment '????????????',
    opusername     varchar(50) comment '???????????????',
    checkerid      varchar(36) comment '?????????',
    checkername    varchar(36) comment '???????????????',
    checkeropinion varchar(200) comment '????????????',
    opobjecttype   varchar(36) comment '??????????????????',
    primary key (id)
);
alter table taexamine comment '?????????';

/*==============================================================*/
/* Table: taexaminelocked ???????????????                              */
/*==============================================================*/
create table taexaminelocked
(
    id           varchar(36) not null comment '??????id',
    examineid    varchar(36) comment '??????id',
    lockedtype   varchar(1) comment '0:???????????? 1??????????????????',
    lockedkey    varchar(100) comment '?????????key',
    createtime   datetime comment '????????????',
    opobjecttype varchar(36) comment '????????????',
    lockedmode   varchar(1) comment '????????????',
    primary key (id)
);

alter table taexamine comment '???????????????';

/*==============================================================*/
/* Table: taexamine ???????????????                                    */
/*==============================================================*/

create table taexaminechild
(
    id         varchar(36) not null comment 'id',
    examineid  varchar(36) comment '??????id',
    beforedata longblob comment '????????????????????????????????????',
    afterdata  longblob comment '????????????????????????????????????',
    dataclass  varchar(200) comment '???????????????????????????(??????)',
    classname  varchar(200) comment '???????????????',
    methodname varchar(200) comment '?????????',
    param      longblob comment '?????????????????????????????????',
    primary key (id)
);
alter table taexaminechild comment '????????????';

/*==============================================================*/
/* Table: taloginfaillog ??????????????????                             */
/*==============================================================*/
create table taloginfaillog
(
    logid            varchar(36) not null comment '??????ID',
    loginid          varchar(36) comment '??????id',
    failpassword     varchar(50) comment '??????',
    failreason       varchar(200) comment '??????????????????',
    logintime        datetime comment '????????????',
    clientip         varchar(200) comment '?????????IP',
    serverip         varchar(200) comment '?????????IP',
    clientsystem     varchar(50) comment '???????????????',
    clientbrowser    varchar(50) comment '??????????????????',
    clientscreensize varchar(50) comment '??????????????????',
    hashverity       varchar(200) comment 'hash??????',
    syspath          varchar(50) comment '????????????',
    primary key (logid)
);

alter table taloginfaillog comment '?????????????????????';

/*==============================================================*/
/* Table: taaccessdenylog ?????????????????????                          */
/*==============================================================*/
create table taaccessdenylog
(
    logid            varchar(36) not null comment '??????ID',
    url              varchar(200) comment '??????URL',
    userid           varchar(36) comment '??????ID',
    accesstime       datetime comment '????????????',
    clientip         varchar(200) comment '?????????IP',
    serverip         varchar(50) comment '?????????IP',
    clientsystem     varchar(50) comment '???????????????',
    clientbrowser    varchar(50) comment '??????????????????',
    accessdenytype   varchar(2) comment '???????????? 01: ?????????(TOKEN ??????) 02???????????? 03?????????',
    clientscreensize varchar(50) comment '??????????????????',
    menuid           varchar(50) comment '??????id',
    hashverity       varchar(200) comment 'hash ??????',
    primary key (logid)
);

alter table taaccessdenylog comment '?????????????????????';

/*==============================================================*/
/* Table: taaudit ?????????                                         */
/*==============================================================*/
create table taaudit
(
    auditid        varchar(36) not null comment '??????ID',
    userid         varchar(36) not null comment '??????ID',
    auditcontent   varchar(1024) comment '????????????',
    auditdate      datetime comment '????????????',
    excelname      varchar(64) comment '?????????',
    aliasexcelname varchar(64) comment '????????????',
    audittype      varchar(1) comment  '1??????????????? 2??????????????? 3??????????????? 4??????????????? 5???????????????',
    storetype      varchar(1) comment '????????????(1:????????? 2:?????? 3:??????????????????',
    hashverity      varchar(200) comment 'hash ??????',
    primary key (auditid)
);
alter table taaudit comment '???????????????';


create table tadynamicrest
(
    id         VARCHAR(36)   not null COMMENT '????????????',
    `sql`        VARCHAR(2048) not null COMMENT 'sql',
    dsname     VARCHAR(128)  not null COMMENT '???????????????',
    restid     VARCHAR(255)  not null COMMENT '??????ID',
    restname   VARCHAR(128)  not null COMMENT '????????????',
    effective  VARCHAR(1)    not null COMMENT '????????????',
    createtime DATETIME      not null COMMENT '????????????',
    createuser VARCHAR(36)   not null COMMENT '????????????',
    PRIMARY KEY (id)
);
alter table tadynamicrest comment '???????????????';

/*==============================================================*/
/* ????????????-???                                                  */
/*==============================================================*/
create table TAMSGNOTICE
(
    MID             VARCHAR(36)    not null comment '??????ID',
    SENDERID        VARCHAR(36)    not null comment '?????????ID',
    SENDERNAME      VARCHAR(450)   not null comment '?????????name',
    SENDDATE  		datetime       not null comment '????????????',
    TITLE           VARCHAR(200)   not null comment '??????',
    CONTENT         TEXT           not null comment '??????',
    TYPE            VARCHAR(10)     not null comment '??????',
    MENUUURL        VARCHAR(200)       null comment '????????????????????????',
    OTHERDATA       VARCHAR(500)       null comment '??????',
    constraint PK_NOTICE primary key (MID)
);
alter table TAMSGNOTICE comment '?????????';

create table TAMSGNOTICESTATE
(
    MID             VARCHAR(36)    not null comment '??????ID',
    RECEIVERID      VARCHAR(36)    not null comment '?????????ID',
    READSIGN        VARCHAR(1)     not null comment '????????????'
);
alter table  TAMSGNOTICESTATE comment '???????????????';

create table TAMSGNOTICEANNEX
(
    MID             VARCHAR(36)    	   null comment '??????ID',
    ANNEXID         VARCHAR(36)    not null comment '??????ID',
    ANNEXNAME       VARCHAR(100)   not null comment '????????????',
    ANNEX           longblob           null comment '??????',
    constraint PK_ANNEX primary key (ANNEXID)
);
alter table TAMSGNOTICEANNEX comment '???????????????';

create table TAMSGCHAT
(
    CHATID			VARCHAR(36)    not null comment '??????ID',
    `OWNER` 			VARCHAR(36)    not null comment '?????????',
    TWOUSERID       VARCHAR(36)    not null comment '?????????',
    TWONAME         VARCHAR(100)   not null comment '?????????name',
    constraint PK_CHAT primary key (CHATID,OWNER)
);
alter table TAMSGCHAT comment '???????????????';

create table TAMSGLETTER
(
    MID             VARCHAR(36)    not null comment '??????ID',
    CHATID			VARCHAR(36)    not null comment '??????ID',
    SENDERID        VARCHAR(36)    not null comment '?????????',
    SENDERNAME      VARCHAR(100)   not null comment '?????????name',
    SENDDATE  		datetime       not null comment '????????????',
    RECEIVERID      VARCHAR(36)    not null comment '?????????',
    CONTENT         VARCHAR(450)   not null comment '??????',
    TYPE            VARCHAR(2)     not null comment '??????',
    READSIGN        VARCHAR(1)     not null comment '????????????',
    constraint PK_LETTER primary key (MID)
);
alter table TAMSGLETTER comment '???????????????';
/*==============================================================*/
/* ????????????-??? -end                                              */
/*==============================================================*/

create table TAURL(
                      ID          VARCHAR(36) NOT NULL COMMENT '??????',
                      NAME        VARCHAR(128) NOT NULL COMMENT 'url ??????' ,
                      URL         VARCHAR(255) NOT NULL COMMENT 'url ??????',
                      NAMESPACE   VARCHAR(36) COMMENT '????????????????????????',
                      TYPE        VARCHAR(1) NOT NULL COMMENT '?????????????????????????????????rest url ?????????',
                      EFFECTIVE   VARCHAR(2) NOT NULL COMMENT '????????????',
                      CREATETIME  datetime NOT NULL COMMENT '????????????',
                      CREATEUSER  VARCHAR(36)  NOT NULL COMMENT '????????????'
);

alter table TAURL comment 'URL ?????????';

/*==============================================================*/
/* ??????????????????-???                                                */
/*==============================================================*/
CREATE TABLE TATEMPLATE (
                            TEMPLATEID      VARCHAR(36)     NOT NULL    COMMENT '??????ID',
                            TEMPLATENAME    VARCHAR(100)    NOT NULL    COMMENT '????????????',
                            TEMPLATETYPE    VARCHAR(2)      NOT NULL    COMMENT '????????????',
                            TEMPLATEINTRO   VARCHAR(255)    NOT NULL    COMMENT '????????????',
                            TEMPLATECONTENT TEXT            NOT NULL    COMMENT '????????????',
                            EFFECTIVE       VARCHAR(1)      NOT NULL    COMMENT '?????????',
                            DESTROY         VARCHAR(1)      NOT NULL    COMMENT '????????????',
                            CREATEUSER      VARCHAR(36)     NOT NULL    COMMENT '?????????',
                            CREATEDATE      datetime        NOT NULL    COMMENT '????????????',
                            constraint PK_TATEMPLATE primary key (TEMPLATEID)
);

alter table TATEMPLATE comment '?????????????????????';
/*==============================================================*/
/* ??????????????????-???  end                                           */
/*==============================================================*/

CREATE TABLE seq (
                     name varchar(20) NOT NULL DEFAULT '',
                     val bigint(20) unsigned NOT NULL,
                     PRIMARY KEY (name)
);
INSERT INTO seq (name,val) VALUES  ('SEQ_DEFAULT',1000000000);
INSERT INTO seq (name,val) VALUES  ('HIBERNATE_SEQUENCE',1000000000);

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE FUNCTION  seq(seq_name varchar(20)) RETURNS bigint(20)
BEGIN
UPDATE seq SET val = LAST_INSERT_ID(val+1) WHERE name = seq_name;
RETURN LAST_INSERT_ID();
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

create OR REPLACE view v_dict (name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks,
                               createdate, createuser, version, status, field01, field02, field03, field04, field05,
                               `SYSTEM`, newtype) as
select x0.name,
       x0.type,
       x0.label,
       x0.value,
       x0.parentvalue,
       x0.sort,
       x0.authority,
       x0.cssclass,
       x0.cssstyle,
       x0.remarks,
       x0.createdate,
       x0.createuser,
       x0.version,
       x0.status,
       x0.field01,
       x0.field02,
       x0.field03,
       x0.field04,
       x0.field05,
       x0.`SYSTEM`,
       x0.newtype
from tadict x0;


CREATE VIEW V_RESOURCECATEGORY(CATEGORYID, CATEGORYNAME, EFFECTIVE, CODE, CATEGORYCONTENT) AS
SELECT '1' AS CATEGORYID, '????????????', '1' AS EFFECTIVE, 'org_code' AS CODE, '' AS CATEGORYCONTENT FROM TAORG WHERE DESTORY = '0'
UNION SELECT CATEGORYID, CATEGORYNAME, EFFECTIVE, CODE, CATEGORYCONTENT FROM TARESOURCECATEGORY;

CREATE VIEW V_CUSTOMRESOURCE(CUSTOMRESOURCEID, RESOURCENAME, PARENTID, CODE, RESOURCECONTENT, RESOURCECATEGORY, EFFECTIVE, ADDTIME, MODIFYTIME, `SYSTEM`) AS
SELECT CUSTOMRESOURCEID, RESOURCENAME, PARENTID, CODE, RESOURCECONTENT, RESOURCECATEGORY, EFFECTIVE, ADDTIME, MODIFYTIME, `SYSTEM` FROM TACUSTOMRESOURCE
UNION
SELECT ORGID AS CUSTOMERESOURCEID, ORGNAME AS RESOURCENAME, PARENTID, CUSTOMNO AS CODE, AREA AS RESOURCECONTENT, '1' AS RESOURCECATEGORY , EFFECTIVE, CREATETIME AS ADDTIME, NULL AS MODIFYTIME, 'E55B9B7046434D66BC11B94D553FADA2' AS `SYSTEM` FROM TAORG
WHERE DESTORY = '0' AND PARENTID != '0'
    UNION
SELECT ORGID AS CUSTOMERESOURCEID, ORGNAME AS RESOURCENAME, '1' AS PARENTID, CUSTOMNO AS CODE, AREA AS RESOURCECONTENT, '1' AS RESOURCECATEGORY , EFFECTIVE, CREATETIME AS ADDTIME, NULL AS MODIFYTIME, 'E55B9B7046434D66BC11B94D553FADA2' AS `SYSTEM` FROM TAORG
WHERE DESTORY = '0' AND PARENTID = '0';


--  ??????????????????
INSERT INTO tauser(userid, loginid, password, passworddefaultnum, pwdlastmodifydate, islock, orderno, name, sex, idcardtype, idcardno, mobile, createuser, createtime, modifytime, destory, accountsource, effective, effectivetime, jobnumber, state, birthplace, address, zipcode, email, phone, education, graduateschool, workplace, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10) VALUES ('3', 'auditor', '$2a$10$ZI3ewI1LvnS8bvTDiZk5X.w9/u.LXy8vPTwQFl8SlDtMTYBQHnIEm', 0, now(), '0', 21, '?????????????????????', '1', NULL, NULL, NULL, '1', now(), NULL, '0', NULL, '1', NULL, NULL, NULL, NULL, '?????????/?????????/????????????', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO tauser(userid, loginid, password, passworddefaultnum, pwdlastmodifydate, islock, orderno, name, sex, idcardtype, idcardno, mobile, createuser, createtime, modifytime, destory, accountsource, effective, effectivetime, jobnumber, state, birthplace, address, zipcode, email, phone, education, graduateschool, workplace, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10) VALUES ('2', 'examiner', '$2a$10$ZI3ewI1LvnS8bvTDiZk5X.w9/u.LXy8vPTwQFl8SlDtMTYBQHnIEm', 0, now(), '0', 11, '?????????????????????', '1', NULL, NULL, NULL, '1', now(), NULL, '0', NULL, '1', NULL, NULL, NULL, NULL, '?????????/?????????/????????????', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO tauser(userid, loginid, password, passworddefaultnum, pwdlastmodifydate, islock, orderno, name, sex, idcardtype, idcardno, mobile, createuser, createtime, modifytime, destory, accountsource, effective, effectivetime, jobnumber, state, birthplace, address, zipcode, email, phone, education, graduateschool, workplace, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10) VALUES ('1', 'developer', '$2a$10$ZI3ewI1LvnS8bvTDiZk5X.w9/u.LXy8vPTwQFl8SlDtMTYBQHnIEm', 0, now(), '0', 1, '???????????????', '1', '', NULL, '', '1', now(), NULL, '0', NULL, '1', NULL, NULL, NULL, NULL, '?????????/?????????/????????????', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--  ??????????????????
INSERT INTO taorg(orgid, orgname, spell, parentid, idpath, namepath, customno, orderno, orglevel, area, effective, orgtype, createuser, createtime, modifytime, orgmanager, orgcode, contacts, address, tel, destory, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10) VALUES ('fd811ab9c30440088df3e29ea784460a', '????????????', 'DJZZ', '0', 'fd811ab9c30440088df3e29ea784460a', '????????????', '', 0, 0, '', '1', '01', '1', NULL, now(), '', '', '', '', '', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--  ???????????????
INSERT INTO tarole(roleid, rolename, isadmin, rolelevel, orgid, roletype, effective, effectivetime, createuser, createtime, roledesc, rolesign, subordinate) VALUES ('1',  '???????????????',  NULL,  NULL,  'fd811ab9c30440088df3e29ea784460a',  '04',  '1',  NULL,  '1',  now(),  '?????????????????????',  NULL,  NULL);
INSERT INTO tarole(roleid, rolename, isadmin, rolelevel, orgid, roletype, effective, effectivetime, createuser, createtime, roledesc, rolesign, subordinate) VALUES ('6908dc02a2af43a39dd8be7d9bcbbaa4',  '?????????????????????',  NULL,  NULL,  'fd811ab9c30440088df3e29ea784460a',  '02',  '1',  NULL,  '1',  now(),  NULL,  NULL,  NULL);
INSERT INTO tarole(roleid, rolename, isadmin, rolelevel, orgid, roletype, effective, effectivetime, createuser, createtime, roledesc, rolesign, subordinate) VALUES ('c7a290c35198445dbaa5d45af0cbf007',  '?????????????????????',  NULL,  NULL,  'fd811ab9c30440088df3e29ea784460a',  '05',  '1',  NULL,  '1',  now(),  NULL,  NULL,  NULL);


--  ????????????????????????
INSERT INTO tauserorg(userid, orgid, isdirect) VALUES ('1', 'fd811ab9c30440088df3e29ea784460a', '1');
INSERT INTO tauserorg(userid, orgid, isdirect) VALUES ('2', 'fd811ab9c30440088df3e29ea784460a', '1');
INSERT INTO tauserorg(userid, orgid, isdirect) VALUES ('3', 'fd811ab9c30440088df3e29ea784460a', '1');


-- ????????????????????????????????????
INSERT INTO taroleuser(userid, roleid, defaultrole, createuser, createtime) VALUES ('2', '6908dc02a2af43a39dd8be7d9bcbbaa4', '0', '1', now());
INSERT INTO taroleuser(userid, roleid, defaultrole, createuser, createtime) VALUES ('3', 'c7a290c35198445dbaa5d45af0cbf007', '0', '1', now());
INSERT INTO taroleuser(userid, roleid, defaultrole, createuser, createtime) VALUES ('1', '1', '0', '1', now());


--  ???????????????
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'OPOBJTYPE', '???????????????', '08', NULL, 80, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'LOGLEVEL', 'OFF', '0', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'ROLETYPE', '????????????', '04', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'ROLESIGN', '????????????', '2', NULL, 2, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'ROLESIGN', '????????????', '1', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('?????????????????????????????????', 'ELEMENTAUTHORITYPOLICY', '?????????', '0', NULL, 31, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('?????????????????????????????????', 'ELEMENTAUTHORITYPOLICY', '????????????????????????', '1', '', 21, '0', '', '', NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('?????????????????????????????????', 'ELEMENTAUTHORITYPOLICY', '?????????????????????', '2', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'ACCOUNTTYPE', '????????????', '2', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'ACCOUNTTYPE', '????????????', '1', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????????????????', 'UIAUTHORITYPOLICY', '????????????????????????', '0', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????????????????', 'UIAUTHORITYPOLICY', '????????????', '1', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'SECURITYPOLICY', '?????????????????????', '0', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'SECURITYPOLICY', '??????????????????', '1', NULL, 2, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'SECURITYPOLICY', '???????????????', '2', NULL, 3, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'EFFECTIVE', '??????', '1', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'EFFECTIVE', '??????', '0', NULL, 0, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'IDCARDTYPE', '???????????????(?????????)', '0', '', 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'IDCARDTYPE', '??????', '1', '', 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'IDCARDTYPE', '?????????', '2', '', 30, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'CONFIGFUNCTIONCATEGORY', '????????????', 'ta404.modules.cache', NULL, 70, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('???????????????', 'CHECKCODETYPE', 'simple', 'simple', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'IDCARDTYPE', '??????', '3', '', 40, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'AUTHMODE', '???????????????', '01', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'AUTHMODE', '????????????', '02', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'AUTHMODE', '????????????', '03', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'AUTHMODE', 'Key???', '04', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????', '01', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????', '02', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????', '03', NULL, 30, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????', '04', NULL, 40, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????', '05', NULL, 50, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????', '06', NULL, 60, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????', '07', NULL, 70, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????', '08', NULL, 80, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????', '09', NULL, 90, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????', '10', NULL, 100, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????????????????', '12', NULL, 110, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????', '13', NULL, 120, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????', '14', NULL, 130, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????', '15', NULL, 140, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '?????????????????????????????????', '16', NULL, 150, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????', '17', NULL, 160, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????', '18', NULL, 170, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????', '19', NULL, 180, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????', '20', NULL, 190, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '??????????????????', '21', NULL, 200, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '??????????????????', '22', NULL, 210, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '??????????????????', '23', NULL, 220, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '??????????????????', '24', NULL, 230, '0', NULL, NULL, NULL, now(), '1', '1', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '??????????????????', '25', NULL, 240, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '??????????????????????????????', '26', NULL, 250, '0', NULL, NULL, NULL, now(), '1', '1', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '??????????????????????????????', '27', NULL, 260, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '??????????????????????????????', '28', NULL, 270, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '??????????????????????????????', '29', NULL, 280, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '??????????????????????????????', '30', NULL, 290, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '??????????????????????????????', '31', NULL, 300, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '?????????????????????????????????', '32', NULL, 310, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '?????????????????????????????????', '33', NULL, 320, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '??????????????????????????????', '34', NULL, 330, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????', '35', NULL, 340, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????', '36', NULL, 350, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '??????????????????', '37', NULL, 360, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '??????????????????', '38', NULL, 370, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????????????????????????????', '39', NULL, 380, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '??????????????????', '40', NULL, 390, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????????????????????????????', '41', NULL, 400, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????', '43', NULL, 420, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'OPOBJTYPE', '????????????', '01', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'OPOBJTYPE', '????????????', '02', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'OPOBJTYPE', '??????', '03', NULL, 30, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'OPOBJTYPE', '????????????', '04', NULL, 40, '0', NULL, NULL, NULL, now(), '1', '1', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'OPOBJTYPE', '????????????', '05', NULL, 50, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'OPOBJTYPE', '????????????', '06', NULL, 60, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'OPOBJTYPE', '????????????', '07', NULL, 70, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'LOGLEVEL', 'ERROR', '1', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '1', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'LOGLEVEL', 'WARN', '2', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '1', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'LOGLEVEL', 'INFO', '3', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '1', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'LOGLEVEL', 'DEBUG', '4', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '1', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'LOGLEVEL', 'TRACE', '5', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '1', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'LOGLEVEL', 'ALL', '6', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '1', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'SECURIYTLEVEL', '?????????', '0', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'SECURIYTLEVEL', '??????', '1', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'SECURIYTLEVEL', '??????', '2', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'SECURIYTLEVEL', '??????', '3', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'SECURIYTLEVEL', '??????', '4', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'DICTDATATYPE', '?????????', '0', '', 0, '0', '', '', NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'DICTDATATYPE', '?????????', '2', '', 2, '0', '', '', NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'DICTDATATYPE', '?????????', '1', '', 1, '0', '', '', NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????', 'YESORNO', '???', '1', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????', 'YESORNO', '???', '0', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'ORGTYPE', '??????', '01', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'ORGTYPE', '??????', '02', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'ORGTYPE', '???', '03', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'ROLETYPE', '????????????', '01', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'ROLETYPE', '????????????', '03', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????', 'HAVAORNOT', '???', '0', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'RESOURCETYPE', '????????????', '0', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'RESOURCETYPE', '????????????', '1', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'RESOURCETYPE', '????????????', '2', NULL, 1, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????', 'HAVAORNOT', '???', '1', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????', 'STATE', '??????', '1', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????', 'STATE', '??????', '0', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'SITEEFFECTIVE', '??????', '1', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'SITEEFFECTIVE', '??????', '0', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'SITETYPE', '??????', '1', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'SITETYPE', '????????????', '2', NULL, 30, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'SITETYPE', '?????????', '3', NULL, 40, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'FILERESOURCETYPE', '??????', '1', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'FILERESOURCETYPE', '????????????', '3', NULL, 30, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'FILERESOURCETYPE', '????????????', '2', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '1', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'SITETYPE', 'APP', '0', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'AREALEVEL', '???', '1', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'AREALEVEL', '???/???', '2', NULL, 30, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'AREALEVEL', '??????', '4', NULL, 50, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'AREALEVEL', '???/?????????', '0', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'AREALEVEL', '??????/???', '3', NULL, 40, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'ISSUCCESS', '??????', '0', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'ISSUCCESS', '??????', '1', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'TEMPLATETYPE', '????????????', '1', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'TEMPLATETYPE', '????????????', '2', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'AVAILABLE', '?????????', '0', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'AVAILABLE', '??????', '1', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('?????????', 'BL', 'true', 'true', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('?????????', 'BL', 'false', 'false', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'CONFIGFUNCTIONCATEGORY', '??????????????????', 'ta404.component.org', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'CONFIGFUNCTIONCATEGORY', '????????????', 'ta404.component.examine', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'CONFIGFUNCTIONCATEGORY', 'online??????', 'ta404.modules.online', NULL, 30, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'CONFIGFUNCTIONCATEGORY', '???????????????', 'ta404.modules.captcha', NULL, 40, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'CONFIGFUNCTIONCATEGORY', '????????????', 'ta404.log', NULL, 50, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'CONFIGFUNCTIONCATEGORY', 'web????????????', 'ta404.component.security', NULL, 60, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'CONFIGSYSTEMCATEGORY', '????????????', 'ta404.resource.cors', null, 110, '0', null, null, null, now(), '1', '0', '1', null, null, null, null, null, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'CONFIGSYSTEMCATEGORY', '??????????????????', 'ta404.modules.websecurity', null, 90, '0', null, null, null, now(), '1', '1', '1', null, null, null, null, null, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'CONFIGSYSTEMCATEGORY', '????????????', 'ta404.modules.dict', NULL, 40, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'CONFIGSYSTEMCATEGORY', '??????????????????', 'ta404.modules.cluster', NULL, 60, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'CONFIGSYSTEMCATEGORY', '??????????????????', 'ta404.batch', NULL, 70, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'CONFIGSYSTEMCATEGORY', 'redis??????????????????', 'ta404.modules.registry-center', NULL, 80, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'CONFIGSYSTEMCATEGORY', 'elasticjob??????', 'ta404.modules.elasticjob', NULL, 100, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'CONFIGSYSTEMCATEGORY', 'mapper????????????', 'ta404.modules.refresh-mapper-xml', NULL, 100, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('???????????????', 'CHECKCODETYPE', 'slide', 'slide', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'LOGOUTPUTTYPE', 'console', 'console', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'LOGOUTPUTTYPE', 'file', 'file', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'LOGOUTPUTTYPE', 'kafka', 'kafka', NULL, 30, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('???????????????????????????', 'ENCODERTYPE', 'BCRYPT', 'BCRYPT', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('???????????????????????????', 'ENCODERTYPE', 'MD5', 'MD5', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('???????????????????????????', 'ENCODERTYPE', 'Sm2', 'Sm2', NULL, 30, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('???????????????????????????', 'ENCODERTYPE', 'Sm3', 'Sm3', NULL, 40, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('???????????????????????????', 'ENCODERTYPE', 'Sm4', 'Sm4', NULL, 50, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'CACHEMODE', 'ehcache', 'ehcache', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'CONFIGDATATYPE', '??????(TEXT)', '1', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'CONFIGDATATYPE', '??????(DATE)', '2', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'CONFIGDATATYPE', '??????(SELECTINPUT)', '3', NULL, 30, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'CONFIGDATATYPE', '??????(NUMBER)', '4', NULL, 40, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'CONFIGDATATYPE', 'YAML(YML)', '5', NULL, 50, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'OPTYPE', '????????????', '50', NULL, 410, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'EXAMINEISCHECK', '?????????', '1', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'EXAMINEISCHECK', '?????????', '2', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????', 'SEX', '???', '1', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????', 'SEX', '???', '2', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????', 'SEX', '???', '0', NULL, 30, '0', NULL, NULL, NULL, now(), '1', '1', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('URL????????????', 'URLTYPE', '????????????', '0', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('URL????????????', 'URLTYPE', '????????????URL', '1', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'AUDITTYPE', '????????????', '1', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'AUDITTYPE', '????????????', '2', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'AUDITTYPE', '????????????', '4', NULL, 40, '0', NULL, NULL, NULL, now(), '1', '1', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'AUDITTYPE', '????????????', '3', NULL, 30, '0', NULL, NULL, NULL, now(), '1', '1', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'AUDITTYPE', '????????????', '5', NULL, 50, '0', NULL, NULL, NULL, now(), '1', '1', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'AUDITTYPE', '????????????', '6', NULL, 60, '0', NULL, NULL, NULL, now(), '1', '1', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'AUDITTYPE', '??????????????????', '8', NULL, 80, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'AUDITTYPE', '??????????????????', '7', NULL, 70, '0', NULL, NULL, NULL, now(), '1', '1', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'STORETYPE', '?????????', '1', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'STORETYPE', '??????', '2', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'STORETYPE', '???????????????', '3', NULL, 30, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'AUDITTYPE', '????????????????????????', '9', NULL, 90, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'ACCESSDENYTYPE', '?????????(TOKEN ??????)(TOKEN ??????)', '01', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'ACCESSDENYTYPE', '?????????', '02', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'ACCESSDENYTYPE', '??????', '03', NULL, 30, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'RAQTYPE', '????????????', '0', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'RAQTYPE', '?????????', '1', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'RAQTYPE', '?????????', '2', NULL, 30, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'ROLETYPE', '????????????', '02', NULL, 11, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'ROLETYPE', '????????????', '05', NULL, 21, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('?????????????????????', 'WORKTABLECOMPONENTTYPE', '????????????', '0', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('?????????????????????', 'WORKTABLECOMPONENTTYPE', '????????????', '3', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('?????????????????????', 'WORKTABLECOMPONENTTYPE', '????????????', '4', NULL, 30, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'CONFIGFUNCTIONCATEGORY', 'token??????', 'ta404.modules.security.token', null, 80, '0', null, null, null, now(), '1', '0', '1', null, null, null, null, null, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'CONFIGFUNCTIONCATEGORY', '????????????', 'ta404.component.audit', null, 90, '0', null, null, null, now(), '1', '0', '1', null, null, null, null, null, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'ACCESSDENYTYPE', '????????????????????????', '04', null, 40, '0', null, null, null, now(), '1', '0', '1', null, null, null, null, null, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('????????????', 'ACCESSDENYTYPE', '??????IP?????????', '05', null, 50, '0', null, null, null, now(), '1', '0', '1', null, null, null, null, null, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'EXAMINELOCKEDOBJECT', '??????', '1', null, 10, '0', null, null, null, now(), '1', '0', '1', null, null, null, null, null, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'EXAMINELOCKEDOBJECT', '??????', '4', null, 40, '0', null, null, null, now(), '1', '0', '1', null, null, null, null, null, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'EXAMINELOCKEDOBJECT', '????????????', '3', null, 30, '0', null, null, null, now(), '1', '1', '1', null, null, null, null, null, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????????????????', 'EXAMINELOCKEDOBJECT', '??????', '2', null, 20, '0', null, null, null, now(), '1', '1', '1', null, null, null, null, null, '1', '0');
-- ????????????
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????', 'EDUCATION', '???????????????', '1', NULL, 10, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????', 'EDUCATION', '??????/??????', '2', NULL, 20, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????', 'EDUCATION', '??????', '3', NULL, 30, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????', 'EDUCATION', '??????', '4', NULL, 40, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????', 'EDUCATION', '??????', '5', NULL, 50, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????', 'EDUCATION', '??????', '6', NULL, 60, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');
INSERT INTO tadict(name, type, label, value, parentvalue, sort, authority, cssclass, cssstyle, remarks, createdate, createuser, version, status, field01, field02, field03, field04, field05, `SYSTEM`, newtype) VALUES ('??????', 'EDUCATION', '??????', '7', NULL, 70, '0', NULL, NULL, NULL, now(), '1', '0', '1', NULL, NULL, NULL, NULL, NULL, '1', '0');

-- ?????????URL?????????
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('ec651e93d17d45b4a2179efa40e3d218', '??????????????????', 'org/orguser/orgManagementRestService/getOrgByOrgId', 'aa60a746c0a24640a06dea49a4d42572', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('e21705b74aa14db3a01388c30ec36c4c', '????????????', 'audit/taAuditResService/queryAuditList', 'fe98234d9a0a4f2a9228743a58e86d54', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('76214a306e0e44f8b8f19eae5fa0dd1c', '?????????????????????????????????', 'org/authority/authorityAgentRestService/queryCustomUsePermissionAsync', 'c4360fdef9ad46278a677508ee8b290a', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('0941e708ddac4155b7d4d1b6a1fc2e8e', '??????????????????????????????', 'org/authority/roleAuthorityManagementRestService/queryAuthRole', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('e0d0c362e8f7483680c5daf3fc2bb987', '????????????????????????????????????', 'org/authority/adminAuthorityManagementRestService/changeCustomResourceUsePermission', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('90765bc3d2e74ae7b4adf1f7fa97a204', '??????????????????', 'org/orguser/userManagementRestService/getUserByUserId', 'b32b96d0142d4fea8d5fd8a58011c0c2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('0c53f4294d9b40699e7fa440af6b7ad0', '?????????????????????????????????', 'org/authority/adminAuthorityManagementRestService/updateCustomResourceUsePermissionEffectiveTime', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('9fc1eaec4a364bada22396dc233faa63', '????????????', 'tasysconfig/taSysConfigRestService/refreshSysConfig', '3154d229a4244fda90903cb56f7da445', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('46caf3a83bb34d248e86cb2b7d6e0ed8', '????????????????????????', 'logmg/loginLog/loginLogAnalysisRestService/online', '39683443f5e84c67913039e4c53133d1', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('ca6ae64039b34b61ac33444db8586583', '??????????????????', 'logmg/loginLog/loginLogAnalysisRestService/login', '39683443f5e84c67913039e4c53133d1', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('8fe5b7e8c0564c1183964b3ef47de089', '??????????????????', 'message/removeChat', '415a0c59d499478da3b40fc896470569', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('b309d59e4888483c9491f836a673edb2', '??????????????????', 'message/readLetters', '415a0c59d499478da3b40fc896470569', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('45fea7f87ddf4f419e5c1e5b7b356f2a', '??????????????????', 'message/queryUserNotice', '415a0c59d499478da3b40fc896470569', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('5251eff95b944e96937d43afdd41823a', '?????????????????????', 'message/queryOrgUser', '415a0c59d499478da3b40fc896470569', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('ea59a4b2d0c04678b6845dc2ff58e5f0', '????????????????????????', 'tasysconfig/taSysConfigRestService/selectOne', '3154d229a4244fda90903cb56f7da445', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('571beb27637e4a02a40b30b01eb977a1', '???????????????', 'examine/taExamineRestService/examineChart', '475f84c0bc3f4702a1e3d76de7e84f35', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('1ba2429d2cf741eaa651d135cecfccfa', '??????????????????', 'examine/taExamineRestService/batchRefusePass', '475f84c0bc3f4702a1e3d76de7e84f35', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('8f4c664e4eac467e823cca1dae037afa', '????????????????????????', 'examine/taExamineRestService/selectOne', '475f84c0bc3f4702a1e3d76de7e84f35', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('195ea431cbda47599912e600593916d9', '??????????????????', 'examine/taExamineRestService/batchExamineSomeone', '475f84c0bc3f4702a1e3d76de7e84f35', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('44432ccd6aee42d5b8e7a5fa333335a6', '????????????', 'codetable/getCode', null, '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('0e78d360879a4bd38b3fa9c492dd106a', '????????????????????????', 'jobmg/elasticjob/jobDatasourceManagementRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('a8897d46eef944efbfee9693dc0566b2', '???????????????', 'jobmg/elasticjob/jobDatasourceManagementRestService/getJobDatasource', '0e78d360879a4bd38b3fa9c492dd106a', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('c16ef6c06f0a4ee8a47a8d853171a7ff', '???????????????', 'jobmg/elasticjob/jobDatasourceManagementRestService/addJobDatasource', '0e78d360879a4bd38b3fa9c492dd106a', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('7b5dbd9796374fb4818ef6f992fb90cd', '???????????????', 'jobmg/elasticjob/jobDatasourceManagementRestService/deleteJobDatasource', '0e78d360879a4bd38b3fa9c492dd106a', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('1f662d581613479f9cf7438aad814f6e', '??????????????????????????????', 'jobmg/elasticjob/jobDatasourceManagementRestService/getJobExecutionTrace', '0e78d360879a4bd38b3fa9c492dd106a', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('b32f17c028cc44ada9d2a8472e608b33', '????????????????????????', 'jobmg/elasticjob/jobDatasourceManagementRestService/getJobStatusTrace', '0e78d360879a4bd38b3fa9c492dd106a', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('475f84c0bc3f4702a1e3d76de7e84f35', '????????????', 'examine/taExamineRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('c48caa74d4614c63892fbae774a6c113', '????????????', 'examine/taExamineRestService/examineSomeone', '475f84c0bc3f4702a1e3d76de7e84f35', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('fc88cde084394fac9fabf7d39268df37', '????????????', 'examine/taExamineRestService/refusePass', '475f84c0bc3f4702a1e3d76de7e84f35', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('7e13bb8bad344530abc0c997e6f29c6a', '??????????????????', 'examine/taExamineRestService/queryExamine', '475f84c0bc3f4702a1e3d76de7e84f35', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('15f7e09d42124995bb44c18ce7b625de', '??????????????????', 'examine/taExamineRestService/queryExamineLog', '475f84c0bc3f4702a1e3d76de7e84f35', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('0181353f447e466ba81475d7c265aa89', '??????????????????', 'examine/taExamineRestService/queryExamineDetail', '475f84c0bc3f4702a1e3d76de7e84f35', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('39683443f5e84c67913039e4c53133d1', '??????????????????', 'logmg/loginLog/loginLogAnalysisRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('f90d3e743f6f4505b139b089eb05e5bc', '?????????????????????', 'logmg/loginLog/loginLogAnalysisRestService/getSysTime', '39683443f5e84c67913039e4c53133d1', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('79c8a0452bb84d439ac3461d40f7df01', '??????????????????????????????', 'logmg/loginLog/loginLogAnalysisRestService/getOnlineInfo', '39683443f5e84c67913039e4c53133d1', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('f588153009394645a497f2897ba79eb4', '????????????????????????????????????', 'logmg/loginLog/loginLogAnalysisRestService/getLoginInfo', '39683443f5e84c67913039e4c53133d1', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('0a5d58ba4cf54e4eae6d1157c3193e47', '????????????????????????', 'logmg/loginLog/loginLogAnalysisRestService/analysisOnlineStatInfo', '39683443f5e84c67913039e4c53133d1', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('a03fe56632dd4e779b0196812344f86f', '?????????????????????????????????', 'logmg/loginLog/loginLogAnalysisRestService/analysisClientSystemInfo', '39683443f5e84c67913039e4c53133d1', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('fedb18b63f474b63aeb93007c3d9c843', '????????????????????????????????????', 'logmg/loginLog/loginLogAnalysisRestService/analysisClientScreenInfo', '39683443f5e84c67913039e4c53133d1', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('40a218c972bb4dd7b3c3e71a265e2de1', '????????????????????????????????????', 'logmg/loginLog/loginLogAnalysisRestService/analysisClientBrowserInfo', '39683443f5e84c67913039e4c53133d1', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('880da059725c4b06a624a13d7e0a1d59', '????????????????????????', 'logmg/loginLog/loginLogAnalysisRestService/queryLoginEnvironmentDetail', '39683443f5e84c67913039e4c53133d1', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('2a54d340e21b43238c5013ce0534c85a', '????????????????????????', 'logmg/loginLog/loginLogAnalysisRestService/analysisLoginStatInfo', '39683443f5e84c67913039e4c53133d1', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('821a8ca012154ba2a4c451918c99cfc0', '??????????????????', 'org/sysmg/resourceManagementRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('3910f6a32f034404a92b4278645702c8', '????????????????????????', 'org/sysmg/resourceManagementRestService/queryResourceByResourceID', '821a8ca012154ba2a4c451918c99cfc0', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('40d60f8d1a7c440c821cb7813dcad84f', '??????????????????', 'org/sysmg/resourceManagementRestService/updateResourceByResourceId', '821a8ca012154ba2a4c451918c99cfc0', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('00c38936f3224585948b2f4076856748', '????????????????????????', 'org/sysmg/resourceManagementRestService/deleteResourceByResourceIds', '821a8ca012154ba2a4c451918c99cfc0', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('2a6fc98ead7e4606a565943e2b6cdcb7', '??????????????????', 'org/sysmg/resourceManagementRestService/addResource', '821a8ca012154ba2a4c451918c99cfc0', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('adbcb239a961413a91190a1a6e1a9687', '??????????????????????????????', 'org/sysmg/resourceManagementRestService/queryTaResourceByParameters', '821a8ca012154ba2a4c451918c99cfc0', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('fa4b47a3941e4fba9eff97249987e4d9', '????????????????????????', 'org/sysmg/resourceManagementRestService/queryAllAccessSystem', '821a8ca012154ba2a4c451918c99cfc0', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('4753a58f0d1b4770996784b7f4ce15f9', '??????????????????', 'org/sysmg/resourceManagementRestService/disabledResourceByResourceIds', '821a8ca012154ba2a4c451918c99cfc0', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('774535576eb142078ec9f589fa0166cf', '??????????????????', 'org/sysmg/resourceManagementRestService/enabledResourceByResourceIds', '821a8ca012154ba2a4c451918c99cfc0', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('83564254d96c4a0196d3397347737cf9', '????????????????????????', 'org/orguser/areaManagementRestService/deleteAreaById', '7859157a0cd94c89995b0dde9fc40bc6', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('d2610e8b0c6144b0af4ea3a647d8649b', '????????????????????????????????????', 'org/orguser/areaManagementRestService/queryAreaByCondition', '7859157a0cd94c89995b0dde9fc40bc6', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('33ebb96ce401430a9b630ea9bf7b19ce', '????????????????????????????????????', 'org/orguser/areaManagementRestService/updateBatchEffectiveByAreaIdPath', '7859157a0cd94c89995b0dde9fc40bc6', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('16fa889f1e634f46aa1c19bef83bef5c', '????????????????????????', 'org/orguser/areaManagementRestService/queryAreaByAreaId', '7859157a0cd94c89995b0dde9fc40bc6', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('cbc0fbecfe4442d893d7681752d6e5eb', '??????????????????????????????', 'org/orguser/areaManagementRestService/deleteBatchAreaByAreaIds', '7859157a0cd94c89995b0dde9fc40bc6', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('10ce3706358e4127bb173427560244d8', '??????????????????', 'logMg/accessLog/taAccessDenyLogRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('847d0576ff39421686a6094185ba93ef', '??????????????????', 'logMg/accessLog/taAccessDenyLogRestService/queryAccessDenyLog', '10ce3706358e4127bb173427560244d8', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('71408b92effd4fcd99cd89f6b87bad57', '????????????????????????', 'logMg/accessLog/taAccessDenyLogRestService/analysisAccessDenyInfoInterval', '10ce3706358e4127bb173427560244d8', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('885e01d3494b44759c62b8b3568e6145', '????????????', 'org/sysmg/tagManagementRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('5831fba3851241fdb990311b6f2d2c58', '???????????????', 'org/sysmg/tagManagementRestService/addTagGroup', '885e01d3494b44759c62b8b3568e6145', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('9d67b3d6337a4e488a1c1f71a57cd1cb', '??????????????????', 'org/sysmg/tagManagementRestService/deleteBatchTag', '885e01d3494b44759c62b8b3568e6145', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('f019482965424846a344c23762921af3', '??????????????????', 'tasysconfig/taSysConfigRestService/queryConfigCategory', '3154d229a4244fda90903cb56f7da445', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('f1ade00ea79541218e3c59ac0382cdbb', '????????????', 'org/sysmg/tagManagementRestService/queryTag', '885e01d3494b44759c62b8b3568e6145', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('32f19d310a1246eeb4804c947d1480b1', '????????????', 'org/sysmg/tagManagementRestService/addTag', '885e01d3494b44759c62b8b3568e6145', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('c3f485a5d431487081927fea7bbdd6aa', '????????????', 'org/sysmg/tagManagementRestService/updateTag', '885e01d3494b44759c62b8b3568e6145', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('2ec2c5d9963d4f868cffa9889eb80b6a', '????????????????????????', 'org/sysmg/tagManagementRestService/queryAllTagGroup', '885e01d3494b44759c62b8b3568e6145', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('c69bb98ae17f410eaa0862ff61c7c6dc', '????????????????????????', 'org/sysmg/tagManagementRestService/updateBatchTagStatus', '885e01d3494b44759c62b8b3568e6145', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('626ddca64fac430d898bce60fe90fa54', '??????????????????????????????', 'org/sysmg/tagManagementRestService/queryTagByCondition', '885e01d3494b44759c62b8b3568e6145', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('42f7383e22bd468e9aeec2e58d8dea5f', '????????????????????????', 'org/authority/examinerAuthorityRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('8b757b398c7145dca303538859299971', '??????????????????????????????', 'org/authority/examinerAuthorityRestService/addBatchUserRole', '42f7383e22bd468e9aeec2e58d8dea5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('c53a34cb93bc4c75afc865231914ba9f', '??????????????????????????????', 'org/authority/examinerAuthorityRestService/deleteBatchRoleUser', '42f7383e22bd468e9aeec2e58d8dea5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('bfc657fcb614420f94bb5bdf4c425510', '??????????????????????????????', 'org/authority/examinerAuthorityRestService/deleteBatchUserRole', '42f7383e22bd468e9aeec2e58d8dea5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('20700551c33b437c806b93bc92dc3c9d', '????????????????????????', 'org/authority/examinerAuthorityRestService/queryUserNoWrapperByRoleId', '42f7383e22bd468e9aeec2e58d8dea5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('cc844a5e23424fbfaf5d421b6b8658b0', '????????????????????????', 'org/authority/examinerAuthorityRestService/queryNoWrapperRoleByUserId', '42f7383e22bd468e9aeec2e58d8dea5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('3e199ec988a64522a61baabcd852470d', '????????????????????????', 'org/authority/examinerAuthorityRestService/deleteBatchExaminer', '42f7383e22bd468e9aeec2e58d8dea5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('77f13730212647509751b06c8bb3dd27', '?????????????????????', 'org/authority/examinerAuthorityRestService/queryOrgTreeByAsync', '42f7383e22bd468e9aeec2e58d8dea5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('9f84c0c4803a40af9624e58197906f78', '????????????????????????', 'org/authority/examinerAuthorityRestService/queryRoleByUserId', '42f7383e22bd468e9aeec2e58d8dea5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('2e34a4c83bba440abf1e65c47a1f64c1', '???????????????????????????', 'org/authority/examinerAuthorityRestService/queryOrgAuthTreeByAsync', '42f7383e22bd468e9aeec2e58d8dea5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('99b13867dfcc45d4bacd7c6917f729dc', '??????????????????', 'org/authority/examinerAuthorityRestService/queryUserByCondition', '42f7383e22bd468e9aeec2e58d8dea5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('80de460d98984d96952d99e39a0a4fab', '??????????????????', 'org/authority/examinerAuthorityRestService/addOrgAuth', '42f7383e22bd468e9aeec2e58d8dea5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('d44c860bee374ab69fb9e5e60516c28d', '??????????????????', 'org/authority/examinerAuthorityRestService/enableExaminer', '42f7383e22bd468e9aeec2e58d8dea5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('afa0c8bace664c238d31ddde03c17d7a', '??????????????????', 'org/authority/examinerAuthorityRestService/queryExaminer', '42f7383e22bd468e9aeec2e58d8dea5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('76ac5cd69dbe4a0c8ab844510679957c', '???????????????????????????', 'org/authority/examinerAuthorityRestService/queryOrgAuth', '42f7383e22bd468e9aeec2e58d8dea5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('195c1e0a469547f8a37befdabea14a5e', '????????????(??????+url)', 'review/getPage', '583c6b33a74c467aac7f67f364181450', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('d709efa9492e41c985be89583d026227', '??????????????????', 'org/authority/examinerAuthorityRestService/unableExaminer', '42f7383e22bd468e9aeec2e58d8dea5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('72901308421145c88a469675d425afad', '??????????????????', 'org/authority/examinerAuthorityRestService/removeOrgAuth', '42f7383e22bd468e9aeec2e58d8dea5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('323d4e5765604460b96311bfaac9fc01', '??????????????????', 'org/authority/examinerAuthorityRestService/updateExaminer', '42f7383e22bd468e9aeec2e58d8dea5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('ed3c1f3b34334c758ddafb3235cc1a74', '??????????????????', 'org/authority/examinerAuthorityRestService/addExaminer', '42f7383e22bd468e9aeec2e58d8dea5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('28341963475b40e2982f13375a7bed27', '??????????????????????????????', 'org/authority/examinerAuthorityRestService/addBatchRoleUser', '42f7383e22bd468e9aeec2e58d8dea5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('fc810d0f2c9745da8ea370175ab3947a', '???????????????', 'org/sysmg/WorkbenchManageRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('18d5c9e17bbb496b80ccf6d587d2922e', '?????????????????????????????????', 'org/sysmg/WorkbenchManageRestService/updateStatus', 'fc810d0f2c9745da8ea370175ab3947a', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('a19c95b79a694e2abad612a888d0baf7', '???????????????????????????', 'org/sysmg/WorkbenchManageRestService/queryResource', 'fc810d0f2c9745da8ea370175ab3947a', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('ad0d709c33284be58a7232fa416d7bd3', '?????????????????????', 'org/sysmg/WorkbenchManageRestService/queryRole', 'fc810d0f2c9745da8ea370175ab3947a', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('5a41ab45c651433ba0a2623e0be9391c', '??????????????????????????????????????????', 'org/sysmg/WorkbenchManageRestService/queryDefaultValue', 'fc810d0f2c9745da8ea370175ab3947a', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('7acb6d48d51f47fc9f9491b1234c0428', '???????????????ZK??????', 'jobmg/elasticjob/zookeeperAddressManagementRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('2ec14b8ed9a04a9f85cc803d99ff0b18', '????????????????????????', 'jobmg/elasticjob/zookeeperAddressManagementRestService/getZookeeperRegistryCenter', '7acb6d48d51f47fc9f9491b1234c0428', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('0d5c35c9b02340f2ad37397c76f36e4f', '??????????????????', 'jobmg/elasticjob/zookeeperAddressManagementRestService/addZookeeperRegistryCenter', '7acb6d48d51f47fc9f9491b1234c0428', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('d93202ddd70e4f1da4d4d70a37e1710c', '??????????????????', 'jobmg/elasticjob/zookeeperAddressManagementRestService/deleteZookeeperRegistryCenter', '7acb6d48d51f47fc9f9491b1234c0428', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('d0bc87eb27f3428686eef131314eb98e', '??????????????????', 'jobmg/elasticjob/zookeeperAddressManagementRestService/connectZookeeperRegistryCenter', '7acb6d48d51f47fc9f9491b1234c0428', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('22392a8d036a4ad390cb754effb8183e', '?????????????????????????????????', 'jobmg/elasticjob/freeBusyJobManagerRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('67fe92e1f2f74a9ea1947dac0cf7447b', '??????????????????????????????', 'jobmg/elasticjob/freeBusyJobManagerRestService/getJobNameByZkId', '22392a8d036a4ad390cb754effb8183e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('b1396cf02957493cb9dba1530863dbf6', '??????????????????', 'jobmg/elasticjob/freeBusyJobManagerRestService/getFreeBusyJob', '22392a8d036a4ad390cb754effb8183e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('3220d5b0942e432daf3c073ca360122b', '??????????????????', 'jobmg/elasticjob/freeBusyJobManagerRestService/addFreeBusyJob', '22392a8d036a4ad390cb754effb8183e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('6ad4d47081004f7598d4132264383268', '??????????????????????????????IP', 'jobmg/elasticjob/freeBusyJobManagerRestService/getServerIpsByJobName', '22392a8d036a4ad390cb754effb8183e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('9d58b8eb62ea424287eb7562dfaaa837', '??????????????????', 'jobmg/elasticjob/freeBusyJobManagerRestService/updateFreeBusyJob', '22392a8d036a4ad390cb754effb8183e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('58412f36f1c64e719d03d7bf5bba9ca6', '????????????????????????????????????IP', 'jobmg/elasticjob/freeBusyJobManagerRestService/getAllServerIpsByJobName', '22392a8d036a4ad390cb754effb8183e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('795af47695b84dcd8c3bc5e6c4c8eccf', '??????????????????', 'jobmg/elasticjob/freeBusyJobManagerRestService/deleteFreeBusyJob', '22392a8d036a4ad390cb754effb8183e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('b88be2871149451a918264fd1ff468a3', '????????????', 'dictmg/dictMgRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('d1759dc661d640d2ad559ce4a6ece974', '??????????????????', 'dictmg/dictMgRestService/saveType', 'b88be2871149451a918264fd1ff468a3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('4371f9f5b6f64f7490a11f5b0f46611b', '????????????', 'dictmg/dictMgRestService/updateDict', 'b88be2871149451a918264fd1ff468a3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('5b6eb06323f341ff90d735805d22e938', '??????????????????', 'dictmg/dictMgRestService/deleteBatchDict', 'b88be2871149451a918264fd1ff468a3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('6dc3fe02dcc549648eb2b5472c75b133', '????????????????????????', 'dictmg/dictMgRestService/stopDictByType', 'b88be2871149451a918264fd1ff468a3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('159be0ed8e7e4107b085ab9d1020592d', '????????????????????????', 'dictmg/dictMgRestService/deleteDictByType', 'b88be2871149451a918264fd1ff468a3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('54cebfdf34c54e0191915d14f5e52ba0', '??????????????????', 'dictmg/dictMgRestService/queryDictContent', 'b88be2871149451a918264fd1ff468a3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('45d43aee748d4ed2894b1f812f62360e', '??????????????????', 'dictmg/dictMgRestService/queryDictInfo', 'b88be2871149451a918264fd1ff468a3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('dedea13dd9dd42b7aba71f1526ac7fe8', '??????????????????', 'dictmg/dictMgRestService/startBatchDict', 'b88be2871149451a918264fd1ff468a3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('d1471eda4afc45a4b915d2100fe18af9', '????????????????????????', 'dictmg/dictMgRestService/startDictByType', 'b88be2871149451a918264fd1ff468a3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('7faf8e17e5e846e5b10e1fc42ecbe6c1', '??????????????????????????????', 'dictmg/dictMgRestService/queryDictByType', 'b88be2871149451a918264fd1ff468a3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('2b9bb0e2179f43179d41f4fc7b22bf0e', '????????????', 'dictmg/dictMgRestService/saveDict', 'b88be2871149451a918264fd1ff468a3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('e9bc69a3bca94eccbe3e4286bf2863bf', '??????????????????', 'dictmg/dictMgRestService/stopBatchDict', 'b88be2871149451a918264fd1ff468a3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('08cd4ed593114680bfa8a9826936c3bd', '????????????????????????', 'dictmg/dictMgRestService/queryType', 'b88be2871149451a918264fd1ff468a3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('a6e96e7ce7ca4b5f862e1df5b19d0a20', '??????????????????????????????', 'dictmg/dictMgRestService/queryAuthorityList', 'b88be2871149451a918264fd1ff468a3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('35a9fdc228314981b740a17ac3041863', '??????????????????', 'dictmg/dictMgRestService/refreshDictByType', 'b88be2871149451a918264fd1ff468a3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('583c6b33a74c467aac7f67f364181450', '????????????', 'review/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('bbcf4cf809324ffdbf9cbe95b649b652', '????????????', 'review/savePage', '583c6b33a74c467aac7f67f364181450', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('e53d524ae7884251b9551e5bd690ab20', '???????????????Url', 'review/getPageUrl', '583c6b33a74c467aac7f67f364181450', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('a7b3a24aa28d415891f67a7deae318d1', '????????????????????????', 'review/queryPageReview', '583c6b33a74c467aac7f67f364181450', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('af83691612354bb8933f8e3e9107df4e', '??????????????????', 'review/getPageData', '583c6b33a74c467aac7f67f364181450', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('206adb9da5cf481f927097e4457a4381', '???????????????zk??????????????????', 'jobmg/elasticjob/serverOperateRestService/getServerInfo', '5855e399c9074b899850bb25ce1aaf76', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('fe182cce9ff34370b62b0dacfc74679c', '???????????????zk????????????', 'jobmg/elasticjob/serverOperateRestService/disableServer', '5855e399c9074b899850bb25ce1aaf76', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('1013f293306948acb3b0d600da8983ec', '???????????????zk????????????', 'jobmg/elasticjob/serverOperateRestService/enableServer', '5855e399c9074b899850bb25ce1aaf76', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('135ccd2cabaf4a6cac8c3ab5c4f49071', '???????????????zk????????????', 'jobmg/elasticjob/serverOperateRestService/shutdownServer', '5855e399c9074b899850bb25ce1aaf76', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('e476368003a64ea49113e1f699ebf44a', '???????????????zk????????????', 'jobmg/elasticjob/serverOperateRestService/removeServer', '5855e399c9074b899850bb25ce1aaf76', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('f5b7a9571ca640038ac5ae5f7fdfe242', '????????????', 'jobmg/elasticjob/serverOperateRestService/removeServerJob', '5855e399c9074b899850bb25ce1aaf76', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('7c08e928b3e146eea3729b1ac0222376', '???????????????', 'jobmg/elasticjob/serverOperateRestService/enableServerJob', '5855e399c9074b899850bb25ce1aaf76', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('3c72d73f18624014a3935c2d7f3e2a4c', '????????????', 'jobmg/elasticjob/serverOperateRestService/shutdownServerJob', '5855e399c9074b899850bb25ce1aaf76', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('a384ae7998c64307b98c3071747bab59', '????????????', 'jobmg/elasticjob/serverOperateRestService/disabledServerJob', '5855e399c9074b899850bb25ce1aaf76', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('9bf4ec13940041efbc48932c2a0ffe8e', '??????????????????', 'jobmg/elasticjob/serverOperateRestService/getServerJobDetail', '5855e399c9074b899850bb25ce1aaf76', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('b091f4af3eba4c5c946af8dacaf951b9', '?????????????????????', 'org/orguser/customOrgManagementRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('ca28dad434e54bf1a9b8f21e63f54b2b', '?????????????????????', 'org/orguser/customOrgManagementRestService/updateCustomOrg', 'b091f4af3eba4c5c946af8dacaf951b9', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('20800affa5404857aed051b36cec9717', '?????????????????????', 'org/orguser/customOrgManagementRestService/addCustomOrg', 'b091f4af3eba4c5c946af8dacaf951b9', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('f617dc2ccb8a481b8e13b814f3447bf9', '?????????????????????????????????????????????', 'org/orguser/customOrgManagementRestService/queryCustomOrgTypeNameByCondition', 'b091f4af3eba4c5c946af8dacaf951b9', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('7949676d97104f89bfd8fb9475977b07', '???????????????????????????', 'org/orguser/customOrgManagementRestService/deleteBatchCustomOrg', 'b091f4af3eba4c5c946af8dacaf951b9', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('9bc0b432d45c455392eb781a8f465f0d', '???????????????????????????????????????', 'org/orguser/customOrgManagementRestService/updateBatchCustomOrgStatus', 'b091f4af3eba4c5c946af8dacaf951b9', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('63daedc10cb9415da26c532ab9388ec8', '??????????????????', 'audit/auditQueryRestService/exception', '90ef822f9e644448be5705a9994a263b', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('d492053e1cd943a190d4e33c1d284890', '??????????????????', 'audit/auditQueryRestService/online', '90ef822f9e644448be5705a9994a263b', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('986ee8c346f84f258658734af5ef494b', '??????????????????', 'audit/auditQueryRestService/login', '90ef822f9e644448be5705a9994a263b', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('a8806d67cc434c0382a170ef5ff5ded2', '??????????????????', 'audit/auditQueryRestService/audit', '90ef822f9e644448be5705a9994a263b', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('611174d293ac4027b5f148fd677df4e3', '????????????????????????', 'rest/', '3cf89df828154febac4345a00ecd867b', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('93bb62a65b7b43eca20ea91b43d9ebe1', '??????????????????????????????', 'org/orguser/customOrgManagementRestService/queryCustomOrgByParentId', 'b091f4af3eba4c5c946af8dacaf951b9', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('37e80fb9e192462fa2146e0a6ccce592', '?????????????????????????????????', 'org/orguser/customOrgManagementRestService/queryCustomOrgByCondition', 'b091f4af3eba4c5c946af8dacaf951b9', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('2a06ec82aced450a9360f88083e7269d', '???????????????????????????????????????', 'org/orguser/customOrgManagementRestService/queryCustomOrgByValidId', 'b091f4af3eba4c5c946af8dacaf951b9', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('28efc47547b94deca7fb745a3ccd9f0a', '?????????????????????????????????????????????', 'org/orguser/customOrgManagementRestService/addBatchCustomOrgUser', 'b091f4af3eba4c5c946af8dacaf951b9', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('9eb3d2c727814de5936c9b409de8835c', '????????????????????????????????????????????????', 'org/orguser/customOrgManagementRestService/deleteBatchCustomOrgTypeName', 'b091f4af3eba4c5c946af8dacaf951b9', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('1fc681db43df49caa2e1c0c03eca04a2', '??????????????????', 'tarunqianresource/taRunqianResourceRestService/addRunqianResource', '8545972435bb4abab8d2524fac510a04', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('dfc350b510624f79b12305e3fe7a8308', '??????????????????', 'tarunqianresource/taRunqianResourceRestService/editRunqianResource', '8545972435bb4abab8d2524fac510a04', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('f70bb418d762405f8df422ddd05f4692', '??????????????????', 'tarunqianresource/taRunqianResourceRestService/downloadRunqianResource', '8545972435bb4abab8d2524fac510a04', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('0ed2e37e987e47a9b995bab04dd00001', '??????????????????', 'tarunqianresource/taRunqianResourceRestService/delRunqianResource', '8545972435bb4abab8d2524fac510a04', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('1f759706bf5548d3ae362cac46f9f39b', '??????????????????', 'tarunqianresource/taRunqianResourceRestService/queryRunqianResource', '8545972435bb4abab8d2524fac510a04', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('09961b00d2b34b748daa794515e3d8d6', '???????????????????????????', 'org/orguser/customOrgManagementRestService/queryCustomOrgTypeName', 'b091f4af3eba4c5c946af8dacaf951b9', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('8a5bf6151747497ea819f0dec6f2ac33', '????????????????????????????????????????????????', 'org/orguser/customOrgManagementRestService/deleteBatchCustomOrgUser', 'b091f4af3eba4c5c946af8dacaf951b9', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('912d99f0d32f4f819206e7d2f2b66df2', '?????????????????????id??????user', 'org/orguser/customOrgManagementRestService/queryBatchUserByCustomOrgId', 'b091f4af3eba4c5c946af8dacaf951b9', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('2277168fd5a046829fe3405d49802e8e', 'URL????????????', 'org/sysmg/url/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('fa83267e5a984eb0804c042b8989bc57', '??????????????????URL', 'org/sysmg/url/queryByParam', '2277168fd5a046829fe3405d49802e8e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('af7e74c0348947e691972de795c8f1aa', '??????URL??????', 'org/sysmg/url/queryUrl', '2277168fd5a046829fe3405d49802e8e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('1a5380116d7b4068b8b149359e461e0f', '??????????????????', 'org/sysmg/url/queryNamespace', '2277168fd5a046829fe3405d49802e8e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('3381997ccaac4df68639008bd103a3c0', '??????URL', 'org/sysmg/url/updateUrl', '2277168fd5a046829fe3405d49802e8e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('13a1953a5f7e4527a25950b63c7bf3d4', '??????URL', 'org/sysmg/url/saveUrl', '2277168fd5a046829fe3405d49802e8e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('2fd8146f001c4e7f979669bf36e4f1a2', '????????????URL', 'org/sysmg/url/disableBatchUrl', '2277168fd5a046829fe3405d49802e8e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('2a23726d511b46c7b19a350706148868', '????????????URL', 'org/sysmg/url/enableBatchUrl', '2277168fd5a046829fe3405d49802e8e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('5e09b74efacf4862beda8a21bb8cbc9a', '????????????URL', 'org/sysmg/url/deleteBatchUrl', '2277168fd5a046829fe3405d49802e8e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('83a48b7e93e94da78f768246aae6c84f', '????????????????????????URL', 'org/sysmg/url/queryUrlByNamespace', '2277168fd5a046829fe3405d49802e8e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('ba186bfbfb1647ffbe7db23e89686e9f', '?????????????????????', 'org/sysmg/workbenchRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('3e09b57045fb4ea5b8b7c28b9714febf', '??????????????????????????????', 'org/sysmg/workbenchRestService/queryLastChooseWorkbench', 'ba186bfbfb1647ffbe7db23e89686e9f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('8949d73e53794d359ebcbf57f41359ee', '???????????????????????????????????????ID', 'org/sysmg/workbenchRestService/queryUserWorkbenchByUserId', 'ba186bfbfb1647ffbe7db23e89686e9f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('f969b32f0f2640189237fb82687f2a71', '?????????????????????????????????ID', 'org/sysmg/workbenchRestService/queryRoleWorkbenchByRoleId', 'ba186bfbfb1647ffbe7db23e89686e9f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('00a74d89066a47989407b208230b1709', '??????????????????????????????????????????', 'org/sysmg/workbenchRestService/queryResourceEffectiveByUserId', 'ba186bfbfb1647ffbe7db23e89686e9f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('38a33deff4e044b999ca4bde56a53ea8', '??????????????????????????????????????????', 'org/sysmg/workbenchRestService/queryResourceEffectiveByRoleId', 'ba186bfbfb1647ffbe7db23e89686e9f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('d0e7351f05ce4b58a6fca29a19c70847', '???????????????????????????', 'org/sysmg/workbenchRestService/saveRoleWorkbench', 'ba186bfbfb1647ffbe7db23e89686e9f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('417153883b114bc796c78f4420b14bb9', '??????????????????????????????????????????', 'org/sysmg/workbenchRestService/saveLastChooseWorkbenchData', 'ba186bfbfb1647ffbe7db23e89686e9f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('42bc8aea3378498e81c53334b06050ac', '???????????????????????????', 'org/sysmg/workbenchRestService/saveUserWorkbench', 'ba186bfbfb1647ffbe7db23e89686e9f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('518fb0e03af64326ae3f6d1ea6da1fad', '???????????????????????????', 'org/sysmg/workbenchRestService/queryRoleListByUserId', 'ba186bfbfb1647ffbe7db23e89686e9f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('3154d229a4244fda90903cb56f7da445', '??????????????????', 'tasysconfig/taSysConfigRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('658ea1202bc843e99e0201aa5d079b00', '????????????', 'tasysconfig/taSysConfigRestService/querySysConfig', '3154d229a4244fda90903cb56f7da445', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('f91c291fd2f741f5b2eb52d3f882c153', '????????????', 'tasysconfig/taSysConfigRestService/addSysConfig', '3154d229a4244fda90903cb56f7da445', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('6426f3aad7c648f68377d1e346c02624', '????????????', 'tasysconfig/taSysConfigRestService/updateSysConfig', '3154d229a4244fda90903cb56f7da445', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('15de371347e94563b28214db9cf37c02', '????????????', 'tasysconfig/taSysConfigRestService/deleteSysConfig', '3154d229a4244fda90903cb56f7da445', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('aa60a746c0a24640a06dea49a4d42572', '????????????', 'org/orguser/orgManagementRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('ec9eda6ecc7a4e6c8d0f6e2e8a0472bc', '??????orgId ???????????????????????????????????????', 'org/orguser/orgManagementRestService/queryTaOrgByOrgId', 'aa60a746c0a24640a06dea49a4d42572', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('a87e7b2776214a76ba31151c6c5cbbe5', '?????????????????????', 'org/orguser/orgManagementRestService/getOrgByAsync', 'aa60a746c0a24640a06dea49a4d42572', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('5316d8f69b98419b8fcf6f96002f5e0e', '??????????????????', 'org/orguser/orgManagementRestService/deleteBatchOrgs', 'aa60a746c0a24640a06dea49a4d42572', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('2fdcb068e93c428d8cf612cb92c65418', '????????????????????????', 'org/orguser/orgManagementRestService/disableBatchOrgs', 'aa60a746c0a24640a06dea49a4d42572', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('2f786a24ec574ed48368a9e633e07351', '??????type??????????????????', 'org/orguser/orgManagementRestService/queryTags', 'aa60a746c0a24640a06dea49a4d42572', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('03ae618da1fd4bf0a3a5b3ef31ea586f', '????????????ID??????????????????', 'org/orguser/orgManagementRestService/deleteOrgByOrgId', 'aa60a746c0a24640a06dea49a4d42572', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('d8202e6246994e8f89e1c8c55752f8f0', '????????????????????????', 'org/orguser/orgManagementRestService/enableBatchOrgs', 'aa60a746c0a24640a06dea49a4d42572', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('314abaf6c856464194670bee9edf3e3a', '??????????????????', 'org/orguser/orgManagementRestService/addTaOrg', 'aa60a746c0a24640a06dea49a4d42572', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('1e49a3453812453891c46331a4b91f46', '??????????????????????????????', 'org/orguser/orgManagementRestService/queryAllTaOrg', 'aa60a746c0a24640a06dea49a4d42572', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('a2d72ab0507241d19290cbb6fee6817e', '??????????????????????????????', 'org/sysmg/workbenchRestService/querynow()UserLastLoginLog', 'ba186bfbfb1647ffbe7db23e89686e9f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('88c9acc56ac24b61a003073c68828c03', '??????????????????????????????', 'org/orguser/orgManagementRestService/queryChildOrgByOrgId', 'aa60a746c0a24640a06dea49a4d42572', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('cbcdd31ffb6c40499bb1af744851a783', '???????????????????????????', 'org/authority/adminAuthorityManagementRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('e83bb87d573246e5b6c2ed534c2cd775', '?????????????????????', 'org/authority/adminAuthorityManagementRestService/addAdminRole', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('e14986416987402c9283b0dfabacb379', '??????????????????', 'org/authority/adminAuthorityManagementRestService/deleteBatchRole', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('e62f249ce1af41b7bb286d0e745d1471', '??????????????????????????????', 'org/authority/adminAuthorityManagementRestService/saveOrgScope', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('877de3c0984e456ea1bbf52541a1d0f4', '??????????????????', 'org/authority/adminAuthorityManagementRestService/updateAdmin', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('8ff682c3168a4b1295ed1efd32467321', '????????????????????????', 'org/authority/adminAuthorityManagementRestService/removeOrgScope', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('a911f4d576124857a80ddc37873d90e8', '????????????????????????????????????', 'org/authority/adminAuthorityManagementRestService/addBatchUserRole', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('37e4e66df7de4a87b14a19e8c4f44ef6', '??????????????????', 'org/authority/adminAuthorityManagementRestService/queryUserByCondition', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('b05f5e9f2bb048d9adf335ab62a78cfd', '???????????????????????????????????????', 'org/authority/adminAuthorityManagementRestService/queryChildResourceAuthorityByRoleId', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('3efc328fe5fa40e38ff29b7f97deb709', '????????????????????????????????????????????????', 'org/authority/adminAuthorityManagementRestService/queryChildCustomResourceAuthorityByRoleId', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('0cd7696d40ad49ad91f6ce91911fa2aa', '?????????????????????????????????', 'org/authority/adminAuthorityManagementRestService/queryChildCustomResourceAsync', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('cab374d4f2af4cadaf487532c29df3ff', '????????????????????????????????????', 'org/authority/adminAuthorityManagementRestService/updateBatchUsePermissionEffectiveTime', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('1ce091c3b3604be2932c25df07a642cd', '??????????????????????????????', 'org/authority/adminAuthorityManagementRestService/queryUsersByRoleId', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('20232206695a4aaa851e5d30a08ce295', '????????????????????????', 'org/authority/adminAuthorityManagementRestService/updateRoleEffectiveByRoleId', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('2cb89bd084f74184a15e8313ad5b5647', '????????????????????????', 'org/authority/adminAuthorityManagementRestService/deleteBatchRoleUsers', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('93acb3693a4c4dc8a47c4d0240f00890', '???????????????????????????', 'org/authority/adminAuthorityManagementRestService/queryRootResourceAuthority', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('697ec7337fc44943872e5fd47a6efdea', '????????????????????????', 'org/authority/adminAuthorityManagementRestService/queryChildResourceByRoleId', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('26ae2d0f31404495ad8c6d3bf8df9da1', '???????????????????????????', 'org/authority/adminAuthorityManagementRestService/queryChildCustomResourceByRoleId', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('59bc6ad7451f47e5929a42d98986be98', '???????????????', 'org/authority/adminAuthorityManagementRestService/querynow()AdminRoleWrapOrgTree', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('7ef0b9f372fd44a69ef79cdb968ec994', '??????????????????????????????', 'org/authority/adminAuthorityManagementRestService/queryUsersNoWraperByRoleId', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('60509043f699448ab9f5812e2333a11d', '??????????????????', 'org/authority/adminAuthorityManagementRestService/queryRolesByOrgId', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('9fcef2129d1c47e58631bf196a003d3b', '??????????????????????????????????????????', 'org/authority/adminAuthorityManagementRestService/queryRootCustomResourceAuthority', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('90ef822f9e644448be5705a9994a263b', '????????????', 'audit/auditQueryRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('41f4b754edd14be79ee108d40c061a8a', '????????????????????????????????????', 'org/authority/adminAuthorityManagementRestService/addBatchRoleUsers', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('8d54ec9a7cbb4f1a9c3f4c54e7d341c8', '???????????????????????????', 'org/authority/adminAuthorityManagementRestService/queryAdminRoleByOrgId', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('bb63ae66fd6d4807948948106d410f89', '??????????????????????????????', 'org/authority/adminAuthorityManagementRestService/batchChangeAdminPermission', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('c59aaa9e3f1f4dcb961a90be46ea9b72', '??????????????????????????????', 'org/authority/adminAuthorityManagementRestService/deleteRoleUserByKey', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('fcf51d71136d4c2897b736f11af9266f', '??????????????????', 'org/authority/adminAuthorityManagementRestService/queryRootResource', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('941c10445bcc40369cb4b55e468aaf48', '???????????????????????????????????????', 'org/authority/adminAuthorityManagementRestService/queryRootCustomResource', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('213caa8621494ce98a55bef675dd39f2', '???????????????????????????', 'org/authority/adminAuthorityManagementRestService/queryRolesByUserId', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('8cb4565415ce47bba1d7be36cbabf40e', '????????????????????????????????????', 'org/authority/adminAuthorityManagementRestService/deleteBatchUserRole', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('e0338aeb38164edb893d21c9af0bee43', '???????????????????????????', 'org/authority/adminAuthorityManagementRestService/changeResourceAuthority', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('77f6d7ab67654023a997ba31bcef5262', '????????????????????????', 'org/authority/adminAuthorityManagementRestService/changeResourceUsePermission', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('22d46236ba834a1f93fe128dd9861f6b', '????????????????????????', 'org/authority/adminAuthorityManagementRestService/selectPermissionOrgScope', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('bbaef041a14c49f8963f1b6589a28d69', '??????????????????????????????', 'org/authority/adminAuthorityManagementRestService/changeCustomResourceAuthority', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('9cf0537f574d472fb2df4211a2e83d88', '??????????????????????????????', 'org/authority/adminAuthorityManagementRestService/updateUsePermissionEffectiveTime', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('b1fd82d7707645869a4088703dd260f1', '??????????????????????????????', 'org/authority/adminAuthorityManagementRestService/queryNoWrapperRolesByUserId', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('9466add8d6e3449aab05fbbf0bda43cc', '????????????????????????????????????????????????', 'org/authority/adminAuthorityManagementRestService/updateBatchCustomResourceUsePermissionEffectiveTime', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('03c3c8302674456f989739369d35fedc', '????????????????????????', 'org/authority/adminAuthorityManagementRestService/selectOrgScope', 'cbcdd31ffb6c40499bb1af744851a783', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('1e334b5580fb40588b41833ace89ece0', '??????????????????', 'dynamic/rest/disable', '47488be533b54ae99f0418ba3962e8b9', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('96d86e0b87264ee29424151636d50667', '??????????????????', 'dynamic/rest/enable', '47488be533b54ae99f0418ba3962e8b9', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('84dc082ef9a94cb6a70955ded2229848', '????????????ID????????????', 'dynamic/rest/getByRestId', '47488be533b54ae99f0418ba3962e8b9', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('a196f610e78645488b830ca21d5d73d2', '????????????????????????', 'dynamic/rest/update', '47488be533b54ae99f0418ba3962e8b9', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('6cb53bacf6e84b2d89eb732cf29b683d', '??????????????????', 'dynamic/rest/add', '47488be533b54ae99f0418ba3962e8b9', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('49a5ee26819f4dc9934ff23b905b249f', '????????????????????????', 'dynamic/rest/queryList', '47488be533b54ae99f0418ba3962e8b9', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('404773da30b843a4b70da215f73a9384', '??????????????????', 'dynamic/rest/delete', '47488be533b54ae99f0418ba3962e8b9', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('feeec1113f5d49b2bb19eca44702b035', '?????????????????????', 'dynamic/rest/queryDsList', '47488be533b54ae99f0418ba3962e8b9', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('fb72be8cb70f40caacc63510afc9e8b3', '????????????', 'audit/auditExportRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('72e8e1bdf40d4350b8addd7132952c5d', '??????????????????', 'audit/auditExportRestService/online', 'fb72be8cb70f40caacc63510afc9e8b3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('993e777e680341cb86fe70437ca1150f', '????????????????????????', 'audit/auditExportRestService/accessDeny', 'fb72be8cb70f40caacc63510afc9e8b3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('8a19872cf40e4078922ae712924102f7', '????????????????????????', 'audit/auditExportRestService/loginLogAnalysis', 'fb72be8cb70f40caacc63510afc9e8b3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('0b0456f381374b278c804a848bceebcc', '??????????????????', 'audit/auditExportRestService/orgOp', 'fb72be8cb70f40caacc63510afc9e8b3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('909e509a59ec430d9eb239d3265f03f5', '????????????????????????', 'audit/auditExportRestService/loginFail', 'fb72be8cb70f40caacc63510afc9e8b3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('ff98da127f154939a0fdef59ec22f982', '????????????????????????', 'audit/auditExportRestService/exception', 'fb72be8cb70f40caacc63510afc9e8b3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('7abfb7bd84994c0db08eb9976adfd7d8', '??????????????????', 'audit/auditExportRestService/login', 'fb72be8cb70f40caacc63510afc9e8b3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('dec7f275ce6242b0a591ccd371474db7', '????????????', 'indexRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('653ec11f00e8473fbad26ea69098e047', '????????????????????????', 'indexRestService/getCurUserAccount', 'dec7f275ce6242b0a591ccd371474db7', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('aa56d8e0833b4fffad76945a4133f4d5', '????????????', 'indexRestService/changePassword', 'dec7f275ce6242b0a591ccd371474db7', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('8c965431a61145fb98f7fa67b7271f76', '???????????????????????? ????????????????????????', 'indexRestService/defaultOpen', 'dec7f275ce6242b0a591ccd371474db7', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('3cf89df828154febac4345a00ecd867b', '????????????????????????', 'rest/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('fc45635549b5487c87d0287490a79b5f', '??????????????????', 'org/authority/roleAuthorityManagementRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('e2273cbc1ffb47afb24c2c7ec24b3633', '??????????????????', 'org/authority/roleAuthorityManagementRestService/deleteBatchRole', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('624bde4ff89e4630b220f9808b5f07e2', '????????????????????????????????????', 'org/authority/roleAuthorityManagementRestService/addBatchUserRole', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('a14c3e447ba044aaa5275e85ee026f0d', '??????????????????', 'org/authority/roleAuthorityManagementRestService/queryUserByCondition', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('87566f8084c14e70a76f622abef88ee9', '???????????????', 'logmg/exceptionlog/serverExceptionLogRestService/exceptionChart', 'f2e756c387524382a6fa4d9f3db9abf7', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('f08165aeb751488cb3c42d8679d92ad1', '??????????????????', 'audit/taAuditResService/audit', 'fe98234d9a0a4f2a9228743a58e86d54', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('d2e57270fb64454b937915cead646bf5', '???????????????', 'audit/taAuditResService/auditChart', 'fe98234d9a0a4f2a9228743a58e86d54', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('2b147317777f4f728c659abfea82db57', '???????????????', 'org/sysmg/orgOpLogRestService/opLogChart', 'badc42944eb74d38a3ce254536e997c1', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('6d73b1f0ab7742e4b21caef223799261', '??????????????????', 'queryUserNotice', '415a0c59d499478da3b40fc896470569', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('95d6fa234ee848059a815b9c14287737', '????????????id????????????????????????', 'logmg/exceptionlog/serverExceptionLogRestService/getDetalExceptionLog', 'f2e756c387524382a6fa4d9f3db9abf7', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('2d69486d5fdc4336be2411e125a561c0', '??????????????????????????????', 'logmg/exceptionlog/serverExceptionLogRestService/getServerExceptionLog', 'f2e756c387524382a6fa4d9f3db9abf7', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('badc42944eb74d38a3ce254536e997c1', '????????????????????????', 'org/sysmg/orgOpLogRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('26010f3c6ec04bf59680ec7f11109e54', '??????????????????', 'org/sysmg/orgOpLogRestService/getOrgOpLog', 'badc42944eb74d38a3ce254536e997c1', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('366d45447b244c2b8f3a6cefec338ae0', '??????????????????????????????', 'org/sysmg/orgOpLogRestService/getChangeContent', 'badc42944eb74d38a3ce254536e997c1', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('fe98234d9a0a4f2a9228743a58e86d54', '????????????', 'audit/taAuditResService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('31d3fcf575694d36b19d79488d10a719', '?????????????????????????????????', 'org/authority/roleAuthorityManagementRestService/deleteCustomResourceUsePermission', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('55f139c1352846f185d1115d6d38bb2b', '??????????????????????????????', 'org/authority/roleAuthorityManagementRestService/querynow()AdminRoleWrapeOrgTree', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('8786b8c546af4a049e5c166872fb69fb', '?????????????????????????????????', 'org/authority/roleAuthorityManagementRestService/updateBatchUsePermissionEffectiveTime', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('598b36d8554649c19f7e88e087347c7e', '??????????????????????????????????????????', 'org/authority/roleAuthorityManagementRestService/updateCustomResourceUsePermissionEffectiveTime', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('74a7d5a9739841809c3b0db1079a4ba8', '????????????', 'org/authority/roleAuthorityManagementRestService/deleteBatchUsePermissionByMoreRole', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('081da1f5cc5a41fbbdb89e5423e2908f', '??????????????????????????????', 'org/authority/roleAuthorityManagementRestService/queryUsersByRoleId', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('98396599f9e1494e9e99bca94de11a94', '????????????????????????', 'org/authority/roleAuthorityManagementRestService/updateRoleEffectiveByRoleId', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('138ecb6ff95e4b58991a0f2f5d1deb3b', '????????????????????????????????????', 'org/authority/roleAuthorityManagementRestService/deleteBatchRoleUser', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('19b678a580b94d5d9e38d8fa1ab32124', '??????????????????????????????', 'org/authority/roleAuthorityManagementRestService/queryUsersNoWraperByRoleId', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('bbc17b9c19374ae0b050f77da4e23636', '??????????????????', 'org/authority/roleAuthorityManagementRestService/queryRolesByOrgId', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('9a749a3305844739a424feeb0962f0e9', '?????????????????????', 'org/authority/roleAuthorityManagementRestService/queryRePermissionByRoleId', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('9e367251a5fd4c658648b2b0bc177b03', '???????????????????????????', 'org/authority/roleAuthorityManagementRestService/queryRolesByUserId', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('c3aac3c6d27844aaa36831f0b05199a9', '????????????????????????????????????', 'org/authority/roleAuthorityManagementRestService/deleteBatchUserRole', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('5165c4afb9a546f69555b139f194ba36', '??????????????????????????????', 'org/authority/roleAuthorityManagementRestService/updateUsePermissionEffectiveTime', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('01fa335e75e8405b9161c14be68bdfba', '????????????????????????????????????', 'org/authority/roleAuthorityManagementRestService/queryNoWrapperRolesByUserId', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('501b8e57bfac491eab3ea302bd0d1577', '????????????', 'org/authority/roleAuthorityManagementRestService/addBatchUsePermissionByMoreRole', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('0f450ebdc9de4e8897402109ee1faa6d', '??????????????????', 'org/authority/roleAuthorityManagementRestService/updateRoleByRoleId', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('ce3009ef4f61445bb2ba1fe5a747e8be', '???????????????????????????????????????', 'org/authority/roleAuthorityManagementRestService/queryUsePermissionByRoleId', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('c335de0f745049439eea4ed4ef5e8220', '??????????????????????????????????????????', 'org/authority/roleAuthorityManagementRestService/queryCustomUsePermissionByRoleId', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('f6f90c9794c547e89ac15b1c1e2cd1c5', '????????????', 'org/authority/roleAuthorityManagementRestService/deleteRoleByRoleId', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('fc5a759500054f00a5016f68ba687ab2', '???????????????????????????', 'org/authority/roleAuthorityManagementRestService/addCustomResourceUsePermission', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('daab8c8fac94444e8f73f670166b6123', '??????????????????', 'org/authority/roleAuthorityManagementRestService/queryRolesByRoleName', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('1186646d85324d318e02899ca0f9508b', '??????Rest????????????', 'org/authority/roleAuthorityManagementRestService/changeRestAuthority', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('bdba806884544d378c6a12f912a90e69', '??????????????????', 'org/authority/roleAuthorityManagementRestService/updateRoleUserDefaultRole', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('155d58691b514a79824a95968dda38e6', '??????????????????', 'org/authority/roleAuthorityManagementRestService/queryRePermission', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('c4a5ece4fa5b414e98958972572c88b9', '???????????????????????????', 'org/authority/roleAuthorityManagementRestService/queryCustomRePermissionAsync', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('690b9acefd6e45f6bc5214646bb7d434', '??????????????????', 'org/authority/roleAuthorityManagementRestService/deleteUsePermission', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('832d3322479949d8a36da9458fa3bcbb', '????????????Id????????????????????????', 'org/authority/roleAuthorityManagementRestService/queryCustomRePermissionByRoleId', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('e65ee0ad6e4e4e29a37d8d1f6d952ede', '?????????????????????????????????', 'org/authority/roleAuthorityManagementRestService/queryCustomRePermission', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('a5ff0d74a0084769b8e767cc51491c75', '????????????????????????????????????????????????', 'org/authority/roleAuthorityManagementRestService/updateBatchCustomResourceUsePermissionEffectiveTime', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('7f5017d989ad4f1e828bced19467ee2a', '??????????????????', 'org/authority/roleAuthorityManagementRestService/addUsePermission', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('14ad6adb99464b0c811e3a0c307efdfd', '??????????????????????????????', 'org/authority/roleAuthorityManagementRestService/addRoleUser', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('c65e391b3372485aa45fddd997cab064', '????????????', 'org/authority/roleAuthorityManagementRestService/addRole', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('d3a3b173b8c04b5a9cef0e82e2920310', '????????????', 'org/authority/roleAuthorityManagementRestService/copyResource', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('9a520b63f24c437c8861080a5526f23b', '????????????', 'org/authority/roleAuthorityManagementRestService/copyRole', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('43900d1b828d4c8b950612fcae10a786', '????????????', 'loginRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('52c52f7e65c84c6da2c1e7da75824182', '??????????????????', 'loginRestService/getConfig', '43900d1b828d4c8b950612fcae10a786', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('ed2bf752425d4ac580d73f99615990ab', '?????????????????????', 'loginRestService/changePassword', '43900d1b828d4c8b950612fcae10a786', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('5f77fb7579294f02908bde7aaec43ece', '????????????', 'loginRestService/checkUser', '43900d1b828d4c8b950612fcae10a786', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('c4360fdef9ad46278a677508ee8b290a', '????????????', 'org/authority/authorityAgentRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('16e2788f54794c1d9fda4036b0ebe85f', '??????????????????', 'org/authority/authorityAgentRestService/getOrgByAsync', 'c4360fdef9ad46278a677508ee8b290a', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('c6428dc1dc144d4c8efb9b0e44dc17d5', '???????????????????????????', 'org/authority/authorityAgentRestService/updateAgentRoleAuthority', 'c4360fdef9ad46278a677508ee8b290a', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('5b43aa7145734290803796c1b9070d49', '?????????????????????????????????????????????????????????', 'org/authority/authorityAgentRestService/queryAllAgentRole', 'c4360fdef9ad46278a677508ee8b290a', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('6ec810ccee18431bb058d6440c4476f7', '????????????id????????????????????????????????????????????????', 'org/authority/authorityAgentRestService/queryReAgentUsersByOrgId', 'c4360fdef9ad46278a677508ee8b290a', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('1272585f9ed944eab717939300cadbb8', '??????????????????', 'loginRestService/checkMobile', '43900d1b828d4c8b950612fcae10a786', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('3a0b491b01674d9fab78498550320cd0', '??????userId???????????????????????????????????????????????????', 'org/authority/authorityAgentRestService/queryCustomUsePermissionByUserId', 'c4360fdef9ad46278a677508ee8b290a', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('b7ea5b5a2bdc462aa14e8aca7961d61f', '??????????????????', 'org/authority/authorityAgentRestService/addAgentRole', 'c4360fdef9ad46278a677508ee8b290a', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('aef954306f5d4c6d9b5e507aa3f175c6', '????????????????????????', 'menu/menuAction/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('9d4b47c0490640008c31e892314520fc', '??????????????????????????????', 'menu/menuAction/queryRootChildrenMenus', 'aef954306f5d4c6d9b5e507aa3f175c6', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('58606a643d29437c9afcd69e8dd6482e', '??????????????????', 'org/sysmg/accessSystemManagementRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('6b844095d25d44daba36670ed5d31bd7', '?????????????????????????????????', 'org/sysmg/accessSystemManagementRestService/queryEffectiveAccessSystem', '58606a643d29437c9afcd69e8dd6482e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('3bc7226a89454115b2c09d10aff96749', '????????????????????????', 'org/sysmg/accessSystemManagementRestService/deleteBatchTaAccessSystemById', '58606a643d29437c9afcd69e8dd6482e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('c9b473e0bd044a579aef3a73d4ffc3cf', '??????????????????', 'org/sysmg/accessSystemManagementRestService/addTaAccessSystem', '58606a643d29437c9afcd69e8dd6482e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('3974a2411df2404ab1e0afa08653da95', '??????????????????', 'org/sysmg/accessSystemManagementRestService/deleteTaAccessSystemById', '58606a643d29437c9afcd69e8dd6482e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('f9de9a6d93e94f31ac446d213c5782fa', '????????????????????????', 'org/sysmg/accessSystemManagementRestService/updateTaAccessSystemById', '58606a643d29437c9afcd69e8dd6482e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('807ef17eaa8446188acbf92929171c56', '??????????????????', 'org/sysmg/accessSystemManagementRestService/queryAccessSystemByParam', '58606a643d29437c9afcd69e8dd6482e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('2c3c1591444842e1aa1588a0aab998a8', '????????????', 'org/authority/similarAuthorityManagementRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('8cea2eccc40c4c418e43f4321ee970c3', '????????????Ids????????????????????????????????????????????????', 'org/authority/similarAuthorityManagementRestService/queryUsePermissionRoleByResourceId', '2c3c1591444842e1aa1588a0aab998a8', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('83ca67228517485fba1f73bffc17b8a6', '?????????????????????????????????', 'org/authority/similarAuthorityManagementRestService/querynow()UserRePermission', '2c3c1591444842e1aa1588a0aab998a8', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('83a2c0425f3d469d92f24e7043a5d0f7', '?????????????????????????????????-?????????', 'org/authority/similarAuthorityManagementRestService/queryRePermissionResource', '2c3c1591444842e1aa1588a0aab998a8', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('09ec9781ec834b079889bcf60fcd7388', '????????????????????????', 'org/authority/similarAuthorityManagementRestService/addBatchSimilarAuthority', '2c3c1591444842e1aa1588a0aab998a8', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('0bd90473a1b64ae1ab705302bb6881fc', '??????????????????????????????', 'jobmg/elasticjob/jobOperateRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('b20b7169663b49d6b548a34e0d128b25', '???????????????????????????', 'jobmg/elasticjob/jobOperateRestService/clearCache', '0bd90473a1b64ae1ab705302bb6881fc', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('8d9b9595a4f84d28b5cad358335a37f7', '???????????????', 'jobmg/elasticjob/jobOperateRestService/enableJob', '0bd90473a1b64ae1ab705302bb6881fc', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('6e135682e38140a3bc423ff6406119d3', '????????????', 'jobmg/elasticjob/jobOperateRestService/shutdownJob', '0bd90473a1b64ae1ab705302bb6881fc', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('80ee0be75f024dee80412a61c3284256', '??????????????????', 'jobmg/elasticjob/jobOperateRestService/effectSharding', '0bd90473a1b64ae1ab705302bb6881fc', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('d105c3c113bf4188afd27fe2a2347a08', '??????????????????', 'jobmg/elasticjob/jobOperateRestService/getJobProgress', '0bd90473a1b64ae1ab705302bb6881fc', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('302d500716e34c3490523c3093201174', '????????????', 'jobmg/elasticjob/jobOperateRestService/removeJob', '0bd90473a1b64ae1ab705302bb6881fc', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('4b9d98dd01dd479d942b7d9fee2b8eae', '??????????????????', 'jobmg/elasticjob/jobOperateRestService/refreshProgress', '0bd90473a1b64ae1ab705302bb6881fc', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('db1104eba4874533b3042af4651e9c75', '????????????', 'jobmg/elasticjob/jobOperateRestService/triggerJob', '0bd90473a1b64ae1ab705302bb6881fc', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('97615539a3fe4dceb66a01ddaa5b4b4b', '????????????????????????', 'jobmg/elasticjob/jobOperateRestService/getJobDetailInfo', '0bd90473a1b64ae1ab705302bb6881fc', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('80018c73459347e0bf7cb9f089179e05', '??????????????????', 'jobmg/elasticjob/jobOperateRestService/getJobInfo', '0bd90473a1b64ae1ab705302bb6881fc', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('3568ca57a1bf4600a38b716982600625', '??????????????????', 'jobmg/elasticjob/jobOperateRestService/disabledSharding', '0bd90473a1b64ae1ab705302bb6881fc', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('d9d0f34456c24b44a6efa5634a6f115c', '???????????????', 'jobmg/elasticjob/jobOperateRestService/disableJob', '0bd90473a1b64ae1ab705302bb6881fc', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('d23f6f951ce5490dbe54dce47b1acfb1', '??????????????????', 'jobmg/elasticjob/jobOperateRestService/getJobServerDetail', '0bd90473a1b64ae1ab705302bb6881fc', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('59064e87d0294f5097e8bb192ab4e98c', '??????????????????', 'jobmg/elasticjob/jobOperateRestService/saveJobDetailInfo', '0bd90473a1b64ae1ab705302bb6881fc', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('b32b96d0142d4fea8d5fd8a58011c0c2', '????????????', 'org/orguser/userManagementRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('72fc1e15bee64231beee40b2d482aa43', '??????????????????', 'org/orguser/userManagementRestService/updateUserPwdByUserId', 'b32b96d0142d4fea8d5fd8a58011c0c2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('b94fc48142fe4130b29757a07f385aeb', '??????????????????', 'org/orguser/userManagementRestService/getOrgByAsync', 'b32b96d0142d4fea8d5fd8a58011c0c2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('634743c9057749748b82045ef69dd214', '????????????????????????', 'org/orguser/userManagementRestService/queryUserByConditon', 'b32b96d0142d4fea8d5fd8a58011c0c2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('5861ad2003b94d8ab0d730112a098fae', '????????????ID??????????????????????????????', 'org/orguser/userManagementRestService/getOrgUserByUserId', 'b32b96d0142d4fea8d5fd8a58011c0c2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('02484f5c350544b5b16ead7293c3558e', '??????userId??????????????????', 'org/orguser/userManagementRestService/queryAvatar', 'b32b96d0142d4fea8d5fd8a58011c0c2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('bdbe704910d8436fa2fe57985ff20431', '????????????Id??????????????????????????????', 'org/orguser/userManagementRestService/updateOrgUserByUserId', 'b32b96d0142d4fea8d5fd8a58011c0c2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('b4bfe4f72bc54f5fb6d431053323ff7d', '???????????????', 'org/orguser/userManagementRestService/queryOrgTree', 'b32b96d0142d4fea8d5fd8a58011c0c2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('a8d04425958c452eb9461a93867884ac', '?????????????????????id??????user', 'org/orguser/userManagementRestService/queryBatchUserByCustomOrgId', 'b32b96d0142d4fea8d5fd8a58011c0c2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('ab213f6723aa4e37bd2ce5597928fd53', '????????????????????????', 'org/orguser/userManagementRestService/updateUserOrgByUserId', 'b32b96d0142d4fea8d5fd8a58011c0c2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('06cd55b18e1f44adbdeded3fca1355f7', '???????????????????????????', 'org/orguser/userManagementRestService/queryOrgInfoByUserId', 'b32b96d0142d4fea8d5fd8a58011c0c2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('90829994ecaa4a0ca78c8ff564f2753b', '????????????', 'org/orguser/userManagementRestService/updateBatchUserUnLockByUserIds', 'b32b96d0142d4fea8d5fd8a58011c0c2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('b39bb0d6720d4764b2cd0224f3659a80', '????????????id????????????????????????', 'org/orguser/userManagementRestService/queryBatchUserByOrgId', 'b32b96d0142d4fea8d5fd8a58011c0c2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('24cee81a613f416a8649d159931cede2', '????????????', 'org/orguser/userManagementRestService/updateBatchUserDisabledByUserIds', 'b32b96d0142d4fea8d5fd8a58011c0c2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('5f575442b1f84595a1c05aef61f85765', '??????????????????', 'org/orguser/userManagementRestService/resetUserPwByUserId', 'b32b96d0142d4fea8d5fd8a58011c0c2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('25a2a2f205114fab819203012b99fa68', '??????userId?????????????????????', 'org/orguser/userManagementRestService/updateUserByUserId', 'b32b96d0142d4fea8d5fd8a58011c0c2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('203d2e7109ec4853997e2cfb462f5501', '????????????????????????', 'org/orguser/userManagementRestService/getUserOrgMultiConfig', 'b32b96d0142d4fea8d5fd8a58011c0c2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('1e9ea424827e475c89f036ab1f85137e', '????????????????????????', 'org/orguser/userManagementRestService/deleteBatchUserByUserIds', 'b32b96d0142d4fea8d5fd8a58011c0c2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('a1fa23f246904da9a3198966bbdd2122', '????????????', 'org/orguser/userManagementRestService/updateBatchUserAbleByUserIds', 'b32b96d0142d4fea8d5fd8a58011c0c2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('f2df6f27fcb945b39f263962a387aa16', '?????????????????????', 'message/queryUser', '415a0c59d499478da3b40fc896470569', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('a50c6b036e164d5daaba6a33881d5370', '??????????????????', 'message/queryUserMessage', '415a0c59d499478da3b40fc896470569', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('a272cfdac31c4af593d644e951b80a80', '??????????????????', 'message/queryNoticeFiles', '415a0c59d499478da3b40fc896470569', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('eb848308e574462e8d3bc9acb9d5defd', '????????????', 'message/sendNotice2', '415a0c59d499478da3b40fc896470569', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('02bbbed032b44a52ae6c5e82ec45d83a', '????????????', 'message/sendNotice', '415a0c59d499478da3b40fc896470569', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('0aae6ab603b442429a9ca0b29396da80', '??????????????????', 'message/readNotice', '415a0c59d499478da3b40fc896470569', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('4b19cb3a440e4e3f9f6f34de34e6d695', '??????????????????(??????)', 'message/readNotices', '415a0c59d499478da3b40fc896470569', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('f157f212127b49659461b34a0c23eb95', '??????????????????', 'message/uploadNoticeFile', '415a0c59d499478da3b40fc896470569', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('45fc94a23742400d9a681ac08695c246', '????????????(??????)', 'message/removeNotices', '415a0c59d499478da3b40fc896470569', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('a213d1db5b6b4e08b204b701c0476024', '??????????????????', 'message/downloadNoticeFile', '415a0c59d499478da3b40fc896470569', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('09024f31af1341a7b6c19c38359fcca1', '??????????????????', 'message/queryUserLetter', '415a0c59d499478da3b40fc896470569', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('4bf5eb1024ea41e09fdd8e714ea57492', '????????????', 'message/sendLetter2', '415a0c59d499478da3b40fc896470569', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('e8ac1a55c9db46d8a38d0c43f424a0bf', '????????????', 'message/sendLetter', '415a0c59d499478da3b40fc896470569', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('2a2eb9bfce6d42168eaa271fa3a001b8', '??????????????????', 'message/queryUserChat', '415a0c59d499478da3b40fc896470569', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('448d31215eba49ecb975f1800ed00f79', '??????????????????', 'message/readLetter', '415a0c59d499478da3b40fc896470569', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('8b11d3374b344f6292b2e13794b14fd7', '????????????', 'message/createChat', '415a0c59d499478da3b40fc896470569', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('7ffbbd9552954860b058a29f27dc55f0', '??????????????????(??????)', 'message/queryUserLetterNoRead', '415a0c59d499478da3b40fc896470569', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('af0be155c6934ecd83d8cf62b36437e2', '???????????????', 'org/sysmg/customResourceManagementRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('98c8e94f284e4cc19a66fb60ba04056d', '?????????????????????', 'org/sysmg/customResourceManagementRestService/updateTaCustomResourceByCustomResourceId', 'af0be155c6934ecd83d8cf62b36437e2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('91a7ffff45334096b124645f4f29974f', '?????????????????????', 'org/sysmg/customResourceManagementRestService/deleteTaCustomResourceByCustomResourceId', 'af0be155c6934ecd83d8cf62b36437e2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('2e457c6060bd411eb65bae7068d3d5d9', '?????????????????????', 'org/sysmg/customResourceManagementRestService/addTaCustomResource', 'af0be155c6934ecd83d8cf62b36437e2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('89d993cfaedb4c5db40fcf1bbe4a96ae', '?????????????????????', 'org/sysmg/customResourceManagementRestService/queryTaCustomResourceByCustomResourceId', 'af0be155c6934ecd83d8cf62b36437e2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('7859157a0cd94c89995b0dde9fc40bc6', '??????????????????', 'org/orguser/areaManagementRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('6cbf93b5f4b346b890f104756c55d078', '????????????????????????', 'org/orguser/areaManagementRestService/updateArea', '7859157a0cd94c89995b0dde9fc40bc6', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('e0819670288c4a8991872a398894488e', '????????????????????????', 'org/orguser/areaManagementRestService/addArea', '7859157a0cd94c89995b0dde9fc40bc6', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('0cdb0e7d42b941e3bc99399aa69a0f89', '??????????????????????????????', 'org/orguser/areaManagementRestService/queryAreaByAsync', '7859157a0cd94c89995b0dde9fc40bc6', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('6a73d3aa6f5949caa1f4c536ffe01400', '??????????????????????????????', 'org/sysmg/resourceManagementRestService/queryChildResource', '821a8ca012154ba2a4c451918c99cfc0', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('c1b1724998ed41aeaecd8dafa167278a', '?????????????????????????????????', 'org/sysmg/resourceManagementRestService/deleteTaResourceUi', '821a8ca012154ba2a4c451918c99cfc0', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('d072f9cf46f24a52ba5fb68f7e393c21', '??????????????????????????????', 'org/sysmg/resourceManagementRestService/addTaResourceUi', '821a8ca012154ba2a4c451918c99cfc0', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('243a1cf716ed49dcae4f105ef450aa45', '??????????????????', 'org/sysmg/resourceManagementRestService/updateTaResourceUi', '821a8ca012154ba2a4c451918c99cfc0', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('b8d148426f6746b1b76f36d11c059dbf', '??????????????????', 'org/sysmg/resourceManagementRestService/queryTaResourceUi', '821a8ca012154ba2a4c451918c99cfc0', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('f2e756c387524382a6fa4d9f3db9abf7', '??????????????????', 'logmg/exceptionlog/serverExceptionLogRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('676b9aca9d054d65aac3830436d2322e', '?????????????????????', 'org/sysmg/manageableFieldsRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('b771b6243ac04ddc8f9e496c175f8f52', '??????????????????????????????', 'org/sysmg/manageableFieldsRestService/updateManageableFieldsDetailByFieldId', '676b9aca9d054d65aac3830436d2322e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('d3dd51b3f42141b490aab2a4b76dba44', '????????????????????????', 'org/sysmg/manageableFieldsRestService/saveDefaultManageableFields', '676b9aca9d054d65aac3830436d2322e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('bbde0232aa2c41b59593666c95186ab6', '??????????????????', 'org/sysmg/manageableFieldsRestService/updateManageableFieldsByFieldsId', '676b9aca9d054d65aac3830436d2322e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('47a91cf250b8446c89cc98628adbcd31', '??????????????????', 'org/sysmg/manageableFieldsRestService/queryManageableFields', '676b9aca9d054d65aac3830436d2322e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('8545972435bb4abab8d2524fac510a04', '??????????????????', 'tarunqianresource/taRunqianResourceRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('5855e399c9074b899850bb25ce1aaf76', '?????????????????????????????????', 'jobmg/elasticjob/serverOperateRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('c7ae73b1a4cd4ad8a4b4e2f199bad322', '???????????????????????????', 'org/orguser/customOrgManagementRestService/addCustomOrgTypeName', 'b091f4af3eba4c5c946af8dacaf951b9', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('ef46133fe6b04b04b0a5e7481d92b2ea', '???????????????????????????', 'org/orguser/customOrgManagementRestService/updateCustomOrgTypeName', 'b091f4af3eba4c5c946af8dacaf951b9', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('9c99e327ead94f96a0799377d8aea579', '?????????????????????????????????????????????', 'org/orguser/orgManagementRestService/queryAllOrgByOrgId', 'aa60a746c0a24640a06dea49a4d42572', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('fd4b922d759a448e894c489336b9443e', '????????????????????????', 'org/orguser/orgManagementRestService/updateTaOrgByOrgId', 'aa60a746c0a24640a06dea49a4d42572', '1', '1', now(), '1');
-- INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('47488be533b54ae99f0418ba3962e8b9', '????????????', 'dynamic/rest/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('7ac1c71173f2421ea634f0e274303521', '???????????????????????????????????????', 'org/authority/roleAuthorityManagementRestService/addBatchRoleUsers', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('670804d52f2c473bb58ad6c87ceefbf9', '??????????????????????????????', 'org/authority/roleAuthorityManagementRestService/deleteRoleUserByKey', 'fc45635549b5487c87d0287490a79b5f', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('072db1f4c4a848cd938d95b4057ff4c0', '??????userId??????????????????????????????????????????', 'org/authority/authorityAgentRestService/queryUsePermissionByUserId', 'c4360fdef9ad46278a677508ee8b290a', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('7ff6d8f6a9994e7cb6710b4edd1d109c', '????????????????????????', 'org/authority/authorityAgentRestService/deleteBatchAgentRole', 'c4360fdef9ad46278a677508ee8b290a', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('e546d678a75740c0be0e9a0914d3fac4', '????????????????????????', 'org/authority/authorityAgentRestService/queryAgentRoleAuthority', 'c4360fdef9ad46278a677508ee8b290a', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('4b3512dec0204cd19b7c5fbdd75a97fa', '??????????????????', 'org/orguser/userManagementRestService/queryEffectiveUser', 'b32b96d0142d4fea8d5fd8a58011c0c2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('416f405ee4dc43d5b5c9f4bbbf6414ef', '????????????', 'org/orguser/userManagementRestService/queryTagByUserId', 'b32b96d0142d4fea8d5fd8a58011c0c2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('d3db2fb5724d4839b04ff4260174a70d', '??????????????????', 'org/orguser/userManagementRestService/addUser', 'b32b96d0142d4fea8d5fd8a58011c0c2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('415a0c59d499478da3b40fc896470569', '????????????', 'message/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('efaecd1281c64c89ba87363bf1c18900', '??????????????????????????????????????????', 'org/sysmg/customResourceManagementRestService/queryALLTaCustomResourceTreeByCategoryId', 'af0be155c6934ecd83d8cf62b36437e2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('7af7009339d145c1967e8d46a4b194d1', '??????????????????', 'org/sysmg/customResourceManagementRestService/queryALLTaCustomResourceParent', 'af0be155c6934ecd83d8cf62b36437e2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('321ac2aade66460dbea294f434dc4c9d', '??????????????????', 'logmg/logconfig/logConfigRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('e34479764c66437e993c27072a13dfca', '??????????????????', 'logmg/logconfig/logConfigRestService/addLogConfig', '321ac2aade66460dbea294f434dc4c9d', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('72fb390446eb475cbefd28e0a26041c0', '??????????????????', 'logmg/logconfig/logConfigRestService/getLogConfig', '321ac2aade66460dbea294f434dc4c9d', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('89872c1e30e543e1ae0352c0b1ecfb72', '??????????????????', 'logmg/logconfig/logConfigRestService/deleteLogConfigByName', '321ac2aade66460dbea294f434dc4c9d', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('0e4c73815f2e43deaadbb0646cc9ae7c', '?????????????????????', 'logmg/logconfig/logConfigRestService/configFileNamePattern', '321ac2aade66460dbea294f434dc4c9d', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('ffffdb7e67b74234a3a230abd06e4d32', '???????????????????????????????????????', 'logmg/logconfig/logConfigRestService/configLevelAndAppenderType', '321ac2aade66460dbea294f434dc4c9d', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('7f621426782342faa371319c677f066e', '?????????????????????', 'org/sysmg/resourceCategoryManagementRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('f757b23bbfbe461b8478e5ad456ec64f', '???????????????????????????', 'org/sysmg/resourceCategoryManagementRestService/deleteTaResourceCategoryByCategoryId', '7f621426782342faa371319c677f066e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('b94b3fd3ce4f4e89860a3b0b00f985b4', '???????????????????????????', 'org/sysmg/resourceCategoryManagementRestService/updateTaResourceCategoryByCategoryId', '7f621426782342faa371319c677f066e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('80d490da38044ad58c96da08e6e58efd', '??????????????????????????????????????????', 'org/sysmg/resourceCategoryManagementRestService/queryALLTaResourceCategory', '7f621426782342faa371319c677f066e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('8c54473a278248628dcad204a57ebd9a', '???????????????????????????', 'org/sysmg/resourceCategoryManagementRestService/addTaResourceCategory', '7f621426782342faa371319c677f066e', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('4e90eb395b2e41ed81285b7ba9362b84', '??????????????????', 'logMg/loginFailLog/taLoginFailLogRestService/**', null, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('498a9c21ba1d4042b85b2d0b8d4ec61f', '??????????????????', 'logMg/loginFailLog/taLoginFailLogRestService/queryLoginFailLog', '4e90eb395b2e41ed81285b7ba9362b84', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('20cf287cd36448d4ba6b6930ea472824', '?????????????????????????????????', 'org/sysmg/customResourceManagementRestService/queryALLTaCustomResourceTree', 'af0be155c6934ecd83d8cf62b36437e2', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('314759f094014f24b991d467378d1755', '???????????????', 'logMg/loginFailLog/taLoginFailLogRestService/loginFailChart', '4e90eb395b2e41ed81285b7ba9362b84', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('253c2eae3e0046c2ba4f53f4ffa89ba3', '????????????????????????', 'onlineForm/templateMg/templateMgRestService/**', NULL, '0', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('d9a5e31b83b141279b387bc4dfac0713', '??????????????????????????????', 'onlineForm/templateMg/templateMgRestService/queryTemplate', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('66ee423b80f84407a952e4edf2d27901', '??????ID????????????JSON?????????', 'onlineForm/templateMg/templateMgRestService/queryTemplateContentById', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('2133136c1fca4fa79ed4c5b960bf914c', '??????????????????', 'onlineForm/templateMg/templateMgRestService/insertTemplate', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('8d50ff41b6aa42c383f119cc4dd9abf6', '??????????????????', 'onlineForm/templateMg/templateMgRestService/updateTemplate', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('59ea5a521dd1439f839466603c76302a', '?????????????????????', 'onlineForm/templateMg/templateMgRestService/updateTemplateEffective', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('c433ed5a2a1340f6a0063637861de279', '??????????????????', 'onlineForm/templateMg/templateMgRestService/deleteTemplates', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('632895cc5cd14dbdb76d9c10fffd0786', '???????????????', 'onlineForm/templateMg/templateMgRestService/queryTableColumns', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', now(), '1');
INSERT INTO taurl (id, name, url, namespace, type, effective, createtime, createuser) VALUES ('60bd58fe73d0472881349ecbfdd0bd29', '??????????????????', 'onlineForm/templateMg/templateMgRestService/queryTable', '253c2eae3e0046c2ba4f53f4ffa89ba3', '1', '1', now(), '1');


--  ?????????????????????
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('4b2eee0d7ded4e8094d4acf439fd3a1c', '48afedddc8f04c668b3c1572c30a7745', '??????????????????', '', 'sysmg', 'orguser.html#/areaManagement', 30, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/48afedddc8f04c668b3c1572c30a7745/4b2eee0d7ded4e8094d4acf439fd3a1c', '????????????/????????????/??????????????????/??????????????????', '3', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('1d4e283ad5584e02811f6b188d3592bc', '0415d44401b24605a21b589b6aaa349e', '????????????', '', 'sysmg', '', 41, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/1d4e283ad5584e02811f6b188d3592bc', '????????????/????????????/????????????', '2', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('7c1dabd160974d8f90858c187cefa128', '1d4e283ad5584e02811f6b188d3592bc', '??????????????????', '', 'sysmg', 'logmg.html#/logConfig', 0, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/1d4e283ad5584e02811f6b188d3592bc/7c1dabd160974d8f90858c187cefa128', '????????????/????????????/????????????/??????????????????', '3', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('95bb9b749bf54e4692b0b1f14fd1b5ab', '78ad02fdb879406ebc5e7a4faf8f5905', '??????????????????', '', 'sysmg', 'authority.html#/roleAuthorityManagement', 0, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/78ad02fdb879406ebc5e7a4faf8f5905/95bb9b749bf54e4692b0b1f14fd1b5ab', '????????????/????????????/??????????????????/??????????????????', '3', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('7b7f9cd1675a4b54b05c7c7cf0a7ac63', '0415d44401b24605a21b589b6aaa349e', '???????????????', NULL, 'sysmg', NULL, 51, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7b7f9cd1675a4b54b05c7c7cf0a7ac63', '????????????/????????????/???????????????', '2', '', '', '2', 0, '0', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('40337bdecb19484ebeb39d6c21aaca26', '0', '????????????', '', 'sysmg', '', 0, '40337bdecb19484ebeb39d6c21aaca26', '????????????', '0', '', '', '2', 1, '0', '1', '', '', now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('5b658a734b39420c965f1bc68832c4fa', '7b7f9cd1675a4b54b05c7c7cf0a7ac63', '???????????????', NULL, 'sysmg', NULL, 30, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7b7f9cd1675a4b54b05c7c7cf0a7ac63/5b658a734b39420c965f1bc68832c4fa', '????????????/????????????/???????????????/???????????????', '3', '', '', '2', 0, '0', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('fb8637c2e52e4b05bd2c07d742141ee7', '1d4e283ad5584e02811f6b188d3592bc', '?????????????????????', NULL, 'sysmg', NULL, 50, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/1d4e283ad5584e02811f6b188d3592bc/fb8637c2e52e4b05bd2c07d742141ee7', '????????????/????????????/????????????/?????????????????????', '3', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('60554e93387146bb9c7357907ba093fa', '7b7f9cd1675a4b54b05c7c7cf0a7ac63', '?????????????????????', NULL, 'sysmg', 'workTablePage.html#/componentsMg', 10, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7b7f9cd1675a4b54b05c7c7cf0a7ac63/60554e93387146bb9c7357907ba093fa', '????????????/????????????/???????????????/?????????????????????', '3', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('3dbde33722154503a7d22ac60f6a0e4e', '48afedddc8f04c668b3c1572c30a7745', '?????????????????????', '', 'sysmg', 'orguser.html#/customOrgManagement', 20, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/48afedddc8f04c668b3c1572c30a7745/3dbde33722154503a7d22ac60f6a0e4e', '????????????/????????????/??????????????????/?????????????????????', '3', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('daceeff8a97b46cb9573b93ba3a5a792', '48afedddc8f04c668b3c1572c30a7745', '????????????', '', 'sysmg', 'orguser.html#/userManagement', 10, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/48afedddc8f04c668b3c1572c30a7745/daceeff8a97b46cb9573b93ba3a5a792', '????????????/????????????/??????????????????/????????????', '3', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('bd9d0bba145c458e841aa9da0aeeb1d8', '7459c1b525934151a1d309a304933644', '???????????????????????????', '', 'sysmg', 'sysmg.html#/userInfoManagement', 40, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7459c1b525934151a1d309a304933644/bd9d0bba145c458e841aa9da0aeeb1d8', '????????????/????????????/????????????/???????????????????????????', '3', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('5611d1533d494a839c0be1e7a05da31f', '7459c1b525934151a1d309a304933644', 'URL????????????', NULL, 'sysmg', 'resourcemg.html#/urlmg', 50, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7459c1b525934151a1d309a304933644/5611d1533d494a839c0be1e7a05da31f', '????????????/????????????/????????????/URL????????????', '3', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('59a7fb9c459a4dd48d468f2add1d32b2', '1d4e283ad5584e02811f6b188d3592bc', '??????????????????', '', 'sysmg', 'sysmg.html#/accessSystem', 70, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/1d4e283ad5584e02811f6b188d3592bc/59a7fb9c459a4dd48d468f2add1d32b2', '????????????/????????????/????????????/??????????????????', '3', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('72888507aba5484a8942e8dd0e6b6f7f', 'fb8637c2e52e4b05bd2c07d742141ee7', '????????????', NULL, 'sysmg', 'sysmg.html#/jobManager', 0, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/1d4e283ad5584e02811f6b188d3592bc/fb8637c2e52e4b05bd2c07d742141ee7/72888507aba5484a8942e8dd0e6b6f7f', '????????????/????????????/????????????/?????????????????????/????????????', '4', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('c578d9f8626d48f2971d7a18ac5281c5', 'fb8637c2e52e4b05bd2c07d742141ee7', '????????????', NULL, 'sysmg', 'sysmg.html#/jobHistory', 10, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/1d4e283ad5584e02811f6b188d3592bc/fb8637c2e52e4b05bd2c07d742141ee7/c578d9f8626d48f2971d7a18ac5281c5', '????????????/????????????/????????????/?????????????????????/????????????', '4', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('7459c1b525934151a1d309a304933644', '0415d44401b24605a21b589b6aaa349e', '????????????', '', 'sysmg', '', 40, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7459c1b525934151a1d309a304933644', '????????????/????????????/????????????', '2', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('78ad02fdb879406ebc5e7a4faf8f5905', '0415d44401b24605a21b589b6aaa349e', '??????????????????', '', 'sysmg', '', 30, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/78ad02fdb879406ebc5e7a4faf8f5905', '????????????/????????????/??????????????????', '2', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('0aac95c1e73947bea41be639cc4e9036', '7b7f9cd1675a4b54b05c7c7cf0a7ac63', '???????????????????????????', NULL, 'sysmg', 'workTablePage.html#/roleTemplateMg', 20, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7b7f9cd1675a4b54b05c7c7cf0a7ac63/0aac95c1e73947bea41be639cc4e9036', '????????????/????????????/???????????????/???????????????????????????', '3', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('bf447212de284c79a0d73c658d0692b4', '1d4e283ad5584e02811f6b188d3592bc', '??????????????????', 'sysmg', 'sysmg', 'sysmg.html#/configManagement', 80, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/1d4e283ad5584e02811f6b188d3592bc/bf447212de284c79a0d73c658d0692b4', '????????????/????????????/????????????/??????????????????', '3', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('3df588fc565d4287b3cefcd00a39cd91', '7459c1b525934151a1d309a304933644', '????????????', '', 'sysmg', 'sysmg.html#/tagManagement', 30, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7459c1b525934151a1d309a304933644/3df588fc565d4287b3cefcd00a39cd91', '????????????/????????????/????????????/????????????', '3', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('86d9f05789894b8fae5fb431c6e14168', '5b658a734b39420c965f1bc68832c4fa', '??????', NULL, 'sysmg', 'analysis', 10, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7b7f9cd1675a4b54b05c7c7cf0a7ac63/5b658a734b39420c965f1bc68832c4fa/86d9f05789894b8fae5fb431c6e14168', '????????????/????????????/???????????????/???????????????/??????', '4', '', '', '1', 1, '0', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('1e706f26bc144c1da12022359c238053', '48afedddc8f04c668b3c1572c30a7745', '??????????????????', '', 'sysmg', 'orguser.html#/orgManagement', 0, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/48afedddc8f04c668b3c1572c30a7745/1e706f26bc144c1da12022359c238053', '????????????/????????????/??????????????????/??????????????????', '3', '', '', '2', 1, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('48afedddc8f04c668b3c1572c30a7745', '0415d44401b24605a21b589b6aaa349e', '??????????????????', '', 'sysmg', '', 10, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/48afedddc8f04c668b3c1572c30a7745', '????????????/????????????/??????????????????', '2', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('c2745b7cae7846acb9bcf8d0f4e836e8', '7459c1b525934151a1d309a304933644', '?????????????????????', '', 'sysmg', 'sysmg.html#/customResource', 20, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7459c1b525934151a1d309a304933644/c2745b7cae7846acb9bcf8d0f4e836e8', '????????????/????????????/????????????/?????????????????????', '3', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('ec56a0a43b09429482632cb61f7c6908', '7459c1b525934151a1d309a304933644', '??????????????????', '', 'sysmg', 'sysmg.html#/resourceManagement', 0, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7459c1b525934151a1d309a304933644/ec56a0a43b09429482632cb61f7c6908', '????????????/????????????/????????????/??????????????????', '3', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('0415d44401b24605a21b589b6aaa349e', '40337bdecb19484ebeb39d6c21aaca26', '????????????', '', 'sysmg', '', 51, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e', '????????????/????????????', '1', '', '', '2', 0, '0', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('cd49aa1e1a724404a4dfb4f290e1ed62', '1d4e283ad5584e02811f6b188d3592bc', '??????????????????', NULL, 'sysmg', 'sysmg.html#/systemConfigManagement', 90, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/1d4e283ad5584e02811f6b188d3592bc/cd49aa1e1a724404a4dfb4f290e1ed62', '????????????/????????????/????????????/??????????????????', '3', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('a3c94b4edf1e4e9d8665a81dc1c5f778', '1d4e283ad5584e02811f6b188d3592bc', '????????????', NULL, 'sysmg', 'sysmg.html#/dynamicRest', 100, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/1d4e283ad5584e02811f6b188d3592bc/a3c94b4edf1e4e9d8665a81dc1c5f778', '????????????/????????????/????????????/????????????', '3', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('ccbf8db88cc548eba4dfbb920c74feec', '5b658a734b39420c965f1bc68832c4fa', '??????', NULL, 'sysmg', 'monitor', 20, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7b7f9cd1675a4b54b05c7c7cf0a7ac63/5b658a734b39420c965f1bc68832c4fa/ccbf8db88cc548eba4dfbb920c74feec', '????????????/????????????/???????????????/???????????????/??????', '4', '', '', '1', 0, '0', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('722e1cc774a14178a488eb42ef4099de', '7459c1b525934151a1d309a304933644', '??????????????????', NULL, 'sysmg', 'functionModules.html#/runqian', 60, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7459c1b525934151a1d309a304933644/722e1cc774a14178a488eb42ef4099de', '????????????/????????????/????????????/??????????????????', '3', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('5e67c7acef914c349d8aff076921f6b5', '78ad02fdb879406ebc5e7a4faf8f5905', '??????????????????', '', 'sysmg', 'authority.html#/similarAuthority', 30, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/78ad02fdb879406ebc5e7a4faf8f5905/5e67c7acef914c349d8aff076921f6b5', '????????????/????????????/??????????????????/??????????????????', '3', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('d81d6ee5ec684fd8a32935ceb03d1cf7', '5b658a734b39420c965f1bc68832c4fa', '??????', NULL, 'sysmg', 'user', 0, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/7b7f9cd1675a4b54b05c7c7cf0a7ac63/5b658a734b39420c965f1bc68832c4fa/d81d6ee5ec684fd8a32935ceb03d1cf7', '????????????/????????????/???????????????/???????????????/??????', '4', '', '', '1', 0, '0', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('8aa86ed4c7f84183935a262db4a605d3', '78ad02fdb879406ebc5e7a4faf8f5905', '?????????????????????', '', 'sysmg', 'authority.html#/adminAuthority', 10, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/78ad02fdb879406ebc5e7a4faf8f5905/8aa86ed4c7f84183935a262db4a605d3', '????????????/????????????/??????????????????/?????????????????????', '3', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('877e407281dd48acb05a77fcb922bc73', '78ad02fdb879406ebc5e7a4faf8f5905', '????????????', '', 'sysmg', 'authority.html#/authorityAgent', 20, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/78ad02fdb879406ebc5e7a4faf8f5905/877e407281dd48acb05a77fcb922bc73', '????????????/????????????/??????????????????/????????????', '3', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('ffa74f43e853441dac0ee90c787cb2e6', '1d4e283ad5584e02811f6b188d3592bc', '????????????', '', 'sysmg', 'sysmg.html#/dictionaryManager', 30, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/1d4e283ad5584e02811f6b188d3592bc/ffa74f43e853441dac0ee90c787cb2e6', '????????????/????????????/????????????/????????????', '3', '', '', '2', 0, '1', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('fe8be18859b5478d8b76a7653f02e5eb', '1d4e283ad5584e02811f6b188d3592bc', '????????????', null, 'sysmg', 'audit.html#/operationLog', 120, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/1d4e283ad5584e02811f6b188d3592bc/fe8be18859b5478d8b76a7653f02e5eb', '????????????/????????????/????????????/????????????', '3', '', '', '2', 0, '1', '1', '1', null, now(), '1', '0', null, null, null, null, null, null, null, null, null, null, '0', null);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('43f468b40c6c4c76a3a2fe4be903f4c7', '1d4e283ad5584e02811f6b188d3592bc', '??????????????????', null, 'sysmg', 'audit.html#/systemExceptionLog', 110, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/1d4e283ad5584e02811f6b188d3592bc/43f468b40c6c4c76a3a2fe4be903f4c7', '????????????/????????????/????????????/??????????????????', '3', '', '', '2', 0, '1', '1', '1', null, now(), '1', '0', null, null, null, null, null, null, null, null, null, null, '0', null);
-- ??????
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('6d0bbcbe65e543d8a5d272d6a6a3bf4c', '0415d44401b24605a21b589b6aaa349e', '????????????', NULL, 'sysmg', NULL, 61, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/6d0bbcbe65e543d8a5d272d6a6a3bf4c', '????????????/????????????/????????????', '2', '', '', '2', 0, '4', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('73dd0eb461784dfe8bb7d18616a83a09', '6d0bbcbe65e543d8a5d272d6a6a3bf4c', '????????????', NULL, 'sysmg', 'audit.html#/auditLog', 60, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/6d0bbcbe65e543d8a5d272d6a6a3bf4c/73dd0eb461784dfe8bb7d18616a83a09', '????????????/????????????/????????????/????????????', '3', '', '', '2', 0, '4', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('76514eaf165e42c5838b1fbcf7993863', '6d0bbcbe65e543d8a5d272d6a6a3bf4c', '??????????????????', NULL, 'sysmg', 'audit.html#/accessDenyLog', 20, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/6d0bbcbe65e543d8a5d272d6a6a3bf4c/76514eaf165e42c5838b1fbcf7993863', '????????????/????????????/????????????/??????????????????', '3', '', '', '2', 0, '4', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('25e6a452ed7a454ab3c757b5f8ff0a70', '6d0bbcbe65e543d8a5d272d6a6a3bf4c', '??????????????????', NULL, 'sysmg', 'audit.html#/loginFailLog', 30, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/6d0bbcbe65e543d8a5d272d6a6a3bf4c/25e6a452ed7a454ab3c757b5f8ff0a70', '????????????/????????????/????????????/??????????????????', '3', '', '', '2', 0, '4', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('2ac775f74f934264ab1d43b5a42b56ef', '6d0bbcbe65e543d8a5d272d6a6a3bf4c', '??????????????????', NULL, 'sysmg', 'audit.html#/loginLogAnalysis', 0, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/6d0bbcbe65e543d8a5d272d6a6a3bf4c/2ac775f74f934264ab1d43b5a42b56ef', '????????????/????????????/????????????/??????????????????', '3', '', '', '2', 0, '4', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('49296b8d9bd04786a8860e7011d4481f', '6d0bbcbe65e543d8a5d272d6a6a3bf4c', '??????????????????', null, 'sysmg', 'audit.html#/systemExceptionLog', 40, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/6d0bbcbe65e543d8a5d272d6a6a3bf4c/49296b8d9bd04786a8860e7011d4481f', '????????????/????????????/????????????/??????????????????', '3', '', '', '2', 0, '4', '1', null, null, now(), '1', '0', null, null, null, null, null, null, null, null, null, null, '0', null);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('b2d888803a5e425fa59af5d247a87a6e', '6d0bbcbe65e543d8a5d272d6a6a3bf4c', '????????????', null, 'sysmg', 'audit.html#/operationLog', 50, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/6d0bbcbe65e543d8a5d272d6a6a3bf4c/b2d888803a5e425fa59af5d247a87a6e', '????????????/????????????/????????????/????????????', '3', '', '', '2', 0, '4', '1', null, null, now(), '1', '0', null, null, null, null, null, null, null, null, null, null, '0', null);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('78fe48d6ab83452892dd10cd657d5f59', '6d0bbcbe65e543d8a5d272d6a6a3bf4c', '????????????', null, 'sysmg', 'authority.html#/examineManagementLog', 10, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/6d0bbcbe65e543d8a5d272d6a6a3bf4c/78fe48d6ab83452892dd10cd657d5f59', '????????????/????????????/????????????/????????????', '3', '', '', '2', 0, '4', '1', null, null, now(), '1', '0', null, null, null, null, null, null, null, null, null, null, '0', null);
-- ??????
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('ea2297291cb24f8ba2eb01c2ae00850d', '0415d44401b24605a21b589b6aaa349e', '????????????', NULL, 'sysmg', NULL, 61, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/ea2297291cb24f8ba2eb01c2ae00850d', '????????????/????????????/????????????', '2', '', '', '2', 0, '3', '1', NULL, NULL, now(), '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('1b7f1d4202a841aaac9186c8772cfdac', 'ea2297291cb24f8ba2eb01c2ae00850d', '????????????', null, 'sysmg', 'authority.html#/examineManagement', 10, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/ea2297291cb24f8ba2eb01c2ae00850d/1b7f1d4202a841aaac9186c8772cfdac', '????????????/????????????/????????????/????????????', '3', '', '', '2', 0, '3', '1', null, null, now(), '1', '0', null, null, null, null, null, null, null, null, null, null, '0', null);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('519e7153c57745edb884dd10ae7dccf5', 'ea2297291cb24f8ba2eb01c2ae00850d', '??????????????????', null, 'sysmg', 'authority.html#/examineManagementLog', 30, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/ea2297291cb24f8ba2eb01c2ae00850d/519e7153c57745edb884dd10ae7dccf5', '????????????/????????????/????????????/??????????????????', '3', '', '', '2', 0, '3', '1', '1', null, now(), '1', '0', null, null, null, null, null, null, null, null, null, null, '0', null);
INSERT INTO taresource(resourceid, presourceid, name, code, syscode, url, orderno, idpath, namepath, resourcelevel, icon, iconcolor, securitypolicy, securitylevel, resourcetype, effective, isdisplay, isfiledscontrol, createdate, createuser, uiauthoritypolicy, field01, field02, field03, field04, field05, field06, field07, field08, field09, field10, workbench, image) VALUES ('e7542892ef424e809c3bb8cfa8c0051b', 'ea2297291cb24f8ba2eb01c2ae00850d', '????????????????????????', null, 'sysmg', 'authority.html#/examinerAuthority', 20, '40337bdecb19484ebeb39d6c21aaca26/0415d44401b24605a21b589b6aaa349e/ea2297291cb24f8ba2eb01c2ae00850d/e7542892ef424e809c3bb8cfa8c0051b', '????????????/????????????/????????????/????????????????????????', '3', '', '', '2', 0, '3', '1', null, null, now(), '1', '0', null, null, null, null, null, null, null, null, null, null, '0', null);

--  ?????????????????????
INSERT INTO taaccesssystem
(id,syscode,sysname,spell,protocol,domain,port,contextpath,portalsystem,menuservice,provider,effective,regtime,modifytime,backgroundaddress) VALUES ('e55b9b7046434d66bc11b94d553fada2','sysmg','????????????','GLXT','http','localhost','8081','sysmg','1','111','ss','1',now(),now(),'192.168.0.1:8083');


--  ???????????????
INSERT INTO tataggroup (taggroupid,taggroupname,effective,createuser,createtime,updatetime,destory) VALUES ('001','??????','1','developer',now(),now(),'0');
INSERT INTO tataggroup (taggroupid,taggroupname,effective,createuser,createtime,updatetime,destory) VALUES ('002','??????','1','developer',now(),now(),'0');

--  ????????????????????????taresourceurl
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('1e706f26bc144c1da12022359c238053', '0cdb0e7d42b941e3bc99399aa69a0f89', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('1e706f26bc144c1da12022359c238053', '47a91cf250b8446c89cc98628adbcd31', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('1e706f26bc144c1da12022359c238053', 'aa60a746c0a24640a06dea49a4d42572', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('877e407281dd48acb05a77fcb922bc73', 'c4360fdef9ad46278a677508ee8b290a', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('5e67c7acef914c349d8aff076921f6b5', '2c3c1591444842e1aa1588a0aab998a8', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('0aac95c1e73947bea41be639cc4e9036', 'ba186bfbfb1647ffbe7db23e89686e9f', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('1e706f26bc144c1da12022359c238053', '4b3512dec0204cd19b7c5fbdd75a97fa', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('0aac95c1e73947bea41be639cc4e9036', 'ad0d709c33284be58a7232fa416d7bd3', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('b2d888803a5e425fa59af5d247a87a6e', 'badc42944eb74d38a3ce254536e997c1', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('c2745b7cae7846acb9bcf8d0f4e836e8', 'af0be155c6934ecd83d8cf62b36437e2', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('c2745b7cae7846acb9bcf8d0f4e836e8', '7f621426782342faa371319c677f066e', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('c2745b7cae7846acb9bcf8d0f4e836e8', '6b844095d25d44daba36670ed5d31bd7', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('bd9d0bba145c458e841aa9da0aeeb1d8', '676b9aca9d054d65aac3830436d2322e', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('b2d888803a5e425fa59af5d247a87a6e', 'fb72be8cb70f40caacc63510afc9e8b3', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('49296b8d9bd04786a8860e7011d4481f', 'f2e756c387524382a6fa4d9f3db9abf7', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('49296b8d9bd04786a8860e7011d4481f', 'fb72be8cb70f40caacc63510afc9e8b3', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('2ac775f74f934264ab1d43b5a42b56ef', '39683443f5e84c67913039e4c53133d1', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('2ac775f74f934264ab1d43b5a42b56ef', 'fb72be8cb70f40caacc63510afc9e8b3', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('519e7153c57745edb884dd10ae7dccf5', '475f84c0bc3f4702a1e3d76de7e84f35', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('519e7153c57745edb884dd10ae7dccf5', '15f7e09d42124995bb44c18ce7b625de', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('519e7153c57745edb884dd10ae7dccf5', '47a91cf250b8446c89cc98628adbcd31', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('519e7153c57745edb884dd10ae7dccf5', '2f786a24ec574ed48368a9e633e07351', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('519e7153c57745edb884dd10ae7dccf5', '832d3322479949d8a36da9458fa3bcbb', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('519e7153c57745edb884dd10ae7dccf5', '9a749a3305844739a424feeb0962f0e9', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('519e7153c57745edb884dd10ae7dccf5', 'ce3009ef4f61445bb2ba1fe5a747e8be', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('25e6a452ed7a454ab3c757b5f8ff0a70', '4e90eb395b2e41ed81285b7ba9362b84', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('25e6a452ed7a454ab3c757b5f8ff0a70', 'fb72be8cb70f40caacc63510afc9e8b3', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('519e7153c57745edb884dd10ae7dccf5', '83ca67228517485fba1f73bffc17b8a6', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('519e7153c57745edb884dd10ae7dccf5', '416f405ee4dc43d5b5c9f4bbbf6414ef', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('3df588fc565d4287b3cefcd00a39cd91', '885e01d3494b44759c62b8b3568e6145', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('95bb9b749bf54e4692b0b1f14fd1b5ab', 'fc45635549b5487c87d0287490a79b5f', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('8aa86ed4c7f84183935a262db4a605d3', 'cbcdd31ffb6c40499bb1af744851a783', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('4b2eee0d7ded4e8094d4acf439fd3a1c', '7859157a0cd94c89995b0dde9fc40bc6', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('ffa74f43e853441dac0ee90c787cb2e6', 'b88be2871149451a918264fd1ff468a3', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('7c1dabd160974d8f90858c187cefa128', '321ac2aade66460dbea294f434dc4c9d', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('76514eaf165e42c5838b1fbcf7993863', '10ce3706358e4127bb173427560244d8', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('76514eaf165e42c5838b1fbcf7993863', 'fb72be8cb70f40caacc63510afc9e8b3', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('722e1cc774a14178a488eb42ef4099de', '8545972435bb4abab8d2524fac510a04', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('76514eaf165e42c5838b1fbcf7993863', '71408b92effd4fcd99cd89f6b87bad57', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('43f468b40c6c4c76a3a2fe4be903f4c7', 'f2e756c387524382a6fa4d9f3db9abf7', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('43f468b40c6c4c76a3a2fe4be903f4c7', '63daedc10cb9415da26c532ab9388ec8', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('43f468b40c6c4c76a3a2fe4be903f4c7', 'ff98da127f154939a0fdef59ec22f982', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('fe8be18859b5478d8b76a7653f02e5eb', 'badc42944eb74d38a3ce254536e997c1', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('fe8be18859b5478d8b76a7653f02e5eb', '0b0456f381374b278c804a848bceebcc', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('daceeff8a97b46cb9573b93ba3a5a792', '47a91cf250b8446c89cc98628adbcd31', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('1b7f1d4202a841aaac9186c8772cfdac', '475f84c0bc3f4702a1e3d76de7e84f35', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('1b7f1d4202a841aaac9186c8772cfdac', '2f786a24ec574ed48368a9e633e07351', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('1b7f1d4202a841aaac9186c8772cfdac', '416f405ee4dc43d5b5c9f4bbbf6414ef', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('1b7f1d4202a841aaac9186c8772cfdac', '47a91cf250b8446c89cc98628adbcd31', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('90e5730164b845898feb23c091140ea0', '58606a643d29437c9afcd69e8dd6482e', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('144a2bc62c5845b0b17019dd59954ef9', '7acb6d48d51f47fc9f9491b1234c0428', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('1b7f1d4202a841aaac9186c8772cfdac', '9a749a3305844739a424feeb0962f0e9', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('0da142c0f8444c1a85f2d861db818055', '0e78d360879a4bd38b3fa9c492dd106a', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('1b7f1d4202a841aaac9186c8772cfdac', 'ce3009ef4f61445bb2ba1fe5a747e8be', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('1b7f1d4202a841aaac9186c8772cfdac', '832d3322479949d8a36da9458fa3bcbb', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('1b7f1d4202a841aaac9186c8772cfdac', '83ca67228517485fba1f73bffc17b8a6', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('daceeff8a97b46cb9573b93ba3a5a792', 'b32b96d0142d4fea8d5fd8a58011c0c2', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('daceeff8a97b46cb9573b93ba3a5a792', 'a87e7b2776214a76ba31151c6c5cbbe5', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('78fe48d6ab83452892dd10cd657d5f59', '475f84c0bc3f4702a1e3d76de7e84f35', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('78fe48d6ab83452892dd10cd657d5f59', '15f7e09d42124995bb44c18ce7b625de', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('78fe48d6ab83452892dd10cd657d5f59', '47a91cf250b8446c89cc98628adbcd31', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('e7542892ef424e809c3bb8cfa8c0051b', '42f7383e22bd468e9aeec2e58d8dea5f', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('78fe48d6ab83452892dd10cd657d5f59', '2f786a24ec574ed48368a9e633e07351', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('78fe48d6ab83452892dd10cd657d5f59', 'fb72be8cb70f40caacc63510afc9e8b3', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('78fe48d6ab83452892dd10cd657d5f59', '832d3322479949d8a36da9458fa3bcbb', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('78fe48d6ab83452892dd10cd657d5f59', '9a749a3305844739a424feeb0962f0e9', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('78fe48d6ab83452892dd10cd657d5f59', 'ce3009ef4f61445bb2ba1fe5a747e8be', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('78fe48d6ab83452892dd10cd657d5f59', '83ca67228517485fba1f73bffc17b8a6', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('78fe48d6ab83452892dd10cd657d5f59', '416f405ee4dc43d5b5c9f4bbbf6414ef', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('5611d1533d494a839c0be1e7a05da31f', '2277168fd5a046829fe3405d49802e8e', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('ec56a0a43b09429482632cb61f7c6908', '821a8ca012154ba2a4c451918c99cfc0', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('ec56a0a43b09429482632cb61f7c6908', '47a91cf250b8446c89cc98628adbcd31', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('ec56a0a43b09429482632cb61f7c6908', 'fa83267e5a984eb0804c042b8989bc57', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('ec56a0a43b09429482632cb61f7c6908', '1a5380116d7b4068b8b149359e461e0f', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('ec56a0a43b09429482632cb61f7c6908', '83a48b7e93e94da78f768246aae6c84f', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('3dbde33722154503a7d22ac60f6a0e4e', 'b091f4af3eba4c5c946af8dacaf951b9', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('3dbde33722154503a7d22ac60f6a0e4e', 'a87e7b2776214a76ba31151c6c5cbbe5', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('3dbde33722154503a7d22ac60f6a0e4e', '4b3512dec0204cd19b7c5fbdd75a97fa', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('3dbde33722154503a7d22ac60f6a0e4e', '634743c9057749748b82045ef69dd214', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('59a7fb9c459a4dd48d468f2add1d32b2', '58606a643d29437c9afcd69e8dd6482e', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('a3c94b4edf1e4e9d8665a81dc1c5f778', '47488be533b54ae99f0418ba3962e8b9', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('bf447212de284c79a0d73c658d0692b4', '3154d229a4244fda90903cb56f7da445', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('cd49aa1e1a724404a4dfb4f290e1ed62', '3154d229a4244fda90903cb56f7da445', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('72888507aba5484a8942e8dd0e6b6f7f', '5855e399c9074b899850bb25ce1aaf76', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('72888507aba5484a8942e8dd0e6b6f7f', '7acb6d48d51f47fc9f9491b1234c0428', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('72888507aba5484a8942e8dd0e6b6f7f', '22392a8d036a4ad390cb754effb8183e', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('72888507aba5484a8942e8dd0e6b6f7f', '0bd90473a1b64ae1ab705302bb6881fc', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('c578d9f8626d48f2971d7a18ac5281c5', '0e78d360879a4bd38b3fa9c492dd106a', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('73dd0eb461784dfe8bb7d18616a83a09', 'fe98234d9a0a4f2a9228743a58e86d54', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('73dd0eb461784dfe8bb7d18616a83a09', '90ef822f9e644448be5705a9994a263b', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('60554e93387146bb9c7357907ba093fa', 'fc810d0f2c9745da8ea370175ab3947a', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('60554e93387146bb9c7357907ba093fa', '40d60f8d1a7c440c821cb7813dcad84f', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('60554e93387146bb9c7357907ba093fa', '00c38936f3224585948b2f4076856748', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('60554e93387146bb9c7357907ba093fa', '2a6fc98ead7e4606a565943e2b6cdcb7', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('60554e93387146bb9c7357907ba093fa', '1a5380116d7b4068b8b149359e461e0f', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('60554e93387146bb9c7357907ba093fa', '83a48b7e93e94da78f768246aae6c84f', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('60554e93387146bb9c7357907ba093fa', 'fa83267e5a984eb0804c042b8989bc57', '0');
INSERT INTO taresourceurl (resourceid, urlid, authoritypolicy) VALUES ('823c2134cae14d029f7db31e42b3451f', '253c2eae3e0046c2ba4f53f4ffa89ba3', '0');



--  ????????????????????????????????????
INSERT INTO tacustomorgtypename (customorgtypenameid, customorgtypename, effective, createuser, createtime, updatetime, destory, customorgtypenamecode, customorgtypenamedesc)VALUES ('baa315851d3c4a90a47889672404505d', '????????????', '1', '1', now(), now(), '0', 'SBZZ', '????????????????????????');


-- ??????????????????
UPDATE taresource SET icon='setting' WHERE resourceid = '0415d44401b24605a21b589b6aaa349e';
UPDATE taresource SET icon='layout' WHERE resourceid = '0aac95c1e73947bea41be639cc4e9036';
UPDATE taresource SET icon='setting' WHERE resourceid = '1d4e283ad5584e02811f6b188d3592bc';
UPDATE taresource SET icon='cluster' WHERE resourceid = '1e706f26bc144c1da12022359c238053';
UPDATE taresource SET icon='hdd' WHERE resourceid = '322e200d71544e3986d2f374e3506805';
UPDATE taresource SET icon='deployment-unit' WHERE resourceid = '3dbde33722154503a7d22ac60f6a0e4e';
UPDATE taresource SET icon='tags' WHERE resourceid = '3df588fc565d4287b3cefcd00a39cd91';
UPDATE taresource SET icon='exception' WHERE resourceid = '43f468b40c6c4c76a3a2fe4be903f4c7';
UPDATE taresource SET icon='usergroup-add' WHERE resourceid = '48afedddc8f04c668b3c1572c30a7745';
UPDATE taresource SET icon='gold' WHERE resourceid = '4b2eee0d7ded4e8094d4acf439fd3a1c';
UPDATE taresource SET icon='global' WHERE resourceid = '5611d1533d494a839c0be1e7a05da31f';
UPDATE taresource SET icon='api' WHERE resourceid = '59a7fb9c459a4dd48d468f2add1d32b2';
UPDATE taresource SET icon='block' WHERE resourceid = '5e67c7acef914c349d8aff076921f6b5';
UPDATE taresource SET icon='block' WHERE resourceid = '60554e93387146bb9c7357907ba093fa';
UPDATE taresource SET icon='form' WHERE resourceid = '722e1cc774a14178a488eb42ef4099de';
UPDATE taresource SET icon='form' WHERE resourceid = '72888507aba5484a8942e8dd0e6b6f7f';
UPDATE taresource SET icon='align-left' WHERE resourceid = '7459c1b525934151a1d309a304933644';
UPDATE taresource SET icon='safety-certificate' WHERE resourceid = '78ad02fdb879406ebc5e7a4faf8f5905';
UPDATE taresource SET icon='laptop' WHERE resourceid = '7b7f9cd1675a4b54b05c7c7cf0a7ac63';
UPDATE taresource SET icon='file-sync' WHERE resourceid = '7c1dabd160974d8f90858c187cefa128';
UPDATE taresource SET icon='snippets' WHERE resourceid = '823c2134cae14d029f7db31e42b3451f';
UPDATE taresource SET icon='team' WHERE resourceid = '877e407281dd48acb05a77fcb922bc73';
UPDATE taresource SET icon='safety' WHERE resourceid = '8aa86ed4c7f84183935a262db4a605d3';
UPDATE taresource SET icon='idcard' WHERE resourceid = '95bb9b749bf54e4692b0b1f14fd1b5ab';
UPDATE taresource SET icon='database' WHERE resourceid = 'a3c94b4edf1e4e9d8665a81dc1c5f778';
UPDATE taresource SET icon='user' WHERE resourceid = 'bd9d0bba145c458e841aa9da0aeeb1d8';
UPDATE taresource SET icon='compass' WHERE resourceid = 'bf447212de284c79a0d73c658d0692b4';
UPDATE taresource SET icon='copyright' WHERE resourceid = 'c2745b7cae7846acb9bcf8d0f4e836e8';
UPDATE taresource SET icon='clock-circle' WHERE resourceid = 'c578d9f8626d48f2971d7a18ac5281c5';
UPDATE taresource SET icon='tool' WHERE resourceid = 'cd49aa1e1a724404a4dfb4f290e1ed62';
UPDATE taresource SET icon='user' WHERE resourceid = 'daceeff8a97b46cb9573b93ba3a5a792';
UPDATE taresource SET icon='compass' WHERE resourceid = 'ec56a0a43b09429482632cb61f7c6908';
UPDATE taresource SET icon='gold' WHERE resourceid = 'fb8637c2e52e4b05bd2c07d742141ee7';
UPDATE taresource SET icon='form' WHERE resourceid = 'fe8be18859b5478d8b76a7653f02e5eb';
UPDATE taresource SET icon='book' WHERE resourceid = 'ffa74f43e853441dac0ee90c787cb2e6';
