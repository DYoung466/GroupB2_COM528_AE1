

<%@page import="org.solent.ood.simplepropertiesdaowebapp.dao.WebObjectFactory"%>
<%@page import="org.solent.ood.simplepropertiesdaowebapp.dao.PropertiesDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    PropertiesDao propertiesDao = WebObjectFactory.getPropertiesDao();

    String url = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.url");
    String username = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.username");
    String password = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.password");
    String cardnumber = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.cardnumber");
    String cvv = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.cvv");
    String expirydate = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.expirydate");
    String name = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.name");
    String message = "";
    
    String action = (String) request.getParameter("action");
    if ("updateProperties".equals(action)) {
        message = "updating properties";
        url = (String) request.getParameter("url");
        username = (String) request.getParameter("username");
        password = (String) request.getParameter("password");
        cardnumber = (String) request.getParameter("cardnumber");
        cvv = (String) request.getParameter("cvv");
        expirydate = (String) request.getParameter("expirydate");
        name = (String) request.getParameter("name");

        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.url", url);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.username", username);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.password", password);
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
            <p>Bank URL: <input type="text" name="url" value="<%=url%>"></p>
            <p>Username: <input type="text" name="username" value="<%=username%>"></p>
            <p>Password: <input type="text" name="password" value="<%=password%>"></p>
            <p>Shop's Card Number: <input type="text" name="cardnumber" value="<%=cardnumber%>"></p>
            <p>CVV: <input type="text" name="cvv" value="<%=cvv%>"></p>
            <p>Expiry Date: <input type="text" name="expirydate" value="<%=expirydate%>"></p>
            <p>Name: <input type="text" name="name" value="<%=name%>"></p>
            <input type="hidden" name="action" value="updateProperties">

            <button class="btn" type="submit" >Update Bank And Shopkeeper Details</button>
        </form>
        <form action="http://localhost:8080/properties.jsp/home.jsp">
            <button type="submit">Use Card Terminal</button>
        </form>
    </body>
</html>
