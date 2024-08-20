<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard</title>
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
        /* Styles for dialogs */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }
        .modal-content {
            background-color: #fefefe;
            margin: 10% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 400px;
            border-radius: 5px;
        }
        .modal-content h2, .modal-content label {
            color: black;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <% 
            String accountNo = (String) session.getAttribute("account_no");
            String customerName = "";
            double balance = 0.0;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BankingSystem", "root", "user@123");
                PreparedStatement ps = con.prepareStatement("SELECT full_name, initial_balance FROM Customer WHERE account_no=?");
                ps.setString(1, accountNo);
                ResultSet rs = ps.executeQuery();
                
                if (rs.next()) {
                    customerName = rs.getString("full_name");
                    balance = rs.getDouble("initial_balance");
                }

                rs.close();
                ps.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
        <h2>Welcome, <%= customerName %></h2>
        <div class="account-info">
            Account No: <%= accountNo %> <br>
            Balance: <%= balance %> <br>
        </div>
        <a href="#" onclick="showDepositDialog()" class="button"><i class="fa fa-plus-circle"></i> Deposit</a>
        <a href="#" onclick="showWithdrawDialog()" class="button"><i class="fa fa-minus-circle"></i> Withdraw</a>
        <a href="viewTransactions.jsp" class="button button-primary"><i class="fas fa-eye"></i>  View Transactions</a>
        <a href="closeAccount.jsp" class="button button-secondary"><i class="fa fa-times-circle"></i> Close Account</a>
        <a href="logout.jsp" class="button button-secondary"><i class="fa fa-sign-out-alt"></i> Logout</a>
    </div>

    <div id="depositDialog" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeDialog('depositDialog')">&times;</span>
            <h2>Deposit Amount</h2>
            <form id="depositForm" onsubmit="return submitDepositForm()">
                <div class="form-group">
                    <label for="depositAmount">Amount:</label>
                    <input type="text" id="depositAmount" name="amount" required>
                </div>
                <input type="submit" value="Deposit" class="button">
            </form>
        </div>
    </div>

 
    <div id="withdrawDialog" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeDialog('withdrawDialog')">&times;</span>
            <h2>Withdraw Amount</h2>
            <form id="withdrawForm" onsubmit="return submitWithdrawForm()">
                <div class="form-group">
                    <label for="withdrawAmount">Amount:</label>
                    <input type="text" id="withdrawAmount" name="amount" required>
                </div>
                <input type="submit" value="Withdraw" class="button">
            </form>
        </div>
    </div>

 
    <script>
        function showDepositDialog() {
            document.getElementById('depositDialog').style.display = 'block';
        }

        function showWithdrawDialog() {
            document.getElementById('withdrawDialog').style.display = 'block';
        }

        function closeDialog(dialogId) {
            document.getElementById(dialogId).style.display = 'none';
        }

        function submitDepositForm() {
            var amount = parseFloat(document.getElementById('depositAmount').value);
            if (isNaN(amount) || amount <= 0) {
                alert('Please enter a positive amount for deposit.');
                return false;
            }
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'DepositServlet', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        alert('Deposit successful!');
                        closeDialog('depositDialog');
                        location.reload();
                    } else {
                        alert('Deposit failed: ' + xhr.responseText);
                    }
                }
            };
            xhr.send('amount=' + encodeURIComponent(amount));
            return false;
        }

        function submitWithdrawForm() {
            var amount = parseFloat(document.getElementById('withdrawAmount').value);
            if (isNaN(amount) || amount <= 0) {
                alert('Please enter a positive amount for withdrawal.');
                return false;
            }
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'WithdrawServlet', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                	if (xhr.status === 200) {
                		var response = xhr.responseText.trim();
                        if (response === "Insufficient Balance") {
                            alert(response);
                            closeDialog('withdrawDialog');
                            location.reload();
                        } else {
                        	alert("Withdrawal Successful");
                            closeDialog('withdrawDialog');
                            location.reload();
                        }
                    } else {
                        alert('Withdrawal failed: ' + xhr.responseText);
                    }
                }
            };
            xhr.send('amount=' + encodeURIComponent(amount));
            return false;
        }
    </script>
</body>
</html>