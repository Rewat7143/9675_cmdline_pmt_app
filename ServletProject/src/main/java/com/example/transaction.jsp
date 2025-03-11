<%@ page import="java.util.List, servlets.example.Transaction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Transaction Table</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Transaction Table</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Date</th>
            <th>Amount</th>
            <th>Customer ID</th>
            <th>Payment Method</th>
        </tr>
        <%
            List<Transaction> transactions = (List<Transaction>) request.getAttribute("transactions");
            if (transactions != null) {
                for (Transaction transaction : transactions) {
        %>
        <tr>
            <td><%= transaction.getTransactionId() %></td>
            <td><%= transaction.getTransactionDate() %></td>
            <td><%= transaction.getAmount() %></td>
            <td><%= transaction.getCustomerId() %></td>
            <td><%= transaction.getPaymentMethod() %></td>
        </tr>
        <%
                }
            }
        %>
    </table>
</body>
</html>
