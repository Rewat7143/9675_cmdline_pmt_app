<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Bank Account</title>
</head>
<body>
    <form action="PaymentServlet" method="post">
        <input type="hidden" name="action" value="editBankAccount">
        <label>Account No:</label>
        <input type="text" name="accountNo" required>
        <label>New Bank Name:</label>
        <input type="text" name="bankName" required>
        <label>New IFSC Code:</label>
        <input type="text" name="ifscCode" required>
        <button type="submit">Update</button>
    </form>
</body>
</html>
