<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Bank Account</title>
    <style>
        body { font-family: Arial, sans-serif; text-align: center; }
        .container { margin: 50px auto; width: 400px; border: 2px solid blue; padding: 20px; }
        h2 { color: red; }
        label { font-weight: bold; color: blue; display: block; margin-top: 10px; }
        input { width: 100%; padding: 8px; margin-top: 5px; }
        button { background-color: blue; color: white; padding: 10px; margin-top: 15px; cursor: pointer; }
    </style>
</head>
<body>
    <h2>Add Bank Account</h2>
    <div class="container">
        <form action="BankAccountServlet" method="post">
            <label>Bank Name:</label>
            <input type="text" name="bankName" required>
            
            <label>Account Number:</label>
            <input type="text" name="accountNumber" required>
            
            <label>Account Type:</label>
            <input type="text" name="accountType" required>
            
            <label>IFSC Code:</label>
            <input type="text" name="ifscCode" required>
            
            <label>Current Balance:</label>
            <input type="number" name="currentBalance" required>
            
            <label>PIN:</label>
            <input type="password" name="pin" required>
            
            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
