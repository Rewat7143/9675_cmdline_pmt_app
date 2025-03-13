<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Statement Request</title>
</head>
<body>
    <form action="PaymentServlet" method="post">
        <input type="hidden" name="action" value="getTransactions">
        <button type="submit">View Transactions</button>
    </form>
</body>
</html>
