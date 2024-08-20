<!DOCTYPE html>
<html>
<head>
    <title>Deposit</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<div align = center>
    <h2>Deposit Amount</h2>
    <form id="depositForm" onsubmit="return submitDepositForm()">
    <div class="form-group">
        <label for="depositAmount">Amount:</label>
        <input type="text" id="depositAmount" name="amount" required>
    </div>
    <input type="submit" value="Deposit" class="button">
</form>
</div>
</body>
</html>