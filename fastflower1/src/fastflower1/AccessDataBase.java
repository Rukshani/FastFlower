package fastflower1;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AccessDataBase
 */
@WebServlet("/accessdatabase")
public class AccessDataBase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccessDataBase() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().println("test");
		try {
			Statement st=connection.getcon().createStatement();
			ResultSet rs=st.executeQuery("SELECT * FROM store");
			int count=0;
			while(rs.next()){
				count++;
			}
			rs.beforeFirst();
			while(rs.next()){
				for(int i=0;i<=count;i++){
					request.setAttribute("lat"+i, Double.parseDouble(rs.getString("latitude")));
					request.setAttribute("long"+i, Double.parseDouble(rs.getString("longitutde")));
				}
				
				//request.setAttribute("loc", rs.getString("latitude"));
				//response.getWriter().println(rs.getString("latitude"));
				//response.getWriter().println(rs.getString("longitutde"));
				//response.getWriter().println(rs.getString("storemail"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
