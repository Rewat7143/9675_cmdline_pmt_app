<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Statement Request Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        .container {
            width: 450px;
            margin: auto;
            padding: 20px;
            border: 2px solid blue;
            border-radius: 10px;
        }
        h2 {
            color: orange;
        }
        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
        }
        input[type="date"], .checkbox-group {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .checkbox-group {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
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
    <script>
        function toggleCheckboxes() {
            var allCheckbox = document.getElementById("all");
            var checkboxes = document.querySelectorAll(".txnCheckbox");

            if (allCheckbox.checked) {
                checkboxes.forEach(function(checkbox) {
                    checkbox.checked = false;
                    checkbox.disabled = true;
                });
            } else {
                checkboxes.forEach(function(checkbox) {
                    checkbox.disabled = false;
                });
            }
        }
    </script>
</head>
<body>

    <div class="container">
        <h2>Statement Request</h2>
        <form method="post">
            <label>Start Date:</label>
            <input type="date" name="startDate" required>

            <label>End Date:</label>
            <input type="date" name="endDate" required>

            <div class="checkbox-group">
                <label><input type="checkbox" id="all" name="txnType" value="all" onclick="toggleCheckboxes()"> All</label>
                <label><input type="checkbox" class="txnCheckbox" name="txnType" value="credit"> Credit Transactions</label>
                <label><input type="checkbox" class="txnCheckbox" name="txnType" value="debit"> Debit Transactions</label>
                <label><input type="checkbox" class="txnCheckbox" name="txnType" value="wallet"> Wallet Transactions</label>
                <label><input type="checkbox" class="txnCheckbox" name="txnType" value="bank"> Bank Transactions</label>
            </div>

            <button type="submit" name="generateStatement" class="btn">Generate</button>
        </form>

        <%
            // Process the statement request form
            if (request.getParameter("generateStatement") != null) {
                String startDate = request.getParameter("startDate");
                String endDate = request.getParameter("endDate");
                String[] txnTypes = request.getParameterValues("txnType");

                out.println("<h3>Statement Request Summary</h3>");
                out.println("<p>Start Date: " + startDate + "</p>");
                out.println("<p>End Date: " + endDate + "</p>");
                
                if (txnTypes != null) {
                    out.println("<p>Transaction Types: " + String.join(", ", txnTypes) + "</p>");
                } else {
                    out.println("<p>No transaction types selected.</p>");
                }
            }
        %>
    </div>

</body>
</html>
