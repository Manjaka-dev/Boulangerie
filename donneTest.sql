INSERT INTO "categorie" ("nom_categorie") VALUES
('Viennoiseries'), 
('Pâtisseries'), 
('Pain'), 
('Tartes'), 
('Snacks'), 
('Boissons');


INSERT INTO "unite" ("nom_unite") VALUES
('Kilogrammes'), 
('Litres'), 
('Unités'), 
('Paquets'), 
('Boîtes');


INSERT INTO "type_mouvement" ("nom_type_mouvement") VALUES
('Production'), 
('Vente'), 
('Retour'), 
('Perte');


INSERT INTO "produit" ("nom_produit", "prix_unitaire", "id_categorie", "est_nature") 
VALUES
('Baguette Tradition', 1.10, 3, TRUE),
('Croissant Nature', 1.20, 1, TRUE),
('Croissant au Chocolat', 1.50, 1, FALSE),
('Pain au Lait', 0.90, 3, TRUE),
('Pain aux Raisins', 1.30, 1, FALSE),
('Tarte aux Pommes', 4.50, 4, TRUE),
('Tarte au Citron Meringuée', 5.00, 4, FALSE),
('Éclair au Chocolat', 2.50, 2, FALSE),
('Éclair à la Vanille', 2.50, 2, FALSE),
('Gâteau au Chocolat', 15.00, 2, FALSE),
('Brioche Nature', 3.00, 3, TRUE),
('Brioche au Sucre', 3.20, 3, FALSE),
('Canelé', 1.00, 2, TRUE),
('Mille-feuille', 2.80, 2, FALSE),
('Tartelette aux Fraises', 3.50, 4, FALSE),
('Cookies', 1.50, 5, FALSE),
('Brownies', 2.00, 5, FALSE),
('Chausson aux Pommes', 1.80, 1, FALSE),
('Quiche Lorraine', 3.50, 5, FALSE),
('Sandwich Jambon-Beurre', 3.00, 5, TRUE),
('Jus d’Orange Pressé', 2.50, 6, TRUE),
('Café', 1.80, 6, TRUE),
('Chocolat Chaud', 2.00, 6, FALSE);



INSERT INTO "vente" ("date_vente", "prix_total") 
VALUES
('2025-01-01 10:00:00', 50.00),
('2025-01-02 14:30:00', 75.00),
('2025-01-03 16:00:00', 100.00),
('2025-01-31 12:00:00', 60.00);

-- Insertion dans la table detail_stock_ingredient
INSERT INTO "detail_stock_ingredient" ("date_mouvement", "quantite", "id_type_mouvement") 
VALUES
('2025-01-01', 50, 1),
('2025-01-02', 40, 2),
('2025-01-03', 30, 3);

-- Insertion dans la table detail_vente
INSERT INTO "detail_vente" ("quantite", "id_produit", "id_vente") 
VALUES
(2, 1, 1),
(3, 2, 2),
(1, 3, 3);

INSERT INTO "ingredient" ("nom_ingredient", "prix_unitaire", "id_unite") 
VALUES
('Farine', 1.20, 1),
('Beurre', 3.50, 1),
('Lait', 1.00, 2),
('Œufs', 2.50, 3),
('Chocolat', 5.00, 1),
('Sucre', 0.80, 1),
('Levure', 0.60, 1),
('Raisins Secs', 3.00, 1),
('Pommes', 2.00, 1),
('Citron', 3.00, 1),
('Fraises', 4.00, 1),
('Vanille', 10.00, 1),
('Cacao', 2.50, 1);



-- Insertion dans la table stock_ingredient
INSERT INTO "stock_ingredient" ("quantite_ingredient", "id_ingredient") 
VALUES
(100, 1),
(200, 2),
(150, 3),
(300, 4),
(50, 5);

-- Insertion dans la table stock_produit
INSERT INTO "stock_produit" ("quantite_produit", "id_produit") 
VALUES
(100, 1),
(150, 2),
(200, 3),
(50, 4),
(100, 5);

-- Insertion dans la table detail_stock_produit
INSERT INTO "detail_stock_produit" ("date_mouvement", "quantite", "id_type_mouvement") 
VALUES
('2025-01-01', 10, 1),
('2025-01-02', 20, 2),
('2025-01-03', 30, 3);

-- Baguette Tradition
INSERT INTO "produit_ingredient" ("id_produit", "id_ingredient", "quantite_ingredient") 
VALUES
(1, 1, 0.500), -- Farine
(1, 6, 0.050), -- Sucre
(1, 7, 0.010); -- Levure

-- Croissant Nature
INSERT INTO "produit_ingredient" ("id_produit", "id_ingredient", "quantite_ingredient") 
VALUES
(2, 1, 0.200), -- Farine
(2, 2, 0.100), -- Beurre
(2, 4, 1.000); -- Œufs

-- Croissant au Chocolat
INSERT INTO "produit_ingredient" ("id_produit", "id_ingredient", "quantite_ingredient") 
VALUES
(3, 1, 0.200), -- Farine
(3, 2, 0.100), -- Beurre
(3, 5, 0.050), -- Chocolat
(3, 4, 1.000); -- Œufs

-- Tarte aux Pommes
INSERT INTO "produit_ingredient" ("id_produit", "id_ingredient", "quantite_ingredient") 
VALUES
(6, 1, 0.300), -- Farine
(6, 9, 0.400), -- Pommes
(6, 2, 0.100), -- Beurre
(6, 4, 2.000); -- Œufs

-- Tarte au Citron Meringuée
INSERT INTO "produit_ingredient" ("id_produit", "id_ingredient", "quantite_ingredient") 
VALUES
(7, 1, 0.300), -- Farine
(7, 10, 0.200), -- Citron
(7, 6, 0.150), -- Sucre
(7, 4, 3.000); -- Œufs

-- Éclair au Chocolat
INSERT INTO "produit_ingredient" ("id_produit", "id_ingredient", "quantite_ingredient") 
VALUES
(8, 1, 0.200), -- Farine
(8, 5, 0.200), -- Chocolat
(8, 4, 2.000); -- Œufs
