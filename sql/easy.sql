create table common_nation (
	id bigint(20) primary key,
	nation_key varchar(32) not null,
	nation_value varchar(20) not null,
	create_at timestamp not null default current_timestamp,
	deleted bit(1) default 0,
	version int(11) default 1
)

insert into common_nation select id,`key`,value,create_at,deleted,version from common_map_entry where map=1503042335400400010;
insert into common_map_entry select null,1503042335400400009,nation_key,nation_value,'default','default','default' from common_nation;

--MySQL关键字冲突用`key`代替key

alter table common_map_entry add constraint foreign key (map) references common_map(id);
alter table common_map modify id bigint(20) auto_increment;

insert into common_map value(null,'sexMap',default,default,default);--性别
insert into common_map value(null,'educationMap',default,default,default);--教育程度
insert into common_map value(null,'checkStatusMap',default,default,default);--审核状态
insert into common_map value(null,'rentalModeMap',default,default,default);--租住方式
insert into common_map value(null,'propertyTypeMap',default,default,default);--产权类型
insert into common_map value(null,'houseTypeMap',default,default,default);--房屋类型
insert into common_map value(null,'houseDirectionMap',default,default,default);--房屋朝向
insert into common_map value(null,'houseUseMap',default,default,default);--房屋用途
insert into common_map value(null,'CollectionerSourceMap',default,default,default);--采集人来源
insert into common_map value(null,'leaseTypeMap',default,default,default);--租赁类型
insert into common_map value(null,'payWaysMap',default,default,default);--支付方式
insert into common_map value(null,'WEGpayMap',default,default,default);--水电气缴费
insert into common_map value(null,'bankMap',default,default,default);--结算银行
insert into common_map value(null,'nationMap',default,default,default);--民族
insert into common_map value(null,'renovationPlanMap',default,default,default);--装修方案
insert into common_map value(null,'renovationLayoutMap',default,default,default);--装修户型
insert into common_map value(null,'houseFurnitureMap',default,default,default);--房屋配套
insert into common_map value(null,'contractStatusMap',default,default,default);--合同状态
insert into common_map value(null,'systemUserStatusMap',default,default,default);--系统用户状态
insert into common_map value(null,'systemRoleStatusMap',default,default,default);--系统角色状态
insert into common_map value(null,'houseLeaseStatusMap',default,default,default);--房屋租赁状态

-------- -----------------------
insert into common_map_entry value(null,1503042335400400001,'M','男',default,default,default);
insert into common_map_entry value(null,1503042335400400001,'F','女',default,default,default);

insert into common_map_entry value(null,1503042335400400002,'1','高中及以下',default,default,default);
insert into common_map_entry value(null,1503042335400400002,'2','大专',default,default,default);
insert into common_map_entry value(null,1503042335400400002,'3','本科',default,default,default);
insert into common_map_entry value(null,1503042335400400002,'4','硕士',default,default,default);
insert into common_map_entry value(null,1503042335400400002,'5','博士及以上',default,default,default);

insert into common_map_entry value(null,1503042335400400003,'-1','待审核',default,default,default);
insert into common_map_entry value(null,1503042335400400003,'0','未通过',default,default,default);
insert into common_map_entry value(null,1503042335400400003,'1','已通过',default,default,default);

insert into common_map_entry value(null,1503042335400400004,'Single','单人租住',default,default,default);
insert into common_map_entry value(null,1503042335400400004,'Shared','与人合租',default,default,default);

insert into common_map_entry value(null,1503042335400400005,'Personal','个人独有',default,default,default);
insert into common_map_entry value(null,1503042335400400005,'Shared','夫妻共有',default,default,default);

insert into common_map_entry value(null,1503042335400400006,'Day','按天租住',default,default,default);
insert into common_map_entry value(null,1503042335400400006,'Month','按月租住',default,default,default);
insert into common_map_entry value(null,1503042335400400006,'Season','按季租住',default,default,default);
insert into common_map_entry value(null,1503042335400400006,'Year','按年租住',default,default,default);

insert into common_map_entry value(null,1503042335400400007,'Day','按天缴费',default,default,default);
insert into common_map_entry value(null,1503042335400400007,'Month','按月缴费',default,default,default);
insert into common_map_entry value(null,1503042335400400007,'Season','按季缴费',default,default,default);
insert into common_map_entry value(null,1503042335400400007,'Year','按年缴费',default,default,default);

insert into common_map_entry value(null,1503042335400400008,'ZGYH','中国银行',default,default,default);
insert into common_map_entry value(null,1503042335400400008,'ZGNYYH','中国农业银行',default,default,default);
insert into common_map_entry value(null,1503042335400400008,'ZGGSYH','中国工商银行',default,default,default);
insert into common_map_entry value(null,1503042335400400008,'ZGJSYH','中国建设银行',default,default,default);

insert into common_map_entry value(null,1503042335400400010,'A','A方案',default,default,default);
insert into common_map_entry value(null,1503042335400400010,'B','B方案',default,default,default);
insert into common_map_entry value(null,1503042335400400010,'C','C方案',default,default,default);
insert into common_map_entry value(null,1503042335400400010,'D','D方案',default,default,default);
insert into common_map_entry value(null,1503042335400400010,'E','E方案',default,default,default);

insert into common_map_entry value(null,1503042335400400011,'One','大一居',default,default,default);
insert into common_map_entry value(null,1503042335400400011,'Three','三居室',default,default,default);
insert into common_map_entry value(null,1503042335400400011,'Four','四居室',default,default,default);
insert into common_map_entry value(null,1503042335400400011,'All','公司整装',default,default,default);

insert into common_map_entry value(null,1503042335400400012,'Bed','床',default,default,default);
insert into common_map_entry value(null,1503042335400400012,'The wardrobe','衣柜',default,default,default);
insert into common_map_entry value(null,1503042335400400012,'Air-conditioning','空调',default,default,default);
insert into common_map_entry value(null,1503042335400400012,'Chair','椅子',default,default,default);
insert into common_map_entry value(null,1503042335400400012,'Bedside cupboard','床头柜',default,default,default);
insert into common_map_entry value(null,1503042335400400012,'Key','钥匙',default,default,default);
insert into common_map_entry value(null,1503042335400400012,'Access control','门禁',default,default,default);

insert into common_map_entry value(null,1503042335400400013,'Two-One','两室一厅',default,default,default);
insert into common_map_entry value(null,1503042335400400013,'Three-One','三室一厅',default,default,default);
insert into common_map_entry value(null,1503042335400400013,'Four-One','四室一厅',default,default,default);

insert into common_map_entry value(null,1503042335400400014,'E','朝东',default,default,default);
insert into common_map_entry value(null,1503042335400400014,'W','朝西',default,default,default);
insert into common_map_entry value(null,1503042335400400014,'S','朝南',default,default,default);
insert into common_map_entry value(null,1503042335400400014,'N','朝北',default,default,default);

insert into common_map_entry value(null,1503042335400400015,'H','房屋出租',default,default,default);
insert into common_map_entry value(null,1503042335400400015,'P','个人整租',default,default,default);
insert into common_map_entry value(null,1503042335400400015,'C','企业整租',default,default,default);

insert into common_map_entry value(null,1503042335400400016,'E','公司员工',default,default,default);
insert into common_map_entry value(null,1503042335400400016,'F','自由个人',default,default,default);
insert into common_map_entry value(null,1503042335400400016,'C','合作机构',default,default,default);

insert into common_map_entry value(null,1503042335400400017,'Single','单项结算',default,default,default);
insert into common_map_entry value(null,1503042335400400017,'Monthly','包月使用',default,default,default);

insert into common_map_entry value(null,1503042335400400018,'All','全部',default,default,default);
insert into common_map_entry value(null,1503042335400400018,'Normal','正常',default,default,default);
insert into common_map_entry value(null,1503042335400400018,'Pause','暂停',default,default,default);
insert into common_map_entry value(null,1503042335400400018,'End','终止',default,default,default);

insert into common_map_entry value(null,1503042335400400019,'OK','正常',default,default,default);
insert into common_map_entry value(null,1503042335400400019,'NO','禁用',default,default,default);

insert into common_map_entry value(null,1503042335400400020,'OK','正常',default,default,default);
insert into common_map_entry value(null,1503042335400400020,'NO','禁用',default,default,default);

insert into common_map_entry value(null,1503042335400400021,'OK','待租赁',default,default,default);
insert into common_map_entry value(null,1503042335400400021,'NO','已租赁',default,default,default);













