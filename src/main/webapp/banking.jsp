<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Banking System</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: "Poppins", sans-serif;
        }
        body {
            background-color: #f2f2f2;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        .container {
            width: 90%;
            max-width: 1000px;
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin-bottom: 20px;
            position: relative;
        }
        h2, h3 {
            text-align: center;
            color: #2c3e50;
        }
        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 20px;
        }
        .card {
            background: #ffffff;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 3px 6px rgba(0, 0, 0, 0.15);
            text-align: center;
        }
        .btn {
            display: inline-block;
            padding: 10px 15px;
            background-color: #27ae60;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }
        .btn:hover {
            background-color: #219150;
        }
        input, select {
            width: 90%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .logout-btn {
            background: #e74c3c;
            position: absolute;
            top: 20px;
            right: 20px;
        }
        .logout-btn:hover {
            background: #c0392b;
        }
        /* User Info Styling */
        .user-info {
            background: #f9f9f9;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
            text-align: left;
            font-size: 16px;
        }
        .user-info strong {
            color: #27ae60;
        }
    </style>
</head>
<body>

<%-- LOGIN SYSTEM (Static Data) --%>
<%
    String validUsername = "user123";
    String validPassword = "pass123";

    String fullName = "John Doe";
    String phoneNumber = "+91 9876543210";
    String email = "john.doe@example.com";

    if (session.getAttribute("user") == null) {
        if (request.getParameter("login") != null) {
            String uname = request.getParameter("uname");
            String pass = request.getParameter("pass");

            if (uname.equals(validUsername) && pass.equals(validPassword)) {
                session.setAttribute("user", uname);
            } else {
                out.println("<p style='color:red;text-align:center;'>Invalid credentials!</p>");
            }
        }
%>
    <div class="container">
        <h2>Welcome to Our Banking System</h2>
        <div class="card">
            <h3>Login</h3>
            <form method="post">
                <input type="text" name="uname" placeholder="Username" required><br>
                <input type="password" name="pass" placeholder="Password" required><br>
                <button type="submit" name="login" class="btn">Login</button>
            </form>
        </div>
    </div>
<%
        return;
    }
%>

<%-- HOME PAGE --%>
<div class="container">
    <h2>Dashboard</h2>
    <button class="btn logout-btn" onclick="location.href='banking.jsp?logout=true'">Logout</button>
    <p style="text-align:center;"><strong>Welcome, <%= session.getAttribute("user") %> 🎉</strong></p>
</div>

<%-- LOGOUT FUNCTION --%>
<%
    if ("true".equals(request.getParameter("logout"))) {
        session.invalidate();
        response.sendRedirect("banking.jsp");
    }
%>

<%-- USER INFO BLOCK --%>
<div class="container">
    <h3>Your Profile</h3>
    <div class="user-info">
        <p><strong>Full Name:</strong> <%= fullName %></p>
        <p><strong>Phone Number:</strong> <%= phoneNumber %></p>
        <p><strong>Email:</strong> <%= email %></p>
    </div>
</div>

<%-- BANKING FEATURES --%>
<div class="container">
    <div class="grid-container">
        
        <%-- ACCOUNTS --%>
        <div class="card">
            <h3>Accounts</h3>
            <table class="account-table">
                <tr>
                    <th>Account Number</th>
                    <th>Account Name</th>
                    <th>Balance</th>
                </tr>
                <tr>
                    <td>1234567890</td>
                    <td>ABC123</td>
                    <td>₹50,000</td>
                </tr>
                <tr>
                    <td>9876543210</td>
                    <td>XYZ456</td>
                    <td>₹30,000</td>
                </tr>
            </table>
        </div>
        <%-- Statement request --%>

     <div class="card">
    <h3>Statement Request</h3>
    <form method="post">
        <label for="startDate">Start Date:</label>
        <input type="date" name="startDate" required><br>

        <label for="endDate">End Date:</label>
        <input type="date" name="endDate" required><br>

        <label>Transaction Type:</label><br>
        
        <input type="checkbox" name="transactionType" value="all" id="all"> 
        <label for="all">All Transactions</label><br>

        <input type="checkbox" name="transactionType" value="credit" class="txn"> 
        <label for="credit">Credit Transactions</label><br>

        <input type="checkbox" name="transactionType" value="debit" class="txn"> 
        <label for="debit">Debit Transactions</label><br>

        <input type="checkbox" name="transactionType" value="wallet" class="txn"> 
        <label for="wallet">Wallet Transactions</label><br>

        <input type="checkbox" name="transactionType" value="bank" class="txn"> 
        <label for="bank">Bank Transactions</label><br>

        <button type="submit" name="generateStatement" class="btn">Generate Statement</button>
    </form>
</div>

<script>
    document.getElementById("all").addEventListener("change", function() {
        if (this.checked) {
            document.querySelectorAll(".txn").forEach(chk => chk.checked = false);
        }
    });

    document.querySelectorAll(".txn").forEach(chk => {
        chk.addEventListener("change", function() {
            if (this.checked) {
                document.getElementById("all").checked = false;
            }
        });
    });
</script>
     

        <%-- SEND MONEY --%>
        <div class="card">
            <h3>Send Money</h3>
            <form method="post">
                <input type="text" name="source" placeholder="Source Account" required><br>
                <input type="text" name="target" placeholder="Target Account" required><br>
                <input type="number" name="amount" placeholder="Amount (₹)" required><br>
                <button type="submit" name="sendMoney" class="btn">Send</button>
            </form>
        </div>

        <%-- ADD ACCOUNT --%>
        <div class="card">
            <h3>Add Account</h3>
            <form method="post">
                <input type="text" name="accNo" placeholder="Account No" required><br>
                <input type="text" name="ifsc" placeholder="IFSC Code" required><br>
                <input type="text" name="bank" placeholder="Bank Name" required><br>
                <input type="number" name="balance" placeholder="Initial Balance" required><br>
                <button type="submit" name="addAccount" class="btn">Add</button>
            </form>
        </div>

    </div>
</div>

</body>
</html>
