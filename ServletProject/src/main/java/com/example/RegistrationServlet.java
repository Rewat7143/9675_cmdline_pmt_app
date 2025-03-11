package servlets.example;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("register.html");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter writer = response.getWriter();

        String user = request.getParameter("username");
        String pass = request.getParameter("password");

        writer.println("<html><body>");
        writer.println("<h1>Account Created Successfully</h1>");
        writer.println("<p>Username: " + user + "</p>");
        writer.println("<p>Password: " + pass + "</p>");
        writer.println("<a href='login'>Click here to Login</a>");
        writer.println("</body></html>");
    }
}
