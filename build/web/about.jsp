<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>About Us - Political News Hub</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
<style>
/* Reset */
* { margin: 0; padding: 0; box-sizing: border-box; }
body {
    font-family: 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
    background: #f4f7fb;
    color: #1a1a2e;
    line-height: 1.6;
}

/* Navigation */
.navbar {
    background: #003366;
    padding: 15px 80px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}
.navbar .logo {
    color: white;
    font-size: 1.8rem;
    font-weight: 700;
}
.navbar .logo i {
    color: #4aa6ff;
}
.navbar nav ul {
    display: flex;
    gap: 30px;
    list-style: none;
}
.navbar nav a {
    color: white;
    text-decoration: none;
    font-weight: 500;
    transition: color 0.3s;
}
.navbar nav a:hover {
    color: #4aa6ff;
}

/* Hero Section */
.hero {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 100px 80px 80px;
    position: relative;
    min-height: 500px;
    background: linear-gradient(135deg, #ffffff 0%, #e8f0f7 100%);
    overflow: hidden;
}

/* Hero Left Text */
.hero-text {
    flex: 1;
    max-width: 600px;
}
.hero-text h1 {
    font-size: 3rem;
    font-weight: 700;
    color: #003366;
    margin-bottom: 20px;
}
.hero-text .tagline {
    font-size: 1.2rem;
    color: #4a5568;
    font-style: italic;
}

/* Image Section */
.hero-image {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
}
.hero-image img {
    width: 450px;
    height: auto;
    border-radius: 20px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.15);
    object-fit: cover;
}

/* Who We Are */
.who-we-are {
    padding: 80px 80px;
    background: #ffffff;
}
section h2 {
    font-size: 2.5rem;
    color: #003366;
    text-align: center;
    margin-bottom: 40px;
}
.who-we-are p {
    text-align: center;
    color: #4a5568;
    max-width: 850px;
    margin: 0 auto 20px;
    font-size: 1.1rem;
}

/* Info Cards */
.cards-container {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 30px;
    margin-top: 40px;
}
.info-card {
    background: #f8f9fb;
    width: 280px;
    padding: 30px;
    border-radius: 16px;
    text-align: center;
    box-shadow: 0 8px 20px rgba(0,0,0,0.05);
    transition: all 0.4s ease;
}
.info-card:hover {
    transform: translateY(-10px);
    box-shadow: 0 12px 30px rgba(0,70,150,0.15);
    background: linear-gradient(135deg, #7cbfff, #a0d8ff);
    color: white;
}
.info-card .icon {
    font-size: 3rem;
    margin-bottom: 15px;
    color: #4aa6ff;
}
.info-card:hover .icon {
    color: white;
}
.info-card h3 {
    font-size: 1.3rem;
    margin-bottom: 10px;
}

/* Footer */
.footer {
    background: #1a1a2e;
    color: white;
    padding: 60px 80px 30px;
}
.footer-content {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 40px;
    margin-bottom: 40px;
}
.footer-section h3 {
    margin-bottom: 20px;
    color: #4aa6ff;
}
.footer-bottom {
    text-align: center;
    padding-top: 30px;
    border-top: 1px solid #2a2a3e;
    color: #b0b8c1;
}

/* Responsive Fix */
@media (max-width:1024px) { 
    .hero { flex-direction: column; text-align:center; padding:80px 40px; }
    .hero-image img { width: 300px; }
}
@media (max-width:768px) {
    .hero-text h1 { font-size:2rem; }
}
</style>
</head>

<body>

<%@ include file="navbar.jsp" %>

<!-- ? HERO SECTION WITH IMAGE -->
<section class="hero">
    <div class="hero-text">
        <h1>Empowering Citizens Through Informed Political Coverage</h1>
        <p class="tagline">Together, we build a more transparent and accountable democracy for everyone.</p>
    </div>

    <div class="hero-image">
        <!-- ? Replace this image path with your image -->
        <img src="images/s2.jpg" alt="Political News Image">
    </div>
</section>

<!-- ? WHO WE ARE -->
<section class="who-we-are">
    <h2>Who We Are</h2>
    <p>Political News Hub is a leading independent news organization dedicated to providing comprehensive, unbiased political coverage.</p>
    <p>We believe that an informed citizenry is the foundation of a healthy democracy. Our mission is to deliver accurate, timely, and in-depth political news that helps you understand the issues that matter most.</p>

    <div class="cards-container">
        <div class="info-card">
            <div class="icon"><i class="fas fa-newspaper"></i></div>
            <h3>Unbiased Reporting</h3>
            <p>We provide balanced coverage across the political spectrum.</p>
        </div>
        <div class="info-card">
            <div class="icon"><i class="fas fa-users"></i></div>
            <h3>Expert Journalists</h3>
            <p>Our team consists of experienced political analysts.</p>
        </div>
        <div class="info-card">
            <div class="icon"><i class="fas fa-check-circle"></i></div>
            <h3>Fact-Checked Content</h3>
            <p>Every story is thoroughly verified and fact-checked.</p>
        </div>
    </div>
</section>

<%@ include file="Footer.jsp" %>

</body>
</html>
