create database OlympicGames;

use OlympicGames;

create table Olympics(
EmployeeID int primary key auto_increment,
FullName varchar (500),
Gender varchar(50),
Age int(255),
Height varchar(500),
Team varchar(250),
Noc varchar(250),
Games varchar(500),
Year int(255),
Season varchar(250),
City varchar(500),
Sport varchar(250),
Event varchar(500),
Medal varchar(50));

Insert into Olympics
            values(1,'Juhamatti Tapio Aaltonen','Male',28,184,'Finland','FIN','2014 Winter',2014,'Winter','Sochi','Ice Hockey','Ice Hockey Men Ice Hockey','Bronze'),
                  (2,'Paavo Johannes Aaltonen','Male',28,175,'Finland','FIN','1948 Summer',1948,'Summer','London','Gymnastics','Gymnastics Men Individual All-Around','Bronze'),
(3,'Paavo Johannes Aaltonen','Male',28,175,'Finland','FIN','1948 Summer',1948,'Summer','London','Gymnastics','Gymnastics Men Team All-Around','Gold'),
(4,'Paavo Johannes Aaltonen','Male',28,175,'Finland','FIN','1948 Summer',1948,'Summer','London','Gymnastics','Gymnastics Men Horse Vault','Gold'),
(5,'Paavo Johannes Aaltonen','Male',28,175,'Finland','FIN','1948 Summer',1948,'Summer','London','Gymnastics','Gymnastics Men Pommelled Horse','Gold'),
(6,'Paavo Johannes Aaltonen','Male',32,175,'Finland','FIN','1952 Summer',1952,'Summer','Helsinki','Gymnastics','Gymnastics Men Team All-Around','Bronze'),
(7,'Kjetil Andr Aamodt','Male',20,176,'Norway','NOR','1992 Winter',1992,'Winter','Albertville','Alpine Skiing','Alpine Skiing Men Super G','Gold'),
(8,'Kjetil Andr Aamodt','Male',20,176,'Norway','NOR','1992 Winter',1992,'Winter','Albertville','Alpine Skiing','Alpine Skiing Men Giant Slalom','Bronze'),
(9,'Kjetil Andr Aamodt','Male',22,176,'Norway','NOR','1994 Winter',1994,'Winter','Lillehammer','Alpine Skiing','Alpine Skiing Men Downhill','Silver'),
(10,'Kjetil Andr Aamodt','Male',22,176,'Norway','NOR','1994 Winter',1994,'Winter','Lillehammer','Alpine Skiing','Alpine Skiing Men Super G','Bronze'),
(11,'Kjetil Andr Aamodt','Male',22,176,'Norway','NOR','1994 Winter',1994,'Winter','Lillehammer','Alpine Skiing','Alpine Skiing Men Combined','Silver'),
(12,'Kjetil Andr Aamodt','Male',30,176,'Norway','NOR','2002 Winter',2002,'Winter','Salt Lake City','Alpine Skiing','Alpine Skiing Men Super G','Gold'),
(13,'Kjetil Andr Aamodt','Male',30,176,'Norway','NOR','2002 Winter',2002,'Winter','Salt Lake City','Alpine Skiing','Alpine Skiing Men Combined','Gold'),
(14,'Kjetil Andr Aamodt','Male',34,176,'Norway','NOR','2006 Winter',2006,'Winter','Torino','Alpine Skiing','Alpine Skiing Men Super G','Gold'),
(15,'Ragnhild Margrethe Aamodt','Female',27,163,'Norway','NOR','2008 Summer',2008,'Summer','Beijing','Handball','Handball Women Handball','Gold'),
(16,'Pepijn Aardewijn','Male',26,189,'Netherlands','NED','1996 Summer',1996,'Summer','Atlanta','Rowing','Rowing Men Lightweight Double Sculls','Silver'),
(17,'Ann Kristin Aarnes','Female',23,182,'Norway','NOR','1996 Summer',1996,'Summer','Atlanta','Football','Football Women Football','Bronze'),
(18,'Giovanni Abagnale','Male',21,198,'Italy','ITA','2016 Summer',2016,'Summer','Rio de Janeiro','Rowing','Rowing Men Coxless Pairs','Bronze'),
(19,'Jos Luis Abajo Gmez','Male',30,194,'Spain','ESP','2008 Summer',2008,'Summer','Beijing','Fencing','Fencing Men epee, Individual','Bronze'),
(20,'Patimat Abakarova','Female',21,165,'Azerbaijan','AZE','2016 Summer',2016,'Summer','Rio de Janeiro','Taekwondo','Taekwondo Women Flyweight','Bronze'),
(21,'Mariya Vasilyevna Abakumova (-Tarabina)','Female',22,179,'Russia','RUS','2008 Summer',2008,'Summer','Beijing','Athletics','Athletics Women Javelin Throw','Silver'),
(22,'Aleksey Aleksandrovich Abalmasov','Male',28,180,'Belarus','BLR','2008 Summer',2008,'Summer','Beijing','Canoeing','Canoeing Men Kayak Fours, 1,000 metres','Gold'),
(23,'Luc Abalo','Male',23,182,'France','FRA','2008 Summer',2008,'Summer','Beijing','Handball','Handball Men Handball','Gold'),
(24,'Luc Abalo','Male',27,182,'France','FRA','2012 Summer',2012,'Summer','London','Handball','Handball Men Handball','Gold'),
(25,'Luc Abalo','Male',31,182,'France','FRA','2016 Summer',2016,'Summer','Rio de Janeiro','Handball','Handball Men Handball','Silver'),
(26,'Jouan Patrice Abanda Etong','Male',22,185,'Cameroon','CMR','2000 Summer',2000,'Summer','Sydney','Football','	Football Mens Football','Gold'),
(27,'Jos Mara Abarca Plotas','Male',22,186,'Spain','ESP','1996 Summer',1996,'Summer','Atlanta','Water Polo','Water Polo Men Water Polo','Gold'),
(29,'Stephen Anthony Abas','Male',26,165,'United States','USA','2004 Summer',2004,'Summer','Athina','Wrestling','Wrestling Men Featherweight, Freestyle0','Silver'),
(30,'Alejandro Abascal Garca','Male',28,181,'Spain','ESP','1980 Summer',1980,'Summer','Moskva','Sailing','Sailing Mixed Two Person Heavyweight Dinghy','Gold');

SELECT * FROM olympicgames.olympics;

# Find total number of summer olympic Games.
select count(Season) as total_summer
from olympicgames.olympics
where Season ="summer";

select EmployeeID,Games
from olympicgames.olympics
where Season = "Summer" order by Games;

# Find for each sport, how many games where they played in.
 select Sport ,count(Games) as  NO_of_Games
 from olympicgames.olympics
 group by Sport;
 
 select count(Team)
 from olympicgames.olympics
 where Team = "Finland";
 
 
 # Display the list of max Height
 select FullName,Height 
 from olympicgames.olympics
 where Height = (select max(Height)  from olympicgames.olympics);
 
 select min(Height) as Height
 from olympicgames.olympics
 where Height;
 
 # Display the list of min height
 select FullName,Height 
 from olympicgames.olympics
 where Height = (select min(Height) from olympicgames.olympics);
 
 
 
 select  Games, count(*) as count
 from olympicgames.olympics
 group by Games ;
 
 # Fetch the top 5 athletes who have won the most gold Madel
select FullName,Sport,Medal
from olympicgames.olympics
where Medal = "Gold"
limit  5;

with t1 as
(select  FullName, count(1) as total_Madels
from olympicgames.olympics
where Medal ="Gold"
group by FullName),
 t2 as 
    (select*, rank() over(order by total_Madels desc) as Rnk from t1)
     select* from t2;
     
# List down total gold , silver and Bronze medals won by each country
 SELECT FullName, City,
    SUM(CASE WHEN medal = 'Gold' THEN 1 ELSE 0 END) AS gold_medals,
    SUM(CASE WHEN medal = 'Silver' THEN 1 ELSE 0 END) AS silver_medals,
    SUM(CASE WHEN medal = 'Bronze' THEN 1 ELSE 0 END) AS bronze_medals
FROM olympicgames.olympics
GROUP BY City, FullName;

# Display the list of Female
select *
 from olympicgames.olympics
where Gender='Female';

# Display the list of Fullname which start with j or p but end with en
  select FullName 
  from olympicgames.olympics
  where FullName like 'j%en' or FullName like 'p%en';

# Display the list of FullName which start with L
  select FullName
  from olympicgames.olympics
  where FullName like 'L%';
            
# identify which city won the most gold, most silver, most Bronze medal in each olympics games.            
 SELECT Year,City, 
    MAX(CASE WHEN Medal = 'Gold' THEN Team ELSE 0 END) AS gold_winner,
    MAX(CASE WHEN Medal = 'Silver' THEN Team ELSE 0 END) AS silver_winner,
    MAX(CASE WHEN Medal = 'Bronze' THEN Team ELSE 0 END) AS bronze_winner
FROM olympicgames.olympics
GROUP BY Year, City
ORDER BY Year ASC;
 
# Identify which city has won the least number of Gold, Silver, Bronze medals in each Olympic Games.
   select year , city,
    min(case when Medal = 'Gold' Then Team else NULL end) as Gold_Medal,
    min(case when Medal = 'Silver' Then Team else NULL end) as Silver_Medal,
    min(case when Medal = 'Bronze' Then Team else NULL end) as Bronze_Medal
    FROM olympicgames.olympics
    where Medal <> 'NULL'
GROUP BY Year, City
ORDER BY Year ASC;
    
# Mention the total number nations who participated in each olympics games.   
   select year,
   count(distinct Noc) as no_nations
   from olympicgames.olympics
   group by year;

# List down the All olympic games held so far 
  select distinct Games
  from olympicgames.olympics;
  
# Which year saw the highest ana lowest no of countries participating in olympics 
SELECT Year, 
COUNT(DISTINCT Noc) AS num_countries
FROM olympicgames.olympics
GROUP BY Year;

# Fetch details of the oldest athletes to win a gold medal
  select FullName ,Age,Year,Medal
   from olympicgames.olympics
    where Medal ='Gold';
  

