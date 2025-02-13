<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Success</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
        .div{
            color : black;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }
        .container {
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            width: 90%;
            max-width: 900px;
            text-align: center;
        }
        .container h2 {
            margin-bottom: 20px;
            color : black;
        }
        .account-info {
            margin-bottom: 20px;
            text-align: left;
        }
        .button {
            display: inline-block;
            margin: 10px 5px;
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
        .button-secondary {
            background-color: #5bc0de;
        }
        .button-secondary:hover {
            background-color: #31b0d5;
        }
        .fa {
            margin-right: 8px;
        }
  		</style>
</head>
<body>
    <div class="container">
        <h2>Registration Successful</h2>
        <p class="message">The customer has been successfully registered. Thank you!</p>
        <a href="adminDashboard.jsp" class="button"><i class="fa fa-home"></i> Back to Dashboard</a>
    </div>
</body>
</html>
