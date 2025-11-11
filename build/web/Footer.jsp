<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Political News Hub - Footer</title>

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        /* ---------- Reset & base ---------- */
        * { box-sizing: border-box; }
        body { 
            margin: 0; 
            font-family: 'Inter', sans-serif; 
            background: linear-gradient(to bottom right, #e8e3f5 0%, #e3ecf7 50%, #dff0fa 100%);
        }
        a { text-decoration: none; color: inherit; }
        .container { width: 90%; max-width: 1350px; margin: 0 auto; }

        /* ---------- Footer ---------- */
        .footer {
            background: linear-gradient(135deg, #0a1628 0%, #162642 100%);
            color: #fff;
            padding: 60px 0 30px;
            margin-top: 80px;
            position: relative;
            overflow: hidden;
        }

        .footer::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #4aa6ff 0%, #6ec1ff 50%, #4aa6ff 100%);
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 40px;
        }

        .footer-top {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 60px;
            flex-wrap: wrap;
            gap: 40px;
        }

        .footer-brand {
            max-width: 450px;
        }

        .footer-logo {
            display: flex;
            gap: 15px;
            align-items: center;
            margin-bottom: 25px;
        }

        .logo-icon {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #4aa6ff 0%, #6ec1ff 100%);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            box-shadow: 0 4px 15px rgba(74, 166, 255, 0.3);
            color: white;
        }

        .logo-text {
            line-height: 1.3;
        }

        .logo-text .logo-main {
            font-weight: 700;
            font-size: 22px;
            letter-spacing: 0.5px;
            color: #fff;
        }

        .logo-text .logo-sub {
            font-size: 14px;
            opacity: 0.8;
            color: #8fa8c7;
        }

        .footer-description {
            color: rgba(255, 255, 255, 0.75);
            line-height: 1.7;
            margin-bottom: 25px;
            font-size: 15px;
        }

        .newsletter-section {
            margin-bottom: 25px;
        }

        .newsletter-title {
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            margin-bottom: 15px;
            color: #4aa6ff;
            font-weight: 600;
        }

        .newsletter {
            display: flex;
            gap: 10px;
        }

        .newsletter-input {
            padding: 14px 18px;
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.15);
            background: rgba(255, 255, 255, 0.08);
            color: #fff;
            min-width: 280px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .newsletter-input:focus {
            outline: none;
            border-color: #4aa6ff;
            background: rgba(255, 255, 255, 0.12);
        }

        .newsletter-input::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }

        .newsletter-btn {
            background: linear-gradient(135deg, #4aa6ff 0%, #6ec1ff 100%);
            border: none;
            padding: 14px 28px;
            border-radius: 10px;
            color: #fff;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .newsletter-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(74, 166, 255, 0.4);
        }

        .footer-right {
            display: flex;
            flex-direction: column;
            gap: 25px;
        }

        .contact-info {
            color: rgba(255, 255, 255, 0.85);
        }

        .contact-info h4 {
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            margin-bottom: 15px;
            color: #4aa6ff;
            font-weight: 600;
        }

        .contact-item {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 12px;
            font-size: 14px;
        }

        .contact-item i {
            width: 20px;
            color: #4aa6ff;
        }

        .social-icons {
            display: flex;
            gap: 12px;
        }

        .social-link {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 44px;
            height: 44px;
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.08);
            color: #fff;
            font-size: 18px;
            text-decoration: none;
            border: 1px solid rgba(255, 255, 255, 0.12);
            transition: all 0.3s ease;
        }

        .social-link:hover {
            background: linear-gradient(135deg, #4aa6ff 0%, #6ec1ff 100%);
            transform: translateY(-3px);
            border-color: transparent;
            box-shadow: 0 6px 15px rgba(74, 166, 255, 0.4);
        }

        .footer-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 50px;
            margin-bottom: 50px;
            padding-bottom: 50px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .footer-column h4 {
            font-size: 13px;
            text-transform: uppercase;
            letter-spacing: 1.8px;
            margin-bottom: 25px;
            color: #4aa6ff;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .footer-column ul {
            list-style: none;
            padding: 0;
        }

        .footer-column ul li {
            margin-bottom: 14px;
        }

        .footer-column ul li a {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            font-size: 15px;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .footer-column ul li a:hover {
            color: #4aa6ff;
            transform: translateX(5px);
        }

        .footer-column ul li a i {
            font-size: 12px;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .footer-column ul li a:hover i {
            opacity: 1;
        }

        .footer-bottom {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 30px;
            font-size: 13px;
            color: rgba(255, 255, 255, 0.6);
            flex-wrap: wrap;
            gap: 20px;
        }

        .footer-bottom-left {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .footer-bottom-links {
            display: flex;
            gap: 25px;
            flex-wrap: wrap;
        }

        .footer-bottom-links a {
            color: rgba(255, 255, 255, 0.6);
            text-decoration: none;
            transition: color 0.3s ease;
            font-size: 13px;
        }

        .footer-bottom-links a:hover {
            color: #4aa6ff;
        }

        @media (max-width: 1024px) {
            .footer-content {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 768px) {
            .container {
                padding: 0 20px;
            }

            .footer-top {
                flex-direction: column;
            }

            .footer-brand {
                max-width: 100%;
            }

            .footer-right {
                width: 100%;
            }

            .newsletter {
                flex-direction: column;
            }

            .newsletter-input {
                min-width: 100%;
            }

            .footer-content {
                grid-template-columns: 1fr;
                gap: 40px;
            }

            .footer-bottom {
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .footer-bottom-links {
                flex-direction: column;
                gap: 12px;
            }
        }
    </style>
</head>
<body>

<!-- FOOTER -->
<footer class="footer" id="footer">
    <div class="container">
        <div class="footer-top">
            <div class="footer-brand">
                <div class="footer-logo">
                    
                    <div class="logo-text">
                          <img src="images/logomain.png" alt="Political News Hub Logo" class="logo-img"style="width:60%;">
                    </div>
                </div>

                <p class="footer-description">
                    Stay informed with comprehensive political coverage, in-depth analysis, and breaking news from around the nation and the world. We deliver unbiased reporting to help you make informed decisions.
                </p>

              
            </div>

            <div class="footer-right">
                <div class="contact-info">
                    <h4>Contact Us</h4>
                    <div class="contact-item">
                        <i class="fas fa-envelope"></i>
                        <span>news@politicalhub.com</span>
                    </div>
                    <div class="contact-item">
                        <i class="fas fa-phone"></i>
                        <span>+1 (202) 555-0100</span>
                    </div>
                    <div class="contact-item">
                        <i class="fas fa-map-marker-alt"></i>
                        <span>Washington, DC 20001</span>
                    </div>
                </div>

                <div>
                    <h4 style="font-size: 14px; text-transform: uppercase; letter-spacing: 1.5px; margin-bottom: 15px; color: #4aa6ff; font-weight: 600;">Follow Us</h4>
                    <div class="social-icons">
                        <a class="social-link" href="#" title="Facebook">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a class="social-link" href="#" title="Twitter">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a class="social-link" href="#" title="LinkedIn">
                            <i class="fab fa-linkedin-in"></i>
                        </a>
                        <a class="social-link" href="#" title="YouTube">
                            <i class="fab fa-youtube"></i>
                        </a>
                        <a class="social-link" href="#" title="Instagram">
                            <i class="fab fa-instagram"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer-content">
            <div class="footer-column">
                <h4><i class="fas fa-newspaper"></i> News & Articles</h4>
                <ul>
                    <li><a href="articles.jsp">All Political Articles <i class="fas fa-arrow-right"></i></a></li>
                    <li><a href="articles.jsp?cat=elections">Elections & Campaigns <i class="fas fa-arrow-right"></i></a></li>
                    <li><a href="articles.jsp?cat=policy">Policy & Legislation <i class="fas fa-arrow-right"></i></a></li>
                    <li><a href="articles.jsp?cat=breaking">Breaking News <i class="fas fa-arrow-right"></i></a></li>
                    <li><a href="articles.jsp?cat=opinion">Opinion & Analysis <i class="fas fa-arrow-right"></i></a></li>
                </ul>
            </div>

            <div class="footer-column">
                <h4><i class="fas fa-video"></i> Videos & Media</h4>
                <ul>
                    <li><a href="videos.jsp">All Video Content <i class="fas fa-arrow-right"></i></a></li>
                    <li><a href="videos.jsp?cat=interviews">Expert Interviews <i class="fas fa-arrow-right"></i></a></li>
                    <li><a href="videos.jsp?cat=debates">Political Debates <i class="fas fa-arrow-right"></i></a></li>
                    <li><a href="videos.jsp?cat=analysis">News Analysis <i class="fas fa-arrow-right"></i></a></li>
                    <li><a href="videos.jsp?cat=live">Live Coverage <i class="fas fa-arrow-right"></i></a></li>
                </ul>
            </div>

            <div class="footer-column">
                <h4><i class="fas fa-bookmark"></i> Resources</h4>
                <ul>
                    <li><a href="resources.jsp">All Resources <i class="fas fa-arrow-right"></i></a></li>
                    <li><a href="resources.jsp?type=guides">Political Guides <i class="fas fa-arrow-right"></i></a></li>
                    <li><a href="resources.jsp?type=data">Election Data <i class="fas fa-arrow-right"></i></a></li>
                    <li><a href="resources.jsp?type=reports">Research Reports <i class="fas fa-arrow-right"></i></a></li>
                    <li><a href="glossary.jsp">Political Glossary <i class="fas fa-arrow-right"></i></a></li>
                </ul>
            </div>

            <div class="footer-column">
                <h4><i class="fas fa-info-circle"></i> About</h4>
                <ul>
                    <li><a href="about.jsp">About Us <i class="fas fa-arrow-right"></i></a></li>
                    <li><a href="about.jsp#mission">Our Mission <i class="fas fa-arrow-right"></i></a></li>
                    <li><a href="about.jsp#team">Our Team <i class="fas fa-arrow-right"></i></a></li>
                    <li><a href="contact.jsp">Contact Us <i class="fas fa-arrow-right"></i></a></li>
                    <li><a href="careers.jsp">Careers <i class="fas fa-arrow-right"></i></a></li>
                </ul>
            </div>
        </div>

        <div class="footer-bottom">
            <div class="footer-bottom-left">
                <div>&copy; 2025 Political News Hub. All rights reserved.</div>
            </div>
            <div class="footer-bottom-links">
                <a href="privacy.jsp">Privacy Policy</a>
                <a href="terms.jsp">Terms of Service</a>
                <a href="ethics.jsp">Editorial Ethics</a>
                <a href="accessibility.jsp">Accessibility</a>
                <a href="sitemap.jsp">Sitemap</a>
            </div>
        </div>
    </div>
</footer>

<script>
function handleNewsletter(event) {
    event.preventDefault();
    const email = event.target.querySelector('input[type="email"]').value;
    alert('Thank you for subscribing to Political News Hub! You will receive daily political updates at: ' + email);
    event.target.reset();
    return false;
}
</script>

</body>
</html>