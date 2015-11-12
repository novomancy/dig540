## 008 - PHP and Databases

We've made it to the part of the class where we can start to put the pieces together by tying PHP to MySQL databases. In this class we're using a feature of PHP called PDO to do that. These videos will walk you through how to use PDO to connect PHP to a database, extend a PHP class to mirror the object structure of a model you put into MySQL, and integrate that function into a form.

**Videos**

The files I ended up with after creating these videos are in the examples directory for you to look at.

- Intro to PDO: <https://vimeo.com/145471656>
- Inserting data into a database: <https://vimeo.com/145471724>
- Reading data out of a database: <https://vimeo.com/145472925>
- Integration with HTML: <https://vimeo.com/145473106>
- Assignment video: <https://vimeo.com/145471532>
- Intro to the final project: <https://vimeo.com/145471533>

**Links**
PDO Tutorial: <http://codular.com/php-pdo-how-to>
Omeka Tutorials: <http://omeka.readthedocs.org/en/latest/Tutorials/index.html#plugin-basics>

**Assignment**

Create a PHP class and matching SQL table. To do this, you have to set up a config file to connect PDO to your database and a PHP class that uses PDO to read and write data to a database. Your class should getters and setters for each of its properties, a constructor, and database functions to manage create, read, update, and delete functions. You should also add a function that gets back a list of rows in your table and search your table using a given string.

This assignment is due on Wednesday November 18th at noon.
