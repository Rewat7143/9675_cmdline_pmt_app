<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Send Money</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        .container {
            width: 400px;
            margin: auto;
            padding: 20px;
            border: 2px solid blue;
            border-radius: 10px;
        }
        h2 {
            color: red;
        }
        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .radio-group {
            display: flex;
            justify-content: space-around;
            margin-top: 10px;
        }
        .btn {
            margin-top: 15px;
            padding: 10px;
            background-color: red;
            color: white;
            border: none;
            cursor: pointer;
            width: 100%;
        }
        .btn:hover {
            background-color: darkred;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>Send Money</h2>
        <form method="post">
            <label>Amount to Send:</label>
            <input type="number" name="amount" required>

            <label>From:</label>
            <select name="fromAccount">
                <option value="acc1">Account 1</option>
                <option value="acc2">Account 2</option>
            </select>

            <div class="radio-group">
                <label><input type="radio" name="transferType" value="account" checked> To Account</label>
                <label><input type="radio" name="transferType" value="wallet"> To Wallet</label>
            </div>

            <label>Recipient:</label>
            <input type="number" name="recipient" required>

            <button type="submit" name="sendMoney" class="btn">Send</button>
        </form>

        <%
            // Process the form if submitted
            if (request.getParameter("sendMoney") != null) {
                String amount = request.getParameter("amount");
                String fromAccount = request.getParameter("fromAccount");
                String transferType = request.getParameter("transferType");
                String recipient = request.getParameter("recipient");

                out.println("<h3>Transaction Details</h3>");
                out.println("<p>Amount: " + amount + "</p>");
                out.println("<p>From: " + fromAccount + "</p>");
                out.println("<p>Transfer Type: " + transferType + "</p>");
                out.println("<p>Recipient: " + recipient + "</p>");
            }
        %>
    </div>

</body>
</html>
