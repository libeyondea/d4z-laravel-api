create table slide
(
	slide_id					bigint(20)			unsigned not null,
	slide_title					varchar(66)		    not null,
    slide_image					varchar(66)			not null,
	slide_content				varchar(666)		not null,
	slide_created_at			timestamp			null default current_timestamp,
	slide_updated_at			timestamp			null default current_timestamp on update current_timestamp
);

create table role
(
	role_id						bigint(20)			unsigned not null,
	role_title					varchar(66)			not null,
    role_slug					varchar(66)			not null,
	role_content				varchar(666)		not null,
	role_created_at				timestamp			null default current_timestamp,
	role_updated_at				timestamp			null default current_timestamp on update current_timestamp
);

create table permission
(
	perm_id						bigint(20)			unsigned not null,
	perm_title					varchar(66)			not null,
    perm_slug					varchar(66)			not null,
	perm_content				varchar(666)		not null,
    active                      bit(1)              not null,
	perm_created_at				timestamp			null default current_timestamp,
	perm_updated_at				timestamp			null default current_timestamp on update current_timestamp
);

create table role_permission
(
	role_id						bigint(20)			unsigned not null,
    perm_id						bigint(20)			unsigned not null,
	r_p_created_at				timestamp			null default current_timestamp,
	r_p_updated_at				timestamp			null default current_timestamp on update current_timestamp
);

create table user
(
    user_id						bigint(20)			unsigned not null,
	role_id						bigint(20)			unsigned not null,
	user_first_name				varchar(66)			not null,
	user_last_name				varchar(66)			not null,
	user_name					varchar(66)			not null,
	user_email					varchar(66)			not null,
	user_email_verified_at		timestamp 			null default null,
	user_password				varchar(666)		not null,
	user_remember_token			varchar(666)		default null,
    user_auth_token		        varchar(666)		default null,
	user_phone					varchar(66)			default null,
	user_nation					varchar(66)			not null,
	user_address				varchar(666)		default null,
    user_gender				    bit(1)		        default null,
	user_created_at			    timestamp			null default current_timestamp,
	user_updated_at			    timestamp			null default current_timestamp on update current_timestamp
);

create table post
(
	post_id						bigint(20)			unsigned not null,
	user_id					    bigint(20)			unsigned not null,
    post_parent_id              bigint(20)			unsigned default null,
	post_title					varchar(666)		not null,
    post_meta_title				varchar(666)		not null,
    post_meta_desc				varchar(666)		not null,
    post_slug                   varchar(66)		    not null,
	post_summary				varchar(666)		not null,
    post_image					varchar(66)			not null,
    post_content				text				not null,
    post_published              bit(1)              not null,
    post_published_at           datetime			not null,
	post_created_at			    timestamp			null default current_timestamp,
	post_updated_at			    timestamp			null default current_timestamp on update current_timestamp
);

create table comment
(
	comm_id						bigint(20)			unsigned not null,
    post_id						bigint(20)			unsigned not null,
    comm_parent_id				bigint(20)			unsigned default null,
    comm_content			    text				not null,
    comm_published              bit(1)              not null,
    comm_published_at           datetime			not null,
	comm_created_at			    timestamp			null default current_timestamp,
	comm_updated_at			    timestamp			null default current_timestamp on update current_timestamp
);

create table tag
(
	tag_id						bigint(20)			unsigned not null,
	tag_title					varchar(666)		not null,
    tag_meta_title				varchar(666)		default null,
    tag_meta_desc				varchar(666)		default null,
    tag_slug                    varchar(66)		    not null,
    tag_summary				    varchar(666)		default null,
    tag_content				    text				default null,
	tag_created_at			    timestamp			null default current_timestamp,
	tag_updated_at			    timestamp			null default current_timestamp on update current_timestamp
);

create table post_tag
(
    post_id						bigint(20)			unsigned not null,
    tag_id						bigint(20)			unsigned not null,
	p_t_created_at			    timestamp			null default current_timestamp,
	p_t_updated_at			    timestamp			null default current_timestamp on update current_timestamp
);

create table category
(
	cate_id						bigint(20)			unsigned not null,
    cate_parent_id				bigint(20)			unsigned default null,
	cate_title					varchar(66)			not null,
    cate_meta_title				varchar(666)		default null,
    cate_meta_desc				varchar(666)		default null,
    cate_slug					varchar(66)			not null,
    cate_summary			    varchar(666)		default null,
	cate_content				text		        default null,
	cate_created_at			    timestamp			null default current_timestamp,
	cate_updated_at			    timestamp			null default current_timestamp on update current_timestamp
);

create table post_category
(
	post_id						bigint(20)			unsigned not null,
    cate_id				        bigint(20)			unsigned not null,
	cate_created_at			    timestamp			null default current_timestamp,
	cate_updated_at			    timestamp			null default current_timestamp on update current_timestamp
);

alter table slide
	add constraint pk_slide primary key (slide_id);

alter table role
	add constraint pk_role primary key (role_id),
    add unique index uq_role_slug (role_slug ASC);

alter table permission
	add constraint pk_permission primary key (perm_id),
    add unique index uq_perm_slug (perm_slug ASC);

alter table role_permission
	add constraint pk_permission primary key (role_id, perm_id),
    add index idx_r_p_role (role_id ASC),
    add index idx_r_p_permission (perm_id ASC);

alter table user
	add constraint pk_user primary key (user_id),
    add index idx_role_id (role_id ASC),
    add unique index uq_user_name (user_name ASC),
    add unique index uq_user_email (user_email ASC);

alter table post
	add constraint pk_post primary key (post_id),
    add unique index uq_post_slug (post_slug ASC),
    add index idx_post_user (user_id ASC),
    add index idx_post_parent (post_parent_id ASC);

alter table comment
	add constraint pk_comment primary key (comm_id);

alter table tag
	add constraint pk_tag primary key (tag_id);

alter table post_tag
	add constraint pk_post_tag primary key (post_id, tag_id);

alter table category
	add constraint pk_category primary key (cate_id);

alter table post_category
	add constraint pk_post_category primary key (post_id, cate_id);


alter table slide
	modify column slide_id bigint(20) unsigned not null auto_increment;

alter table role
	modify column role_id bigint(20) unsigned not null auto_increment;

alter table permission
	modify column perm_id bigint(20) unsigned not null auto_increment;

alter table user
	modify column user_id bigint(20) unsigned not null auto_increment;

alter table post
	modify column post_id bigint(20) unsigned not null auto_increment;

alter table comment
	modify column comm_id bigint(20) unsigned not null auto_increment;

alter table tag
	modify column tag_id bigint(20) unsigned not null auto_increment;

alter table category
	modify column cate_id bigint(20) unsigned not null auto_increment;




alter table role_permission
	add constraint fk_r_p_role foreign key (role_id) references role (role_id),
    add constraint fk_r_p_permission foreign key (perm_id) references permission (perm_id);

alter table user
	add constraint fk_user_role foreign key (role_id) references role (role_id);

alter table post
	add constraint fk_post_user foreign key (user_id) references user (user_id),
    add constraint fk_post_parent foreign key (post_parent_id) references post (post_id);

alter table comment
	add constraint fk_comment_post foreign key (post_id) references post (post_id),
    add constraint fk_comment_parent foreign key (comm_parent_id) references comment (comm_id);

alter table post_tag
	add constraint fk_p_t_post foreign key (post_id) references post (post_id),
    add constraint fk_p_t_tag foreign key (tag_id) references tag (tag_id);

alter table category
	add constraint fk_category_parent foreign key (cate_parent_id) references category (cate_id);

alter table post_category
	add constraint fk_p_c_post foreign key (post_id) references post (post_id),
    add constraint fk_p_c_cate foreign key (cate_id) references category (cate_id);
