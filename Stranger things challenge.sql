Create database Stranger_things;
Use Stranger_things;
CREATE TABLE Characters (
            character_id INT PRIMARY KEY,
            name VARCHAR(255) NOT NULL,
            age INT,
            occupation VARCHAR(255),
            hometown VARCHAR(255),
            introduction TEXT
        );
        
        INSERT INTO Characters (character_id, name, age, occupation, hometown, introduction)
        VALUES
            (1, 'Eleven', 15, 'Former Lab Subject', 'Hawkins', 'Mysterious girl with telekinetic powers.'),
            (2, 'Mike Wheeler', 16, 'Student', 'Hawkins', 'Leader of the group and Eleven''s love interest.'),
            (3, 'Dustin Henderson', 16, 'Student', 'Hawkins', 'Smart and witty member of the group.'),
            (4, 'Lucas Sinclair', 16, 'Student', 'Hawkins', 'Skilled with a slingshot and skeptical member.'),
            (5, 'Will Byers', 16, 'Student', 'Hawkins', 'Went missing in Season 1 and has supernatural connections.'),
            (6, 'Joyce Byers', 42, 'Retail Clerk', 'Hawkins', 'Mother of Will and Jonathan.'),
            (7, 'Jim Hopper', 45, 'Chief of Police', 'Hawkins', 'Protector of the town and Eleven.'),
            (8, 'Steve Harrington', 18, 'Former Babysitter', 'Hawkins', 'Transformed from a popular kid to a hero.'),
            (9, 'Jonathan Byers', 19, 'Photographer', 'Hawkins', 'Will''s older brother and a close friend of Nancy.'),
            (10, 'Nancy Wheeler', 17, 'Student', 'Hawkins', 'Mike''s older sister and investigator of strange occurrences.');
                        
                
        CREATE TABLE Locations (
            location_id INT PRIMARY KEY,
            name VARCHAR(255) NOT NULL,
            type VARCHAR(255),
            description TEXT,
            latitude DECIMAL(9,6),
            longitude DECIMAL(9,6)
        );
        
        INSERT INTO Locations (location_id, name, type, description, latitude, longitude)
        VALUES
            (1, 'Hawkins High School', 'School', 'The local high school attended by the main characters.', 40.0401, -82.4629),
            (2, 'Starcourt Mall', 'Mall', 'The central mall in Hawkins with various shops and events.', 40.0502, -82.4611),
            (3, 'Hawkins National Laboratory', 'Laboratory', 'A secretive government facility where experiments take place.', 40.0520, -82.4652),
            (4, 'Hawkins Public Library', 'Library', 'A public library used for research and information gathering.', 40.0459, -82.4624),
            (5, 'Byers House', 'Residence', 'The home of the Byers family, central to many events.', 40.0477, -82.4641),
            (6, 'Wheeler House', 'Residence', 'The home of the Wheeler family.', 40.0482, -82.4630),
            (7, 'Hopper''s Cabin', 'Residence', 'Jim Hopper''s secluded cabin in the woods.', 40.0531, -82.4598),
            (8, 'Hawkins Community Pool', 'Pool', 'A public pool where characters gather in Season 3.', 40.0465, -82.4613);
                      
    CREATE TABLE Events (
    event_id INT PRIMARY KEY,
    season INT,
    episode INT,
    event_name VARCHAR(255) NOT NULL,
    description TEXT
);

INSERT INTO Events (event_id, season, episode, event_name, description)
VALUES
    (1, 1, 1, 'Disappearance of Will Byers', 'Will Byers goes missing, leading to the events of Season 1.'),
    (2, 1, 3, 'Discovery of Eleven', 'The boys find Eleven in the woods with mysterious powers.'),
    (3, 2, 5, 'Demogorgon Attack on School', 'A terrifying encounter with the Demogorgon at Hawkins High School.'),
    (4, 2, 9, 'The Mind Flayer', 'The emergence of the Mind Flayer in Season 2.'),
    (5, 3, 1, 'The Mall Battle', 'The climactic battle against the Mind Flayer at Starcourt Mall.'),
    (6, 1, 6, 'Search for Barb', 'Nancy and Jonathan search for their missing friend Barb in Season 1.'),
    (7, 2, 2, 'The Upside Down', 'Exploration of the alternate dimension known as the Upside Down.'),
    (8, 3, 8, 'Russian Conspiracy', 'Discovery of a Russian laboratory beneath the mall in Season 3.');


    
    
CREATE TABLE Relationships (
    relationship_id INT PRIMARY KEY,
    character1_id INT,
    character2_id INT,
    relationship_type VARCHAR(255)
);

INSERT INTO Relationships (relationship_id, character1_id, character2_id, relationship_type)
VALUES
    (1, 1, 2, 'Close Friends'),
    (2, 1, 7, 'Adoptive Father and Daughter'),
    (3, 2, 3, 'Friends'),
    (4, 3, 4, 'Friends'),
    (5, 5, 6, 'Mother and Son'),
    (6, 6, 9, 'Siblings'),
    (7, 9, 10, 'Romantic Relationship'),
    (8, 4, 8, 'Friends');

CREATE TABLE Monsters (
    monster_id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    type VARCHAR(255),
    abilities TEXT
);

INSERT INTO Monsters (monster_id, name, type, abilities)
VALUES
    (1, 'Demogorgon', 'Demons', 'Interdimensional travel, face-opening petal attack'),
    (2, 'Mind Flayer', 'Eldritch Horror', 'Mind control, ability to possess creatures'),
    (3, 'Demodogs', 'Demons', 'Ferocious, dog-like creatures under the Mind Flayer''s control'),
    (4, 'Shadow Monster', 'Eldritch Horror', 'Sentient, shadowy entity controlling the Mind Flayer'),
    (5, 'Thessalhydra', 'Demons', 'Multi-headed creature mentioned in a Dungeons & Dragons game'),
    (6, 'Mind Flayer (Baby)', 'Eldritch Horror', 'A smaller version of the Mind Flayer'),
    (7, 'The Flayed', 'Humans', 'Humans infected and controlled by the Mind Flayer'),
    (8, 'Polywog', 'Creatures', 'A small, slug-like creature that evolves into a Demodog');

	Select * from Characters;
	Select * from Relationships;
	Select * from Events;
	Select * from Monsters;
	Select * from Locations;

	--1.Retrieve the names of the characters?
	Select name as names_of_characters from Characters;

	--2.Find characters with age greater than 18.
	Select name from Characters where age>18;

	--3.Find events in Season 2.
	Select event_id, event_name from Events where season=2;

	--4.Get details of the 'Mind Flayer' monster.
	Select * from Monsters where name='Mind Flayer'; 

	--5.Retrieve characters and their associated events.
	Select  c.character_id,c.name,e.event_name from Characters c join Relationships r 
	on c.character_id=r.character1_id or c.character_id=r.character2_id
	join Events e on r.relationship_id=e.event_id order by c.name;

	--6.Calculate the total number of characters from each hometown?
	Select hometown, count(*) as total_characters from Characters group by hometown;

	--7.Retrieve characters who were involved in events in Season 1 or Season 2.
	Select c.character_id, c.name,e.season from Characters c 
	join Relationships r on c.character_id=r.character1_id or c.character_id=r.character2_id 
	join Events e on r.character1_id=e.event_id or r.character2_id=e.event_id
	where e.season in (1,2) order by e.season;

--8. Retrieve the top 3 oldest characters.
Select * from (
Select character_id, name, age ,rank() over(order by age desc) as rnk from Characters) as a
where rnk in (1,2,3); 

	--9.Find the average age of characters in Hawkins?
	Select hometown,avg(age) as average_age from Characters 
	where hometown='Hawkins'
	group by hometown;

--10.Rank characters by age in descending order?
Select character_id,name, age from Characters order by age desc;