<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Send Money</title>
</head>
<body>
    <form action="PaymentServlet" method="post">
        <input type="hidden" name="action" value="sendMoney">
        <label>Recipient:</label>
        <input type="text" name="recipient" required>
        <label>Amount:</label>
        <input type="number" name="amount" required>
        <button type="submit">Send</button>
    </form>
</body>
</html>
