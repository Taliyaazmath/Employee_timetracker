<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>

<!--  
    //HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    } else if (!"Associate".equals(session.getAttribute("role"))) {
        response.sendRedirect("dashboard.jsp");
        return; // Redirect to dashboard if the user is not an associate
    }
-->
<!DOCTYPE html>
<html>
<head>
    <title>Associate Page</title>
    <style>
        /* Basic reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, cyan, pink);
            color: #333;
            text-align: center;
            padding: 20px;
        }

        h2 {
            color: #ffffff;
            font-size: 2em;
            margin-bottom: 20px;
        }

        ul {
            list-style-type: none;
            padding: 0;
            margin: 20px 0;
        }

        li {
            margin: 10px 0;
        }

        a {
            text-decoration: none;
            color: #ffffff;
            background-color: #ff69b4; /* Light pink */
            padding: 10px 20px;
            border-radius: 5px;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #ff1493; /* Darker pink */
        }

        a:visited {
            color: #ffffff;
        }

        a:active {
            background-color: rgba(255, 105, 180, 0.5);
        }
    </style>
</head>
<body>
    <h2>Associate Page</h2>
    <ul>
        <li><a href="viewMyCharts.jsp">View My Charts</a></li>
    </ul>
    <a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>
