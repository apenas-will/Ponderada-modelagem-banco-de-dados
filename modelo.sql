CREATE TABLE user (
 id BIGSERIAL,
 name VARCHAR(50) NOT NULL,
 email VARCHAR(50) NOT NULL,
 password VARCHAR(50) NOT NULL,
 role VARCHAR(4) NOT NULL
);


ALTER TABLE user ADD CONSTRAINT user_pkey PRIMARY KEY (id);

CREATE TABLE resenha (
 id BIGSERIAL,
 id_user INTEGER NOT NULL,
 age INTEGER NOT NULL,
 gender VARCHAR(15) NOT NULL,
 education_level VARCHAR(25) NOT NULL,
 house_type VARCHAR(15) NOT NULL,
 family_constitution VARCHAR(50) NOT NULL,
 income VARCHAR(25) NOT NULL,
 people_in_house INTEGER NOT NULL,
 country VARCHAR(50) NOT NULL,
 state VARCHAR(50) NOT NULL,
 city VARCHAR(50) NOT NULL,
 neighborhood VARCHAR(50) NOT NULL,
 next_forms VARCHAR(25) NOT NULL/* Informa se a pessoa deseja ter um cão, se tem um cão, se já teve um cão ou se não deseja ter um cão */,
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 social_name VARCHAR(50) NOT NULL,
 tel_number INTEGER NOT NULL,
 email VARCHAR(50) NOT NULL
);


ALTER TABLE resenha ADD CONSTRAINT resenha_pkey PRIMARY KEY (id);
COMMENT ON COLUMN "resenha"."next_forms" IS 'Informa se a pessoa deseja ter um cão, se tem um cão, se já teve um cão ou se não deseja ter um cão';

CREATE TABLE have_dog (
 id BIGSERIAL,
 id_user INTEGER,
 dogs_name VARCHAR(50) NOT NULL,
 dogs_sex VARCHAR(5) NOT NULL,
 tutor BOOLEAN NOT NULL/* Verifica se o usuário é ou não o tutor/responsável pelo cão */,
 castrated VARCHAR(7) NOT NULL,
 castration_date DATE/* Ano da castração */,
 time_w_dog TIME/* Tempo que está com o cão */,
 first_dog BOOLEAN/* Verifica se este é o primeiro cão do usuário */,
 other_pets BOOLEAN NOT NULL/* Verifica se há outros pets na casa */,
 number_other_pets INTEGER/* Habilitada em caso de resposta prositiva na questão anterior */,
 dogs_age VARCHAR(15) NOT NULL/* Idade do cão em intervalos pré-determinados */,
 dogs_breed_type VARCHAR(20) NOT NULL/* Determina se o cão tem raça definida, indefinida ou se é uma mistura de raça */,
 breed VARCHAR(50),
 dogs_origin VARCHAR(50) NOT NULL,
 paid_to_acquire BOOLEAN NOT NULL,
 age_dog_arrived INTEGER NOT NULL,
 dogs_personality TEXT NOT NULL,
 id_reasons_to_have_the_dog INTEGER,
 other_reasons_to_have_the_dog VARCHAR(80),
 things_you_like_in_the_dog TEXT NOT NULL,
 involved_in_decision VARCHAR(50) NOT NULL,
 couldnt_keep_a_dog_before BOOLEAN NOT NULL,
 reasons_to_not_keep TEXT/* Habilitado apenas se a resposta anterior for verdadeira */,
 number_of_vet_visits INTEGER NOT NULL,
 adopte_your_dog TEXT NOT NULL,
 contact_permission BOOLEAN NOT NULL
);


ALTER TABLE have_dog ADD CONSTRAINT have_dog_pkey PRIMARY KEY (id);
COMMENT ON COLUMN "have_dog"."tutor" IS 'Verifica se o usuário é ou não o tutor/responsável pelo cão';
COMMENT ON COLUMN "have_dog"."castration_date" IS 'Ano da castração';
COMMENT ON COLUMN "have_dog"."time_w_dog" IS 'Tempo que está com o cão';
COMMENT ON COLUMN "have_dog"."first_dog" IS 'Verifica se este é o primeiro cão do usuário';
COMMENT ON COLUMN "have_dog"."other_pets" IS 'Verifica se há outros pets na casa';
COMMENT ON COLUMN "have_dog"."number_other_pets" IS 'Habilitada em caso de resposta prositiva na questão anterior';
COMMENT ON COLUMN "have_dog"."dogs_age" IS 'Idade do cão em intervalos pré-determinados';
COMMENT ON COLUMN "have_dog"."dogs_breed_type" IS 'Determina se o cão tem raça definida, indefinida ou se é uma mistura de raça';
COMMENT ON COLUMN "have_dog"."reasons_to_not_keep" IS 'Habilitado apenas se a resposta anterior for verdadeira';

CREATE TABLE want_dog (
 id BIGSERIAL,
 id_user INTEGER,
 dogs_size VARCHAR(10) NOT NULL,
 fur_length VARCHAR(10) NOT NULL,
 fur_color VARCHAR(50),
 dogs_sex VARCHAR(5) NOT NULL,
 dogs_age VARCHAR(15) NOT NULL,
 breed VARCHAR(20) NOT NULL/* Determina se o cão tem ou não raça definida */,
 id_reasons_to_have_the_dog INTEGER,
 already_have_a_name BOOLEAN NOT NULL/* Verifica se o usuário já tem um nome para o cão */,
 possible_name VARCHAR(50)/* Habilitado apenas se a pergunta anterior for verdadeira */,
 name_reason VARCHAR(50)/* Habilitada apenas se a questão anterior estiver preenchida */,
 acquire_intention VARCHAR(10) NOT NULL/* Vê se o usuário prefere comprar ou adotar um cão */,
 bringing_date BOOLEAN NOT NULL,
 wanted_personality TEXT NOT NULL,
 expenses_search BOOLEAN,
 expenses INTEGER/* Despesas mensais com o cão. habilitado caso a resposta anterior seja verdadeira */,
 contact_permission BOOLEAN NOT NULL
);


ALTER TABLE want_dog ADD CONSTRAINT want_dog_pkey PRIMARY KEY (id);
COMMENT ON COLUMN "want_dog"."breed" IS 'Determina se o cão tem ou não raça definida';
COMMENT ON COLUMN "want_dog"."already_have_a_name" IS 'Verifica se o usuário já tem um nome para o cão';
COMMENT ON COLUMN "want_dog"."possible_name" IS 'Habilitado apenas se a pergunta anterior for verdadeira';
COMMENT ON COLUMN "want_dog"."name_reason" IS 'Habilitada apenas se a questão anterior estiver preenchida';
COMMENT ON COLUMN "want_dog"."acquire_intention" IS 'Vê se o usuário prefere comprar ou adotar um cão';
COMMENT ON COLUMN "want_dog"."expenses" IS 'Despesas mensais com o cão. habilitado caso a resposta anterior seja verdadeira';

CREATE TABLE dont_want_dog (
 id BIGSERIAL,
 id_user INTEGER,
 reason TEXT NOT NULL
);


ALTER TABLE dont_want_dog ADD CONSTRAINT dont_want_dog_pkey PRIMARY KEY (id);

CREATE TABLE had_dog (
 id BIGSERIAL,
 id_user INTEGER,
 dogs_name VARCHAR(50) NOT NULL,
 belonging BOOLEAN NOT NULL,
 dogs_personality TEXT NOT NULL,
 how_much_stayed TIME NOT NULL,
 first_dog BOOLEAN NOT NULL,
 number_other_pets INTEGER NOT NULL,
 kind_of_other_pets VARCHAR(20),
 dogs_age VARCHAR(20),
 castrated VARCHAR(7) NOT NULL,
 castration_age VARCHAR/* habilitado caso a pergunta anterior seja afirmativa */,
 breed VARCHAR(50) NOT NULL,
 dogs_origin VARCHAR(50) NOT NULL,
 cost_to_acquire VARCHAR(20) NOT NULL,
 id_reasons_to_have_the_dog INTEGER,
 dogs_characteristics TEXT NOT NULL,
 involved_name_decision VARCHAR(50) NOT NULL,
 favorite_things_first_weeks TEXT NOT NULL,
 dont_liked_things TEXT NOT NULL,
 number_of_vet_visits INTEGER NOT NULL,
 visit_reason VARCHAR(50) NOT NULL/* Habilitada se a resposta anterior for diferente de 0 */,
 stopped_live_with_dog DATE NOT NULL,
 stopped_live_dogs_age INTEGER NOT NULL,
 reason_stopped_living TEXT NOT NULL,
 would_live_with_other_dog BOOLEAN NOT NULL,
 reason_live_with_other_dog TEXT NOT NULL,
 contact_permission BOOLEAN NOT NULL
);


ALTER TABLE had_dog ADD CONSTRAINT had_dog_pkey PRIMARY KEY (id);
COMMENT ON COLUMN "had_dog"."castration_age" IS 'habilitado caso a pergunta anterior seja afirmativa';
COMMENT ON COLUMN "had_dog"."visit_reason" IS 'Habilitada se a resposta anterior for diferente de 0';

CREATE TABLE reasons_to_have_the_dog (
 id BIGSERIAL,
 kids_company BOOLEAN NOT NULL DEFAULT 'false',
 adults_company BOOLEAN NOT NULL DEFAULT 'false',
 appearance BOOLEAN NOT NULL DEFAULT 'false',
 dogs_company BOOLEAN NOT NULL DEFAULT 'false',
 resposability_to_children BOOLEAN NOT NULL DEFAULT 'false',
 friends_have BOOLEAN NOT NULL DEFAULT 'false',
 protection BOOLEAN NOT NULL DEFAULT 'false',
 help_friend_couldnt_keep_it BOOLEAN NOT NULL DEFAULT 'false',
 save_my_life BOOLEAN NOT NULL DEFAULT 'false',
 was_cute BOOLEAN NOT NULL DEFAULT 'false',
 chose_me BOOLEAN NOT NULL DEFAULT 'false',
 gift BOOLEAN NOT NULL DEFAULT 'false'
);


ALTER TABLE reasons_to_have_the_dog ADD CONSTRAINT reasons_to_have_the_dog_pkey PRIMARY KEY (id);

ALTER TABLE resenha ADD CONSTRAINT resenha_id_user_fkey FOREIGN KEY (id_user) REFERENCES user(id);
ALTER TABLE have_dog ADD CONSTRAINT have_dog_id_user_fkey FOREIGN KEY (id_user) REFERENCES user(id);
ALTER TABLE have_dog ADD CONSTRAINT have_dog_id_reasons_to_have_the_dog_fkey FOREIGN KEY (id_reasons_to_have_the_dog) REFERENCES reasons_to_have_the_dog(id);
ALTER TABLE want_dog ADD CONSTRAINT want_dog_id_user_fkey FOREIGN KEY (id_user) REFERENCES user(id);
ALTER TABLE want_dog ADD CONSTRAINT want_dog_id_reasons_to_have_the_dog_fkey FOREIGN KEY (id_reasons_to_have_the_dog) REFERENCES reasons_to_have_the_dog(id);
ALTER TABLE dont_want_dog ADD CONSTRAINT dont_want_dog_id_user_fkey FOREIGN KEY (id_user) REFERENCES user(id);
ALTER TABLE had_dog ADD CONSTRAINT had_dog_id_user_fkey FOREIGN KEY (id_user) REFERENCES user(id);
ALTER TABLE had_dog ADD CONSTRAINT had_dog_id_reasons_to_have_the_dog_fkey FOREIGN KEY (id_reasons_to_have_the_dog) REFERENCES reasons_to_have_the_dog(id);