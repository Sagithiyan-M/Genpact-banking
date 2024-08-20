import java.io.IOException;
import java.net.URLEncoder;
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

@WebServlet("/CloseAccountServlet")
public class CloseAccountServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        String accountNo = (String) session.getAttribute("account_no");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/BankingSystem", "root", "user@123");
            PreparedStatement ps1 = con.prepareStatement("SELECT initial_balance FROM Customer WHERE account_no = ?");
            ps1.setString(1, accountNo);
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                double currentBalance = rs.getDouble("initial_balance");
                if (currentBalance > 0.0) {
                    String errorMessage = URLEncoder.encode("Account can only be closed if the balance is zero.", "UTF-8");
                    String encodedBalance = URLEncoder.encode(String.valueOf(currentBalance), "UTF-8");
                    response.sendRedirect("error.jsp?errorMessage=" + errorMessage + "&balance=" + encodedBalance);
                    return;
                }

                PreparedStatement ps = con.prepareStatement("DELETE FROM Customer WHERE account_no = ?");
                ps.setString(1, accountNo);
                ps.executeUpdate();
                session.invalidate();
                response.sendRedirect("customerLogin.jsp");
            } else {
                response.sendRedirect("error.jsp?errorMessage=Account number not found.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
//PreparedStatement ps2 = con.prepareStatement("DELETE FROM Transactions WHERE account_no = ?");
                