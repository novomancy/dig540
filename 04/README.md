## Unit 4 - Database Normalization

For this batch of videos we're going to take a closer look at the CDDB and FreeDB formats and see how they compare to the kind of data structures that we'll be studying most this semester, relational databases. This will also be the first time that you need to submit your assignment via GitHub - don't worry, there are instructions below on how to do that!

**GitHub**

See the GitHub video below on how to update your fork of the class with this week's content and then submit your assignment. Note that, although I use a text file in the example, you can put any file you want in a directory tracked by git and it will sync up to the server. This week you'll be turning in a .txt text file and a .png graphic.

**Videos**

- The FreeDB File Format: <https://vimeo.com/139494412> (With the closing of freedb last year, the reference file is no longer available at the URL shown in the video. I have added it to the 04 folder here for you to look over.)
- 1NF Database Normalization: <https://vimeo.com/74420806>
- 2NF Database Normalization: <https://vimeo.com/74423053>
- 3NF Database Normalization: <https://vimeo.com/74424001>
- Updating Your Syllabus Fork: <https://vimeo.com/234756098>
- Resolving Git Conflicts in DSC: <https://vimeo.com/234755868>
- Submitting Assignments on GitHub: <https://vimeo.com/234756048>
- Using LucidChart: <https://vimeo.com/293813410> 

*Note 1: In the 2NF video, I create a one to one relationship between artists and discs. That's because I'm just creating a model based on the FreeDB file right now, and yes, it should be a many to many relationship in an actual relational database schema for this type of data.*

*Note 2: Apologies that the fork update video is a bit choppy; GitHub doesn't like what I'm trying to do by simulating multiple user accounts. Just let me know if you run into any trouble in Slack. It just goes to show though: despite being incredibly useful, git can also be a real pain point in any development workflow!*

**Reading**

This is not required, but may be helpful: <https://www.essentialsql.com/get-ready-to-learn-sql-database-normalization-explained-in-simple-english/>

Note that there is also a 4NF and 5NF if you look around at other references, but you don't need to worry about them right now.

**Assignment**

To some extent, this assignment builds on what you did over the last week. I'll get feedback to you on that by the end of the weekend, but you should feel free to keep moving forward before you hear from me. If you run into questions before I review your lsat assignment, just ask!

I want you to come up with a new exhibition site for audio tracks. There are a lot of music sites out there, but do they show off audio in the most effective way? Does the most effective way change based on the context of the content? For example, you probably want a different set of data and metadata when you're working with oral histories than, say, Beatles records.

In a text file, propose an interesting audio data set (it may exist in reality or only in your imagination) and identify what you want to show off about it in a digital exhibition space. The space may be network-based or sited. Using FreeDB/CDDB as your baseline, describe a set of fields that extend that baseline to capture whatever you need to run your more contextually-aware exhibition. Then, go to LucidChart and create a database diagram that shows your new schema. Export it as a (yourname).png, put it in the 004 directory along with your text file, and sync back to your GitHub fork so that I'll be able to see them on GitHub.com.

*Note 3: Just to be clear, submitting something to github is inherently making it public. If you do not wish for your name to be attached to the image you can put some other unique identifier on there–just let me know what it is in Slack.*

This assignment is due on Wednesday the 30th at 11:59PM.