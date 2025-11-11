<%@ page language="java" 
         contentType="text/html; charset=UTF-8" 
         pageEncoding="UTF-8" 
         import="java.sql.Connection, java.sql.PreparedStatement, java.sql.ResultSet, com.cyberportal.util.DBConnection" %>

<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Resources - National Cybersecurity Alliance</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <style>
            * {
                box-sizing: border-box;
            }
            body {
                font-family: 'Poppins', sans-serif;
                margin: 0;
                background: linear-gradient(135deg, #f5f7fa 0%, #e8eef5 100%);
                color: #1a1a1a;
            }

            .header1 {
                text-align: center;
                padding: 80px 20px 40px;
                margin-top: 60px;
                color:#003366;
                position: relative;
                overflow: hidden;
            }
            .header1 h1 {                                                                                           
                font-size: 2.8rem;
                font-weight: 700;
                margin-bottom: 15px;
            }
            .header1 p {
                max-width: 750px;
                margin: 0 auto;
                font-size: 1.1rem;
                line-height: 1.6;
                opacity: 0.95;
            }

            .nav-tabs {
                display: flex;
                justify-content: center;
                gap: 10px;
                padding: 30px 20px;
                position: sticky;
                top: 0;
                z-index: 100;
            }
            .nav-tab {
                padding: 12px 30px;
                border: 2px solid #e0e0e0;
                border-radius: 50px;
                font-weight: 600;
                font-size: 15px;
                color: #666;
                cursor: pointer;
                transition: all 0.3s ease;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }
            .nav-tab:hover {
                border-color: #667eea;
                color: #667eea;
                transform: translateY(-2px);
            }
            .nav-tab.active {
                background-color:#003366;
                color: white;
                border-color: #003366;
                box-shadow: 0 4px 15px rgba(0, 51, 102, 0.4);
            }

            .sub-tabs {
                display: flex;
                justify-content: center;
                gap: 40px;
                margin: 0 auto 30px;
                border-bottom: 2px solid #e0e0e0;
                max-width: 1200px;
                padding: 0 20px;
            }
            .sub-tab {
                border: none;
                font-weight: 600;
                font-size: 17px;
                color: #666;
                cursor: pointer;
                padding: 12px 20px;
                border-bottom: 3px solid transparent;
                transition: all 0.3s ease;
                position: relative;
            }
            .sub-tab:hover {
                color: #667eea;
            }
            .sub-tab.active {
                color: #003366;
                border-bottom-color: #003366;
            }
            .search-container {
                position: relative;
                margin-bottom: 50px;
                margin-top: -30px;
            }

            .search-bar {
                width: 100%;
                height: 20px;
                padding: 20px 24px;
                font-size: 16px;
                border: none;
                border-radius: 16px;
                outline: none;
                background: #f7fafc;
                transition: all 0.3s ease;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.10);
            }

            .search-bar:focus {
                box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
            }

            .search-bar::placeholder {
                color: #a0aec0;
            }

            .content-container {
                max-width: 1200px;
                margin: 30px auto;
                padding: 40px;
                background: white;
                border-radius: 20px;
                box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            }

            .articles-container {
                display: flex;
                flex-direction: column;
                gap: 20px;
            }
            .article-card {
                display: flex;
                gap: 25px;
                padding: 25px;
                border-radius: 15px;
                border: 1px solid #f0f0f0;
                transition: all 0.3s ease;
                position: relative;
                overflow: hidden;
            }
            .article-card:hover {
                transform: translateX(5px);
                box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            }
            .article-image {
                width: 180px;
                height: 140px;
                object-fit: cover;
                border-radius: 15px;
                flex-shrink: 0;
            }
            .article-content {
                flex: 1;
                display: flex;
                flex-direction: column;
                gap: 10px;
            }
            .article-content h3 {
                margin: 0;
                font-size: 1.3rem;
                color: #1a1a1a;
                font-weight: 600;
                line-height: 1.4;
            }
            .article-content p {
                margin: 0;
                font-size: 0.95rem;
                color: #666;
                line-height: 1.6;
            }
            .article-footer {
                display: flex;
                align-items: center;
                gap: 15px;
                margin-top: auto;
            }
            .read-btn {
                color: #667eea;
                font-weight: 600;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                gap: 8px;
                transition: all 0.3s ease;
            }
            .read-btn:hover {
                gap: 12px;
                color: #764ba2;
            }
            .heart-btn {
                background: none;
                border: none;
                cursor: pointer;
                font-size: 22px;
                color: #ccc;
                transition: all 0.3s ease;
                margin-left: auto;
            }
            .heart-btn:hover {
                color: #ff6b6b;
                transform: scale(1.2);
            }
            .heart-btn.active {
                color: #ff6b6b;
                animation: heartBeat 0.3s ease;
            }
            @keyframes heartBeat {
                0%, 100% {
                    transform: scale(1);
                }
                50% {
                    transform: scale(1.3);
                }
            }

            .videos-section {
                max-width: 1100px;
                margin: 0 auto;
                background: white;
                border-radius: 24px;
                padding: 40px;
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08);
            }

            .videos-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 30px;
            }

            .videos-header h1 {
                font-size: 42px;
                color: #003366;
                font-weight: 700;
            }

            .videos-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(380px, 1fr));
                gap: 30px;
            }

            .video-card {
                border-radius: 10px;
                overflow: hidden;
                width: 100%;
                cursor: pointer;
            }

            .video-thumbnail {
                position: relative;
                width: 100%;
                height: 0;
                padding-bottom: 56.25%;
                overflow: hidden;
            }

            .video-thumbnail iframe {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                border: none;
            }

            .play-overlay {
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: rgba(0, 0, 0, 0.3);
                display: flex;
                align-items: center;
                justify-content: center;
                transition: all 0.3s ease;
            }

            .video-card:hover .play-overlay {
                background: rgba(0, 0, 0, 0.5);
            }

            .play-button {
                width: 70px;
                height: 70px;
                background: rgba(255, 255, 255, 0.95);
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                transition: all 0.3s ease;
            }

            .play-button i {
                color: #6b21ff;
                font-size: 28px;
                margin-left: 4px;
            }

            .video-card:hover .play-button {
                transform: scale(1.1);
                background: white;
            }

            .video-info {
                padding: 20px;
                color:#1a1a2e;
            }

            .video-category {
                color: #868e96;
                font-size: 12px;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 1px;
                margin-bottom: 8px;
            }

            .video-title {
                font-size: 18px;
                color: gray;
                line-height: 1.4;
            }

            @media (max-width: 768px) {
                .videos-section {
                    padding: 20px;
                }

                .videos-header h1 {
                    font-size: 32px;
                }

                .videos-grid {
                    grid-template-columns: 1fr;
                }

                .filter-tabs {
                    overflow-x: auto;
                    flex-wrap: nowrap;
                    -webkit-overflow-scrolling: touch;
                }
            }
            @media (max-width: 768px) {
                .header1 h1 {
                    font-size: 2rem;
                }
                .content-container {
                    padding: 20px;
                    margin: 20px;
                }
                .article-card {
                    flex-direction: column;
                }
                .article-image {
                    width: 100%;
                    height: 200px;
                }
                .videos-grid {
                    grid-template-columns: 1fr;
                }
                .nav-tabs {
                    flex-direction: column;
                    gap: 10px;
                }
                .sub-tabs {
                    gap: 20px;
                }
            }

            .title_a {
                margin-bottom: 40px;
            }

            .title_a p {
                font-size: 36px;
                font-weight: 800;
                color: #003366;
                letter-spacing: -1px;
                margin-left:30px;
            }

        </style>

        <script>
        // Main Tab
            function switchMainTab(tabName, event){
            document.querySelectorAll('.nav-tab').forEach(btn => btn.classList.remove('active'));
            document.querySelectorAll('.tab-content').forEach(sec => sec.style.display = 'none');
            document.getElementById(tabName).style.display = 'block';
            if (event && event.currentTarget) event.currentTarget.classList.add('active');
            // Set default sub-tab for main tab
            if (tabName === 'onlineSafety'){
            showSubContent('articles1', document.querySelector('#onlineSafety .sub-tab'));
            } else if (tabName === 'careersEducation'){
            showSubContent('articles2', document.querySelector('#careersEducation .sub-tab'));
            }
            }

        // Sub Tabs
            function showSubContent(id, element){
            const parent = element.closest('.tab-content');
            parent.querySelectorAll('.sub-content').forEach(sc => sc.style.display = 'none');
            parent.querySelectorAll('.sub-tab').forEach(sb => sb.classList.remove('active'));
            document.getElementById(id).style.display = 'block';
            element.classList.add('active');
            }

        // Favorites
         function toggleHeart(button, id, title, description, image, category, link) {
    // Get favorites from localStorage
    let favorites = JSON.parse(localStorage.getItem('favorites')) || { articles: [], videos: [] };
    
    // Check if this article is already in favorites
    const index = favorites.articles.findIndex(a => a.id === id);

    if (index === -1) {
        // Add article to favorites
        favorites.articles.push({ id, title, description, image, category, link });
        button.innerHTML = '<i class="fas fa-heart"></i>';
        alert("Added to favorites!");
    } else {
        // Remove article from favorites
        favorites.articles.splice(index, 1);
        button.innerHTML = '<i class="far fa-heart"></i>';
        alert("Removed from favorites!");
    }
    
    // Save back to localStorage
    localStorage.setItem('favorites', JSON.stringify(favorites));

    // Redirect to favorites page
    window.location.href = 'fav.jsp';
}


            function toggleVideoHeart(element, videoId, videoTitle, videoUrl, videoCategory){
            element.classList.toggle('active');
            let favorites = JSON.parse(localStorage.getItem('favorites')) || {articles:[], videos:[]};
            const existingIndex = favorites.videos.findIndex(item => item.id === videoId);
            if (existingIndex > - 1){
            favorites.videos.splice(existingIndex, 1); element.classList.remove('active'); alert('Removed from favorites!');
            } else {
            favorites.videos.push({id:videoId, title:videoTitle, videoId:videoUrl, category:videoCategory});
            element.classList.add('active');
            if (confirm('Added to favorites! View now?')) window.location.href = 'fav.jsp';
            }
            localStorage.setItem('favorites', JSON.stringify(favorites));
            }

        // Load
            window.onload = function(){
            switchMainTab('onlineSafety');
            let favorites = JSON.parse(localStorage.getItem('favorites')) || {articles:[], videos:[]};
            document.querySelectorAll('.heart-btn').forEach(btn => {
            const id = btn.getAttribute('data-id');
            if (id && favorites.articles.some(a => a.id === id)) btn.classList.add('active');
            });
            }
        </script>
    </head>

    <body>
    <div class="header1">
    <h1>Your Source for Political Insights & Updates</h1>
    <p>Explore the latest political news, in-depth articles, and analysis videos covering elections, policies, governance, and global affairs.</p>
</div>


       
        <!-- Online Safety -->
        <div id="onlineSafety" class="tab-content">
            <div class="sub-tabs">
                <button class="sub-tab" onclick="showSubContent('articles1', this)">Articles</button>
                <button class="sub-tab" onclick="showSubContent('videos1', this)">Videos</button>
            </div>

            <!-- Articles -->
            <div id="articles1" class="sub-content" style="display:block">

                <div class="content-container">
                    <div class="articles-container">
                        <!-- Example Article Card -->
                        <div class="title_a">
                            <p>Articles</p>
                        </div>
                        <div class="search-container">
                            <input type="text" class="search-bar" placeholder="🔍 Search articles...">
                        </div>
                        <div class="article-card">
                            <img src="images/207.jpg" class="article-image">
                            <div class="article-content">
                                <h3>Trump Threatens War on Nigeria to ‘Save’ ‘Our CHERISHED Christians’</h3>
                                <p>“We know the heart and intent of Trump is to help us fight insecurity,”</p>
                                <div class="article-footer">
                                    <a href="ResourceDetailServlet?id=207" class="read-btn">Read <i class="fas fa-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>

                        <div class="article-card">
                            <img src="images/208.jpg" alt="Digital IDs" class="article-image">
                            <div class="article-content">
                                <h3>Paper to Metal? New Currency Trends Challenge Dollar’s Reign</h3>
                                <p>Long dismissed as an anachronistic store of value, gold is reasserting its primacy amid monetary uncertainty.</p>
                                <div class="article-footer">
                                    <a href="ResourceDetailServlet?id=208" class="read-btn">Read <i class="fas fa-arrow-right"></i></a>
                                  
                                </div>
                            </div>
                        </div>
                        <div class="article-card">
                            <img src="images/209.jpg" alt="Social Security Scams" class="article-image">
                            <div class="article-content">
                                <h3>Grasping SC’s Interim Intervention in the Waqf Amendments, 2025</h3>
                                <p>Be it on the issue of the disproportionately stringent control over the Islamic institution of Waqf (as compared to the administration of Hindu muths or temples),</p>
                                <div class="article-footer">
                                    <a href="ResourceDetailServlet?id=209" class="read-btn">Read <i class="fas fa-arrow-right"></i></a>
                                  
                                </div>
                            </div>
                        </div>
                        <div class="article-card">
                            <img src="images/210.jpg" alt="Charity Scams" class="article-image">
                            <div class="article-content">
                                <h3>10 Lies US Ambassador Told UN About Cuba Blockade</h3>
                                <p>Ahead of the UN vote on the US-imposed blockade on Cuba, the US once again spread lies about the nature and intent of its coercive policy on Cuba</p>
                                <div class="article-footer">
                                    <a href="ResourceDetailServlet?id=210" class="read-btn">Read <i class="fas fa-arrow-right"></i></a>
                               
                                </div>
                            </div>
                        </div>

<!--                        <div class="article-card">
                            <img src="images/firsta1.jpg" alt="Document Sharing" class="article-image">
                            <div class="article-content">
                                <h3>Document Sharing Security Tips: How to Stay Safe with Shared Docs</h3>
                                <p>In both our professional and personal lives, shared documents are an integral part of how we connect with others.</p>
                                <div class="article-footer">
                                    <a href="ResourceDetailServlet?id=211" class="read-btn">Read <i class="fas fa-arrow-right"></i></a>
                                    <button class="heart-btn" data-id="211" onclick="toggleHeart(this, '211', 'Document Sharing Security Tips: How to Stay Safe with Shared Docs', 'In both our professional and personal lives, shared documents are an integral part of how we connect with others.', 'images/firsta1.jpg', 'Online Safety', 'ResourceDetailServlet?id=211')">
                                        <i class="far fa-heart"></i>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="article-card">
                            <img src="images/firsta2.jpg" alt="Scammers Target" class="article-image">
                            <div class="article-content">
                                <h3>Why Do Scammers Target Older Adults?</h3>
                                <p>As we spend more of our lives online every year, we're all now targets for scammers and other criminals.</p>
                                <div class="article-footer">
                                    <a href="ResourceDetailServlet?id=212" class="read-btn">Read <i class="fas fa-arrow-right"></i></a>
                                    <button class="heart-btn" data-id="212" onclick="toggleHeart(this, '212', 'Why Do Scammers Target Older Adults?', 'As we spend more of our lives online every year, we\\'re all now targets for scammers and other criminals.', 'images / firsta2.jpg', 'Online Safety', 'ResourceDetailServlet?id = 212')">
                                        <i class="far fa-heart"></i>
                                    </button>
                                </div>
                            </div>
                        </div>-->

                    </div>
                </div>
            </div>

            <!-- Videos -->
         

<div id="videos1" class="sub-content" style="display:none">
    <div class="videos-container">
        <div class="videos-section">
            <div class="videos-header">
                <h1>Videos</h1>
            </div><br>

            <div class="search-container">
                <input type="text" class="search-bar" placeholder="🔍 Search videos...">
            </div>

            <div class="videos-grid">
                <%
                    try {
                        Connection conn = DBConnection.getConnection();
                        PreparedStatement ps = conn.prepareStatement("SELECT * FROM video ORDER BY id DESC");
                        ResultSet rs = ps.executeQuery();

                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String heading1 = rs.getString("heading1"); // Category
                            String heading2 = rs.getString("heading2"); // Title
                            String videoLink = rs.getString("video_link"); // YouTube or MP4

                            // Convert YouTube link to embeddable link
                            String embedLink = videoLink;
                            if(videoLink.contains("youtube.com") || videoLink.contains("youtu.be")) {
                                if(videoLink.contains("watch?v=")) {
                                    embedLink = videoLink.replace("watch?v=", "embed/");
                                } else if(videoLink.contains("youtu.be/")) {
                                    embedLink = videoLink.replace("youtu.be/", "www.youtube.com/embed/");
                                }
                            }
                %>
                <!-- Dynamic Video Card -->
                <div class="video-card" onclick="openVideo('<%= id %>')">
                    <div class="video-thumbnail">
                        <% if(videoLink.contains("youtube.com") || videoLink.contains("youtu.be")) { %>
                            <iframe src="<%= embedLink %>" allowfullscreen></iframe>
                        <% } else { %>
                            <video controls>
                                <source src="<%= videoLink %>" type="video/mp4">
                                Your browser does not support the video tag.
                            </video>
                        <% } %>
                    </div>
                    <div class="video-info">
                        <div class="video-category"><%= heading1 %></div>
                        <div class="video-title"><%= heading2 %></div>
                    </div>
                </div>
                <%
                        }
                        rs.close();
                        ps.close();
                        conn.close();
                    } catch(Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
        </div>
    </div>
</div>


        <script>
            function openVideo(videoId) {
                window.open(`https://www.youtube.com/watch?v=${videoId}`, '_blank');
            }

            // Filter tabs functionality
            const filterTabs = document.querySelectorAll('.filter-tab');
            filterTabs.forEach(tab => {
                tab.addEventListener('click', function() {
                    filterTabs.forEach(t => t.classList.remove('active'));
                    this.classList.add('active');
                });
            });

            // Search functionality
            const searchBars = document.querySelectorAll('.search-bar');
            searchBars.forEach(searchBar => {
                searchBar.addEventListener('input', function(e) {
                    const searchTerm = e.target.value.toLowerCase();
                    const parent = this.closest('.sub-content');
                    
                    // Search in articles
                    const articleCards = parent.querySelectorAll('.article-card');
                    articleCards.forEach(card => {
                        const title = card.querySelector('h3')?.textContent.toLowerCase() || '';
                        const description = card.querySelector('p')?.textContent.toLowerCase() || '';
                        if (title.includes(searchTerm) || description.includes(searchTerm)) {
                            card.style.display = 'flex';
                        } else {
                            card.style.display = 'none';
                        }
                    });

                    // Search in videos
                    const videoCards = parent.querySelectorAll('.video-card');
                    videoCards.forEach(card => {
                        const title = card.querySelector('.video-title')?.textContent.toLowerCase() || '';
                        const category = card.querySelector('.video-category')?.textContent.toLowerCase() || '';
                        if (title.includes(searchTerm) || category.includes(searchTerm)) {
                            card.style.display = 'block';
                        } else {
                            card.style.display = 'none';
                        }
                    });
                });
            });
        </script>
        <%@ include file="Footer.jsp" %>
    </body>
</html>