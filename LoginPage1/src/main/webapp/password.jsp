<%@ page import="java.sql.*" %>
<%
    String accountNo = (String) session.getAttribute("account_no");
    String newPassword = request.getParameter("new_password");

    if (newPassword != null && !newPassword.isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BankingSystem", "root", "user@123");
            PreparedStatement ps = con.prepareStatement("UPDATE Customer SET password=?, first=1 WHERE account_no=?");
            ps.setString(1, newPassword);
            ps.setString(2, accountNo);
            ps.executeUpdate();
            response.sendRedirect("customerLogin.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<html>
<head>
    <title>Change Password</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .div{
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }
        .container {
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            border-radius: 5px;
            width: 90%;
            max-width: 900px;
            text-align: center;
        }
        .container h2 {
            margin-bottom: 20px;
            color : red;
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
        .fa {
            margin-right: 8px;
        }
        </style>
</head>
<body>
<div class ="container">
    <form action="password.jsp" method="post">
        <label for="new_password">New Password:</label>
        <input type="password" id="new_password" name="new_password" required>
        <button type="submit" class = "button">Change Password</button>
    </form>
</div>
</body>
</html>
