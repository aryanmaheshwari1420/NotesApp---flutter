const express = require('express');
const app = express();

const mongoose = require('mongoose');
// until mongoose not connect server will not start
const Note = require('./models/Note')
mongoose.connect("mongodb+srv://aryanmaheshwari1420:rr1234@cluster0.ehf7z7f.mongodb.net/notesdb").then(function(){

//Home Route ex - "/"
app.get("/", function (req, res) {
   res.send("This is the HomePage");
});

app.get("/notes/list", async function (req, res) {
   var notes = await Note.find();
   res.json(notes);
   //  res.send("This is the Notes Page");
 });

app.get("/notes/add",async function (req, res) {
   const newNote = new Note({
      id:1001,
      title:"this is the first title",
      content:"this in the content",
      userid:"aryanmaheshwari1402@gmail.com"
   });
   await newNote.save();

   const response = {message:"New Note created!"};
   res.json(response);

});

});




const port = 5000; 

app.listen(port, () => {
   console.log(`Server is running on port ${port}`);
});
