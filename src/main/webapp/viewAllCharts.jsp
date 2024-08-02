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
    <meta charset="UTF-8">
    <title>View All Charts</title>
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
        }

        li {
            margin: 10px 0;
        }

        a {
            text-decoration: none;
            color: #ffffff;
            background-color: #ff69b4; /* Light pink */
            padding: 8px 16px;
            border-radius: 4px;
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
    <h2>Charts Overview</h2>
    <ul>
        <li><a href="AllDailyChart.jsp">View Daily Chart</a></li>
        <li><a href="AllWeeklyChart.jsp">View Weekly Chart</a></li>
        <li><a href="AllMonthlyChart.jsp">View Monthly Chart</a></li>
    </ul>
    <a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>
