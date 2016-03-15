package images;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import db.DatabaseCon;

/**
 * Servlet implementation class ImageUpload
 */
@WebServlet("/ImageUpload")
public class ImageUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean isMultiUpload;
    private String filePath;
    private int maxFileSize = 50 * 1024;
    private int maxMemSize = 4 * 1024;
    File file ;
    File uploadDir;
    String pathToFile = null;
    int imageID = 1;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 
	        // Check that we have a file upload request
	        isMultiUpload = ServletFileUpload.isMultipartContent(request);
	        response.setContentType("text/html");
	        PrintWriter out = response.getWriter( );
	        if( !isMultiUpload){
	            out.println("<html>");
	            out.println("<head>");
	            out.println("<title>Servlet upload</title>");
	            out.println("</head>");
	            out.println("<body>");
	            out.println("<p>No file uploaded</p>");
	            out.println("</body>");
	            out.println("</html>");
	            return;
	        }


	        FileItemFactory factory = new DiskFileItemFactory();

	        // Create a new file upload handler
	        ServletFileUpload upload = new ServletFileUpload(factory);


	        try {
	            // Parse the request to get file items.
	            List<FileItem> fileItems = upload.parseRequest(request);
	            DatabaseCon dbCon = new DatabaseCon();
	            Connection con = dbCon.getDBCon();
	            for (FileItem item:fileItems){

	                String itemName = item.getName();

	                if(itemName!=null){
	                    boolean freeFileFound = false;
	                    String fileNameID = "picture"+imageID;
	                    uploadDir = new File("C:/Users/kipka/workspace_abap3/SportfestOnePager/WebContent/images/gallery");
	                    File uploadNew = new File("C:/Users/kipka/workspace_abap3/SportfestOnePager/WebContent/images/gallery/" + fileNameID + ".jpg");
	                    while(!freeFileFound){
	                        if (!(uploadNew.exists())){
	                            freeFileFound = true;
	                        }else{
	                            imageID++;
	                            fileNameID = "picture"+imageID;
	                            uploadNew = new File("C:/Users/kipka/workspace_abap3/SportfestOnePager/WebContent/images/gallery/" + fileNameID + ".jpg");
	                        }
	                    }
	                    //file = File.createTempFile("img",".jpg",uploadDir);

	                    item.write(uploadNew);


	                    Statement s = con.createStatement();
	                    String path = uploadNew.getPath();
	                    if(path.contains("\\")) {
	                        path = path.replace("\\", "/");
	                    }
	                    String query = "INSERT INTO bilder (src, beschr) VALUES ('"+path+"', '"+fileNameID+"')";
	                    s.execute(query);
	                }


	            }
	            con.close();
	            response.sendRedirect("http://localhost:8080/SportfestOnePager/admin/adminHome.jsp#editBilder");

	        }catch (FileUploadException e){
	            e.printStackTrace();
	        }catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	

}
