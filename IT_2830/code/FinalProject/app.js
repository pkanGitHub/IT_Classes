const express = require('express')
const app = express()
const port = 3000;
// static files 
app.use(express.static('public'))
// app.use(express.urlencoded({extended: false}))

// set views
// app.set('views', './views')
app.set('view engine', 'ejs')

// navigation
app.get('/', (req, res) => {
  res.render('home', {
    home:
      {
        "img": "images/home/me.jpg"
      }
  })
})

app.get('/about', (req, res) => {
  res.render('about', {
    bio: 
    {
      title: "Bio"
    }
  })
})

app.get('/skills', (req, res) => {
  res.render('skills', {
    skills:[
      {
        "name": "Ruby",
        "img": "images/skills/ruby.png"
      },
      {
        "name": "Rails",
        "img": "images/skills/rails.png"
      },
      {
        "name": "JavaScript",
        "img": "images/skills/javascript.png"
      },
      {
        "name": "CSS3",
        "img": "images/skills/css3.png"
      },
      {
        "name": "HTML5",
        "img": "images/skills/html5.png"
      },
      {
        "name": "Express.js",
        "img": "images/skills/expressjs.png"
      },
      {
        "name": "Node.js",
        "img": "images/skills/nodejs.png"
      },
      {
        "name": "React",
        "img": "images/skills/reactjs.png"
      },
      {
        "name": "Redux",
        "img": "images/skills/redux.png"
      },
      {
        "name": "PHP + MySQL",
        "img": "images/skills/php&mysql.png"
      }
    ]
  })
})

app.get('/objective', (req,res) => {
  res.render('objective', {
    objective: 
    {
      title: "Post Graduation",
    },
    newSkills: [
      {
      "name": "SwiftUI",
      "img": "images/objective/swiftui.png"
      },
      {
        "name": "Python",
        "img": "images/objective/python.png"
      }
    ]
  })
})

app.listen(port, () => {
  console.log(`Server running at port:${port}/`);
});
