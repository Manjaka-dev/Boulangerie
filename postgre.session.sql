-- Création de la table categorie
CREATE TABLE IF NOT EXISTS "categorie" (
    "id_categorie" SERIAL PRIMARY KEY,
    "nom_categorie" VARCHAR(50) NOT NULL,
    CONSTRAINT "unique_nom_categorie" UNIQUE("nom_categorie")
);

-- Insertion de données dans la table categorie
INSERT INTO "categorie" ("nom_categorie") VALUES
('Pain'),
('Biscuit'),
('Boisson');

-- Création de la table vente
CREATE TABLE IF NOT EXISTS "vente" (
    "id_vente" SERIAL PRIMARY KEY,
    "date_vente" TIMESTAMP NOT NULL,
    "prix_total" NUMERIC(15,2) NOT NULL
);

-- Insertion de données dans la table vente
INSERT INTO "vente" ("date_vente", "prix_total") VALUES
('2025-01-05 10:30:00', 150.75),
('2025-01-06 11:45:00', 250.60);

-- Création de la table unite
CREATE TABLE IF NOT EXISTS "unite" (
    "id_unite" SERIAL PRIMARY KEY,
    "nom_unite" VARCHAR(50) NOT NULL,
    CONSTRAINT "unique_nom_unite" UNIQUE("nom_unite")
);

-- Insertion de données dans la table unite
INSERT INTO "unite" ("nom_unite") VALUES
('Grammes'),
('Litres'),
('Pièces');

-- Création de la table type_mouvement
CREATE TABLE IF NOT EXISTS "type_mouvement" (
    "id_type_mouvement" SERIAL PRIMARY KEY,
    "nom_type_mouvement" VARCHAR(50) NOT NULL,
    CONSTRAINT "unique_nom_type_mouvement" UNIQUE("nom_type_mouvement")
);

-- Insertion de données dans la table type_mouvement
INSERT INTO "type_mouvement" ("nom_type_mouvement") VALUES
('Entrée'),
('Sortie');

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

-- Insertion de données dans la table detail_stock_ingredient
INSERT INTO "detail_stock_ingredient" ("date_mouvement", "quantite", "id_type_mouvement") VALUES
('2025-01-05', 100, 1),
('2025-01-06', 50, 2);

-- Création de la table produit
CREATE TABLE IF NOT EXISTS "produit" (
    "id_produit" SERIAL PRIMARY KEY,
    "nom_produit" VARCHAR(50) NOT NULL,
    "prix_unitaire" NUMERIC(15,2) NOT NULL,
    "id_categorie" INT NOT NULL,
    CONSTRAINT "unique_nom_produit" UNIQUE("nom_produit"),
    CONSTRAINT "fk_produit_categorie"
        FOREIGN KEY ("id_categorie")
        REFERENCES "categorie"("id_categorie")
        ON DELETE CASCADE
);

-- Insertion de données dans la table produit
INSERT INTO "produit" ("nom_produit", "prix_unitaire", "id_categorie") VALUES
('Pain Complet', 1.50, 1),
('Pain de Mie', 2.00, 1),
('Biscuit Chocolat', 2.50, 2),
('Biscuit Vanille', 2.30, 2),
('Jus d’Orange', 3.00, 3);

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

-- Insertion de données dans la table detail_vente
INSERT INTO "detail_vente" ("quantite", "id_produit", "id_vente") VALUES
(10, 1, 1),
(5, 2, 1),
(3, 3, 2),
(7, 4, 2);

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

-- Insertion de données dans la table ingredient
INSERT INTO "ingredient" ("nom_ingredient", "prix_unitaire", "id_unite") VALUES
('Farine', 0.75, 1),
('Sucre', 1.20, 1),
('Chocolat', 2.00, 1),
('Vanille', 0.50, 1),
('Jus d’Orange', 2.00, 2);

-- Création de la table stock_ingredient
CREATE TABLE IF NOT EXISTS "stock_ingredient" (
    "id_stock_ingredient" SERIAL PRIMARY KEY,
    "quantite_ingredient" INT NOT NULL,
    "id_ingredient" INT NOT NULL,
    CONSTRAINT "fk_stock_ingredient_ingredient"
        FOREIGN KEY ("id_ingredient") REFERENCES "ingredient"("id_ingredient")
        ON DELETE CASCADE
);

-- Insertion de données dans la table stock_ingredient
INSERT INTO "stock_ingredient" ("quantite_ingredient", "id_ingredient") VALUES
(500, 1),
(300, 2),
(100, 3),
(200, 4),
(1000, 5);

-- Création de la table stock_produit
CREATE TABLE IF NOT EXISTS "stock_produit" (
    "id_stock_produit" SERIAL PRIMARY KEY,
    "quantite_produit" INT NOT NULL,
    "id_produit" INT NOT NULL,
    CONSTRAINT "fk_stock_produit_produit"
        FOREIGN KEY ("id_produit") REFERENCES "produit"("id_produit")
        ON DELETE CASCADE
);

-- Insertion de données dans la table stock_produit
INSERT INTO "stock_produit" ("quantite_produit", "id_produit") VALUES
(200, 1),
(150, 2),
(100, 3),
(50, 4),
(300, 5);

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

-- Insertion de données dans la table detail_stock_produit
INSERT INTO "detail_stock_produit" ("date_mouvement", "quantite", "id_type_mouvement") VALUES
('2025-01-05', 50, 1),
('2025-01-06', 30, 2);

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

-- Insertion de données dans la table produit_ingredient
INSERT INTO "produit_ingredient" ("id_produit", "id_ingredient", "quantite_ingredient") VALUES
(1, 1, 500), (1, 2, 300), (2, 1, 600), (2, 3, 400),
(3, 2, 300), (3, 4, 200), (4, 1, 250), (4, 2, 150),
(5, 5, 100);
