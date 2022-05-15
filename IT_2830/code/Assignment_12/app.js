const express = require('express')
const app = express()
const path = require('path') 
const port = 3000;
app.use(express.static(__dirname))

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '/index.html'))
})
// This is just another way to get root to load html file 
// app.get('/', (req, res) => {
//     res.sendFile(__dirname +'/index.html')
// })

app.listen(port, () => {
  console.log(`Server running at port:${port}/`);
});
