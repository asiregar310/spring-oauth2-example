
--digipos:digipos123
INSERT INTO oauth_client_details (client_id, client_secret, web_server_redirect_uri, scope, access_token_validity, refresh_token_validity, resource_ids, authorized_grant_types, additional_information)
VALUES ('clientId', '{bcrypt}$2a$10$xmcd191Q46nT3Zku53L.M.9G0B86pf2Pv9EfIefMC4Y6s6VV13o4y', 'http://localhost:8080/code', 'READ,WRITE', '3600', '10000', null, 'authorization_code,password,refresh_token,implicit', '{}');

 INSERT INTO S_PERMISSION (NAME) VALUES
 ('create'),
 ('read'),
 ('update'),
 ('delete');

 INSERT INTO s_role (NAME) VALUES
		('ROLE_ADMIN'),('ROLE_OPERATOR');

 INSERT INTO PERMISSION_ROLE (PERMISSION_ID, ROLE_ID) VALUES
     (1,1), /*create-> admin */
     (2,1), /* read admin */
     (3,1), /* update admin */
     (4,1), /* delete admin */
     (2,2),  /* read operator */
     (3,2);  /* update operator */

--admin@email.co.id:admin123
insert into s_user (id, username,password, email, enabled, account_non_expired, credentials_non_expired, account_non_locked)
VALUES ('1', 'admin','{bcrypt}$2a$10$VwzAZ/O1gL.r0WplzCIr9.lXjLTAmd7qK9hTcVro5Voy7cBWnJUmS', 'admin@email.co.id', '1', true, true, true);
--operator@email.co.id:operator123
insert into  s_user (id, username,password, email, enabled, account_non_expired, credentials_non_expired, account_non_locked)
VALUES ('2', 'operator', '{bcrypt}$2a$10$xMe.IVLyGa2vFwhEL7LoteD9CLq3Z9/rSjaNDYrLVa6NpJMCOe0A6','operator@email.co.id', '1', true, true, true);

INSERT INTO ROLE_USER (ROLE_ID, USER_ID)
    VALUES
    (1, 1) /* admin@digitel.co.id-admin */,
    (2, 2) /* operator@digitel.co.id-operator */ ;