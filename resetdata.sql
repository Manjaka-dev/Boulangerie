-- Désactiver temporairement les contraintes de clé étrangère
SET session_replication_role = 'replica';

-- Suppression des tables en respectant l'ordre des dépendances
DROP TABLE IF EXISTS "produit_ingredient" CASCADE;
DROP TABLE IF EXISTS "detail_stock_produit" CASCADE;
DROP TABLE IF EXISTS "stock_produit" CASCADE;
DROP TABLE IF EXISTS "stock_ingredient" CASCADE;
DROP TABLE IF EXISTS "ingredient" CASCADE;
DROP TABLE IF EXISTS "detail_vente" CASCADE;
DROP TABLE IF EXISTS "produit_mois" CASCADE;
DROP TABLE IF EXISTS "client" CASCADE;
DROP TABLE IF EXISTS "produit" CASCADE;
DROP TABLE IF EXISTS "vente" CASCADE;
DROP TABLE IF EXISTS "genre" CASCADE;
DROP TABLE IF EXISTS "vendeur" CASCADE;
DROP TABLE IF EXISTS "vente" CASCADE;
DROP TABLE IF EXISTS "categorie" CASCADE;
DROP TABLE IF EXISTS "type_mouvement" CASCADE;
DROP TABLE IF EXISTS "unite" CASCADE;

-- Réactiver les contraintes de clé étrangère
SET session_replication_role = 'origin';
