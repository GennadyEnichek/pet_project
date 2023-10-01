-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cook_book
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cuisine`
--

DROP TABLE IF EXISTS `cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuisine` (
  `id_cuisine` int NOT NULL AUTO_INCREMENT,
  `cuisine_name` varchar(45) DEFAULT NULL,
  `cuisine_table_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_cuisine`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuisine`
--

LOCK TABLES `cuisine` WRITE;
/*!40000 ALTER TABLE `cuisine` DISABLE KEYS */;
INSERT INTO `cuisine` VALUES (1,'Russian','russian_cuisine'),(2,'Greek','greek_cuisine'),(3,'Italy','italy_cuisine');
/*!40000 ALTER TABLE `cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `greek_cuisine`
--

DROP TABLE IF EXISTS `greek_cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `greek_cuisine` (
  `id_course` int NOT NULL,
  `course_name` varchar(45) DEFAULT '',
  `olives` int DEFAULT '0',
  `feta_cheese` int DEFAULT '0',
  `eggplants` int DEFAULT '0',
  `onion` int DEFAULT '0',
  `garlic` int DEFAULT '0',
  `beef` int DEFAULT '0',
  `parmesan_cheese` int DEFAULT '0',
  `tomato` int DEFAULT '0',
  `flour` int DEFAULT '0',
  `pork` int DEFAULT '0',
  `milk` int DEFAULT '0',
  `greek_yogurt` int DEFAULT '0',
  `phyllo_dough` int DEFAULT '0',
  `cucamber` int DEFAULT '0',
  `chicken` int DEFAULT '0',
  PRIMARY KEY (`id_course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `greek_cuisine`
--

LOCK TABLES `greek_cuisine` WRITE;
/*!40000 ALTER TABLE `greek_cuisine` DISABLE KEYS */;
INSERT INTO `greek_cuisine` VALUES (1,'Greek Salad',1,1,0,1,0,0,0,1,0,0,0,0,0,1,0),(2,'Moussaka',0,0,1,1,1,1,1,1,1,0,1,0,0,0,0),(3,'Spanakopita',0,1,0,1,1,0,0,0,0,0,0,0,1,0,0),(4,'Tzatziki',0,0,0,0,1,0,0,0,0,0,0,1,0,1,0),(5,'Souvlaki',0,0,0,0,1,0,0,0,0,1,0,0,0,0,1);
/*!40000 ALTER TABLE `greek_cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructions`
--

DROP TABLE IF EXISTS `instructions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructions` (
  `id_instruction` int NOT NULL AUTO_INCREMENT,
  `id_course` int DEFAULT NULL,
  `ingredient` varchar(1500) DEFAULT NULL,
  `instructions` varchar(1500) DEFAULT NULL,
  PRIMARY KEY (`id_instruction`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructions`
--

LOCK TABLES `instructions` WRITE;
/*!40000 ALTER TABLE `instructions` DISABLE KEYS */;
INSERT INTO `instructions` VALUES (1,1,'2 large tomatoes, cut into chunks; 1 cucumber, sliced; 1 red onion, thinly sliced; Kalamata olives; Feta cheese, crumbled; Fresh oregano leaves; Extra-virgin olive oil; Red wine vinegar; Salt and black pepper to taste;','In a large salad bowl, combine the tomato chunks, cucumber slices, and red onion slices; Add Kalamata olives and crumbled feta cheese; Drizzle extra-virgin olive oil and red wine vinegar over the salad; Season with salt and black pepper to taste; Toss gently to combine; Garnish with fresh oregano leaves before serving;'),(2,2,'2 large eggplants, sliced; 1 lb ground beef; 1 onion, chopped; 2 cloves garlic, minced; 1 can (14 oz) diced tomatoes; 1 teaspoon dried oregano; Salt and black pepper to taste; Olive oil; 2 cups milk; 1/4 cup butter; 1/4 cup all-purpose flour; Salt and nutmeg to taste; Grated Parmesan cheese;','Preheat the oven to 375°F (190°C); Brush the eggplant slices with olive oil and bake them until tender and lightly browned; In a skillet, sauté the chopped onion and minced garlic in olive oil until translucent; Add the ground meat and cook until browned. Stir in diced tomatoes, dried oregano, salt, and black pepper. Simmer for a few minutes; For the béchamel sauce, melt butter in a saucepan, add flour, and cook for a minute. Gradually whisk in milk until smooth and thickened. Season with salt and a pinch of nutmeg; In a baking dish, layer half of the cooked eggplant slices, followed by the meat mixture, and then the remaining eggplant slices; Pour the béchamel sauce over the top, spreading it evenly; Sprinkle grated Parmesan cheese on top; Bake in the preheated oven for about 45 minutes, until golden and bubbly; Allow the moussaka to cool slightly before serving;'),(3,3,'1 package phyllo dough, thawed; 1 lb fresh spinach, chopped; 1 onion, chopped; 2 cloves garlic, minced; 1/2 cup feta cheese, crumbled; 1/4 cup fresh dill, chopped; Olive oil; Salt and black pepper to taste;','Preheat the oven to 375°F (190°C); In a skillet, sauté the chopped onion and minced garlic in olive oil until translucent; Add the chopped spinach and cook until wilted; Allow to cool and drain excess liquid; In a bowl, mix the cooked spinach, crumbled feta cheese, chopped dill, salt, and black pepper; Brush a baking dish with olive oil; Lay one sheet of phyllo dough in the baking dish, brushing it lightly with olive oil. Repeat with several more sheets, overlapping each other; Spread the spinach and cheese mixture evenly over the phyllo layers; Layer more sheets of phyllo on top, brushing each sheet with olive oil; Bake in the preheated oven for about 30-40 minutes, until golden and crisp; Allow to cool slightly before cutting into squares;'),(4,4,'1 cucumber, grated and drained; 2 cups Greek yogurt; 2 cloves garlic, minced; 1 tablespoon fresh dill, chopped; 1 tablespoon lemon juice; Extra-virgin olive oil; and black pepper to taste;','Grate the cucumber and squeeze out excess moisture; In a bowl, combine the grated cucumber, Greek yogurt, minced garlic, chopped dill, and lemon juice; Drizzle with extra-virgin olive oil and season with salt and black pepper; Mix well and refrigerate for at least an hour before serving; Drizzle with more olive oil before serving, if desired;'),(5,5,'1 lb boneless chicken, pork, or lamb, cut into cubes; 1/4 cup olive oil; 2 tablespoons lemon juice; 2 cloves garlic, minced; 1 teaspoon dried oregano; Salt and black pepper to taste; Wooden skewers, soaked in water;','In a bowl, mix olive oil, lemon juice, minced garlic, dried oregano, salt, and black pepper to make the marinade; Add the cubed meat to the marinade, ensuring it\'s well coated. Cover and refrigerate for at least 30 minutes to marinate; Preheat a grill or grill pan over medium-high heat; Thread the marinated meat cubes onto the soaked wooden skewers; Grill the skewers, turning occasionally, until the meat is cooked through and slightly charred on the edges; Serve the souvlaki with pita bread, sliced onions, tomatoes, and Tzatziki sauce.;'),(6,6,'12 oz spaghetti; 2 large eggs; 1 cup grated Pecorino Romano cheese; 4 oz pancetta or guanciale, diced; 2 cloves garlic, minced; Salt and black pepper to taste; Fresh parsley for garnish;','Cook the spaghetti in a pot of salted boiling water until al dente. Reserve about 1 cup of pasta water before draining; In a bowl, whisk together the eggs, grated cheese, salt, and black pepper; In a skillet, cook the diced pancetta or guanciale until crispy. Add minced garlic and cook for another minute; Remove the skillet from heat and add the cooked pasta, tossing to coat with the pancetta and garlic; Quickly pour the egg and cheese mixture over the pasta, tossing continuously to create a creamy sauce. Use a bit of reserved pasta water to adjust the consistency if needed; Serve immediately with a sprinkle of fresh parsley.;'),(7,7,'Pizza dough (store-bought or homemade); 1/2 cup tomato sauce; 8 oz fresh mozzarella cheese, sliced; Fresh basil leaves; Olive oil; Salt and black pepper to taste;','Preheat your oven to the highest temperature it can reach; Roll out the pizza dough on a floured surface to your desired thickness; Place the rolled-out dough on a baking sheet or pizza stone; Spread the tomato sauce evenly over the dough; Arrange the slices of fresh mozzarella on top; Drizzle with olive oil and season with salt and black pepper; Bake in the preheated oven until the crust is golden and the cheese is bubbly (usually around 10-15 minutes); Remove from the oven, sprinkle with fresh basil leaves, and let it cool slightly before slicing.;'),(8,8,'Baguette or Italian bread, sliced; Ripe tomatoes, diced; Fresh basil, chopped; Garlic cloves, peeled; Extra-virgin olive oil; Salt and black pepper to taste;','Preheat a grill or grill pan over medium-high heat; Brush the bread slices with olive oil on both sides; Grill the bread slices until toasted and grill marks appear; Rub one side of the toasted bread with a garlic clove for flavour; In a bowl, combine the diced tomatoes, chopped basil, a drizzle of olive oil, salt, and black pepper; Spoon the tomato mixture onto the garlic-rubbed side of the toasted bread; Serve immediately as an appetizer.;'),(9,9,'1 cup Arborio rice; 1/2 cup dry white wine (optional); 4 cups chicken or vegetable broth; 1 small onion, finely chopped; 2 tablespoons butter; 1/2 cup grated Parmesan cheese; Salt and black pepper to taste;','In a saucepan, warm the broth over low heat, In a separate large pan, melt 1 tablespoon of butter and sauté the chopped onion until translucent; Add the Arborio rice to the pan and toast it for a couple of minutes; If using wine, pour it into the pan and let it simmer until mostly absorbed; Gradually add warm broth to the rice, one ladleful at a time, stirring continuously until the liquid is absorbed. Repeat until the rice is creamy and cooked al dente; Remove from heat, stir in the remaining butter and grated Parmesan cheese; Season with salt and black pepper to taste; Let the risotto rest for a minute before serving.;'),(10,10,'3 medium beets, peeled and grated; 1 large potato, peeled and diced; 1 carrot, peeled and grated; 1 onion, chopped; 2 cloves garlic, minced; 4 cups beef or vegetable broth; 1 cup cabbage, shredded; 1 can (14 oz) diced tomatoes; 2 tablespoons vegetable oil; Salt and pepper to taste; Sour cream for serving; Fresh dill for garnish;','In a large pot, sauté the onions and garlic in vegetable oil until translucent; Add grated beets, carrots, and diced potatoes. Sauté for about 5-7 minutes; Pour in the broth and bring to a boil. Reduce heat and simmer for 20 minutes; Add shredded cabbage and diced tomatoes with their juice. Simmer for an additional 15-20 minutes; Season with salt and pepper to taste; Serve hot with a dollop of sour cream and a sprinkle of fresh dill.;'),(11,11,'2 cups all-purpose flour; 1/2 teaspoon salt; 1/2 cup water; 1/2 pound ground beef and/or pork; 1 small onion, finely chopped; Salt and pepper to taste;','In a bowl, combine flour and salt. Gradually add water, kneading to form a smooth dough. Let it rest for 30 minutes; Meanwhile, mix the ground meat, chopped onion, salt, and pepper in another bowl; Roll out the dough thinly on a floured surface and cut out circles using a glass or a round cutter; Place a small amount of the meat mixture in the center of each circle; Fold the circles in half and pinch the edges to seal, creating a semi-circular dumpling; Bring a pot of salted water to a boil and cook the pelmeni until they float to the surface (about 5-7 minutes); Serve hot with sour cream or vinegar.;'),(12,12,'1 cup all-purpose flour; 1 cup milk; 1 egg; 1 tablespoon melted butter; Pinch of salt; Butter or oil for cooking; Sour cream, jam, or caviar for serving;','Whisk together flour and salt in a bowl; In a separate bowl, beat the egg and then add milk and melted butter, mix well; Gradually add the wet ingredients to the dry ingredients, whisking until you have a smooth batter. Let it rest for 15-20 minutes; Heat a non-stick skillet over medium heat and add a small amount of butter or oil; Pour a ladleful of batter into the skillet, swirling to coat the bottom evenly; Cook until the blini is set and the edges are slightly golden. Flip and cook the other side; Repeat with the remaining batter; Serve the blini with your choice of fillings and toppings.;'),(13,13,'3 large potatoes, boiled and diced; 2 carrots, boiled and diced; 1 cup cooked peas; 1/2 cup diced cooked ham or bologna; 1/2 cup diced pickles; 1/2 cup diced cooked chicken or boiled eggs; 1/2 cup mayonnaise; Salt and pepper to taste;','Combine the diced potatoes, carrots, peas, ham, pickles, and chicken/eggs in a large bowl; Add mayonnaise and gently mix until everything is well coated; Season with salt and pepper to taste; Chill in the refrigerator for at least an hour before serving.;'),(14,14,'1 cup cottage cheese; 1 egg; 2 tablespoons sugar; 1/2 teaspoon vanilla extract; 1/2 cup all-purpose flour; Pinch of salt; Butter or oil for cooking; Sour cream or jam for serving;','In a bowl, mix together cottage cheese, egg, sugar, and vanilla extract until well combined; Gradually add flour and a pinch of salt, stirring until a thick batter forms; Heat a skillet over medium heat and add butter or oil; Spoon the batter onto the skillet to form pancakes. Flatten them slightly with the back of the spoon; Cook until golden brown on both sides; Serve hot with sour cream or jam.;');
/*!40000 ALTER TABLE `instructions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `italy_cuisine`
--

DROP TABLE IF EXISTS `italy_cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `italy_cuisine` (
  `id_course` int NOT NULL,
  `course_name` varchar(45) DEFAULT '',
  `spaghetti` int DEFAULT '0',
  `egg` int DEFAULT '0',
  `Pecorino Romano cheese` int DEFAULT '0',
  `onion` int DEFAULT '0',
  `garlic` int DEFAULT '0',
  `pizza dough` int DEFAULT '0',
  `parmesan cheese` int DEFAULT '0',
  `tomato` int DEFAULT '0',
  `mozzarella cheese` int DEFAULT '0',
  `baguette` int DEFAULT '0',
  `rice` int DEFAULT '0',
  `chicken` int DEFAULT '0',
  PRIMARY KEY (`id_course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `italy_cuisine`
--

LOCK TABLES `italy_cuisine` WRITE;
/*!40000 ALTER TABLE `italy_cuisine` DISABLE KEYS */;
INSERT INTO `italy_cuisine` VALUES (6,'Spaghetti Carbonara',1,1,1,0,1,0,0,0,0,0,0,0),(7,'Margherita Pizza',0,0,0,0,0,1,0,1,1,0,0,0),(8,'Bruschetta',0,0,0,0,1,0,0,1,0,1,0,0),(9,'Risotto',0,0,0,1,0,0,1,0,0,0,1,1);
/*!40000 ALTER TABLE `italy_cuisine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `russian_cuisine`
--

DROP TABLE IF EXISTS `russian_cuisine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `russian_cuisine` (
  `id_course` int NOT NULL,
  `course_name` varchar(45) DEFAULT '',
  `beet` int DEFAULT '0',
  `potato` int DEFAULT '0',
  `carrot` int DEFAULT '0',
  `onion` int DEFAULT '0',
  `garlic` int DEFAULT '0',
  `beef` int DEFAULT '0',
  `cabbage` int DEFAULT '0',
  `tomato` int DEFAULT '0',
  `flour` int DEFAULT '0',
  `pork` int DEFAULT '0',
  `milk` int DEFAULT '0',
  `egg` int DEFAULT '0',
  `peas` int DEFAULT '0',
  `ham` int DEFAULT '0',
  `cucamber` int DEFAULT '0',
  `cottage cheese` int DEFAULT '0',
  PRIMARY KEY (`id_course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `russian_cuisine`
--

LOCK TABLES `russian_cuisine` WRITE;
/*!40000 ALTER TABLE `russian_cuisine` DISABLE KEYS */;
INSERT INTO `russian_cuisine` VALUES (10,'Borscht',1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0),(11,'Pelmeni',0,0,0,1,0,1,0,0,1,1,0,0,0,0,0,0),(12,'Blini',0,0,0,0,0,0,0,0,1,0,1,1,0,0,0,0),(13,'Olivier Salad',0,1,1,0,0,0,0,0,0,0,0,1,1,1,1,0),(14,'Syrniki',0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,1);
/*!40000 ALTER TABLE `russian_cuisine` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-01 13:21:15
