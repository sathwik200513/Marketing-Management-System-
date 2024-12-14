<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
   <!--  <link rel="stylesheet" href="styles.css"> -->
    <style>
   * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
}
.btn{
text-decoration:none;
display: inline-block;
    padding: 10px 20px;
    margin-top: 10px;
    border: none;
    border-radius: 5px;
    background-color: rgb(240, 77, 55);
    color: #fff;
    text-align: center;
    font-size: 16px;
    cursor: pointer;
    
}

.container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px;
    background-color: #fff;
    border-bottom: 1px solid #e0e0e0;
}

.logo h1 {
    font-size: 24px;
    color: #333;
}


.header-buttons button {
    padding: 10px 20px;
    margin-left: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
}

.header-buttons .demo {
    background-color: #ff5c35;
    color: #fff;
}



.header-buttons .demo:hover {
    background-color: #ff704f;
}

.header-buttons .start-free:hover {
    background-color: #ff5c35;
    color: #fff;
}

.hero {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 50px;
    background-color: #f0f0f0;
}


.hero h2 {
    font-size: 24px;
    color: #333;
    margin-bottom: 20px;
}

.hero p {
    font-size: 16px;
    color: #666;
    margin-bottom: 20px;
}

.hero-buttons button {
    padding: 10px 20px;
    margin-right: 10px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
}

.hero-buttons .demo {
    background-color: #ff5c35;
    color: #fff;
}

.hero-buttons .start-free {
    background-color: #fff;
    color: #ff5c35;
    border: 1px solid #ff5c35;
}

.hero-buttons .demo:hover {
    background-color: #ff704f;
}

.hero-buttons .start-free:hover {
    background-color: #ff5c35;
    color: #fff;
}

.info-section {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 50px 20px;
    background-color: #fff;
}

.info-content {
    display: flex;
    align-items: center;
    width: 80%;
    max-width: 1200px;
}

.info-content.reverse {
    flex-direction: row-reverse;
}

.info-text, .info-image {
    flex: 1;
    padding: 20px;
}

.info-text h3 {
    font-size: 24px;
    color: #333;
    margin-bottom: 20px;
}

.info-text p {
    font-size: 16px;
    color: #666;
}

.info-image img {
    max-width: 100%;
    border-radius: 10px;
}

.dropdown li{
	padding:0 0 5px 0;
}
.a{
	 text-decoration: none;
}   
.navbar{
display:flex;
align-items: center;
}

   </style> 
</head>
<body>

<header>
        <div class="container">
            <div class="logo">
                <h1>HubSpot</h1>
            </div>
            <nav>
            <div class="navbar">
             <h2 > Admin panel  </h2>
            
             <h3>Welcome<b> 
        <%
            HttpSession currentSession = request.getSession(false);
            if (currentSession != null) {
                String username = (String) currentSession.getAttribute("username");
                if (username != null) {
                    out.print(username);
                } else {
                    out.print("Guest");
                }
            } else {
                out.print("Guest");
            }
        %></b></h3>
               <a href="Dashboard.jsp" class="btn">Logout</a>
               <div>
            </nav>
            
        </div>
    </header>
     <section class="info-section">
            <div class="info-content">
                <div class="info-text">
                    <h3>All your marketing tools and data can be connected in one place.</h3>
                    <p>Marketers are juggling more campaigns under increasing pressure, 
                    with no signs of it slowing down.Marketing Hub is the all-in-one marketing
                     automation software that connects customer insights through our Smart CRM. 
                     Attract attention to your business and collect contacts. Engage leads and 
                     customers at the right place and time. </p>
                      <a href="approveMarketers.jsp" class="btn">Approve marketers</a>
                </div>               
                <div class="info-image">                 
                    <img src="resources/section 1.png" alt="Section 1 Image">
                </div>                                
            </div>            
        </section>
  
    
</body>
</html>
