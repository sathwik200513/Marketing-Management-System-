<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Marketing Management</title>
    <link rel="stylesheet" href="styles1.css">
</head>
<body>
    <header>
        <div class="container">
            <div class="logo">
                <h1>HubSpot</h1>
            </div>
            <nav>
                <ul>
                    <li>
                        <a href="#">BUSINESS</a>
                        <ul class="dropdown">
                            <li><a href="signup.jsp">Signup</a></li>
                            <li><a href="login.jsp">Login</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">MARKETER</a>
                        <ul class="dropdown">
                            <li><a href="signupMarketer.jsp">signup</a></li>
                            <li><a href="loginMarketer.jsp">login</a></li>
                            
                        </ul>
                    </li>
                    <li>
                        <a href="#">ADMIN</a>
                        <ul class="dropdown">
                            <li><a href="adminLogin.jsp">login</a></li>
                        </ul>
                    </li>
                    
                </ul>
            </nav>
            <div class="header-buttons">
                <button class="demo" onclick="window.location.href='signup.jsp';">SignUp</button>
                <button class="start-free" onclick="window.location.href='login.jsp';">Login</button>
            </div>
        </div>
    </header>
    <main>
        <section class="hero">
            <div class="hero-content">
                <h2>Grow better with HubSpot</h2>
                <p>Software that’s powerful, not overpowering. Seamlessly connect your data, teams, and customers on one AI-powered customer platform that grows with your business.</p>
                <div class="hero-buttons">
                    <button class="demo">SignUp</button>
                    <button class="start-free">Login</button>
                </div>
                <p>Get a demo of our premium software, or get started with free tools.</p>
            </div>
        </section>
        <section class="info-section">
            <div class="info-content">
                <div class="info-text">
                    <h3>All your marketing tools and data can be connected in one place.</h3>
                    <p>Marketers are juggling more campaigns under increasing pressure, 
                    with no signs of it slowing down.Marketing Hub is the all-in-one marketing
                     automation software that connects customer insights through our Smart CRM. 
                     Attract attention to your business and collect contacts. Engage leads and 
                     customers at the right place and time. </p>
                </div>
                <div class="info-image">
                    <img src="resources/section 1.png" alt="Section 1 Image">
                </div>
                
            </div>
            
        </section>
        <section class="info-section reverse">
            <div class="info-content">
                <div class="info-image">
                    <img src="resources/section 2.png" alt="Section 2 Image">
                </div>
                <div class="info-text">
                    <h3>Solutions to Your Top Marketing Challenges</h3>
                    <p>Marketing Hub gives your team the tools to tailor marketing offers and messages to your audience.
                     Those insights and personalizations make your offers relevant, attracting quality leads who are ready
                      to convert.Now you can combine all of your marketing efforts into one cohesive and impactful approach
                       for engaging customers.</p>
                </div>
            </div>
        </section>
        <section class="info-section">
            <div class="info-content">
                <div class="info-text">
                    <h3>Save Time and Resources</h3>
                    <p>Work more efficiently and effectively with the help of AI-based marketing tools.
                     You can personalize messaging, automate campaigns, and gain actionable insights.
                     Automation and AI empower marketing teams to connect deeply with customers and drive
                      impactful results through targeted strategies.</p>
                </div>
                <div class="info-image">
                    <img src="resources/section 3.png" alt="Section 3 Image">
                </div>
            </div>
        </section>
    </main>
</body>
</html>
