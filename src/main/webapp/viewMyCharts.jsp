<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>

<%
    //HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>View My Charts</title>
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
            color: black;
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

        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9); /* Light white with some transparency */
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>My Charts</h2>
        <ul>
            <li><a href="dailyChart.jsp">View Daily Chart</a></li>
            <li><a href="weeklyChart.jsp">View Weekly Chart</a></li>
            <li><a href="monthlyChart.jsp">View Monthly Chart</a></li>
        </ul>
        <a href="dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
