package signin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserChecker
 */
@WebServlet("/UserChecker")
public class UserChecker extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserChecker() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mail = request.getParameter("mail");
        String password = request.getParameter("pw");

        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");

        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }

        try {



            try {

            } catch (Exception e) {

                // TODO Auto-generated catch block
                e.printStackTrace();
              
            }
            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/sportfest", "root", "");

        } catch (SQLException e) {
            e.printStackTrace();

        }

        if (connection!=null){
            try {
                boolean success = false;
                Statement sT = connection.createStatement();

                mail = (String) mail;

                password = (String) password;
                String sql = "SELECT * FROM admins WHERE username='"+mail+"' AND password='" + password + "'";
                System.out.println(sql);
                try {
                    ResultSet rS = sT.executeQuery(sql);
                    if (!rS.isBeforeFirst() ) {
                    	response.sendRedirect("../SportfestOnePager/admin/login.jsp?msg=error");
                    }else{
                        CookiePlacer cP = new CookiePlacer("user", mail);
                        Cookie cookie = cP.generateCookie();
                        cookie.setMaxAge(60*5);
                        response.addCookie(cookie);
                        response.sendRedirect("/SportfestOnePager/functions/redirect.jsp");
                    }

                }catch (SQLException e1){
                    connection.close();
                }finally {
                    connection.close();
                }




            } catch (SQLException e){
                e.printStackTrace();
            }finally {
                try {
                    connection.close();
                }catch(SQLException e1){
                    e1.printStackTrace();
                }
            }
        }
	}

}
