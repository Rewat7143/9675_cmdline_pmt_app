import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("sendMoney".equals(action)) {
            sendMoney(request, response);
        } else if ("addBankAccount".equals(action)) {
            addBankAccount(request, response);
        } else if ("editBankAccount".equals(action)) {
            editBankAccount(request, response);
        } else if ("getTransactions".equals(action)) {
            getTransactions(request, response);
        }
    }
    
    private void sendMoney(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        String recipient = request.getParameter("recipient");
        
        try {
            Connection con = getConnection();
            PreparedStatement stmt = con.prepareStatement("UPDATE users SET wallet_balance = wallet_balance - ? WHERE id = ?");
            stmt.setDouble(1, amount);
            stmt.setInt(2, userId);
            stmt.executeUpdate();
            response.sendRedirect("index.jsp?status=success");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?status=error");
        }
    }
    
    private void addBankAccount(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String bankName = request.getParameter("bankName");
        String accountNo = request.getParameter("accountNo");
        String ifscCode = request.getParameter("ifscCode");
        
        try {
            Connection con = getConnection();
            PreparedStatement stmt = con.prepareStatement("INSERT INTO bank_accounts (bank_name, account_no, ifsc_code) VALUES (?, ?, ?)");
            stmt.setString(1, bankName);
            stmt.setString(2, accountNo);
            stmt.setString(3, ifscCode);
            stmt.executeUpdate();
            response.sendRedirect("index.jsp?status=added");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("index.jsp?status=error");
        }
    }
    
    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/bankdb", "root", "password");
    }
}
