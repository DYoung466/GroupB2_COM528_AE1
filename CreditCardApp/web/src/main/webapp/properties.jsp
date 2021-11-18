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
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap core CSS -->

        <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="./resources/css/navbar.css" rel="stylesheet">

        <script src="./resources/js/jquery.min.js"></script>
        <script src="./resources/js/bootstrap.min.js"></script>
        
    </head>
    <body>
        <jsp:include page="header.jsp" />
        
        <h1>Bank And Shopkeeper Details</h1>
        <p><%=message %></p>
        <main role="main" class="container">
        <script src="./resources/js/keypad.js" defer></script>
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
                       <td><button name="editbtn" type="button" class="btn ml-2 rounded" value="cardnumber">Edit</button></td>
                    </tr>
                    <td>Issue Number</td>
                    <td><input type="text" name="issuenumber" value="<%=issuenumber%>" required></td>
                    <td><button name="editbtn" type="button" class="btn ml-2 rounded" value="issuenumber">Edit</button></td>
                    </tr> 
                    <tr>
                       <td>Expiry Date</td>
                       <td><input type="text" name="expirydate" value="<%=expirydate%>" required></td>
                       <td><button name="editbtn" type="button" class="btn ml-2 rounded" value="expirydate">Edit</button></td>
                    </tr>
                    <tr>
                       <td>CVV Code</td>
                       <td><input type="text" name="cvv" value="<%=cvv%>" ></td>
                       <td><button name="editbtn" type="button" class="btn ml-2 rounded" value="cvv">Edit</button></td>
                    </tr>
                 </tbody>
              </table>
              <input type="hidden" name="action" value="updateProperties"> 
              <button class="btn ml-2 rounded" type="submit">Update Bank & Shopkeeper Details</button>
           </div>
        </form>
                    
        <div id="numpad" class="text-center">
            <div class="btn-group btn-group-lg" role="group">
               <button name="numpad" type="button" class="btn ml-2 rounded" onclick="document.getElementsByName ('cardnumber')[0].value = document.getElementsByName('cardnumber')[0].value + '1';">1</button>
               <button name="numpad" type="button" class="btn ml-2 rounded" onclick="document.getElementsByName('cardnumber')[0].value = document.getElementsByName('cardnumber')[0].value + '2';">2</button>
               <button name="numpad" type="button" class="btn ml-2 rounded" onclick="document.getElementsByName('cardnumber')[0].value = document.getElementsByName('cardnumber')[0].value + '3';">3</button>
            </div>
            <br>
            <div class="btn-group btn-group-lg" role="group">
               <button name="numpad" type="button" class="btn ml-2 rounded" onclick="document.getElementsByName('cardnumber')[0].value = document.getElementsByName('cardnumber')[0].value + '4';">4</button>
               <button name="numpad" type="button" class="btn ml-2 rounded" onclick="document.getElementsByName('cardnumber')[0].value = document.getElementsByName('cardnumber')[0].value + '5';">5</button>
               <button name="numpad" type="button" class="btn ml-2 rounded" onclick="document.getElementsByName('cardnumber')[0].value = document.getElementsByName('cardnumber')[0].value + '6';">6</button>
            </div>
            <br>
            <div class="btn-group btn-group-lg" role="group">
               <button name="numpad" type="button" class="btn ml-2 rounded" onclick="document.getElementsByName('cardnumber')[0].value = document.getElementsByName('cardnumber')[0].value + '7';">7</button>
               <button name="numpad" type="button" class="btn ml-2 rounded" onclick="document.getElementsByName('cardnumber')[0].value = document.getElementsByName('cardnumber')[0].value + '8';">8</button>
               <button name="numpad" type="button" class="btn ml-2 rounded" onclick="document.getElementsByName('cardnumber')[0].value = document.getElementsByName('cardnumber')[0].value + '9';">9</button>
            </div>
            <br>
            <div class="btn-group btn-group-lg" role="group">
               <button name="numpad-back" type="button" class="btn btn-danger py-3" onclick="document.getElementsByName('cardnumber')[0].value = document.getElementsByName('cardnumber')[0].value.slice(0, -1);">Back</button>
               <button name="numpad" type="button" class="btn ml-2 rounded" onclick="document.getElementsByName('cardnumber')[0].value = document.getElementsByName('cardnumber')[0].value + '0';">0</button>
               <button name="numpad-clear" type="button" class="btn btn-danger py-3" onclick="document.getElementsByName('cardnumber')[0].value = document.getElementsByName('cardnumber')[0].value = '';">Clear</button>
            </div>
    </div>
    </body>
</html>
