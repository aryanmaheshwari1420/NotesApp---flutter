const express = require('express');
const app = express();

const mongoose = require('mongoose');
// until mongoose not connect server will not start
mongoose.connect("mongodb+srv://aryanmaheshwari1420:rr1234@cluster0.ehf7z7f.mongodb.net/notesdb").then(function(){

//Home Route ex - "/"
app.get("/", function (req, res) {
   res.send("This is the HomePage");
});

app.get("/notes", function (req, res) {
    res.send("This is the Notes Page");
 });

});




const port = 5000; 

app.listen(port, () => {
   console.log(`Server is running on port ${port}`);
});
