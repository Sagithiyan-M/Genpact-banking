<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <script type="text/javascript">
        window.onload = function() {
            var urlParams = new URLSearchParams(window.location.search);
            var errorMessage = urlParams.get('errorMessage');
            var balance = urlParams.get('balance');

            if (errorMessage && balance) {
                alert(errorMessage + " Your current balance is: " + balance);
                window.location.href = 'customerDashboard.jsp'; // Redirect to withdraw.jsp after the alert
            }
        };
    </script>
</head>
</html>
