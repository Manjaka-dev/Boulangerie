-- Création de la table categorie
CREATE TABLE IF NOT EXISTS "categorie" (
    "id_categorie" SERIAL PRIMARY KEY,
    "nom_categorie" VARCHAR(50) NOT NULL,
    CONSTRAINT "unique_nom_categorie" UNIQUE("nom_categorie")
);

-- Création de la table client
CREATE TABLE IF NOT EXISTS "client" (
    "id_client" SERIAL PRIMARY KEY,
    "nom_client" VARCHAR(100) NOT NULL,
    CONSTRAINT "unique_nom_client" UNIQUE("nom_client")
);

-- Création de la table vendeur
CREATE TABLE IF NOT EXISTS "vendeur" (
    "id_vendeur" SERIAL PRIMARY KEY,
    "nom_vendeur" VARCHAR(100) NOT NULL,
    CONSTRAINT "unique_nom_vendeur" UNIQUE("nom_vendeur")
);

-- Création de la table vente
CREATE TABLE IF NOT EXISTS "vente" (
    "id_vente" SERIAL PRIMARY KEY,
    "date_vente" TIMESTAMP NOT NULL,
    "prix_total" NUMERIC(15,2) NOT NULL,
    "id_client" INT,
    "id_vendeur" INT NOT NULL,
    CONSTRAINT "fk_vente_client"
        FOREIGN KEY ("id_client") REFERENCES "client"("id_client")
        ON DELETE SET NULL,
    CONSTRAINT "fk_vente_vendeur"
        FOREIGN KEY ("id_vendeur") REFERENCES "vendeur"("id_vendeur")
        ON DELETE CASCADE
);

-- Création de la table unite
CREATE TABLE IF NOT EXISTS "unite" (
    "id_unite" SERIAL PRIMARY KEY,
    "nom_unite" VARCHAR(50) NOT NULL,
    CONSTRAINT "unique_nom_unite" UNIQUE("nom_unite")
);

-- Création de la table type_mouvement
CREATE TABLE IF NOT EXISTS "type_mouvement" (
    "id_type_mouvement" SERIAL PRIMARY KEY,
    "nom_type_mouvement" VARCHAR(50) NOT NULL,
    CONSTRAINT "unique_nom_type_mouvement" UNIQUE("nom_type_mouvement")
);

-- Création de la table detail_stock_ingredient
CREATE TABLE IF NOT EXISTS "detail_stock_ingredient" (
    "id_detail_stock_ingredient" SERIAL PRIMARY KEY,
    "date_mouvement" DATE NOT NULL,
    "quantite" INT NOT NULL,
    "id_type_mouvement" INT NOT NULL,
    CONSTRAINT "fk_detail_stock_ingredient_type_mouvement"
        FOREIGN KEY ("id_type_mouvement") REFERENCES "type_mouvement"("id_type_mouvement")
        ON DELETE CASCADE
);

-- Création de la table produit avec une nouvelle colonne est_nature
CREATE TABLE IF NOT EXISTS "produit" (
    "id_produit" SERIAL PRIMARY KEY,
    "nom_produit" VARCHAR(50) NOT NULL,
    "prix_unitaire" NUMERIC(15,2) NOT NULL,
    "id_categorie" INT,
    "est_nature" BOOLEAN NOT NULL DEFAULT FALSE,
    CONSTRAINT "unique_nom_produit" UNIQUE("nom_produit"),
    CONSTRAINT "fk_produit_categorie"
        FOREIGN KEY ("id_categorie")
        REFERENCES "categorie"("id_categorie")
        ON DELETE CASCADE
);

-- Création de la table detail_vente
CREATE TABLE IF NOT EXISTS "detail_vente" (
    "id_detail_vente" SERIAL PRIMARY KEY,
    "quantite" INT NOT NULL,
    "id_produit" INT NOT NULL,
    "id_vente" INT NOT NULL,
    CONSTRAINT "fk_detail_vente_produit"
        FOREIGN KEY ("id_produit") REFERENCES "produit"("id_produit")
        ON DELETE CASCADE,
    CONSTRAINT "fk_detail_vente_vente"
        FOREIGN KEY ("id_vente") REFERENCES "vente"("id_vente")
        ON DELETE CASCADE
);

-- Création de la table ingredient
CREATE TABLE IF NOT EXISTS "ingredient" (
    "id_ingredient" SERIAL PRIMARY KEY,
    "nom_ingredient" VARCHAR(50) NOT NULL,
    "prix_unitaire" NUMERIC(15,2) NOT NULL,
    "id_unite" INT NOT NULL,
    CONSTRAINT "fk_ingredient_unite"
        FOREIGN KEY ("id_unite")
        REFERENCES "unite"("id_unite")
        ON DELETE CASCADE
);

-- Création de la table stock_ingredient
CREATE TABLE IF NOT EXISTS "stock_ingredient" (
    "id_stock_ingredient" SERIAL PRIMARY KEY,
    "quantite_ingredient" INT NOT NULL,
    "id_ingredient" INT NOT NULL,
    CONSTRAINT "fk_stock_ingredient_ingredient"
        FOREIGN KEY ("id_ingredient") REFERENCES "ingredient"("id_ingredient")
        ON DELETE CASCADE
);

-- Création de la table stock_produit
CREATE TABLE IF NOT EXISTS "stock_produit" (
    "id_stock_produit" SERIAL PRIMARY KEY,
    "quantite_produit" INT NOT NULL,
    "id_produit" INT NOT NULL,
    CONSTRAINT "fk_stock_produit_produit"
        FOREIGN KEY ("id_produit") REFERENCES "produit"("id_produit")
        ON DELETE CASCADE
);

-- Création de la table detail_stock_produit
CREATE TABLE IF NOT EXISTS "detail_stock_produit" (
    "id_detail_stock_produit" SERIAL PRIMARY KEY,
    "date_mouvement" DATE NOT NULL,
    "quantite" INT NOT NULL,
    "id_type_mouvement" INT NOT NULL,
    CONSTRAINT "fk_detail_stock_produit_type_mouvement"
        FOREIGN KEY ("id_type_mouvement") REFERENCES "type_mouvement"("id_type_mouvement")
        ON DELETE CASCADE
);

-- Création de la table produit_ingredient
CREATE TABLE IF NOT EXISTS "produit_ingredient" (
    "id_produit" INT NOT NULL,
    "id_ingredient" INT NOT NULL,
    "quantite_ingredient" NUMERIC(15,2) NOT NULL,
    PRIMARY KEY ("id_produit", "id_ingredient"),
    CONSTRAINT "fk_produit_ingredient_produit"
        FOREIGN KEY ("id_produit")
        REFERENCES "produit"("id_produit")
        ON DELETE CASCADE,
    CONSTRAINT "fk_produit_ingredient_ingredient"
        FOREIGN KEY ("id_ingredient")
        REFERENCES "ingredient"("id_ingredient")
        ON DELETE CASCADE
);

-- Création de la table produit_mois
CREATE TABLE IF NOT EXISTS "produit_mois" (
    "id_produit_mois" SERIAL PRIMARY KEY,
    "id_produit" INT NOT NULL,
    "date_conseil" DATE NOT NULL,
    CONSTRAINT "fk_produit_mois_produit"
        FOREIGN KEY ("id_produit") REFERENCES "produit"("id_produit")
        ON DELETE CASCADE
);
