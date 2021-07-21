INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_farma','farma',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_farma','Farma',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_farma', 'Farma', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('farma', 'Farma', 1);

--
-- Déchargement des données de la table `jobs_grades`
--

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('farma', 0, 'brigadnik', 'Pomocnik', 1500, '{}', '{}'),
('farma', 1, 'spolecnik', 'Spolecnik', 2000, '{}', '{}'),
('farma', 2, 'vojak', 'Skladnik', 2500, '{}', '{}'),
('farma', 3, 'kapitan', 'Kontrolor', 3000, '{}', '{}'),
('farma', 4, 'lowerboss1', 'Zastupce sefa', 3500, '{}', '{}'),
('farma', 5, 'boss', 'Sef', 4000, '{}', '{}')
;