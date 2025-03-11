package servlets.example;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TransactionServlet")
public class TransactionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Transaction> transactions = new ArrayList<>();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankDB", "root", "mysql@123");
            String query = "SELECT transaction_id, transaction_date, amount, customer_id, payment_method FROM transactions";
            stmt = con.prepareStatement(query);
            rs = stmt.executeQuery();

            while (rs.next()) {
                transactions.add(new Transaction(
                    rs.getInt("transaction_id"),
                    rs.getString("transaction_date"),
                    rs.getDouble("amount"),
                    rs.getInt("customer_id"),
                    rs.getString("payment_method")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
            try { if (stmt != null) stmt.close(); } catch (SQLException ignored) {}
            try { if (con != null) con.close(); } catch (SQLException ignored) {}
        }

        request.setAttribute("transactions", transactions);
        request.getRequestDispatcher("transaction.jsp").forward(request, response);
    }
}
