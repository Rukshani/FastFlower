package fastflower1;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

@WebServlet("/driversignup")
public class driversignup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 //public final String UPLOAD_DIRECTORY = "C:/uploads";
    
    public driversignup() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try {
			
			

			/* if(ServletFileUpload.isMultipartContent(request)){
		            try {
		                List<FileItem> multiparts = new ServletFileUpload(
		                                         new DiskFileItemFactory()).parseRequest( request);
		              
		                for(FileItem item : multiparts){
		                    if(!item.isFormField()){
		                        String name = new File(item.getName()).getName();
		                        item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
		                    }
		                }
		           
		               //File uploaded successfully
		               request.setAttribute("message", "File Uploaded Successfully");
		            } catch (Exception ex) {
		               request.setAttribute("message", "File Upload Failed due to " + ex);
		               System.out.println(ex);
		            }          
		         
		        }else{
		            request.setAttribute("message",
		                                 "Sorry this Servlet only handles file upload request");
		        }
			
			*/
			
			Statement st=connection.getcon().createStatement();
			
			st.executeUpdate("INSERT INTO password VALUES('"+request.getParameter("email")+"','"+request.getParameter("pswd")+"','driver')");	
			st.executeUpdate("INSERT INTO driver VALUES('"+request.getParameter("email")+"','"+request.getParameter("fname")+"','"+request.getParameter("mname")+"','"+request.getParameter("lname")+"','1','"+request.getParameter("aLine1")+"','"+request.getParameter("licno")+"','"+request.getParameter("accno")+"','"+request.getParameter("nic")+"','"+request.getParameter("licdate")+"','"+request.getParameter("dob")+"','"+request.getParameter("image")+"')");
			st.executeUpdate("INSERT INTO contact VALUES('"+request.getParameter("email")+"',"+request.getParameter("phone")+")");
			
			
			response.sendRedirect("signin/signin.jsp");

			
				ResultSet rs=st.executeQuery("SELECT * FROM driver");
				
				
				while(rs.next()){
					String url=rs.getString(13);
					File file=new File("images/drivers/"+url);
					
					
					   
				}
				
			 
			
			
			
		} catch (Exception ex) {
			System.out.println(ex);
		}
	}

}
