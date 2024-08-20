import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/WithdrawServlet")
public class WithdrawServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String accountNo = (String) session.getAttribute("account_no");
        double amount = Double.parseDouble(request.getParameter("amount"));

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BankingSystem", "root", "user@123");

            PreparedStatement ps = con.prepareStatement("SELECT initial_balance FROM Customer WHERE account_no = ?");
            ps.setString(1, accountNo);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                double currentBalance = rs.getDouble("initial_balance");
                if (currentBalance >= amount) {
                    ps = con.prepareStatement("UPDATE Customer SET initial_balance = initial_balance - ? WHERE account_no = ?");
                    ps.setDouble(1, amount);
                    ps.setString(2, accountNo);
                    ps.executeUpdate();
                    Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                    ps = con.prepareStatement("INSERT INTO Transactions (customer_id, amount, type) VALUES ((SELECT customer_id FROM Customer WHERE account_no=?), ?, 'Withdraw')");
                    ps.setString(1, accountNo);
                    ps.setDouble(2, amount);
                    ps.setTimestamp(3, timestamp);
                    ps.executeUpdate();

                    response.getWriter().print("Withdrawal Successful");
                } else {
                    response.getWriter().print("Insufficient Balance");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
