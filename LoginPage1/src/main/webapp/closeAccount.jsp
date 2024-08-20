<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Close Account</title>
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
        .container {
            background-color: white;
            padding: 20px;
            width:50%;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            text-align: center;
        }
        .container h2 {
            margin-bottom: 20px;
        }
        .button {
            display: inline-block;
            margin: 10px 5px;
            padding: 10px 20px;
            color: white;
            background-color: #d9534f;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .button-primary {
            background-color:  #4CAF50;
        }
        .button-secondary {
            background-color: red;
        }
        .fa {
            margin-right: 8px;
        }
    </style>
</head>
<body>
<div class = container>
    <h2>Close Account</h2>
    <form action="CloseAccountServlet" method="post">
        <label for="confirm">Are you sure you want to close your account?</label><br><br>
        <input type="submit" value="Yes" class="button">
        <a href="customerDashboard.jsp" class="button button-secondary"><i class="fa fa-times"></i> No</a>
    </form>
</div>
</body>
</html>
