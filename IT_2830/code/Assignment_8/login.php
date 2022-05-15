<?php 
    session_start();
    $message = '';

    if($_SERVER['REQUEST_METHOD'] === 'POST')
    {
        $con = mysqli_connect("172.19.0.3", "dbuser", "dbpass", "db");
        $result = mysqli_query($con, "SELECT * FROM user WHERE username='" . $_POST["username"] . "' and password = '" . $_POST["password"] .  "'");
        $row = mysqli_fetch_array($result);

        if(is_array($row))
        {
            $_SESSION['user_id'] = $row['id'];
            $_SESSION['username'] = $row['username'];
        }
        else
        {
            $message = "Invalid username or password";
        }
    }
    if(isset($_SESSION['user_id']))
    {
        header('Location:index.php');
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <form method="POST" action="login.php">
        <h3>Welcome, Please Log In</h3>
        <label for="username">Username:</label>
        <input type="text" name="username">
        <br/><br/>
        <label for="password">Password:</label>        
        <input type="password" name="password">
        <br/><br/>
        <input type="submit">
    </form>
</body>
</html>