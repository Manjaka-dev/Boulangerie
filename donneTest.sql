-- Insertion des catégories
INSERT INTO "categorie" ("nom_categorie") VALUES
('Pâtisserie'),
('Viennoiserie'),
('Boulangerie'),
('Tarte'),
('Snack'),
('Boisson');

-- Insertion des unités
INSERT INTO "unite" ("nom_unite") VALUES
('Kilogrammes'), 
('Litres'), 
('Unités'), 
('Paquets'), 
('Boîtes');

-- Insertion des types de mouvement
INSERT INTO "type_mouvement" ("nom_type_mouvement") VALUES
('Production'), 
('Vente'), 
('Retour'), 
('Perte');

-- Insertion des produits
INSERT INTO "produit" ("nom_produit", "prix_unitaire", "id_categorie", "est_nature") 
VALUES
('Baguette Tradition', 11000, 3, TRUE),
('Croissant Nature', 12000, 1, TRUE),
('Croissant au Chocolat', 15000, 1, FALSE),
('Pain au Lait', 9000, 3, TRUE),
('Pain aux Raisins', 13000, 1, FALSE),
('Tarte aux Pommes', 45000, 4, TRUE),
('Tarte au Citron Meringuée', 50000, 4, FALSE),
('Éclair au Chocolat', 25000, 2, FALSE),
('Éclair à la Vanille', 25000, 2, FALSE),
('Gâteau au Chocolat', 15000, 2, FALSE),
('Brioche Nature', 39000, 3, TRUE),
('Brioche au Sucre', 32000, 3, FALSE),
('Canelé', 1000, 2, TRUE),
('Mille-feuille', 28000, 2, FALSE),
('Tartelette aux Fraises', 35000, 4, FALSE),
('Cookies', 10500, 5, FALSE),
('Brownies', 20000, 5, FALSE),
('Chausson aux Pommes', 10800, 1, FALSE),
('Quiche Lorraine', 35000, 5, FALSE),
('Sandwich Jambon-Beurre', 30000, 5, TRUE),
('Jus d’Orange Pressé', 25000, 6, TRUE),
('Café', 18000, 6, TRUE),
('Chocolat Chaud', 20000, 6, FALSE);

INSERT INTO "genre" ("nom_genre") VALUES
('Homme'),
('Femme');


-- Insertion des vendeurs
INSERT INTO "vendeur" ("nom_vendeur", "id_genre") VALUES
('Alice Dubois', 2),
('Bernard Lemoine', 1),
('Caroline Marchand', 2),
('David Lefèvre', 1),
('Émilie Renaud', 2);

-- Insertion des clients
INSERT INTO "client" ("nom_client") 
VALUES
('Marie Dupont'),
('Jean Martin'),
('Claire Leblanc'),
('Paul Durand'),
('Sophie Morel');

-- Insertion des ventes avec la référence au client et au vendeur
INSERT INTO "vente" ("date_vente", "prix_total", "id_client", "id_vendeur") 
VALUES
('2025-01-05 09:30:00', 260000, 1, 1), -- Vente effectuée par Alice Dubois à Marie Dupont
('2025-01-06 14:00:00', 4500, 2, 2), -- Vente effectuée par Bernard Lemoine à Jean Martin
('2025-01-07 11:15:00', 582000, 3, 3), -- Vente effectuée par Caroline Marchand à Claire Leblanc
('2025-01-08 16:45:00', 220000, 4, 4), -- Vente effectuée par David Lefèvre à Paul Durand
('2025-01-09 13:30:00', 78500, 5, 5); -- Vente effectuée par Émilie Renaud à Sophie Morel

-- Insertion dans la table detail_stock_ingredient
INSERT INTO "detail_stock_ingredient" ("date_mouvement", "quantite", "id_type_mouvement") 
VALUES
('2025-01-01', 50, 1),
('2025-01-02', 40, 2),
('2025-01-03', 30, 3);

-- Insertion dans la table detail_vente
INSERT INTO "detail_vente" ("quantite", "id_produit", "id_vente") 
VALUES
(2, 1, 1), -- 2 Baguettes Tradition pour la vente 1
(3, 2, 2), -- 3 Croissants Nature pour la vente 2
(1, 6, 3), -- 1 Tarte aux Pommes pour la vente 3
(4, 3, 4), -- 4 Croissants au Chocolat pour la vente 4
(1, 10, 5); -- 1 Gâteau au Chocolat pour la vente 5

-- Insertion des ingrédients
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
