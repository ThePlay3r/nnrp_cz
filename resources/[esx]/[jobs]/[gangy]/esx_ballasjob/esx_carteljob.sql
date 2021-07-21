INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_ballas','ballas',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_ballas','Ballas',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_ballas', 'Ballas', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('ballas', 'Ballas', 1);

--
-- Déchargement des données de la table `jobs_grades`
--

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('ballas', 0, 'soldato', 'Ballas', 450, '{}', '{}'),
('ballas', 1, 'boss', 'Boss', 2700, '{}', '{}');