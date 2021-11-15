<%
   request.setAttribute("selectedPage","properties");
%>

<%@page import="org.solent.ood.simplepropertiesdaowebapp.dao.WebObjectFactory"%>
<%@page import="org.solent.ood.simplepropertiesdaowebapp.dao.PropertiesDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    PropertiesDao propertiesDao = WebObjectFactory.getPropertiesDao();
    
    //Getting property file keys
    String url = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.url");
    String cardnumber = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.cardnumber");
    String cvv = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.cvv");
    String expirydate = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.expirydate");
    String issuenumber = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.issuenumber");
    String name = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.name");
    String message = "";
    
    //Set property values from HTML form
    String action = (String) request.getParameter("action");
    if ("updateProperties".equals(action)) {
        message = "Details Updated!";
        url = (String) request.getParameter("url");
        cardnumber = (String) request.getParameter("cardnumber");
        cvv = (String) request.getParameter("cvv");
        expirydate = (String) request.getParameter("expirydate");
        issuenumber = (String) request.getParameter("issuenumber");
        name = (String) request.getParameter("name");
        
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.url", url);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.cardnumber", cardnumber);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.cvv", cvv);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.expirydate", expirydate);
        propertiesDao.setProperty("org.solent.ood.simplepropertiesdaowebapp.issuenumber", issuenumber);
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
        <jsp:include page="header.jsp" />
        <h1>Bank And Shopkeeper Details</h1>
        <p><%=message %></p>
        <main role="main" class="container">
        <form class="form-card" method="POST">
           <div class="form-group">
              <table class="table">
                 <tbody>
                    <tr>
                       <td>Bank's Url</td>
                       <td><input type="text" name="url" value="<%=url%>"></td>
                    </tr>
                 </tbody>
              </table>
              <h1>Recipient Details</h1>
              <table class="table">
                 <tbody>
                    <tr>
                       <td>Full Name</td>
                       <td><input type="text" name="name" value="<%=name%>" required></td>
                    </tr>
                    <tr>
                       <td>Card Number</td>
                       <td><input type="text" name="cardnumber" value="<%=cardnumber%>" required></td>
                    </tr>
                    <td>Issue Number</td>
                    <td><input type="text" name="issuenumber" value="<%=issuenumber%>" required></td>
                    </tr> 
                    <tr>
                       <td>Expiry Date</td>
                       <td><input type="text" name="expirydate" value="<%=expirydate%>" required></td>
                    </tr>
                    <tr>
                       <td>CVV Code</td>
                       <td><input type="text" name="cvv" value="<%=cvv%>" ></td>
                    </tr>
                 </tbody>
              </table>
              <input type="hidden" name="action" value="updateProperties"> 
              <button class="btn ml-2 rounded" type="submit">Update Bank & Shopkeeper Details</button>
           </div>
        </form>
    </body>
</html>
