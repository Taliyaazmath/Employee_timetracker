<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="java.sql.*"%>

<%
    // Get the session
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return; // Prevent further processing if the user is not logged in
    }

    // Retrieve username from the session
    String username = (String) session.getAttribute("username");
    int userId = 0;
    String dbUrl = "jdbc:mysql://localhost:3306/EmployeeTaskTracker";
    String dbUser = "root";
    String dbPass = "12345678910@goat";

    // Query to get user_id from username
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
        PreparedStatement ps = con.prepareStatement("SELECT user_id FROM Users WHERE username=?");
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            userId = rs.getInt("user_id");
        }
        rs.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Task Management</title>
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

        form {
            background-color: rgba(255, 255, 255, 0.9); /* Light white with some transparency */
            padding: 20px;
            border-radius: 8px;
            display: inline-block;
            margin-bottom: 20px;
            width: 80%; /* Adjust the width of the form */
            max-width: 800px; /* Optional: max width to prevent excessive stretching */
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        input[type="text"], input[type="date"], input[type="time"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        textarea {
            height: 100px;
        }

        input[type="submit"] {
            background-color: #ff69b4; /* Light pink */
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #ff1493; /* Darker pink */
        }

        table {
            width: 100%; /* Set the table width to 100% of its container */
            border-collapse: collapse;
            margin-top: 20px;
            table-layout: fixed; /* Ensures columns and table width are consistent */
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #00ffff; /* Light cyan */
            color: #000;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            text-decoration: none;
            color: #ffffff;
            background-color: #ff69b4; /* Light pink */
            padding: 5px 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #ff1493; /* Darker pink */
        }
    </style>
</head>
<body>
    <h2>Task Management for <%= username %></h2>
    <form action="TaskServlet" method="get">
        <input type="hidden" name="userId" value="<%= userId %>">
        <label for="project">Project:</label>
        <input type="text" id="project" name="project"><br><br>
        <label for="date">Date:</label>
        <input type="date" id="date" name="date"><br><br>
        <label for="startTime">Start Time:</label>
        <input type="time" id="startTime" name="startTime"><br><br>
        <label for="endTime">End Time:</label>
        <input type="time" id="endTime" name="endTime"><br><br>
        <label for="category">Category:</label>
        <input type="text" id="category" name="category"><br><br>
        <label for="description">Description:</label>
        <textarea id="description" name="description"></textarea><br><br>
        <input type="submit" value="Add Task">
    </form>
    <h3>Your Tasks</h3>
    <table border="1">
        <tr>
            <th>Project</th>
            <th>Date</th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Category</th>
            <th>Description</th>
            <th>Actions</th>
        </tr>
        <%
            try {
                Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPass);
                PreparedStatement ps = con.prepareStatement("SELECT * FROM Tasks WHERE employee_id=?");
                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("project") %></td>
            <td><%= rs.getDate("date") %></td>
            <td><%= rs.getTime("start_time") %></td>
            <td><%= rs.getTime("end_time") %></td>
            <td><%= rs.getString("category") %></td>
            <td><%= rs.getString("description") %></td>
            <td>
                <a href="EditTaskServlet?taskId=<%= rs.getInt("task_id") %>">Edit</a>
                <a href="DeleteTaskServlet?taskId=<%= rs.getInt("task_id") %>">Delete</a>
            </td>
        </tr>
        <%
                }
                rs.close();
                ps.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
    <a href="dashboard.jsp">Back to Dashboard</a>
</body>
</html>
