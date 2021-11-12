<%
   request.setAttribute("selectedPage","properties");
%>

<%@page import="org.solent.ood.simplepropertiesdaowebapp.dao.WebObjectFactory"%>
<%@page import="org.solent.ood.simplepropertiesdaowebapp.dao.PropertiesDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    PropertiesDao propertiesDao = WebObjectFactory.getPropertiesDao();
    
    //Getting property file keys
    String cardnumber = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.cardnumber");
    String cvv = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.cvv");
    String expirydate = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.expirydate");
    String name = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.name");
    String message = "";
    
    //Set property values from HTML form
    String action = (String) request.getParameter("action");
    if ("updateProperties".equals(action)) {
        message = "updating properties";
        cardnumber = (String) request.getParameter("cardnumber");
        cvv = (String) request.getParameter("cvv");
        expirydate = (String) request.getParameter("expirydate");
        name = (String) request.getParameter("name");

        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.cardnumber", cardnumber);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.cvv", cvv);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.expirydate", expirydate);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.name", name);

    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopkeeper Details</title>
    </head>
    <body>
        <h1>Bank And Shopkeeper Details</h1>
        <p><%=message %></p>
        <form action="./properties.jsp" method="POST">
            <p>Shop's Card Number: <input type="text" name="cardnumber" value="<%=cardnumber%>" required></p>
            <p>CVV: <input type="text" name="cvv" value="<%=cvv%>"></p>
            <p>Expiry Date: <input type="text" name="expirydate" value="<%=expirydate%>" required></p>
            <p>Name: <input type="text" name="name" value="<%=name%>" required></p>
            <input type="hidden" name="action" value="updateProperties">

            <button class="btn" type="submit" >Update Bank And Shopkeeper Details</button>
        </form>
        <form action="http://localhost:8080/home.jsp">
            <button type="submit">Use Card Terminal</button>
        </form>
    </body>
</html>
