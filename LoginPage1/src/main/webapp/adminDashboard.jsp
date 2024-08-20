<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
<link rel="stylesheet" type="text/css" href="styles.css">
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
        .header {
            background-color: #4CAF50;
            color: white;
            padding: 10px 0;
            text-align: center;
        }
        .container {
            margin: 20px auto;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            max-width: 800px;
            background-color: white;
        }
        .button {
            display: inline-block;
            margin: 10px 0;
            padding: 10px 20px;
            color: white;
            background-color: #4CAF50;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .button:hover {
            background-color: #45a049;
        }
        .button-secondary{
        	background-color:red;
        }
        .fa {
            margin-right: 8px;
        }
    </style>
</head>
<body>
<div align = center>
<form>
<div class = container>
<h2>Welcome, <%= session.getAttribute("username") %></h2>
<a href="registerCustomer.jsp" class="button"><i class="fa fa-user-plus"></i>Register Customer</a> 
<a href="viewCustomer.jsp" class="button"><i class="fa fa-users"></i> View Customers</a>
<a href="logout.jsp" class="button button-secondary"><i class="fa fa-sign-out-alt"></i> Logout</a>
</div>
</form>
</div>
</body>
</html>
