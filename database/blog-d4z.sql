create table slide
(
	id					bigint(20)			unsigned not null,
	title				varchar(66)		    not null,
    image				varchar(66)			not null,
	description			varchar(666)		not null,
	created_at			timestamp			null default current_timestamp,
	updated_at			timestamp			null default current_timestamp on update current_timestamp
);

create table role
(
	id						bigint(20)			unsigned not null,
	title					varchar(66)			not null,
    slug					varchar(66)			not null,
	description             varchar(666)		not null,
    active                  tinyint(1)          not null,
	created_at				timestamp			null default current_timestamp,
	updated_at				timestamp			null default current_timestamp on update current_timestamp
);

create table permission
(
	id						bigint(20)			unsigned not null,
	title					varchar(66)			not null,
    slug					varchar(66)			not null,
	description             varchar(666)		not null,
    active                  tinyint(1)          not null,
	created_at				timestamp			null default current_timestamp,
	updated_at				timestamp			null default current_timestamp on update current_timestamp
);

create table role_permission
(
	role_id					bigint(20)			unsigned not null,
    permission_id			bigint(20)			unsigned not null,
	created_at              timestamp			null default current_timestamp,
	updated_at              timestamp			null default current_timestamp on update current_timestamp
);

create table user
(
    id						bigint(20)			unsigned not null,
	role_id					bigint(20)			unsigned not null,
	first_name				varchar(66)			not null,
	last_name				varchar(66)			not null,
	user_name				varchar(66)			not null,
	email					varchar(66)			not null,
	email_verified_at		timestamp 			null default null,
	password				varchar(666)		not null,
	remember_token			varchar(666)		default null,
    auth_token		        varchar(666)		default null,
	phone					varchar(66)			default null,
	address				    varchar(666)		default null,
    gender				    tinyint(1)          default null,
	created_at			    timestamp			null default current_timestamp,
	updated_at			    timestamp			null default current_timestamp on update current_timestamp
);

create table post
(
	id						bigint(20)			unsigned not null,
	user_id					bigint(20)			unsigned not null,
    parent_id               bigint(20)			unsigned default null,
	title					varchar(666)		not null,
    meta_title				varchar(666)		not null,
    meta_description		varchar(666)		not null,
    slug                    varchar(66)		    not null,
	summary				    varchar(666)		not null,
    image					varchar(66)			not null,
    content				    text				not null,
    published               tinyint(1)          default null,
    published_at            datetime			not null,
	created_at			    timestamp			null default current_timestamp,
	updated_at			    timestamp			null default current_timestamp on update current_timestamp
);

create table comment
(
	id						bigint(20)			unsigned not null,
    post_id					bigint(20)			unsigned not null,
    parent_id				bigint(20)			unsigned default null,
    content			        text				not null,
    published               tinyint(1)          not null,
    published_at            datetime			not null,
	created_at			    timestamp			null default current_timestamp,
	updated_at			    timestamp			null default current_timestamp on update current_timestamp
);

create table tag
(
	id						bigint(20)			unsigned not null,
	title					varchar(666)		not null,
    meta_title				varchar(666)		default null,
    meta_description        varchar(666)		default null,
    slug                    varchar(66)		    not null,
    summary				    varchar(666)		default null,
    content				    text				default null,
	created_at			    timestamp			null default current_timestamp,
	updated_at			    timestamp			null default current_timestamp on update current_timestamp
);

create table post_tag
(
    post_id					bigint(20)			unsigned not null,
    tag_id					bigint(20)			unsigned not null,
	created_at			    timestamp			null default current_timestamp,
	updated_at			    timestamp			null default current_timestamp on update current_timestamp
);

create table category
(
	id						bigint(20)			unsigned not null,
    parent_id				bigint(20)			unsigned default null,
	title					varchar(66)			not null,
    meta_title				varchar(666)		default null,
    meta_description        varchar(666)		default null,
    slug					varchar(66)			not null,
    summary			        varchar(666)		default null,
	content				    text		        default null,
	created_at			    timestamp			null default current_timestamp,
	updated_at			    timestamp			null default current_timestamp on update current_timestamp
);

create table post_category
(
	post_id					bigint(20)			unsigned not null,
    category_id             bigint(20)			unsigned not null,
	created_at			    timestamp			null default current_timestamp,
	updated_at			    timestamp			null default current_timestamp on update current_timestamp
);

alter table slide
	add constraint pk_slide primary key (id);

alter table role
	add constraint pk_role primary key (id),
    add unique index unq_role_slug (slug);

alter table permission
	add constraint pk_permission primary key (id),
    add unique index unq_permission_slug (slug);

alter table role_permission
	add constraint pk_permission primary key (role_id, permission_id),
    add index idx_r_p_role_id (role_id),
    add index idx_r_p_permission_id (permission_id);

alter table user
	add constraint pk_user primary key (id),
    add index idx_role_id (role_id),
    add unique index unq_u_user_name (user_name),
    add unique index unq_u_email (email);

alter table post
	add constraint pk_post primary key (id),
    add unique index unq_post_slug (slug),
    add index idx_post_user_id (user_id),
    add index idx_post_parent_id (parent_id);

alter table comment
	add constraint pk_comment primary key (id),
	add index idx_comment_post_id (post_id),
	add index idx_comment_parent_id (parent_id);

alter table tag
	add constraint pk_tag primary key (id),
	add unique index unq_tag_slug (slug);

alter table post_tag
	add constraint pk_post_tag primary key (post_id, tag_id),
	add index idx_p_t_post_id (post_id),
    add index idx_p_t_tag_id (tag_id);

alter table category
	add constraint pk_category primary key (id),
	add unique index unq_category_slug (slug),
	add index idx_category_parent_id (parent_id);

alter table post_category
	add constraint pk_post_category primary key (post_id, category_id),
	add index idx_p_c_post_id (post_id),
    add index idx_p_c_category_id (category_id);


alter table slide
	modify column id bigint(20) unsigned not null auto_increment;

alter table role
	modify column id bigint(20) unsigned not null auto_increment;

alter table permission
	modify column id bigint(20) unsigned not null auto_increment;

alter table user
	modify column id bigint(20) unsigned not null auto_increment;

alter table post
	modify column id bigint(20) unsigned not null auto_increment;

alter table comment
	modify column id bigint(20) unsigned not null auto_increment;

alter table tag
	modify column id bigint(20) unsigned not null auto_increment;

alter table category
	modify column id bigint(20) unsigned not null auto_increment;


alter table role_permission
	add constraint fk_r_p_role foreign key (role_id) references role (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    add constraint fk_r_p_permission foreign key (permission_id) references permission (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

alter table user
	add constraint fk_user_role foreign key (role_id) references role (id);

alter table post
	add constraint fk_post_user foreign key (user_id) references user (id),
    add constraint fk_post_parent foreign key (parent_id) references post (id);

alter table comment
	add constraint fk_comment_post foreign key (post_id) references post (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    add constraint fk_comment_parent foreign key (parent_id) references comment (id);

alter table post_tag
	add constraint fk_p_t_post foreign key (post_id) references post (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    add constraint fk_p_t_tag foreign key (tag_id) references tag (id) ON DELETE NO ACTION ON UPDATE NO ACTION;

alter table category
	add constraint fk_category_parent foreign key (parent_id) references category (id);

alter table post_category
	add constraint fk_p_c_post foreign key (post_id) references post (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
    add constraint fk_p_c_category foreign key (category_id) references category (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
