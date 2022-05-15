# Instruction for testing with docker

- Change the path in your docker-compose.yml 
- `cd student_docker`
- run `docker-compose up -d`

# Instruction to check network IP for database connection
- `docker network inspect student_docker_default`
- look for `student-docker-mariadb-1`
- and in there find similar to `IPAddress: "172.20.0.2/16"`

# When running into error while trying to connect sql server
if you overcome this error:
`Fatal error: Uncaught Error: Call to undefined function mysqli_connect()`


Despite the Dockerfile having this dependency defined, it's not working at this time but there is a way to manually fix it (at least temporarily so you may work on the assignment.)


## Inside your terminal...
- run `docker ps -a` (you need your docker running to work)
- you should see 3 or 4 entries there, now grab the `CONTAINER ID` for the student_docker_php-apache container, which will look something like `f3e478b43e21`
- After that, run `docker exec (YOUR ID) docker-php-ext-install mysqli`
- Then run `docker exec (YOUR ID) apachectl restart`


This will install the missing dependency and should put you back on track with richards video where the next error is about the table 'db.post' not existing (as it shouldn't yet). 
**Ignore the "warning" you get after running the apachectl restart command.**