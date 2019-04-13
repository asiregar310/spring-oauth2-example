-- used in tests that use HSQL
create table oauth_client_details (
  client_id VARCHAR(256) PRIMARY KEY,
  resource_ids VARCHAR(256),
  client_secret VARCHAR(256),
  scope VARCHAR(256),
  authorized_grant_types VARCHAR(256),
  web_server_redirect_uri VARCHAR(256),
  authorities VARCHAR(256),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additional_information VARCHAR(4096),
  autoapprove VARCHAR(256)
);

create table oauth_client_token (
  token_id VARCHAR(256),
  token bytea,
  authentication_id VARCHAR(256) PRIMARY KEY,
  user_name VARCHAR(256),
  client_id VARCHAR(256)
);

create table oauth_access_token (
  token_id VARCHAR(256),
  token bytea,
  authentication_id VARCHAR(256) PRIMARY KEY,
  user_name VARCHAR(256),
  client_id VARCHAR(256),
  authentication bytea,
  refresh_token VARCHAR(256)
);

create table oauth_refresh_token (
  token_id VARCHAR(256),
  token bytea,
  authentication bytea
);

create table oauth_code (
  code VARCHAR(256), authentication bytea
);

create table oauth_approvals (
	userId VARCHAR(256),
	clientId VARCHAR(256),
	scope VARCHAR(256),
	status VARCHAR(10),
	expiresAt TIMESTAMP,
	lastModifiedAt TIMESTAMP
);


-- customized oauth_client_details table
-- create table ClientDetails (
--   appId VARCHAR(256) PRIMARY KEY,
--   resourceIds VARCHAR(256),
--   appSecret VARCHAR(256),
--   scope VARCHAR(256),
--   grantTypes VARCHAR(256),
--   redirectUrl VARCHAR(256),
--   authorities VARCHAR(256),
--   access_token_validity INTEGER,
--   refresh_token_validity INTEGER,
--   additionalInformation VARCHAR(4096),
--   autoApproveScopes VARCHAR(256)
-- );

create table s_permission (
  id SERIAL PRIMARY KEY,
  name varchar(512) null,
  unique (name)
);

create table s_role (
  id SERIAL PRIMARY KEY,
  name varchar(255) default null,
  unique (name)
);

create table s_user (
  id SERIAL PRIMARY KEY,
  username varchar(100) not null,
  password varchar(1024) not null,
  email varchar(1024) not null,
  enabled smallint not null,
  account_non_expired boolean not null,
  credentials_non_expired boolean not null,
  account_non_locked boolean not null,
  unique (username)
);


create table permission_role (
  permission_id integer default null,
  role_id integer default null,
  PRIMARY KEY (permission_id, role_id),
  foreign key (permission_id) references s_permission (id),
  foreign key (role_id) references s_role (id)
);

create table role_user (
  role_id integer default null,
  user_id integer default null,
  PRIMARY KEY (role_id, user_id),
  foreign key (role_id) references s_role (id),
  foreign key (user_id) references s_user (id)
);