INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_sheriff', 'Sheriff', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_sheriff', 'Sheriff', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_sheriff', 'Sheriff', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('sheriff', 'LSSD'),
	('offsheriff', 'Off-Duty')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('sheriff', 0, 'kadet', 'Kadet', 1200, '{}','{}'),
	('sheriff', 1, 'prodeputy', 'Probationary Deputy', 2000, '{}','{}'),
	('sheriff', 2, 'deputy', 'Deputy I', 2300, '{}','{}'),
	('sheriff', 3, 'deputytwo', 'Deputy II', 2600, '{}','{}'),
	('sheriff', 4, 'deputythree', 'Deputy III', 3000, '{}','{}'),

	('sheriff', 5, 'seniordeputy', 'Senior Deputy', 3200, '{}','{}'),
	('sheriff', 6, 'corpolar', 'Corporal', 3500, '{}','{}'),
	
	('sheriff', 7, 'sergeant', 'Sergeant', 3800, '{}','{}'),
	('sheriff', 8, 'lieutenant', 'Lieutenant', 4000, '{}','{}'),
	('sheriff', 9, 'captain', 'Captain', 4200, '{}','{}'),
	
	('sheriff', 10, 'areacommander', 'Area Commander', 4500, '{}','{}'),
	('sheriff', 11, 'division', 'Division Chief', 4800, '{}','{}'),
	('sheriff', 12, 'assistant', 'Assistant Sheriff', 5000, '{}','{}'),

	('sheriff', 13, 'undersheriff', 'Undersheriff', 5500, '{}','{}'),
	('sheriff', 14, 'sheriff', 'Sheriff', 6000, '{}','{}'),

	('offsheriff', 0, 'kadet', 'Kadet', 600, '{}','{}'),
	('offsheriff', 1, 'prodeputy', 'Probationary Deputy', 1000, '{}','{}'),
	('offsheriff', 2, 'deputy', 'Deputy I', 1150, '{}','{}'),
	('offsheriff', 3, 'deputytwo', 'Deputy II', 1300, '{}','{}'),
	('offsheriff', 4, 'deputythree', 'Deputy III', 1500, '{}','{}'),

	('offsheriff', 5, 'seniordeputy', 'Senior Deputy', 1600, '{}','{}'),
	('offsheriff', 6, 'corpolar', 'Corporal', 1750, '{}','{}'),
	
	('offsheriff', 7, 'sergeant', 'Sergeant', 1900, '{}','{}'),
	('offsheriff', 8, 'lieutenant', 'Lieutenant', 2000, '{}','{}'),
	('offsheriff', 9, 'captain', 'Captain', 2100, '{}','{}'),
	
	('offsheriff', 10, 'areacommander', 'Area Commander', 2250, '{}','{}'),
	('offsheriff', 11, 'division', 'Division Chief', 2400, '{}','{}'),
	('offsheriff', 12, 'assistant', 'Assistant Sheriff', 2500, '{}','{}'),

	('offsheriff', 13, 'undersheriff', 'Undersheriff', 2750, '{}','{}'),
	('offsheriff', 14, 'sheriff', 'Sheriff', 3000, '{}','{}')
;