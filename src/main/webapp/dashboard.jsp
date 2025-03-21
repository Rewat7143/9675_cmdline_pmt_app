<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, jakarta.servlet.http.HttpSession" %>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    String username = (String) sessionObj.getAttribute("user");
    
    // Database credentials
    String jdbcURL = "jdbc:mysql://localhost:3306/payment_db"; // Change as needed
    String dbUser = "root"; // Your DB username
    String dbPassword = "qwerty123"; // Your DB password
    
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    
    double accountBalance = 0.00;
    double walletBalance = 0.00;
    String accountNumber = "N/A";
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
        
        // Query to fetch user balance
        String sql = "SELECT account_no, account_balance, wallet_balance FROM users WHERE username = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        rs = stmt.executeQuery();
        
        if (rs.next()) {
            accountNumber = rs.getString("account_no");
            accountBalance = rs.getDouble("account_balance");
            walletBalance = rs.getDouble("wallet_balance");
        }
        
        // Query to fetch last 10 transactions
        sql = "SELECT amount, transaction_type, recipient FROM transactions WHERE username = ? ORDER BY txn_date DESC LIMIT 10";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, username);
        ResultSet txnRs = stmt.executeQuery();
        
        request.setAttribute("transactions", txnRs); // Store transactions in request scope
        
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (conn != null) conn.close();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payments Web App</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .header {
            background: #d32f2f;
            color: white;
            padding: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 20px;
        }
        .logout-btn {
            background: white;
            color: #d32f2f;
            padding: 5px 10px;
            border: 1px solid #d32f2f;
            text-decoration: none;
            border-radius: 5px;
        }
        .account-section {
            background: #3f51b5;
            color: white;
            padding: 15px;
            margin: 10px;
            border-radius: 5px;
        }
        .send-money {
            background: white;
            color: #d32f2f;
            padding: 10px 15px;
            border: 2px solid #d32f2f;
            border-radius: 5px;
            cursor: pointer;
        }
        .recent-txns {
            background: #607d8b;
            color: white;
            padding: 15px;
            margin: 10px;
            border-radius: 5px;
        }
        .detailed-stmt {
            background: white;
            color: #5d4037;
            padding: 5px 10px;
            border: 1px solid #5d4037;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="header">
        <div>Payments Web App</div>
        <a href="logout.jsp" class="logout-btn">Logout</a>
    </div>
    
    <div class="account-section">
        <p>Welcome, <%= username %>!</p>
        <p>Primary Bank Account No: <b><%= accountNumber %></b></p>
        <p>Account Balance: <b>$<%= accountBalance %></b></p>
        <p>Wallet Balance: <b>$<%= walletBalance %></b> <span style="color: red;">[+]</span></p>
        <button class="send-money">Send Money</button>
    </div>
    
    <div class="recent-txns">
        <p><b>Recent 10 Transactions</b></p>
        <%
            rs = (ResultSet) request.getAttribute("transactions");
            if (rs != null) {
                while (rs.next()) {
                    double amount = rs.getDouble("amount");
                    String type = rs.getString("transaction_type");
                    String recipient = rs.getString("recipient");
        %>
        <p><%= amount %> <%= type.equals("sent") ? "sent to" : "received from" %> <%= recipient %></p>
        <%
                }
                rs.close();
            }
        %>
        <button class="detailed-stmt">Detailed Statement</button>
    </div>
</body>
</html>
