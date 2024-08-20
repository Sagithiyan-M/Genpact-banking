<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Withdraw</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<div align = center>
    <h2>Withdraw Amount</h2>
    <form action="WithdrawServlet" method="post">
        <label for="amount">Amount:</label>
        <input type="text" id="amount" name="amount"><br><br>
        <input type="submit" value="Withdraw">
    </form>
</div>
</body>
</html>
