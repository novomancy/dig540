## Unit 8 - PHP and HTML

This unit will introduce you to how HTML and PHP work together to render a web page. Though a full HTML tutorial is beyond the scope of this course, you'll need to know at least a little bit about it in order to make the results of your PHP code readable and understandable. There are links in the resources section below if you want to learn more about it, and of course I'm happy to answer any questions in Slack. Similarly, I'm glossing over some aspects of PHP to get to the functional parts that we're working with in this unit so again, please ask questions in Slack!

**Videos**

- Intro to HTML: <https://vimeo.com/240903824>
- Intro to PHP: <https://vimeo.com/240906089>
- PHP Data Types: <https://vimeo.com/240901917>
- PHP Code Blocks: <https://vimeo.com/240905254>

**Resources**

- Bootstrap: <http://getbootstrap.com/docs/4.0/getting-started/introduction/> (this is the site with the HTML template in the video)
- HTML Reference Site: <https://www.w3schools.com/html/default.asp>
- PHP Reference Site: <https://www.w3schools.com/php/default.asp>

**A Word on Debugging**
You may notice I added two lines to the beginning of the parsealbum.php file:
~~~~
    error_reporting(E_ALL); 
    ini_set("display_errors", 1); 
~~~~
These lines of code will generate a file called error_log in the same directory as your PHP file that contains details on any error messages in your script. If you get a generic error (like an error 500, for instance) you can then check that error_log file for more details to help you debug. It's also useful to include an error message when you ask me a question!

**Assignment**

This assignment has two parts. First, I want you to combine the parsealbum code with the index.php code so that the album data appears inside the bootstrap HTML shell. (I've added a line to index.php showing you where to put it-remember to include the <?php and ?> tags from parsealbum!) 

Once that is done (tip: test it first before moving on to this part) I want you to modify the parsealbum code so that it outputs sensible HTML rather than just a whole bunch of text with line breaks. Sensible HTML, in this case, means:

- Add a `<div>` tag before and a `</div>` tag after the list of column headers
- Add a `<strong>` tag before and a `</strong>` tag after every time it prints out the "This is the #n album" line
- Add a `<span>` tag around every second row of genres/subgenres so it looks like each line alternates colors
- - Hint 1: You can determine if an integer is even by using `if($j % 2 == 0)` (see the modulus operator here: <https://www.w3schools.com/php/php_operators.asp>)
- - Hint 2: I showed you how to change the color of text inside a span in one of the videos

Once you've got that working on Reclaim, submit your complete index.php file to me on github or Slack. Also, please send me the URL where I can view it in Slack regardless of where you submit the code itself.

This assignment is due on Wednesday Nov 8 at noon.