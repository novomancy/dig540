## Final Project Description

The final project for this class will be to create a minimal exhibition site for a small set of data and images.

In this course we spend a lot of time thinking about the infrastructure that goes into a digital exhibition. That focus is reflected in how I'm using the word 'minimal' here. When I say 'minimal' I mean that I am not asking for a high-gloss, polished aesthetic experience that you might think of as an idea exhibition site. Instead, I want you to focus on the topics that we've discussed throughout the course:

- How can relationships between items make an exhibition more useful or interesting?
- What database models support those interesting relationships?
- What does it take to normalize messy cultural data into computational database structures?
- How can raw database info be input, searched, and extracted into human-readable pages?

I am leaving the specific content of your site up to you, both in terms of the type and scope of the cultural data you choose. However, there are a number of technical requirements that you need to include in your final site:

- The site must use the technologies we have discussed this semester (MySQL, PHP).
- The site must display records describing at least three types of objects. (For example, in the data we've used throughout the semester the objects were things like albums, songs, and artists).
- The schema for your site should include one-to-many and many-to-many relationships.
- The site must include lists of objects, display pages focusing on single objects, and search results.
- Single record display pages must include textual and image data. Images may be loaded from external sites (i.e., you can just store URLs to images that already exist out on the web in your database and display those if you don't want to store images on your own site).
- Users must be able to navigate between different objects and different types of objects based on the relationships between them.
- The site must be able to import data into the database from one or more csv files (note that your PHP code has to drive this-I don't mean just importing through the phpMyAdmin interface). Therefore, you will also have to create those csv files for your dataset and craft them in such a way that they can be imported into your normalized database schema.

In addition to the site itself, I am asking for a brief (1 page max) description of what aspects of your dataset you chose to highlight and how those aspects are supported by your data structure. This is meant as informal didactic text to help me understand the thinking behind your site, not a formal paper of any sort. You don't need to spend a lot of time on it. As long as it is clearly written and addresses any thorny issues you ran into while making design/modeling decisions about your site, I'll be happy with it.

Over the next couple of weeks I am going to continue to demonstrate code examples using the CDDB data (including the code required to implement several of the requirements above). I am also going to give some assignments based on that data. However, you should feel free to replace the CDDB data with your own once you have developed your project idea to the stage where it is possible to do so. I am happy to give feedback on your code regardless of whether you are using the sample data or your final project data.

To submit your project you will need to send me all of the PHP files you write, any csv files with source data, any images that are part of your site (as opposed to displayed using an external URL), and an export of your complete database (data and structure) as an sql file. Those files can be submitted either via github or as a zip file sent in Slack. I will also need the URL to where I can see your completed site on Reclaim. *If you submit via github remember that github is public and not meant for sensitive information like passwords or potentially-IP restricted content like copyrighted images.*

More information on the requirements above is in the video here: <https://vimeo.com/246180791>

The final project is due Dec. 18, the last day of finals week. 