<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@page import="jakarta.servlet.http.HttpServletResponse"%>
<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    } else {
        String role = (String) session.getAttribute("role");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
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

        a {
            text-decoration: none;
            color: #ffffff;
            font-size: 1.2em;
            margin: 10px;
            padding: 10px;
            display: inline-block;
            border-radius: 5px;
            background-color: rgba(255, 105, 180, 0.8); /* Light pink */
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        a:hover {
            background-color: rgba(255, 20, 147, 0.8); /* Darker pink */
            transform: scale(1.1);
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
    <h2>Welcome, <%= session.getAttribute("username") %></h2>
    <%
        if ("Admin".equals(role)) {
    %>
    <a href="adminPage.jsp">Admin Page</a><br>
    <%
        } else {
    %>
    <a href="taskPage.jsp">Task Management</a><br>
    <a href="associaterPage.jsp">View Asscociater</a>
    <%
        }
    %>
    <a href="LogoutServlet">Logout</a>
</body>
</html>
<%
    }
%>
