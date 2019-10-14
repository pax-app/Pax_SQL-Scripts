USE paxdb;

INSERT INTO USER
	(name, email, cpf, password, url_avatar) 
VALUES
	('Rogério Silva dos Santos Júnior',
	'junior.rogerio8@gmail.com',
	'12345678912',
	'10863780',
	'some_path'),
	('Youssef Muhamad Yacoub Falaneh',
	'emaildeyoussefmuhamad@gmail.com',
	'12345678934',
	'12345',
	'other_path');

INSERT INTO PROVIDER
	(bio, minimum_price, maximum_price, url_rg_photo, number, user_id)
VALUES
	('This is a little about me',
	10.00,
	300.00,
	'rg_path',
	3285432,
	2);

INSERT INTO CHAT
	(user_id, provider_id)
VALUES
	(1,	1);

INSERT INTO MESSAGE
	(sender,
	date_time_sent,
	text_message,
	chat_id)
VALUES
	('U',
	now(),
	"E aê mano, blz?",
	1),
    ('U',
	now(),
	"Quanto você cobra pra trocar a tela de um S6 Edge",
	1),
    ('P',
	now(),
	"Opa! Tudo jóia?",
	1),
    ('P',
	now(),
	"O serviço com a tela fica R$700.00",
	1),
    ('P',
	now(),
	"Você pode me mandar uma foto do aparelho?",
	1);

