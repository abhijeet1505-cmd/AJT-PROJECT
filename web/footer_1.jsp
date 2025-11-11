<%-- 
    Document   : footer
    Created on : 05-Nov-2025, 7:10:05 pm
    Author     : Aman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- footer.jsp --%>
<footer class="footer">
  <div class="footer-container">
    <div class="footer-left">
      <h3>Cyber Awareness Portal</h3>
      <p>
        Learn. Protect. Grow.<br>
        Empowering individuals with knowledge to stay secure online.
      </p>
    </div>

    <div class="footer-center">
      <h4>Quick Links</h4>
      <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="videos.jsp">Videos</a></li>
        <li><a href="review.jsp">Reviews</a></li>
        <li><a href="profile.jsp">Profile</a></li>
      </ul>
    </div>

    <div class="footer-right">
      <h4>Contact</h4>
      <p><i class="fa-solid fa-envelope"></i> support@cyberportal.com</p>
      <p><i class="fa-solid fa-phone"></i> +91 98765 43210</p>
      <div class="social-icons">
        <a href="#"><i class="fa-brands fa-facebook"></i></a>
        <a href="#"><i class="fa-brands fa-twitter"></i></a>
        <a href="#"><i class="fa-brands fa-linkedin"></i></a>
        <a href="#"><i class="fa-brands fa-github"></i></a>
      </div>
    </div>
  </div>

  <div class="footer-bottom">
    <p>© <%= java.time.Year.now() %> Cyber Awareness Portal. All rights reserved.</p>
  </div>

  <!-- Font Awesome for icons -->
  <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
  />
</footer>
