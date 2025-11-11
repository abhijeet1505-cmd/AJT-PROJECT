<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="navbar.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title><%= request.getAttribute("title") %></title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        /* Reset */
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: 'Inter', sans-serif; background: #e8e3f5; }
        a { text-decoration: none; color: inherit; }

        .article-container {
            background: white;
            border-radius: 24px;
            max-width: 850px;
            margin: 160px auto 60px;
            padding: 0;
            box-shadow: 0 20px 60px rgba(0,0,0,0.12);
            overflow: hidden;
        }

        .article-body { padding: 50px 60px 60px; }

        .article-category {
            display: inline-block;
            background: #e8f0ff;
            color: #0047AB;
            padding: 8px 18px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .article-meta { color: #888; font-size: 14px; margin-bottom: 20px; }
        .article-container h1 { font-size: 46px; color: #263675; margin-bottom: 30px; }

        .article-content p { line-height: 1.8; color: #333; font-size: 17px; margin-bottom: 20px; }
        .article-content h2 { color: #0047AB; margin: 40px 0 20px; }
        .article-content h3 { color: #003380; margin: 30px 0 15px; }

        .article-hero { width: 100%; height: 450px; object-fit: cover; border-radius:20px; }

        .print-btn {
            padding: 16px 36px;
            border-radius: 50px;
            font-weight: 700;
            border: none;
            margin-top: 40px;
            cursor: pointer;
        }

        /* Fix: Remove browser header & footer on print */
        @media print {
            @page {
                size: auto;
                margin: 0;
            }

            body { margin: 0; }

            /* Hide everything except article */
            body * { display: none !important; }
            .article-container, .article-container * {
                display: block !important;
                visibility: visible !important;
            }

            .article-container {
                margin: 0;
                box-shadow: none;
                border-radius: 0;
            }

            .print-btn { display: none !important; }
        }
    </style>

    <script>
        window.onbeforeprint = function() {
            document.title = '<%= request.getAttribute("title") %>';
        };
    </script>
</head>
<body>

<jsp:include page="navbar.jsp" />

<section class="article-container">
    <div class="article-body">
        <div class="article-category">ONLINE SAFETY AND PRIVACY</div>
        <div class="article-meta"><%= request.getAttribute("date") %> | <%= request.getAttribute("readTime") %></div>

        <h1><%= request.getAttribute("title") %></h1>

        <img class="article-hero" src="<%= request.getAttribute("image") %>" alt="Article Image">

        <div class="article-content"><%= request.getAttribute("content") %></div>

        <button class="print-btn" onclick="window.print()">📄 Print Article as PDF</button>
    </div>
</section>

<jsp:include page="Footer.jsp" />

</body>
</html>
