<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List, java.util.ArrayList" %>
<%
String userName = (String) session.getAttribute("userName");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>National Cybersecurity Alliance - Home</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        /* ---------- Reset & base ---------- */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: #f8f9fa;
            min-height: 100vh;
            padding-top: 80px;
        }
        
        a {
            text-decoration: none;
            color: inherit;
        }

        /* ---------- Header / Nav ---------- */
        .header {
            background: rgba(255, 255, 255, 0.75);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            border-bottom: 1px solid rgba(255, 255, 255, 0.3);
        }

        .nav-wrapper {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 16px 48px;
            max-width: 1400px;
            margin: 0 auto;
        }

        /* Logo Section */
        .logo {
            display: flex;
            align-items: center;
            flex-shrink: 0;
            z-index: 1001;
        }

        .logo img {
            height:69px;
        }

        /* Burger Menu Icon */
        .burger-menu {
            display: none;
            flex-direction: column;
            cursor: pointer;
            gap: 5px;
            z-index: 1001;
            padding: 8px;
        }

        .burger-menu span {
            width: 25px;
            height: 3px;
            background-color: #333;
            transition: all 0.3s ease;
            border-radius: 3px;
        }

        .burger-menu.active span:nth-child(1) {
            transform: rotate(45deg) translate(8px, 8px);
        }

        .burger-menu.active span:nth-child(2) {
            opacity: 0;
        }

        .burger-menu.active span:nth-child(3) {
            transform: rotate(-45deg) translate(7px, -7px);
        }

        /* Nav Menu */
        .nav-menu {
            display: flex;
            gap: 32px;
            align-items: center;
            
           
        }

        .nav-link {
            color: #333;
            font-weight: 500;
            font-size: 15px;
       
            transition: color 0.2s ease;
            position: relative;
            padding: 8px 0;
        }

        .nav-link:hover {
            color: #4a90e2;
        }

        .nav-link::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0;
            height: 2px;
            background: #4a90e2;
            transition: width 0.3s ease;
        }

        .nav-link:hover::after {
            width: 100%;
        }

        /* Search Bar */
        .search_container {
            flex: 1;
            max-width: 280px;
            margin: 0 48px;
        }

        .search-wrapper {
            display: flex;
            align-items: center;
            background: #f5f5f5;
            border-radius: 8px;
            padding: 10px 16px;
            transition: all 0.2s ease;
            border: 1px solid transparent;
        }

        .search-wrapper:focus-within {
            background: #ffffff;
            border-color: #4a90e2;
            box-shadow: 0 0 0 3px rgba(74, 144, 226, 0.1);
        }

        .search-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
            color: #666;
        }

        .search-input {
            border: none;
            background: transparent;
            outline: none;
            font-family: 'Inter', sans-serif;
            font-size: 14px;
            color: #333;
            width: 100%;
            font-weight: 400;
        }

        .search-input::placeholder {
            color: #999;
        }

        /* Right Actions */
        .nav-actions {
            display: flex;
            align-items: center;
            gap: 20px;
            flex-shrink: 0;
        }

        /* Heart/Favorite Icon */
        .heart-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 38px;
            height: 38px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.2s ease;
            color: #666;
        }

        .heart-icon:hover {
            background: #f5f5f5;
            color: #e74c3c;
        }

        .heart-icon svg {
            width: 20px;
            height: 20px;
        }

        /* User Dropdown */
        .user-dropdown {
            position: relative;
        }

        .user-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 38px;
            height: 38px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.2s ease;
            color: #666;
            background: #f5f5f5;
        }

        .user-icon:hover {
            background: #e8e8e8;
        }

        .user-icon svg {
            width: 20px;
            height: 20px;
        }

        /* Dropdown Menu */
        .dropdown-menu {
            position: absolute;
            top: calc(100% + 8px);
            right: 0;
            background: #ffffff;
            border-radius: 8px;
            min-width: 180px;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.12);
            border: 1px solid #e8e8e8;
            opacity: 0;
            visibility: hidden;
            transform: translateY(-8px);
            transition: all 0.2s ease;
        }

        .user-dropdown:hover .dropdown-menu {
            opacity: 1;
            visibility: visible;
            transform: translateY(0);
        }

        .dropdown-item {
            display: flex;
            align-items: center;
            padding: 12px 16px;
            color: #333;
            font-weight: 500;
            font-size: 14px;
            transition: all 0.2s ease;
            gap: 12px;
        }

        .dropdown-item:first-child {
            border-radius: 8px 8px 0 0;
        }

        .dropdown-item:last-child {
            border-radius: 0 0 8px 8px;
        }

        .dropdown-item:hover {
            background: #f5f5f5;
        }

        .dropdown-item svg {
            width: 18px;
            height: 18px;
            color: #666;
        }

        /* Divider */
        .dropdown-divider {
            height: 1px;
            background: #e8e8e8;
            margin: 4px 0;
        }

       /* Sign In Button */
.signin-btn {
    padding: 10px 24px;
    background-color:#263675;
    color: #ffffff;
    border-radius: 8px;
    font-weight: 600;
    font-size: 14px;
    transition: all 0.2s ease;
    border: none;
    margin-left:20px;
}

/* Hover: only slight color change (no layer effect) */
.signin-btn:hover {
    background-color: #7b97b8;  /* lighter simple hover – optional */
    transform: none;            /* no movement */
    box-shadow: none;           /* no shadow layer */
}


        /* Mobile Overlay */
        .mobile-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .mobile-overlay.active {
            display: block;
            opacity: 1;
        }

        /* ---------- Tablet Responsive (768px - 1024px) ---------- */
        @media (max-width: 1024px) {
            .nav-wrapper {
                padding: 16px 32px;
            }

            .search_container {
                max-width: 220px;
                margin: 0 24px;
            }

            .nav-menu {
                gap: 24px;
            }

            .nav-link {
                font-size: 14px;
            }

            .nav-actions {
                gap: 16px;
            }
        }

        /* ---------- Mobile Responsive (max-width: 768px) ---------- */
        @media (max-width: 768px) {
            body {
                padding-top: 70px;
            }

            .nav-wrapper {
                padding: 12px 20px;
            }

            .logo img {
                height: 36px;
            }

            /* Show burger menu */
            .burger-menu {
                display: flex;
            }

            /* Hide desktop nav menu */
            .nav-menu {
                position: fixed;
                top: 0;
                right: -100%;
                height: 100vh;
                width: 280px;
                background: #ffffff;
                flex-direction: column;
                justify-content: flex-start;
                align-items: flex-start;
                padding: 80px 24px 24px;
                box-shadow: -2px 0 10px rgba(0, 0, 0, 0.1);
                transition: right 0.3s ease;
                gap: 0;
            }

            .nav-menu.active {
                right: 0;
            }

            .nav-link {
                width: 100%;
                padding: 16px 0;
                border-bottom: 1px solid #f0f0f0;
                font-size: 16px;
            }

            .nav-link::after {
                display: none;
            }

            /* Search bar in mobile menu */
            .search_container {
                width: 100%;
                max-width: 100%;
                margin: 16px 0;
                order: 0;
            }

            .nav-menu .search_container {
                margin: 0 0 16px 0;
                padding-bottom: 16px;
                border-bottom: 1px solid #f0f0f0;
            }

            /* Adjust nav actions for mobile */
            .nav-actions {
                gap: 12px;
            }

            .heart-icon,
            .user-icon {
                width: 36px;
                height: 36px;
            }

            .signin-btn {
                padding: 8px 20px;
                font-size: 13px;
            }

            /* Mobile dropdown adjustments */
            .dropdown-menu {
                right: -10px;
            }
        }

        /* ---------- Small Mobile (max-width: 480px) ---------- */
        @media (max-width: 480px) {
            .nav-wrapper {
                padding: 10px 16px;
            }

            .logo img {
                height: 32px;
            }

            .nav-menu {
                width: 260px;
                padding: 70px 20px 20px;
            }

            .nav-actions {
                gap: 8px;
            }

            .heart-icon,
            .user-icon {
                width: 34px;
                height: 34px;
            }

            .heart-icon svg,
            .user-icon svg {
                width: 18px;
                height: 18px;
            }

            .signin-btn {
                padding: 7px 16px;
                font-size: 12px;
            }

            .search-wrapper {
                padding: 8px 12px;
            }

            .search-input {
                font-size: 13px;
            }
        }

        /* ---------- Extra Small Devices (max-width: 360px) ---------- */
        @media (max-width: 360px) {
            .nav-wrapper {
                padding: 8px 12px;
            }

            .logo img {
                height: 28px;
            }

            .nav-menu {
                width: 240px;
            }

            .burger-menu span {
                width: 22px;
            }

            .signin-btn {
                padding: 6px 14px;
                font-size: 11px;
            }
        }

        /* Prevent body scroll when mobile menu is open */
        body.menu-open {
            overflow: hidden;
        }
    </style>
</head>
<body>

<!-- HEADER -->
<header class="header">
    <div class="nav-wrapper">
      <!-- Logo -->
<div class="logo">
    <img src="images/logomain.png" alt="Cyber Nexus Logo">
</div>

        <div class="burger-menu" onclick="toggleMenu()">
            <span></span>
            <span></span>
            <span></span>
        </div>

        <!-- Navbar Menu -->
        <nav class="nav-menu" id="navMenu"style="margin-left:25%">
            <!-- Search Bar (Mobile - inside menu) -->
            <div class="search_container mobile-search">
                <div class="search-wrapper">
                    <div class="search-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24">
                            <path d="M21.707 20.293l-5.388-5.388a7.5 7.5 0 10-1.414 1.414l5.388 5.388a1 1 0 001.414-1.414zM10.5 17a6.5 6.5 0 110-13 6.5 6.5 0 010 13z"/>
                        </svg>
                    </div>
                    <input type="text" class="search-input" placeholder="Search resources..." />
                </div>
            </div>

            <a class="nav-link" href="resources2.jsp">Resources</a>
            <a class="nav-link" href="about.jsp">About Us</a>
            <a class="nav-link" href="login.jsp">admin</a>
        </nav>

        <!-- Right Actions -->
        <div class="nav-actions">
            <% if(userName != null) { %>
                <!-- Heart/Favorite Icon -->
              

                <!-- User Dropdown -->
                <div class="user-dropdown">
                    <div class="user-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24">
                            <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
                        </svg>
                    </div>
                    
                    <!-- Dropdown Menu -->
                    <div class="dropdown-menu">
                        <a href="profile.jsp" class="dropdown-item">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" viewBox="0 0 24 24">
                                <path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"/>
                            </svg>
                            Profile
                        </a>
                        <div class="dropdown-divider"></div>
                        <a href="logout.jsp" class="dropdown-item">
                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" viewBox="0 0 24 24">
                                <path d="M17 7l-1.41 1.41L18.17 11H8v2h10.17l-2.58 2.58L17 17l5-5zM4 5h8V3H4c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h8v-2H4V5z"/>
                            </svg>
                            Logout
                        </a>
                    </div>
                </div>
            <% } else { %>
                <a class="signin-btn" href="signin.jsp">Sign In</a>
            <% } %>
        </div>
    </div>
</header>

<!-- Mobile Overlay -->
<div class="mobile-overlay" id="mobileOverlay" onclick="toggleMenu()"></div>

<script>
    function toggleMenu() {
        const navMenu = document.getElementById('navMenu');
        const burgerMenu = document.querySelector('.burger-menu');
        const mobileOverlay = document.getElementById('mobileOverlay');
        const body = document.body;
        
        navMenu.classList.toggle('active');
        burgerMenu.classList.toggle('active');
        mobileOverlay.classList.toggle('active');
        body.classList.toggle('menu-open');
    }

    // Close menu when clicking on a nav link (mobile)
    document.querySelectorAll('.nav-link').forEach(link => {
        link.addEventListener('click', () => {
            if (window.innerWidth <= 768) {
                toggleMenu();
            }
        });
    });

    // Close menu on window resize if opened
    window.addEventListener('resize', () => {
        if (window.innerWidth > 768) {
            const navMenu = document.getElementById('navMenu');
            const burgerMenu = document.querySelector('.burger-menu');
            const mobileOverlay = document.getElementById('mobileOverlay');
            const body = document.body;
            
            navMenu.classList.remove('active');
            burgerMenu.classList.remove('active');
            mobileOverlay.classList.remove('active');
            body.classList.remove('menu-open');
        }
    });
</script>

</body>
</html>