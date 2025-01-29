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

-- Génération de l'historique des prix pour les produits
INSERT INTO "historique_prix" ("id_produit", "prix", "date_modif")
VALUES
-- Historique pour Baguette Tradition
(1, 10000, '2024-01-01'),
(1, 10500, '2024-06-01'),
(1, 11000, '2025-01-01'),

-- Historique pour Croissant Nature
(2, 11000, '2024-01-01'),
(2, 11500, '2024-06-01'),
(2, 12000, '2025-01-01'),

-- Historique pour Croissant au Chocolat
(3, 14000, '2024-02-01'),
(3, 14500, '2024-07-01'),
(3, 15000, '2025-01-01'),

-- Historique pour Pain au Lait
(4, 8500, '2024-03-01'),
(4, 8800, '2024-09-01'),
(4, 9000, '2025-01-01'),

-- Historique pour Pain aux Raisins
(5, 12000, '2024-04-01'),
(5, 12500, '2024-10-01'),
(5, 13000, '2025-01-01'),

-- Historique pour Tarte aux Pommes
(6, 42000, '2024-05-01'),
(6, 43000, '2024-11-01'),
(6, 45000, '2025-01-01'),

-- Historique pour Tarte au Citron Meringuée
(7, 48000, '2024-06-01'),
(7, 49000, '2024-12-01'),
(7, 50000, '2025-01-01'),

-- Historique pour Éclair au Chocolat
(8, 23000, '2024-07-01'),
(8, 24000, '2024-11-01'),
(8, 25000, '2025-01-01'),

-- Historique pour Éclair à la Vanille
(9, 23000, '2024-07-01'),
(9, 24000, '2024-11-01'),
(9, 25000, '2025-01-01'),

-- Historique pour Gâteau au Chocolat
(10, 14000, '2024-08-01'),
(10, 14500, '2024-12-01'),
(10, 15000, '2025-01-01'),

-- Historique pour Brioche Nature
(11, 37000, '2024-09-01'),
(11, 38000, '2024-12-01'),
(11, 39000, '2025-01-01'),

-- Historique pour Brioche au Sucre
(12, 30000, '2024-09-01'),
(12, 31000, '2024-12-01'),
(12, 32000, '2025-01-01'),

-- Historique pour Canelé
(13, 900, '2024-10-01'),
(13, 950, '2024-12-01'),
(13, 1000, '2025-01-01'),

-- Historique pour Mille-feuille
(14, 27000, '2024-11-01'),
(14, 27500, '2024-12-01'),
(14, 28000, '2025-01-01'),

-- Historique pour Tartelette aux Fraises
(15, 33000, '2024-11-01'),
(15, 34000, '2024-12-01'),
(15, 35000, '2025-01-01'),

-- Historique pour Cookies
(16, 10000, '2024-12-01'),
(16, 10250, '2024-12-15'),
(16, 10500, '2025-01-01'),

-- Historique pour Brownies
(17, 19000, '2024-12-01'),
(17, 19500, '2024-12-15'),
(17, 20000, '2025-01-01'),

-- Historique pour Chausson aux Pommes
(18, 10000, '2024-12-01'),
(18, 10400, '2024-12-15'),
(18, 10800, '2025-01-01'),

-- Historique pour Quiche Lorraine
(19, 33000, '2024-12-01'),
(19, 34000, '2024-12-15'),
(19, 35000, '2025-01-01'),

-- Historique pour Sandwich Jambon-Beurre
(20, 29000, '2024-12-01'),
(20, 29500, '2024-12-15'),
(20, 30000, '2025-01-01'),

-- Historique pour Jus d’Orange Pressé
(21, 24000, '2024-12-01'),
(21, 24500, '2024-12-15'),
(21, 25000, '2025-01-01'),

-- Historique pour Café
(22, 17000, '2024-12-01'),
(22, 17500, '2024-12-15'),
(22, 18000, '2025-01-01'),

-- Historique pour Chocolat Chaud
(23, 19000, '2024-12-01'),
(23, 19500, '2024-12-15'),
(23, 20000, '2025-01-01');


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
