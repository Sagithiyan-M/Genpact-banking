<%@ page import="java.util.*, java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Customers</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: white;
            padding: 20px;
            justify-content: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            width: 100%;
            align-items: center;
            max-width: 1200px;
            text-align: center;
            box-sizing: border-box;
        }
        .container h2 {
            margin-bottom: 20px;
            justify-content: center;
            color: #333;
        }
        table {
            width: 100%;
            justify-content: center;
            margin-bottom: 20px;
            text-align: left;
        }
        th, td {
            padding: 3px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #4CAF50;
            color: #fff;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            color: white;
            background-color: #4CAF50;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
            cursor: pointer;
            margin-top: 40%;
            box-sizing: border-box;
        }
        .button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class = container>
<h2>Customer List</h2>
    <table border="1">
        <tr>
            <th>Customer ID</th>
            <th>Full Name</th>
            <th>Address</th>
            <th>Mobile No</th>
            <th>Email ID</th>
            <th>Account Type</th>
            <th>Initial Balance</th>
            <th>Date of Birth</th>
            <th>Account No</th>
            <th>Password</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BankingSystem", "root", "user@123");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM Customer");
                
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("customer_id") + "</td>");
                    out.println("<td>" + rs.getString("full_name") + "</td>");
                    out.println("<td>" + rs.getString("address") + "</td>");
                    out.println("<td>" + rs.getString("mobile_no") + "</td>");
                    out.println("<td>" + rs.getString("email_id") + "</td>");
                    out.println("<td>" + rs.getString("account_type") + "</td>");
                    out.println("<td>" + rs.getDouble("initial_balance") + "</td>");
                    out.println("<td>" + rs.getDate("date_of_birth") + "</td>");
                    out.println("<td>" + rs.getString("account_no") + "</td>");
                    out.println("<td>" + rs.getString("password") + "</td>");
                    out.println("</tr>");
                }
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</div>
    <a href="adminDashboard.jsp" class="button">Back to Dashboard</a>
</body>
</html>