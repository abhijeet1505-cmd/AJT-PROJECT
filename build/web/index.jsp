<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="java.util.List, java.util.ArrayList" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconnect.jsp" %>


<%!
    // Small POJOs declared inside JSP so no external classes required.
    public static class Resource {
        private int id;
        private String title;
        private String description;
        private String image;
        private String category;
        public Resource(int id, String title, String description, String image, String category){
            this.id = id; this.title = title; this.description = description; this.image = image; this.category = category;
        }
        public int getId(){ return id; }
        public String getTitle(){ return title; }
        public String getDescription(){ return description; }
        public String getImage(){ return image; }
        public String getCategory(){ return category; }
    }
    public static class Event {
        private int id;
        private String title;
        private String description;
        private String eventDate;
        private String location;
        private String image;
        private String link1;
        private String link2;
        public Event(int id, String title, String description, String eventDate, String location, String image, String link1, String link2){
            this.id = id; this.title = title; this.description = description; this.eventDate = eventDate; this.location = location;
            this.image = image; this.link1 = link1; this.link2 = link2;
        }
        public int getId(){ return id; }
        public String getTitle(){ return title; }
        public String getDescription(){ return description; }
        public String getEventDate(){ return eventDate; }
        public String getLocation(){ return location; }
        public String getImage(){ return image; }
        public String getLink1(){ return link1; }
        public String getLink2(){ return link2; }
    }
%>

<%
    // If servlet not used, create fallback lists here
    if (request.getAttribute("resources") == null) {
        List<Resource> res = new ArrayList<>();
        res.add(new Resource(1, "Karnataka: Domestic Workers Bill a Good Step, But Some Concerns Persist",
            "While the Bill represents a crucial step towards recognizing domestic work as real work deserving of protection, its success hinges on sound financial planning and legislative coherence.",
            "images/i1.jpg", "Latest"));
       
        request.setAttribute("resources", res);
        request.setAttribute("totalResources", 839);
    }
   
%>
<%
String userName = (String) session.getAttribute("userName");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>National Cybersecurity Alliance - Home</title>

    <!-- Google font (optional) -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
        /* ---------- Reset & base ---------- */
        *{box-sizing:border-box}
        body{margin:0;font-family:'Inter',sans-serif;background-color: #ffffff;}
        a{text-decoration:none;color:inherit}
        .container{width:90%;max-width:1350px;margin:0 auto}


        /* ---------- Hero slider ---------- */
        .hero-slider{position:relative;overflow:hidden;height:97vh;min-height:380px;border-bottom-left-radius:40px;border-bottom-right-radius: 40px;margin: 0 15px;}
        .slider{position:relative;height:100%}
        .slide{position:absolute;left:0;top:0;width:100%;height:100%;background-size:cover;background-position:center;opacity:0;transition:opacity 1s}
        .slide.active{opacity:1}
        .slide-overlay{position:absolute;inset:0;background:linear-gradient(180deg,rgba(3,36,71,0.28),rgba(3,36,71,0.6))}
        .slide-content{position:absolute;left:5%;bottom:12%;max-width:520px;color:#fff}
        .slide-content h1{font-size:34px;margin:0 0 10px}
        .slide-content p{margin:0 0 16px}
        .hero-btn{background:#ff7a00;border:none;padding:10px 18px;border-radius:6px;color:#fff;cursor:pointer;font-weight:700}

        /* indicators */
        .indicators{position:absolute;right:20px;bottom:20px;display:flex;gap:8px}
        .indicators .dot{width:10px;height:10px;border-radius:50%;background:rgba(255,255,255,0.5);cursor:pointer}
        .indicators .dot.active{background:#ff7a00}

       /* ---------- Resources ---------- */
.resources-section {
    padding: 110px 0;
    margin:0 ;
    
}

.section-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 18px;
}

.section-title {
    margin: 0;
    font-size: 46px;
    color: #263675;
    font-weight: 800;
}

.hero-btn {
    background: #6b2cf5;
    color: #fff;
    border: none;
    border-radius: 30px;
    padding: 12px 26px;
    font-weight: 600;
    cursor: pointer;
    box-shadow: 0 4px 10px rgba(107, 44, 245, 0.3);
    transition: all 0.3s ease;
}

.hero-btn:hover {
    background: #5021c9;
    transform: translateY(-2px);
}

.resource-count {
    display: flex;
    align-items: center;
    gap: 8px;
    font-weight: 100;
    font-size: 28px;
    margin-bottom: 24px;
}

.resource-number {
  font-size: 28px;
  color: rgba(38, 54, 117, 0.6); /* makes it appear lighter */
  font-weight: 100;
}



.filter-tags {
    display: flex;
    gap: 16px;
    margin-bottom: 24px;
    flex-wrap: wrap;
}

.tag {
    padding: 8px 14px;
    border-radius: 20px;
    border: 1px solid #ddd;
    background: #fff;
    cursor: pointer;
    font-weight: 600;
    color: #444;
}

.tag.active-tag {
    background: #002855;
    color: #fff;
    border-color: #002855;
}

/* Featured Resource */
.featured-resource {
    display: flex;
    align-items: center;
    gap: 24px;
    border-radius: 14px;
    margin-bottom: 40px;
    overflow: hidden;
}

.featured-image {
  
    height: 360px;
    width: 60%;
    background-size: cover;
    background-position: center;
    border-radius:20px;
}

.featured-content {
    flex: 1;
    padding: 24px;
}

.featured-title {
    font-size: 22px;
    color: #0b2140;
    margin-bottom: 10px;
}

.featured-desc {
    font-size: 15px;
    color: #444;
    margin-bottom: 14px;
}

.read-btn {
    background: #f2f2f2;
    border: none;
    border-radius: 30px;
    padding: 10px 22px;
    font-weight: 600;
    cursor: pointer;
    transition: 0.3s;
}

.read-btn:hover {
    background: #e1e1e1;
}

/* Smaller Articles */
.resources-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
    gap: 20px;
   
}



.resource-card:hover {
    transform: translateY(-4px);
}

.resource-image {
    height: 140px;
    background-size: cover;
    background-position: center;
     border-radius:20px;
    
}

.resource-content {
    padding: 14px;
}

.resource-title {
    margin: 0 0 8px;
    font-size: 16px;
    color: #0b2140;
    font-weight: 700;
}

.resource-description {
    margin: 0;
    font-size: 14px;
    color: #444;
}
.read-link {
    color:#263675;
    font-weight: bold;
    cursor: pointer;
    text-decoration: none;
    transition: 0.3s;
}

.read-link:hover {
    text-decoration: underline;
}


        /* ---------- Events ---------- */
        .events-section{padding:90px 0;}
        .events-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(260px,1fr));gap:97px;}
        .event-card{background:#fff;border-radius:30px;overflow:hidden;box-shadow:0 6px 18px rgba(11,33,64,0.04);width:107%;}
        .event-image{height:140px;background-size:cover;width:90%;height:200px;margin-left:30px;margin-top:40px;background-position:center;position:relative;border-radius:20px;}
        .event-badge{position:absolute;left:10px;top:10px;background:#ff7a00;color:#fff;padding:6px 10px;border-radius:6px;font-weight:700;font-size:12px}
        .event-content{padding:42px}
        .event-actions{display:flex;gap:10px;margin-top:10px}
        .event-link{padding:8px 12px;border-radius:6px;border:1px solid #002855;color:#002855;font-weight:700}

        
        
         .testimonials-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 60px;
            gap: 40px;
            flex-wrap: wrap;
        }

        .testimonials-title {
            flex: 1;
            min-width: 300px;
        }

        .testimonials-title h2 {
            color: #003d7a;
            font-size: 48px;
            font-weight: 700;
            line-height: 1.2;
            margin-bottom: 10px;
        }

        .testimonials-title .subtitle {
            color: #4a5568;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-bottom: 50px;
        }

        .testimonials-actions {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .action-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 12px 24px;
            border-radius: 8px;
            border: 2px solid #5b4de8;
            background: white;
            color: #5b4de8;
            font-weight: 600;
            font-size: 15px;
            text-decoration: none;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .action-btn:hover {
            background: #5b4de8;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(91, 77, 232, 0.3);
        }

        .testimonials-slider {
            overflow: hidden; /* Hide overflowing cards */
    position: relative;
        }

        .testimonials-track {
            display: flex;
            transition: transform 0.5s ease;
            gap: 30px;
        }
        .testimonials-grid {
    display: flex;
    flex-wrap: wrap;
    gap: 30px; /* spacing between cards */
    justify-content: flex-start;
}


       .testimonial-card {
    width: 48%;
    background: #fff;
    padding: 25px;
    border-radius: 15px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.05);
    text-align: center;
    transition: transform 0.3s ease;
    box-sizing: border-box;
    margin-bottom:15%;
}


.testimonial-card:hover {
    transform: translateY(-5px);
}

        .testimonial-quote {
            color: #2d3748;
            font-size: 18px;
            font-style: italic;
            line-height: 1.7;
            margin-bottom: 30px;
        }

        .testimonial-divider {
            width: 60px;
            height: 4px;
            background: linear-gradient(90deg, #5b4de8, #8b7ff8);
            margin-bottom: 25px;
            border-radius: 2px;
        }

        .testimonial-author {
            color: #a0aec0;
            font-size: 16px;
            font-weight: 600;
            margin-bottom: 5px;
        }

        .testimonial-role {
            color: #cbd5e0;
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .slider-controls {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-top: 40px;
        }

        .slider-btn {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: white;
            border: 2px solid #e2e8f0;
            color: #4a5568;
            font-size: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .slider-btn:hover {
            background: #5b4de8;
            color: white;
            border-color: #5b4de8;
            transform: scale(1.1);
        }

        .slider-btn:disabled {
            opacity: 0.3;
            cursor: not-allowed;
        }

        .slider-btn:disabled:hover {
            background: white;
            color: #4a5568;
            border-color: #e2e8f0;
            transform: scale(1);
        }

        .featured-text {
            text-align: center;
            color: #a0aec0;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-top: 50px;
        }

        @media (max-width: 1200px) {
            .testimonial-card {
                min-width: calc(50% - 15px);
            }
        }

        @media (max-width: 768px) {
            .testimonials-header {
                flex-direction: column;
            }

            .testimonials-title h2 {
                font-size: 36px;
            }

            .testimonials-actions {
                flex-direction: column;
                width: 100%;
            }

            .action-btn {
                width: 100%;
                justify-content: center;
            }

            .testimonial-card {
                min-width: 100%;
            }

            .testimonial-quote {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>

  <!-- HEADER -->
 <jsp:include page="navbar.jsp" />
    <!-- HERO / SLIDER -->
    <section class="hero-slider">
        <div class="slider">
             <div class="slide active" style="background-image:url('images/s2.jpg')">
                <div class="slide-overlay"></div>
                <div class="slide-content container">
                    <h1>Every Vote, Every Voice.</h1>
                    <p>Get the latest updates and opinions on upcoming elections and leaders.</p>
                    
                </div>
            </div>
            <div class="slide" style="background-image:url('images/s1.avif')">
                <div class="slide-overlay"></div>
                <div class="slide-content container">
                    <h1>Stay Informed. Stay Empowered.</h1>
                    <p>Explore in-depth political articles and insights that shape the world.</p>
                   
                </div>
            </div>

            <div class="slide" style="background-image:url('images/i4.jpg')">
                <div class="slide-overlay"></div>
                <div class="slide-content container">
                    <h1>Politics Beyond Borders.</h1>
                    <p>Understand global power shifts through expert analysis and real stories.</p>
                    
                </div>
            </div>

           
        </div>
        
        <div class="indicators">
            <div class="dot active" data-index="0"></div>
            <div class="dot" data-index="1"></div>
            <div class="dot" data-index="2"></div>
        </div>
    </section>

    <!-- RESOURCES -->
<section class="resources-section" id="resources">
   
    <div class="container">
        <div class="section-header">
            <h2 class="section-title">Latest Resources</h2>
        </div>

        <div class="resource-count">
            <p>OVER</p>
            <span class="resource-number">
                <%= request.getAttribute("totalResources") != null ? request.getAttribute("totalResources") : "839" %>
            </span>
            <p>ARTICLES AND RESOURCES</p>
        </div>

      
       <!-- Featured Resource -->
<div class="featured-resource">
    <div class="featured-image" style="background-image:url('images/i1.jpg');"></div>
    <div class="featured-content">
        <h3 class="featured-title">Karnataka: Domestic Workers Bill a Good Step, But Some Concerns Persist</h3>
        <p class="featured-desc">While the Bill represents a crucial step towards recognizing domestic work as real work deserving of protection, its success hinges on sound financial planning and legislative coherence.</p>
        
        <form action="ResourceDetailServlet" method="get">
    <!-- Hidden ID -->
    <input type="hidden" name="id" value="11">

    <!-- Red "Read →" button -->
    <button type="submit" class="read-btn">Read →</button>
</form>
    </div>
</div>


       <!-- Smaller 4 Articles -->
<div class="resources-grid">
    <div class="resource-card">
        <div class="resource-image" style="background-image:url('images/r2.jpeg');"></div>
        <div class="resource-content">
            <h3 class="resource-title">
India’s Crony Corporate State and the Anatomy..</h3>
            <p class="resource-description">India’s crony economy thrives on the interdependence of politics....</p><br>
            <a href="ResourceDetailServlet?id=1" class="read-link">Read →</a>
        </div>
    </div>

    <div class="resource-card">
        <div class="resource-image" style="background-image:url('images/i2.jpeg');"></div>
        <div class="resource-content">
            <h3 class="resource-title">US: People go Hungry as Trump Pours Millions...</h3>
            <p class="resource-description">The Trump administration continues to escalate its threats...</p><br>
            <a href="ResourceDetailServlet?id=2" class="read-link">Read →</a>
        </div>
    </div>

    <div class="resource-card">
        <div class="resource-image" style="background-image:url('images/i3.jpeg');"></div>
        <div class="resource-content">
            <h3 class="resource-title">
South Korea: Trump Faces Protests Over Tariff War...</h3>
            <p class="resource-description">Trump, who is visiting South Korea to attend the APEC summit...</p><br>
            <a href="ResourceDetailServlet?id=3" class="read-link">Read →</a>
        </div>
    </div>

    <div class="resource-card">
        <div class="resource-image" style="background-image:url('images/i4.jpg');"></div>
        <div class="resource-content">
            <h3 class="resource-title">Bihar Elections: The Close Connection of Crime...</h3>
            <p class="resource-description">Hundreds of candidates in the fray face criminal cases....</p><br>
            <a href="ResourceDetailServlet?id=4" class="read-link">Read →</a>
        </div>
    </div>
</div>

</section>


    <!-- ---------- Scripts ---------- -->
    <script>
        // scroll helper
        function scrollToSection(id){ document.getElementById(id).scrollIntoView({behavior:'smooth'}); }

      
        // Filter tags - UI only
        document.querySelectorAll('.tag').forEach(tag=>{
            tag.addEventListener('click', function(){
                document.querySelectorAll('.tag').forEach(t=>t.classList.remove('active-tag'));
                this.classList.add('active-tag');
            });
        });

        // Slider logic
        (function(){
            const slides = document.querySelectorAll('.slide');
            const dots = document.querySelectorAll('.dot');
            let idx = 0;
            let timer = null;

            function show(i){
                slides.forEach(s=>s.classList.remove('active'));
                dots.forEach(d=>d.classList.remove('active'));
                slides[i].classList.add('active');
                dots[i].classList.add('active');
                idx = i;
            }

            function next(){ show((idx+1) % slides.length); }

            dots.forEach(d=>{
                d.addEventListener('click', function(){ show(parseInt(this.getAttribute('data-index'))); restart(); });
            });

            function start(){ timer = setInterval(next, 1500); }
            function stop(){ clearInterval(timer); timer = null; }
            function restart(){ stop(); start(); }

            // start slider
            if(slides.length>0) start();
            // pause on hover
            document.querySelector('.hero-slider').addEventListener('mouseenter', stop);
            document.querySelector('.hero-slider').addEventListener('mouseleave', start);
        })();
    </script>
    
    <jsp:include page="Footer.jsp" />
</body>
</html>
