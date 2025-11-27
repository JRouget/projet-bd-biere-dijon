CREATE TABLE quartier (
    id_quartier SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);


CREATE TABLE bar (
    id_bar SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    adresse VARCHAR(255),
    id_quartier INT NOT NULL,
    FOREIGN KEY (id_quartier) REFERENCES quartier(id_quartier)
);


CREATE TABLE biere (
    id_biere SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    type VARCHAR(100),
    degree_alcool NUMERIC(4,2)
);


CREATE TABLE prix (
    id_bar INT NOT NULL,
    id_biere INT NOT NULL,
    prix NUMERIC(5,2) NOT NULL,
    PRIMARY KEY (id_bar, id_biere),
    FOREIGN KEY (id_bar) REFERENCES bar(id_bar),
    FOREIGN KEY (id_biere) REFERENCES biere(id_biere)
);