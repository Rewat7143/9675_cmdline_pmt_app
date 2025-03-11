package servlets.example;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBUtils {

    private static final String DATABASE_URL = "jdbc:mysql://localhost:3306/userdb"; 
    private static final String DB_USERNAME = "root"; 
    private static final String DB_PASSWORD = "Mysql@123";
    
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new RuntimeException("Could not load MySQL JDBC driver", e);
        }
    }

    public static Connection connectToDatabase() throws SQLException {
        return DriverManager.getConnection(DATABASE_URL, DB_USERNAME, DB_PASSWORD);
    }

    public static List<Transaction> fetchTransactions(int offset, int limit) throws SQLException {
        List<Transaction> transactionsList = new ArrayList<>();
        String sqlQuery = "SELECT * FROM transaction_table LIMIT ? OFFSET ?";

        try (Connection conn = connectToDatabase();
             PreparedStatement preparedStmt = conn.prepareStatement(sqlQuery)) {
            preparedStmt.setInt(1, limit);
            preparedStmt.setInt(2, offset);

            ResultSet resultSet = preparedStmt.executeQuery();
            while (resultSet.next()) {
                Transaction transaction = new Transaction(
                    resultSet.getInt("transaction_id"),
                    resultSet.getString("transaction_date"),
                    resultSet.getDouble("amount"),
                    resultSet.getInt("customer_id"),
                    resultSet.getString("payment_method")
                );
                transactionsList.add(transaction);
            }
        }
        return transactionsList;
    }

    public static int fetchTotalTransactionCount() throws SQLException {
        String sqlQuery = "SELECT COUNT(*) AS total_transactions FROM transaction_table";
        try (Connection conn = connectToDatabase();
             Statement stmt = conn.createStatement();
             ResultSet resultSet = stmt.executeQuery(sqlQuery)) {
            if (resultSet.next()) {
                return resultSet.getInt("total_transactions");
            }
        }
        return 0;
    }
}
