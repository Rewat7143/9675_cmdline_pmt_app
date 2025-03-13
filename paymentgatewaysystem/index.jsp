<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payments Web App</title>
</head>
<body>
    <h2>Welcome <%= session.getAttribute("userFullName") %></h2>
    <a href="logout.jsp">Logout</a>
    <h3>Primary Bank Account: <%= session.getAttribute("primaryBankAccount") %></h3>
    <h3>Account Balance: <%= session.getAttribute("accountBalance") %></h3>
    <h3>Wallet Balance: <%= session.getAttribute("walletBalance") %> <a href="addFunds.jsp">[+]</a></h3>
    <a href="sendMoney.jsp">Send Money</a>
    <h3>Bank Accounts:</h3>
    <a href="addBankAcct.jsp">[+]</a>
    <h3>Recent Transactions:</h3>
    <a href="stmtRequest.jsp">Detailed Stmt</a>

    <h3>Transactions:</h3>
    <%
        int page = 1;
        int recordsPerPage = 10;
        if (request.getParameter("page") != null) {
            page = Integer.parseInt(request.getParameter("page"));
        }
        int start = (page - 1) * recordsPerPage;
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankdb", "root", "password");
        PreparedStatement stmt = con.prepareStatement("SELECT * FROM transactions LIMIT ?, ?");
        stmt.setInt(1, start);
        stmt.setInt(2, recordsPerPage);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
    %>
            <p><%= rs.getString("recipient") %> - <%= rs.getDouble("amount") %> - <%= rs.getTimestamp("timestamp") %></p>
    <%
        }
    %>
    <a href="index.jsp?page=<%= page - 1 %>">Previous</a>
    <a href="index.jsp?page=<%= page + 1 %>">Next</a>
</body>
</html>
