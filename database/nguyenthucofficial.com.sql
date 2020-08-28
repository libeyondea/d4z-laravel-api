create table slide
(
	slide_id					bigint(20)			unsigned not null,
	slide_title					varchar(666)		not null,
    slide_image					varchar(66)			not null,
	slide_content				varchar(666)		not null,
	slide_created_at			timestamp			null default current_timestamp,
	slide_updated_at			timestamp			null default current_timestamp on update current_timestamp
);

create table role_admin
(
	r_a_id						bigint(20)			unsigned not null,
	r_a_name					varchar(66)			not null,
	r_a_content					varchar(666)		not null,
	r_a_created_at				timestamp			null default current_timestamp,
	r_a_updated_at				timestamp			null default current_timestamp on update current_timestamp
);

create table role_user
(
	r_u_id						bigint(20)			unsigned not null,
	r_u_name					varchar(66)			not null,
	r_u_content					varchar(666)		not null,
	r_u_created_at				timestamp			null default current_timestamp,
	r_u_updated_at				timestamp			null default current_timestamp on update current_timestamp
);

create table admin
(
	admin_id					bigint(20)			unsigned not null,
	r_a_id						bigint(20)			unsigned not null,
	admin_first_name			varchar(66)			not null,
	admin_last_name				varchar(66)			not null,
	admin_name				    varchar(66)			not null unique,
	admin_email					varchar(66)			not null unique,
	admin_email_verified_at		timestamp 			null default null,
	admin_password				varchar(66)			not null,
	admin_remember_token		varchar(666)		default null,
    admin_auth_token		    varchar(666)		default null,
	admin_created_at			timestamp			null default current_timestamp,
	admin_updated_at			timestamp			null default current_timestamp on update current_timestamp
);

create table user
(
    user_id						bigint(20)			unsigned not null,
	r_u_id						bigint(20)			unsigned not null,
	user_first_name				varchar(66)			not null,
	user_last_name				varchar(66)			not null,
	user_name					varchar(66)			not null unique,
	user_email					varchar(66)			not null unique,
	user_email_verified_at		timestamp 			null default null,
	user_password				varchar(66)			not null,
	user_remember_token			varchar(666)		default null,
    user_auth_token		        varchar(666)		default null,
	user_phone					varchar(66)			default null,
	user_nation					varchar(66)			not null,
	user_address				varchar(666)		default null,
    user_gender				    bit(1)		        default null,
	user_date_of_birth			date				default null,
	user_created_at			    timestamp			null default current_timestamp,
	user_updated_at			    timestamp			null default current_timestamp on update current_timestamp
);

create table admin_login_history
(
	a_l_h_id 					bigint(20) 			unsigned not null,
	admin_id 					bigint(20) 			unsigned not null,
	a_l_h_ip 					varchar(66)  		not null,
	a_l_h_login_time 			timestamp 			null default current_timestamp,
	a_l_h_logout_time			timestamp  			on update current_timestamp,
	a_l_h_status 				bit(1)				not null,
	a_l_h_created_at			timestamp			null default current_timestamp,
	a_l_h_updated_at			timestamp			null default current_timestamp on update current_timestamp
);

create table user_login_history
(
	u_l_h_id 					bigint(20) 			unsigned not null,
	user_id 					bigint(20) 			unsigned not null,
	u_l_h_ip 					varchar(66)  		not null,
	u_l_h_login_time 			timestamp 			null default current_timestamp,
	u_l_h_logout_time			timestamp  			on update current_timestamp,
	u_l_h_status 				bit(1) 				not null,
	u_l_h_created_at			timestamp			null default current_timestamp,
	u_l_h_updated_at			timestamp			null default current_timestamp on update current_timestamp
);

create table password_resets
(
    email 						varchar(666) 		not null,
    token 						varchar(666) 		not null,
    created_at 				    timestamp 			null default current_timestamp,
    updated_at 				    timestamp 			null default current_timestamp on update current_timestamp
);

create table post
(
	post_id						bigint(20)			unsigned not null,
	user_id					    bigint(20)			unsigned not null,
	post_title					varchar(666)		not null,
    post_meta_title				varchar(666)		not null,
    post_meta_desc				varchar(666)		not null,
    post_slug                   varchar(66)		    not null,
	post_summary				varchar(666)		not null,
    post_image					varchar(66)			not null,
    post_content				text				not null,
	post_created_at			    timestamp			null default current_timestamp,
	post_updated_at			    timestamp			null default current_timestamp on update current_timestamp
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
	cate_title					varchar(66)			not null,
    cate_meta_title				varchar(666)		default null,
    cate_meta_desc				varchar(666)		default null,
    cate_slug					varchar(66)			not null,
    cate_summary			    varchar(666)		default null,
	cate_content				text		        default null,
	cate_created_at			    timestamp			null default current_timestamp,
	cate_updated_at			    timestamp			null default current_timestamp on update current_timestamp
);

create table subcategory
(
	subcate_id					bigint(20)			unsigned not null,
	cate_id 					bigint(20)			unsigned not null,
	subcate_title				varchar(66)			not null,
    subcate_meta_title			varchar(666)		default null,
    subcate_meta_desc			varchar(666)		default null,
    subcate_slug				varchar(66)			not null,
    subcate_summary			    varchar(666)		default null,
	subcate_content				text		        default null,
	subcate_created_at		    timestamp			null default current_timestamp,
	subcate_updated_at		    timestamp			null default current_timestamp on update current_timestamp
);

create table brand
(
	brand_id					bigint(20)			unsigned not null,
	brand_title					varchar(666)		not null,
    brand_meta_title			varchar(666)		default null,
    brand_meta_desc			    varchar(666)		default null,
    brand_slug					varchar(66)			not null,
    brand_summary			    varchar(666)		default null,
	brand_content				text		        default null,
	brand_created_at			timestamp			null default current_timestamp,
	brand_updated_at			timestamp			null default current_timestamp on update current_timestamp
);

create table unit
(
	unit_id						bigint(20)			unsigned not null,
	unit_name					varchar(666)		not null,
	unit_content				varchar(666)		default null,
	unit_created_at				timestamp			null default current_timestamp,
	unit_updated_at				timestamp			null default current_timestamp on update current_timestamp
);

create table product
(
	prod_id						bigint(20)			unsigned not null,
	subcate_id					bigint(20)			unsigned not null,
	brand_id					bigint(20)			unsigned not null,
	unit_id 					bigint(20)			unsigned not null,
    prod_title					varchar(666)		not null,
	prod_meta_title			    varchar(666)		default null,
    prod_meta_desc			    varchar(666)		default null,
    prod_slug					varchar(66)			not null,
    prod_summary			    varchar(666)		default null,
	prod_content				text		        default null,
	prod_image					varchar(66)			not null,
	prod_availability			bit(1)				not null,
	prod_quantity				bigint(20)			not null check (prod_quantity >= 0),
	prod_created_at			    timestamp			null default current_timestamp,
	prod_updated_at			    timestamp			null default current_timestamp on update current_timestamp
);

create table product_price
(
	p_p_id 						bigint(20) 			unsigned not null,
	prod_id						bigint(20) 			unsigned not null,
	p_p_price					decimal(18,0)		not null check (p_p_price >= 0),
	p_p_sale_price				decimal(18,0)		default null check (p_p_sale_price >= 0),
	p_p_created_at				timestamp			null default current_timestamp,
	p_p_updated_at				timestamp			null default current_timestamp on update current_timestamp
);

create table product_image
(
	p_i_id 						bigint(20) 			unsigned not null,
	prod_id						bigint(20) 			unsigned not null,
	p_i_name					varchar(66)			not null,
	p_i_created_at			    timestamp			null default current_timestamp,
	p_i_updated_at			    timestamp			null default current_timestamp on update current_timestamp
);

create table product_review
(
	p_r_id 						bigint(20) 			unsigned not null,
	user_id						bigint(20) 			unsigned not null,
	prod_id						bigint(20) 			unsigned not null,
	p_r_star					int(1)				not null check (1 <= p_r_star <= 5),
	p_r_content					varchar(666)		not null,
	p_r_created_at				timestamp			null default current_timestamp,
	p_r_updated_at				timestamp			null default current_timestamp on update current_timestamp
);

create table cart
(
	cart_id						bigint(20)			unsigned not null,
	user_id						bigint(20)			unsigned not null unique,
	cart_created_at				timestamp			null default current_timestamp,
	cart_updated_at	 			timestamp			null default current_timestamp on update current_timestamp
);

create table product_cart
(
	cart_id						bigint(20)			unsigned not null,
	prod_id						bigint(20)			unsigned not null,
	p_c_quantity				bigint(20)			not null,
	p_c_price					decimal(18,0)		not null check (p_c_price >= 0),
	p_c_created_at				timestamp			null default current_timestamp,
	p_c_updated_at				timestamp			null default current_timestamp on update current_timestamp
);

create table favorite
(
	favo_id						bigint(20) 			unsigned not null,
	user_id 					bigint(20) 			unsigned not null unique,
	favo_created_at				timestamp			not null default current_timestamp,
	favo_updated_at				timestamp			not null default current_timestamp on update current_timestamp
);

create table product_favorite
(
	favo_id						bigint(20) 			unsigned not null,
	prod_id 					bigint(20) 			unsigned not null,
	f_p_created_at				timestamp			null default current_timestamp,
	f_p_updated_at	 			timestamp			null default current_timestamp on update current_timestamp
);

create table bill_status
(
	b_s_id 						bigint(20)			unsigned not null,
	b_s_name 					varchar(66) 		not null,
	b_s_content					varchar(666)		default null,
	b_s_created_at				timestamp			null default current_timestamp,
	b_s_updated_at				timestamp			null default current_timestamp on update current_timestamp
);

create table payment_type
(
	p_t_id 						bigint(20)			unsigned not null,
	p_t_name 					varchar(66) 		not null,
	p_t_content					varchar(666)		default null,
	p_t_created_at				timestamp			null default current_timestamp,
	p_t_updated_at				timestamp			null default current_timestamp on update current_timestamp
);

create table bill
(
	bill_id						bigint(20)			unsigned not null,
	user_id						bigint(20)			unsigned not null,
	b_s_id 						bigint(20)			unsigned not null,
	p_t_id 						bigint(20)			unsigned not null,
	bill_first_name				varchar(66)			not null,
	bill_last_name				varchar(66)			not null,
	bill_email					varchar(66)			not null,
	bill_phone					varchar(66)			not null,
	bill_nation					varchar(66)			not null,
	bill_address				varchar(666)		not null,
	bill_note 					varchar(666)		not null,
	bill_date_order				date				not null,
	bill_date_delivery			date				not null,
	bill_paid					bit(1)				not null,
	bill_delivered				bit(1)				not null,
	bill_transportation_costs	decimal(18,0)		not null check (bill_transportation_costs >= 0),
	bill_created_at				timestamp			null default current_timestamp,
	bill_updated_at 			timestamp			null default current_timestamp on update current_timestamp
);

create table product_bill
(
	bill_id						bigint(20)			unsigned not null,
	prod_id						bigint(20)			unsigned not null,
	p_b_quantity				bigint(20)			not null,
	p_b_price					decimal(18,0)		not null check (p_b_price >= 0),
	p_b_created_at				timestamp			null default current_timestamp,
	p_b_updated_at 				timestamp			null default current_timestamp on update current_timestamp
);


alter table tb_slide
	add constraint pk_slide primary key (slide_id);

alter table tb_news
	add constraint pk_news primary key (news_id);

alter table tb_role_user
	add constraint pk_role_user primary key (ru_id);

alter table tb_role_admin
	add constraint pk_role_admin primary key (ra_id);

alter table tb_admin
	add constraint pk_admin primary key (admin_id);

alter table tb_admin_login_history
	add constraint pk_admin_login_history primary key (alh_id);

alter table tb_users
	add constraint pk_user primary key (user_id);

alter table password_resets
	add key password_resets_email_index (email);

alter table tb_user_login_history
	add constraint pk_user_login_history primary key (ulh_id);

alter table tb_categories
	add constraint pk_category primary key (cate_id);

alter table tb_subcategories
	add constraint pk_subcategory primary key (subcate_id);

alter table tb_brands
	add constraint pk_brand primary key (brand_id);

alter table tb_calculation_unit
	add constraint pk_calculation_unit primary key (cu_id);

alter table tb_products
	add constraint pk_product primary key (prod_id);

alter table tb_product_prices
	add constraint pk_product_price primary key (pp_id);

alter table tb_product_images
	add constraint pk_product_image primary key (pi_id);

alter table tb_product_reviews
	add constraint pk_product_review primary key (pr_id);

alter table tb_carts
	add constraint pk_cart primary key (cart_id);

alter table tb_cart_products
	add constraint pk_cart_product primary key (cp_id);

alter table tb_favorites
	add constraint pk_favorite primary key (favo_id);

alter table tb_favorite_products
	add constraint pk_favorite_product primary key (fp_id);

alter table tb_bill_statuses
	add constraint pk_bill_status primary key (bs_id);

alter table tb_payment_types
	add constraint pk_payment_type primary key (pt_id);

alter table tb_bills
	add constraint pk_bill primary key (bill_id);

alter table tb_bill_products
	add constraint pk_bill_product primary key (bp_id);


alter table tb_slide
	modify column slide_id bigint(20) unsigned not null auto_increment;

alter table tb_news
	modify column news_id bigint(20) unsigned not null auto_increment;

alter table tb_role_user
	modify column ru_id bigint(20) unsigned not null auto_increment;

alter table tb_role_admin
	modify column ra_id bigint(20) unsigned not null auto_increment;

alter table tb_admin_login_history
	modify column alh_id bigint(20) unsigned not null auto_increment;

alter table tb_user_login_history
	modify column ulh_id bigint(20) unsigned not null auto_increment;

alter table tb_calculation_unit
	modify column cu_id bigint(20) unsigned not null auto_increment;

alter table tb_product_prices
	modify column pp_id bigint(20) unsigned not null auto_increment;

alter table tb_product_images
	modify column pi_id bigint(20) unsigned not null auto_increment;

alter table tb_product_reviews
	modify column pr_id bigint(20) unsigned not null auto_increment;

alter table tb_bill_statuses
	modify column bs_id bigint(20) unsigned not null auto_increment;

alter table tb_payment_types
	modify column pt_id bigint(20) unsigned not null auto_increment;

alter table tb_admin
	modify column admin_id bigint(20) unsigned not null auto_increment;

alter table tb_users
	modify column user_id bigint(20) unsigned not null auto_increment;

alter table tb_categories
	modify column cate_id bigint(20) unsigned not null auto_increment;

alter table tb_subcategories
	modify column subcate_id bigint(20) unsigned not null auto_increment;

alter table tb_brands
	modify column brand_id bigint(20) unsigned not null auto_increment;

alter table tb_products
	modify column prod_id bigint(20) unsigned not null auto_increment;

alter table tb_carts
	modify column cart_id bigint(20) unsigned not null auto_increment;

alter table tb_cart_products
	modify column cp_id bigint(20) unsigned not null auto_increment;

alter table tb_favorites
	modify column favo_id bigint(20) unsigned not null auto_increment;

alter table tb_favorite_products
	modify column fp_id bigint(20) unsigned not null auto_increment;

alter table tb_bills
	modify column bill_id bigint(20) unsigned not null auto_increment;

alter table tb_bill_products
	modify column bp_id bigint(20) unsigned not null auto_increment;


alter table tb_news
	add constraint fk_admin_news foreign key (admin_id) references tb_admin (admin_id);

alter table tb_admin
	add constraint fk_role_admin_admin foreign key (ra_id) references tb_role_admin (ra_id);

alter table tb_admin_login_history
	add constraint fk_admin_admin_login_history foreign key (admin_id) references tb_admin (admin_id);

alter table tb_users
	add constraint fk_role_user_user foreign key (ru_id) references tb_role_user (ru_id);

alter table tb_user_login_history
	add constraint fk_user_user_login_history foreign key (user_id) references tb_users (user_id);

alter table tb_subcategories
	add constraint fk_category_subcategory foreign key (cate_id) references tb_categories (cate_id);

alter table tb_products
	add constraint fk_subcategory_product foreign key (subcate_id) references tb_subcategories (subcate_id),
	add constraint fk_brand_product foreign key (brand_id) references tb_brands (brand_id),
	add constraint fk_calculation_unit_product foreign key (cu_id) references tb_calculation_unit (cu_id);

alter table tb_product_reviews
	add constraint fk_user_product_review foreign key (user_id) references tb_users (user_id),
	add constraint fk_product_product_review foreign key (prod_id) references tb_products (prod_id);

alter table tb_product_prices
	add constraint fk_product_product_prices foreign key (prod_id) references tb_products (prod_id);

alter table tb_product_images
	add constraint fk_product_product_images foreign key (prod_id) references tb_products (prod_id);

alter table tb_carts
	add constraint fk_user_cart foreign key (user_id) references tb_users (user_id);

alter table tb_cart_products
	add constraint fk_cart_cart_product foreign key (cart_id) references tb_carts (cart_id),
	add constraint fk_product_cart_product foreign key (prod_id) references tb_products (prod_id);

alter table tb_favorites
	add constraint fk_user_favorite foreign key (user_id) references tb_users (user_id);

alter table tb_favorite_products
	add constraint fk_favorite_favorite_product foreign key (favo_id) references tb_favorites (favo_id),
	add constraint fk_product_favorite_product foreign key (prod_id) references tb_products (prod_id);

alter table tb_bills
	add constraint fk_user_bill foreign key (user_id) references tb_users (user_id),
	add constraint fk_bill_status_bill foreign key (bs_id) references tb_bill_statuses (bs_id),
	add constraint fk_payment_type_bill foreign key (pt_id) references tb_payment_types (pt_id);

alter table tb_bill_products
	add constraint fk_bill_bill_product foreign key (bill_id) references tb_bills (bill_id),
	add constraint fk_product_bill_product foreign key (prod_id) references tb_products (prod_id);


INSERT INTO `tb_brands` (`brand_id`, `brand_url`, `brand_name`, `brand_detail`, `brand_date_created`, `brand_date_updated`) VALUES
(1, 'dell', 'Dell', 'Dell', '2020-06-25 05:22:38', '2020-06-25 05:22:38'),
(2, 'hp', 'HP', 'HP', '2020-06-25 05:22:38', '2020-06-25 05:22:38'),
(3, 'lamborghini', 'Lamborghini', 'Lamborghini', '2020-07-03 05:22:38', '2020-07-03 05:22:38'),
(4, 'ferrari', 'Ferrari', 'Ferrari', '2020-07-03 05:22:38', '2020-07-03 05:22:38'),
(5, 'rolls-royce', 'Rolls-Royce', 'Rolls-Royce', '2020-07-03 05:22:38', '2020-07-03 05:22:38'),
(6, 'mercedes-benz', 'Mercedes-Benz', 'Mercedes-Benz', '2020-07-03 05:22:38', '2020-07-03 05:22:38'),
(7, 'land rover', 'Land Rover', 'Land Rover', '2020-07-03 05:22:38', '2020-07-03 05:22:38'),
(8, 'bentley', 'Bentley', 'Bentley', '2020-07-03 05:22:38', '2020-07-03 05:22:38'),
(9, 'lexus', 'Lexus', 'Lexus', '2020-07-03 05:22:38', '2020-07-03 05:22:38'),
(10, 'aston martin', 'Aston Martin', 'Aston Martin', '2020-07-03 05:22:38', '2020-07-03 05:22:38'),
(11, 'mcLaren', 'McLaren', 'McLaren', '2020-07-03 05:22:38', '2020-07-03 05:22:38'),
(12, 'arrinera', 'Arrinera', 'Arrinera', '2020-07-03 05:22:38', '2020-07-03 05:22:38'),
(13, 'bugatti', 'Bugatti', 'Bugatti', '2020-07-03 05:22:38', '2020-07-03 05:22:38'),
(14, 'koenigsegg-ccx', 'Koenigsegg CCX', 'Koenigsegg CCX', '2020-07-03 05:22:38', '2020-07-03 04:00:23'),
(15, 'w-motors', 'W Motors', 'W Motors', '2020-07-03 05:22:38', '2020-07-03 04:00:23');

INSERT INTO `tb_categories` (`cate_id`, `cate_url`, `cate_name`, `cate_detail`, `cate_date_created`, `cate_date_updated`) VALUES
(1, 'may-tinh-laptop', 'Máy tính & laptop', 'Máy tính và laptop', '2020-06-25 04:52:30', '2020-07-03 04:36:37'),
(2, 'thiet-bi-dien-tu', 'Thiết bị điện tử', 'Thiết bị điện tử', '2020-06-25 04:53:06', '2020-06-25 04:53:06'),
(3, 'may-anh-may-quay-phim', 'Máy ảnh & máy quay phim', 'Máy ảnh và máy quay phim', '2020-06-25 04:53:32', '2020-07-03 04:36:25'),
(4, 'xe-o-to-phuong-tien', 'Xe ô tô & phương tiện', 'Xe ô tô, phương tiện', '2020-06-25 04:56:09', '2020-07-03 02:52:23'),
(5, 'thoi-trang', 'Thời trang', 'Thời trang', '2020-06-25 04:56:09', '2020-07-03 04:49:47');

INSERT INTO `tb_subcategories` (`subcate_id`, `cate_id`, `subcate_url`, `subcate_name`, `subcate_detail`, `subcate_date_created`, `subcate_date_updated`) VALUES
(1, 1, 'laptop', 'Laptop', 'Laptop', '2020-06-25 04:57:34', '2020-06-25 05:14:00'),
(2, 1, 'chuot-ban-phim', 'Chuột và bàn phím', 'Chuột, bàn phím', '2020-06-25 05:03:41', '2020-06-26 09:37:27'),
(3, 2, 'thiet-bi-am-thanh', 'Thiết bị âm thanh', 'Thiết bị âm thanh', '2020-06-25 05:04:50', '2020-06-25 05:04:50'),
(4, 2, 'tai-nghe', 'Tai nghe', 'Tai nghe', '2020-06-25 05:05:38', '2020-06-25 05:05:38'),
(5, 4, 'sieu-xe', 'Siêu xe', 'Siêu xe', '2020-07-03 02:47:10', '2020-07-03 03:53:51');

INSERT INTO `tb_calculation_unit` (`cu_id`, `cu_name`, `cu_detail`, `cu_date_created`, `cu_date_updated`) VALUES
(1, 'Cái', 'Cái', '2020-06-25 05:22:39', '2020-06-25 05:22:39'),
(2, 'Chiếc', 'Chiếc', '2020-06-25 05:22:39', '2020-07-03 03:07:55');

INSERT INTO `tb_products` (`subcate_id`, `brand_id`, `cu_id`, `prod_url`, `prod_name`, `prod_desc`, `prod_detail`, `prod_image`, `prod_availability`, `prod_quantity`, `prod_date_of_manufacture`) VALUES
(5, 3, 2, 'lamborghini-aventador-lp-700-4', 'Lamborghini Aventador LP 700-4', 'desc', 'Lamborghini Aventador LP 700-4', 'Lamborghini_Aventador_LP_700-4_Flickr.jpg', 1, 500, '2020-06-26'),
(5, 3, 2, 'lamborghini-veneno', 'Lamborghini Veneno', 'desc', 'Lamborghini Veneno', 'bf7f68313871d12f8860.jpg', 1, 1000, '2014-08-22'),
(5, 10, 2, 'aston-martin-valkyrie', 'Aston Martin Valkyrie', 'desc', 'Aston Martin Valkyrie', '960x0.jpg', 1, 1500, '2015-06-19'),
(5, 13, 2, 'bugatti-chiron', 'Bugatti Chiron', 'desc', 'Bugatti Chiron', '9757046b562bbf75e63a.jpg', 1, 5000, '2020-06-17'),
(5, 13, 2, 'bugatti-veyron-mansory-vivere', 'Bugatti Veyron Mansory Vivere', 'desc', 'Bugatti Veyron Mansory Vivere', 'xehay-Bugatti-Veyron-Vivere-270717-1.jpg', 1, 6666, '2016-06-08'),
(5, 4, 2, 'ferrari-laferrari-fxx-k', 'Ferrari LaFerrari FXX-K', 'desc', 'Ferrari LaFerrari FXX-K', '92e6cb3ccb2694692a07b6b071be31bc.jpg', 1, 2000, '2020-06-06'),
(5, 4, 2, 'ferrari-pininfarina-sergio', 'Ferrari Pininfarina Sergio', 'desc', 'Ferrari Pininfarina Sergio', 'pinifarina-sergio-concept-1-002.jpg', 1, 5422, '2017-06-14'),
(5, 14, 2, 'koenigsegg-ccxr-trevita', 'Koenigsegg CCXR Trevita', 'desc', 'Koenigsegg CCXR Trevita', 'koenigsegg2.jpg', 1, 4522, '2018-06-25'),
(5, 11, 2, 'mclaren-p1', 'MCLaren P1', 'desc', 'MCLaren P1', 'f07e3d570a0d0c536d08cd8a3a8ceb63_largethumb.jpg', 1, 7857, '2020-05-06'),
(5, 6, 2, 'mercedes-benz-maybach-exelero', 'Mercedes-Benz Maybach Exelero', 'desc', 'Mercedes-Benz Maybach Exelero', 'maybach_exelero_concept_3_028c0255063b0444.jpg', 1, 500, '2018-12-06'),
(5, 5, 2, 'rolls-royce', 'Rolls-Royce', 'desc', 'Rolls-Royce', '2657543-rolls-royce-sweptail-sieu-0.jpg', 1, 5785, '2017-05-07'),
(5, 3, 2, 'sian-fkp-37', 'Sián FKP 37', 'desc', 'Sián FKP 37', 'maxresdefault.jpg', 1, 777, '2017-07-04'),
(5, 15, 2, 'w-motors-lykan-hypersport', 'W Motors Lykan Hypersport', 'desc', 'W Motors Lykan Hypersport', '115512caf25412b2537042099e09f32a.jpg', 1, 3782, '2015-01-15');

INSERT INTO `tb_product_prices` (`pp_id`, `prod_id`, `pp_price`, `pp_sale_price`, `pp_date_created`, `pp_date_updated`) VALUES
(1, 1, 9134637193, null, '2020-06-25 05:22:39', '2020-06-25 05:22:39'),
(2, 2, 221000000000, 211000000000, '2020-06-25 05:22:39', '2020-06-25 05:22:39'),
(3, 3, 74048733996, 74047733996, '2020-06-25 05:22:39', '2020-06-25 05:22:39'),
(4, 4, 69420688121, null, '2020-06-25 05:22:39', '2020-06-25 05:22:39'),
(5, 5, 32396321123, null, '2020-06-25 05:22:39', '2020-06-25 05:22:39'),
(6, 6, 108759078056, null, '2020-06-25 05:22:39', '2020-06-25 05:22:39'),
(7, 7, 69420688121, null, '2020-06-25 05:22:39', '2020-06-25 05:22:39'),
(8, 8, 104131032182, 103131032182, '2020-06-25 05:22:39', '2020-06-25 05:22:39'),
(9, 9, 92560917495, null, '2020-06-25 05:22:39', '2020-06-25 05:22:39'),
(10, 10, 185121834990, null, '2020-06-25 05:22:39', '2020-06-25 05:22:39'),
(11, 11, 40000000000, 39000000000, '2020-06-25 05:22:39', '2020-06-25 05:22:39'),
(12, 12, 83304825745, null, '2020-06-25 05:22:39', '2020-06-25 05:22:39'),
(13, 13, 75000000000, null, '2020-06-25 05:22:39', '2020-06-25 05:22:39'),
(14, 1, 8134637193, null, '2020-06-25 05:22:39', '2020-06-25 05:22:39'),
(14, 1, 210000000000, null, '2020-06-25 05:22:39', '2020-06-25 05:22:39'),
(14, 1, 64048733996, null, '2020-06-25 05:22:39', '2020-06-25 05:22:39');

INSERT INTO `tb_role_user` (`ru_id`, `ru_name`, `ru_detail`, `ru_date_created`, `ru_date_updated`) VALUES
(1, 'Người dùng', 'Người dùng bình thường', '2020-06-26 14:18:20', '2020-07-03 03:08:50');
