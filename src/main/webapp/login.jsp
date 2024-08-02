<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(  #00FFFF 25%, #F8BBD0 75%);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }
        .container {
            text-align: center;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
            width: 350px;
            margin: auto;
        }
        h1 {
            margin: 0;
            font-size: 28px;
            color: #1976D2; /* Blue color */
        }
        h2 {
            margin: 15px 0 25px;
            font-size: 22px;
            color: #D81B60; /* Pink color */
        }
        form {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            text-align: left;
            color: #1976D2; /* Blue color */
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid #1976D2; /* Blue color */
            border-radius: 8px;
            box-sizing: border-box;
            background-color: #E3F2FD; /* Light blue color */
        }
        input[type="submit"] {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 8px;
            background-color: #D81B60; /* Pink color */
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #C2185B; /* Darker pink color */
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Employee Time Tracker</h1>
        <h2>Login</h2>
        <form action="LoginServlet" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password">
            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>
