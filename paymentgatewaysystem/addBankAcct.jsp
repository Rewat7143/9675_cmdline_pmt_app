<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Bank Account</title>
</head>
<body>
    <form action="PaymentServlet" method="post">
        <input type="hidden" name="action" value="addBankAccount">
        <label>Bank Name:</label>
        <input type="text" name="bankName" required>
        <label>Account No:</label>
        <input type="text" name="accountNo" required>
        <label>IFSC Code:</label>
        <input type="text" name="ifscCode" required>
        <button type="submit">Add</button>
    </form>
</body>
</html>
