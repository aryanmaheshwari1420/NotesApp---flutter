require('dotenv').config();
const express = require("express");
const app = express();

const bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// true --> Nested Objects (correct)
// false --> Nested Objecs (not correct)
const mongoose = require("mongoose");
// until mongoose not connect server will not start
const Note = require("./models/Note");
// const MongoUrl =
//   "mongodb+srv://aryanmaheshwari1420:rr1234@cluster0.ehf7z7f.mongodb.net/notesdb";
mongoose.connect(process.env.MONGO_URI).then(function () {
  //Home Route ex - "/"
  app.get("/", function (req, res) {
    const response = { message: "API Works!" };
    res.json(response);
  });
  const noteRouter = require("./routes/Notes");
  app.use("/notes", noteRouter);
});

const PORT = process.env.PORT || 5000;
  
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
