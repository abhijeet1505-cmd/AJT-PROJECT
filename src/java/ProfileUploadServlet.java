import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/ProfileUploadServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // 1 MB
    maxFileSize = 1024 * 1024 * 10,   // 10 MB
    maxRequestSize = 1024 * 1024 * 20 // 20 MB
)
public class ProfileUploadServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");
        
        if (userEmail == null) {
            response.sendRedirect("signin.jsp");
            return;
        }

        try {
            Part filePart = request.getPart("profilePic");

            if (filePart != null && filePart.getSize() > 0) {
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

                // Create uploads folder if missing
                String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdir();

                // Save the uploaded file
                filePart.write(uploadPath + File.separator + fileName);

                // Update database
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection conn = DriverManager.getConnection(
                        "jdbc:mysql://localhost:3306/mainproject?useSSL=false&allowPublicKeyRetrieval=true",
                        "root", "");
                     PreparedStatement pst = conn.prepareStatement(
                        "UPDATE reg SET profile=? WHERE email=?")) {

                    pst.setString(1, fileName);
                    pst.setString(2, userEmail);
                    pst.executeUpdate();

                    // Update session
                    session.setAttribute("profile", fileName);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        // Redirect after upload
        response.sendRedirect("profile.jsp");  // ✅ Redirects to profile2.jsp instead of profile.jsp
    }
}
