<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WELCOME</title>
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
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            width: 80%;
            max-width: 400px;
            text-align: center;
        }
        .header {
            font-size: 28px;
            margin-bottom: 20px;
            color: #333;
        }
        .button-container {
            margin-top: 20px;
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 18px;
            text-decoration: none;
            background-color: #4CAF50; /* Consistent green button color */
            color: #fff;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
            cursor: pointer;
            margin: 5px;
            text-align: center;
        }
        .button:hover {
            background-color: #45a049; /* Slightly darker green on hover */
            transform: scale(1.05);
        }
        .button:active {
            transform: scale(0.98);
        }
        @media (max-width: 480px) {
            .container {
                padding: 15px;
            }
            .button {
                display: block;
                width: 100%;
                margin: 10px 0;
            }
        }
    </style>
</head>
<body>
<div align = center>
<h2>Welcome to Banking System</h2>
<div class = container>
    <a href="login.jsp" class="button">Admin Page </a>
    <a href="customerLogin.jsp" class="button">Customer Page</a>
</div>
</div>
</body>
</html>