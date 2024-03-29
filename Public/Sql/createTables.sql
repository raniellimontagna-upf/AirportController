create table `airportcontroller` . `companies` (
    cnpj bigint PRIMARY KEY NOT NULL,
    razaoSocial varchar(50) NOT NULL,
    nomeFantasia varchar(50)
);

create table `airportcontroller` . `aircraft` (
	id integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome varchar(30) NOT NULL,
    marca varchar(30) NOT NULL,
    tipoMotor varchar(30),
    maxPassageiros integer,
    compania bigint,
    CONSTRAINT fk_compania FOREIGN KEY (compania) REFERENCES companies(cnpj)
);

create table `airportcontroller` . `cities` (
	cep integer PRIMARY KEY NOT NULL,
    nome varchar(30) NOT NULL,
    pais varchar(30) NOT NULL,
    estado varchar(30) NOT NULL
);

create table `airportcontroller` . `airports` (
	id integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome varchar(100) NOT NULL unique,
    porte varchar(15) NOT NULL,
    distancia real NOT NULL,
    cep integer NOT NULL,
    CONSTRAINT fk_cep FOREIGN KEY (cep) REFERENCES cities(cep)
);

create table `airportcontroller` . `crew` (
	id integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome varchar(30) NOT NULL,
    idade integer,
    email varchar(50) NOT NULL,
    senha varchar(50) NOT NULL,
    tipo varchar(20) NOT NULL
);

create table `airportcontroller` . `user` (
	id integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
	email varchar(50) NOT NULL,
    senha varchar(50) NOT NULL
);

	create table `airportcontroller` . `travels` (
    id integer PRIMARY KEY NOT NULL AUTO_INCREMENT,
    aviao integer NOT NULL,
    aeroportoDestino integer NOT NULL,
    dataSaida date NOT NULL,
    CONSTRAINT fk_aeroportoDestino FOREIGN KEY (aeroportoDestino) REFERENCES airports(id),
    CONSTRAINT fk_aviao FOREIGN KEY (aviao) REFERENCES aircraft(id)
);

create table `airportcontroller` . `travelsCrew` (
    voo integer NOT NULL,
    tripulante integer NOT NULL,
    CONSTRAINT fk_crew FOREIGN KEY (tripulante) REFERENCES crew(id),
    CONSTRAINT pk_travelsCrew PRIMARY KEY (voo, tripulante)
);

INSERT INTO User (email, senha) VALUES ('admin@admin', '202cb962ac59075b964b07152d234b70'); 

SELECT * FROM Cities;
SELECT * FROM Crew;
SELECT * FROM Companies;
SELECT * FROM Tickets;
SELECT * FROM Aircraft;
SELECT * FROM Airports;
SELECT * FROM Travels;
SELECT * FROM TravelsCrew;