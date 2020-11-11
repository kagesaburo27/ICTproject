CREATE TABLE Client (
clientID INT NOT NULL,
Fname VARCHAR(50) NOT NULL,
Lname VARCHAR(50) NOT NULL,
email CHAR(50),
PRIMARY KEY (clientID));

CREATE TABLE client_info (
clientID INT NOT NULL,
age INT NOT NULL,
weight DECIMAL(10) NOT NULL,
height DECIMAL(10) NOT NULL,
gender VARCHAR(30) NOT NULL,
diabetes VARCHAR(5),
vegeterian VARCHAR(5),
activity_level VARCHAR(50) NOT NULL,
PRIMARY KEY (clientID),
	FOREIGN KEY (clientID) REFERENCES Client(clientID));
	
CREATE TABLE allergies (
allergyID INT NOT NULL,
allergic_product VARCHAR(50),
PRIMARY KEY (allergyID));

CREATE TABLE client_allergies(
clientID INT NOT NULL,
allergyID INT NOT NULL,
PRIMARY KEY (clientID),
FOREIGN KEY (clientID) REFERENCES Client(clientID),
FOREIGN KEY (allergyID) REFERENCES allergies(allergyID));

CREATE TABLE diagnose(
clientID INT NOT NULL,
name VARCHAR(50) NOT NULL,
description VARCHAR(50),
PRIMARY KEY (clientID),
FOREIGN KEY (clientID) REFERENCES Client(clientID));

CREATE TABLE progress (
clientID INT NOT NULL,
start_date DATE NOT NULL,
curr_date DATE NOT NULL,
current_weight DECIMAL(10) NOT NULL,
PRIMARY KEY (clientID),
FOREIGN KEY (clientID) REFERENCES client(clientID));

CREATE TABLE goal (
clientID INT NOT NULL,
goal_weight DECIMAL(10) NOT NULL,
daily_calorie_intake INT NOT NULL,
PRIMARY KEY (clientID),
FOREIGN KEY (clientID) REFERENCES client(clientID));

CREATE TABLE recipes (
recipeID INT NOT NULL,
description VARCHAR(255) NOT NULL,
recipe VARCHAR(500) NOT NULL,
net_carbs DECIMAL(5) NOT NULL,
calories DECIMAL(7) NOT NULL,
protein DECIMAL(5) NOT NULL,
total_fat DECIMAL(5) NOT NULL,
PRIMARY KEY (recipeID));

CREATE TABLE products (
productID INT NOT NULL,
net_carbs DECIMAL(5) NOT NULL,
calories DECIMAL(7) NOT NULL,
protein DECIMAL(5) NOT NULL,
total_fat DECIMAL(5) NOT NULL,
PRIMARY KEY (productID));

CREATE TABLE diet_options (
diet_planID INT NOT NULL,
name VARCHAR(50) NOT NULL,
calories_per_day INT NOT NULL,
PRIMARY KEY (diet_planID));

CREATE TABLE diet_plan_recipes (
recipeID INT NOT NULL,
diet_planID INT NOT NULL,
PRIMARY KEY (diet_planID),
	FOREIGN KEY (diet_planID) REFERENCES diet_options(diet_planID),
	FOREIGN KEY (recipeID) REFERENCES recipes(recipeID));
	
CREATE TABLE diet_plan_products (
productID INT NOT NULL,
diet_planID INT NOT NULL,
PRIMARY KEY (diet_planID),
	FOREIGN KEY (diet_planID) REFERENCES diet_options(diet_planID),
	FOREIGN KEY (productID) REFERENCES products(productID));
	
CREATE TABLE diet_plan (
clientID INT NOT NULL,
diet_planID INT NOT NULL,
PRIMARY KEY (clientID),
FOREIGN KEY (clientID) REFERENCES client(clientID),
FOREIGN KEY (diet_planID) REFERENCES diet_options(diet_planID));