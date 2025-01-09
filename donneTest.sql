-- Insertion dans la table categorie
INSERT INTO "categorie" ("nom_categorie") VALUES
('Produits Laitiers'), 
('Fruits'), 
('Légumes'), 
('Viandes'), 
('Poissons'),
('Épices'), 
('Pâtes'), 
('Céréales'), 
('Confiseries'), 
('Snacks');

-- Insertion dans la table unite
INSERT INTO "unite" ("nom_unite") VALUES
('Kilogrammes'), 
('Millilitres'), 
('Unités'), 
('Paquets'), 
('Boîtes');

-- Insertion dans la table type_mouvement
INSERT INTO "type_mouvement" ("nom_type_mouvement") VALUES
('Transfert'), 
('Retour'), 
('Perte'), 
('Don');

-- Insertion dans la table produit
INSERT INTO "produit" ("nom_produit", "prix_unitaire", "id_categorie") 
VALUES
('Pain de Mie', 2.50, 1), 
('Croissant', 1.20, 1), 
('Pizza Margherita', 7.50, 2), 
('Pâtes Carbonara', 6.00, 2), 
('Poulet Rôti', 12.00, 3), 
('Bœuf Bourguignon', 18.00, 3), 
('Filet de Saumon', 14.50, 4), 
('Sardines en conserve', 4.00, 4),
('Spaghetti Bolognaise', 5.00, 2), 
('Salade César', 8.00, 5), 
('Tacos', 5.50, 6), 
('Hamburger', 6.00, 6), 
('Steak Haché', 4.80, 3), 
('Gâteau au Chocolat', 3.50, 7), 
('Tarte aux Pommes', 5.00, 7), 
('Salade de Fruits', 4.50, 5), 
('Soupe de Tomates', 3.00, 2), 
('Riz Pilaf', 2.80, 5),
('Pâtisserie au Citron', 2.20, 7), 
('Salmon Grillé', 12.00, 4), 
('Quiche Lorraine', 6.50, 1), 
('Moules Marinières', 9.00, 4), 
('Chili Con Carne', 7.00, 3),
('Gratin Dauphinois', 4.50, 2), 
('Burritos', 5.50, 6),
('Tarte aux Framboises', 4.00, 7), 
('Pâté en Croûte', 5.00, 3), 
('Paella', 15.00, 4), 
('Risotto aux Champignons', 6.00, 5), 
('Mousse au Chocolat', 3.00, 7),
('Lasagnes', 7.50, 2),
('Gâteau aux Carottes', 3.50, 7),
('Soupe de Potiron', 2.80, 2),
('Clafoutis', 4.00, 7),
('Crêpes Suzette', 3.50, 7),
('Pâté de Campagne', 5.80, 3),
('Volaille Rôtie', 10.00, 3),
('Tarte au Fromage', 6.50, 7),
('Gratin de Chou-fleur', 4.00, 2),
('Baba au Rhum', 5.20, 7),
('Pizzas au Poulet', 8.00, 2),
('Tartelette aux Fruits', 3.00, 7);


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

-- Insertion dans la table ingredient
INSERT INTO "ingredient" ("nom_ingredient", "prix_unitaire", "id_unite") 
VALUES
('Lait', 1.50, 1),  -- Kilogrammes
('Sucre', 0.80, 2),  -- Kilogrammes
('Farine', 1.20, 1),  -- Kilogrammes
('Œufs', 2.50, 3),  -- Unités
('Beurre', 3.00, 1),  -- Kilogrammes
('Huile dolive', 5.00, 2),  -- Millilitres
('Sel', 0.50, 1),  -- Kilogrammes
('Poivre', 1.00, 1),  -- Kilogrammes
('Tomates', 2.00, 1),  -- Kilogrammes
('Oignons', 1.50, 1),  -- Kilogrammes
('Ail', 1.20, 1),  -- Kilogrammes
('Fromage râpé', 4.00, 1),  -- Kilogrammes
('Cacao en poudre', 2.80, 1),  -- Kilogrammes
('Levure', 0.60, 2),  -- Millilitres
('Café', 10.00, 1),  -- Kilogrammes
('Pâtes', 1.80, 1),  -- Kilogrammes
('Chocolat', 3.50, 1),  -- Kilogrammes
('Miel', 4.50, 2),  -- Millilitres
('Jus dorange', 2.00, 2);  -- Millilitres


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

-- Insertion dans la table produit_ingredient
INSERT INTO "produit_ingredient" ("id_produit", "id_ingredient", "quantite_ingredient") 
VALUES
-- Pain de Mie
(1, 1, 0.500),  -- Lait
(1, 2, 0.200),  -- Sucre
(1, 3, 0.300),  -- Farine
(1, 4, 2.000),  -- Œufs
(1, 5, 0.100),  -- Beurre
-- Croissant
(2, 3, 0.300),  -- Farine
(2, 2, 0.150),  -- Sucre
(2, 4, 1.000),  -- Œufs
(2, 5, 0.050),  -- Beurre
(2, 6, 0.025),  -- Huile d'olive
-- Pizza Margherita
(3, 3, 0.400),  -- Farine
(3, 2, 0.100),  -- Sucre
(3, 5, 0.150),  -- Beurre
(3, 9, 0.200),  -- Tomates
(3, 11, 0.100),  -- Fromage râpé
-- Pâtes Carbonara
(4, 3, 0.300),  -- Farine
(4, 10, 0.100), -- Ail
(4, 2, 0.200),  -- Sucre
(4, 11, 0.150), -- Fromage râpé
(4, 12, 0.100), -- Cacao en poudre
(4, 4, 3.000),  -- Œufs
-- Poulet Rôti
(5, 12, 0.200), -- Cacao en poudre
(5, 10, 0.150), -- Ail
(5, 1, 0.500),  -- Lait
(5, 7, 0.025),  -- Sel
(5, 8, 0.050),  -- Poivre
-- Bœuf Bourguignon
(6, 2, 0.250),  -- Sucre
(6, 9, 0.300),  -- Tomates
(6, 5, 0.200),  -- Beurre
(6, 10, 0.100), -- Ail
(6, 4, 2.000),  -- Œufs
-- Filet de Saumon
(7, 13, 0.500), -- Salmon Grillé
(7, 9, 0.300),  -- Tomates
(7, 8, 0.050),  -- Poivre
-- Sardines en conserve
(8, 13, 0.500), -- Salmon Grillé
(8, 9, 0.150),  -- Tomates
(8, 7, 0.025),  -- Sel
(8, 8, 0.020),  -- Poivre
-- Spaghetti Bolognaise
(9, 2, 0.150),  -- Sucre
(9, 9, 0.200),  -- Tomates
(9, 12, 0.050), -- Cacao en poudre
(9, 10, 0.100), -- Ail
(9, 13, 0.300), -- Salmon Grillé
-- Salade César
(10, 9, 0.200),  -- Tomates
(10, 8, 0.020),  -- Poivre
(10, 11, 0.050), -- Fromage râpé
-- Tacos
(11, 12, 0.150), -- Cacao en poudre
(11, 2, 0.100),  -- Sucre
(11, 9, 0.100),  -- Tomates
(11, 5, 0.150),  -- Beurre
-- Hamburger
(12, 2, 0.200),  -- Sucre
(12, 9, 0.150),  -- Tomates
(12, 3, 0.300),  -- Farine
(12, 5, 0.100),  -- Beurre
(12, 7, 0.025),  -- Sel
-- Steak Haché
(13, 2, 0.200),  -- Sucre
(13, 7, 0.020),  -- Poivre
(13, 6, 0.025),  -- Huile d'olive
(13, 4, 2.000),  -- Œufs
-- Gâteau au Chocolat
(14, 13, 0.200), -- Chocolat
(14, 2, 0.150),  -- Sucre
(14, 5, 0.200),  -- Beurre
(14, 4, 3.000),  -- Œufs
-- Tarte aux Pommes
(15, 9, 0.400),  -- Tomates
(15, 2, 0.100),  -- Sucre
(15, 3, 0.300),  -- Farine
(15, 7, 0.025),  -- Sel
(15, 4, 2.000);  -- Œufs

