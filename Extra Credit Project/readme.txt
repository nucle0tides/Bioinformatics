For this little extra credit project, I sought to do something similar to the following Gen/CS596 project that has long since been retired: http://web.cs.iastate.edu/~hhchou/home.htm . Since I did not have much to go off of except one webpage, I looked into how to accomplish a stripped down version of this.

The Linux box I'm using is a Raspberry Pi 2. Since I already had an Nginx server running on the pi for other purposes, I chose to use that.

In order to actually run Python scripts on an Nginx server, I had to use uWSGI.

After playing around with the concept of connecting form data to a cgi script, I had to decide on what I would actually make. Since I didn't actually want to implement any pairwise alignment algorithms in Python (I have finals to study for!), I chose to look for a way to do BLAST queries, similar to the exercise posted in the class notes, but with Python.

I found that BioPython had methods to make BLAST queries and decided to use that.

Currently, the script only runs basic BLAST searches, but there is an option to add more parameters.

Not knowing what to show the user of my amazing BLAST machine, I chose to show the prediction heading, length of the sequence, the score, e-value, and other information.
