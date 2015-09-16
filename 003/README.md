## Week 3 - Database Normalization

For this batch of videos we're going to take a closer look at the CDDB and FreeDB formats and see how they compare to the kind of data structures that we'll be studying most this semester, relational databases. This will also be the first time that you need to submit your assignment via GitHub - don't worry, there are instructions below on how to do that!

I will be at a conference next week and I'm not sure what my schedule will look like, so you may or may not get new feedback/content on Wednesday the 23rd. I'll let you know when I have a better idea of what's going on.

**GitHub**
See the GitHub video below on how to update your fork of the class with this week's content and then submit your assignment. Note that, although I use a text file in the example, you can put any file you want in a directory tracked by git and it will sync up to the server. This week you'll be turning in a .txt text file and a .png graphic.

**Videos**

(Yes, some of these videos look different than others. They were recorded at different times...just go with it! :)

- The FreeDB File Format: <https://vimeo.com/139494412>
- 1NF Database Normalization: <https://vimeo.com/74420806>
- 2NF Database Normalization: <https://vimeo.com/74423053>
- 3NF Database Normalization: <https://vimeo.com/74424001>
- Updating Forks and Submitting Assignments on GitHub: <https://vimeo.com/139494413>
- Using Gliffy: <https://vimeo.com/139494414>

*In the 2NF video, I create a one to one relationship between artists and discs. That's because I'm just creating a model based on the FreeDB file right now, and yes, it should be a many to many relationship in an actual relational database schema for this type of data.*

**Reading**
This is not required, but may be helpful: <http://www.phpbuilder.com/print/columns/barry20000731.php3>

Note that you don't need to worry about 4NF and 5NF right now.

**Assignment**

I want you to come up with a new exhibition site for audio tracks. There are a lot of music sites out there, but do they show off audio in the most effective way? Does the most effective way change based on the context of the content? For example, you probably want a different set of data and metadata when you're working with oral histories than, say, Beatles records.

In a text file, propose an interesting audio data set (it may exist in reality or only in your imagination) and identify what you want to show off about it in a digital exhibition space. The space may be network-based or sited. Using FreeDB/CDDB as your baseline, describe a set of fields that extend that baseline to capture whatever you need to run your more contextually-aware exhibition. Then, go to Gliffy and create a database diagram that shows your new schema. Save it as a .png, put it in the 003 directory along with your text file, and sync back to your GitHub fork so that I'll be able to see them on GitHub.com.

This assignment is due on Tuesday the 22nd at noon.
