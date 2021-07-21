INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_cosanostra','cosanostra',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_cosanostra','Cosa Nostra',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_cosanostra', 'Cosa Nostra', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('cosanostra', 'Cosa Nostra', 1);

--
-- Déchargement des données de la table `jobs_grades`
--

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('cosanostra', 0, 'vojak', 'Saldato', 450, '{}', '{}'),
('cosanostra', 1, 'kapitan', 'Rada', 450, '{}', '{}'),
('cosanostra', 2, 'lowerboss1', 'Consigliere', 450, '{}', '{}'),
('cosanostra', 3, 'boss', 'Capo Famiglia', 450, '{}', '{}')
;