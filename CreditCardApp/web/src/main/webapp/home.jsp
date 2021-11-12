<%-- 
    Document   : home
    Created on : 8 Nov 2021, 15:32:51
    Author     : Ben
--%>

<%
   request.setAttribute("selectedPage","home");
%>

<%@page import="org.solent.ood.simplepropertiesdaowebapp.dao.WebObjectFactory"%>
<%@page import="org.solent.ood.simplepropertiesdaowebapp.dao.PropertiesDao"%>
<%@page import ="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%@page import="org.solent.com504.oodd.bank.client.impl.BankRestClientImpl"%>
<%@page import="org.solent.com504.oodd.bank.model.client.BankRestClient"%>
<%@page import="org.solent.com504.oodd.bank.model.dto.BankTransactionStatus"%>
<%@page import="org.solent.com504.oodd.bank.model.dto.CreditCard"%>
<%@page import="org.solent.com504.oodd.bank.model.dto.TransactionReplyMessage"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    PropertiesDao propertiesDao = WebObjectFactory.getPropertiesDao();
    
    // Sets properties values from properties.jsp into variables
    String url = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.url");
    String username = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.username");
    String password = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.password");
    String cardnumber = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.cardnumber");
    String cvv = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.cvv");
    String expirydate = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.expirydate");
    String name = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.name");
    String message = "";
    
    // Takes input from user in HTML form for customer details
    String cust_cardnumber = request.getParameter("custcardnumber");
    String cust_cvv = request.getParameter("custcvv");
    String cust_expirydate = request.getParameter("custexpirydate");
    String cust_name = request.getParameter("custname");
    
    // Bank url
    String bankUrl = "http://com528bank.ukwest.cloudapp.azure.com:8080/rest/";
    
    //Starts client
    BankRestClient client = new BankRestClientImpl(bankUrl);
    
    // Defining variables
    TransactionReplyMessage reply = null;
    
    CreditCard fromCard = null;
    CreditCard toCard = null;

    
    //Get action
    String action = (String) request.getParameter("action");
    
    if ("sendmoney".equals(action)) {
        // Message to show successful transfer
        message = "Successful Transfer!";
        
        // Card from
        fromCard = new CreditCard();
        fromCard.setCardnumber(cust_cardnumber);
        fromCard.setCvv(cust_cvv);
        fromCard.setEndDate(cust_expirydate);
        fromCard.setIssueNumber("01"); 
        fromCard.setName("test user1");
        
        //Card to
        toCard = new CreditCard();
        toCard.setCardnumber(cardnumber);
        toCard.setCvv(cvv);
        toCard.setEndDate(expirydate);
        toCard.setIssueNumber("01");
        toCard.setName("test user2");
        
        // Customer amount
        Double amount = Double.parseDouble(request.getParameter("amount").toString());
        

        reply = client.transferMoney(fromCard, toCard, amount);

    }

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
        <p>Bank Url:</p>
        <p><%=bankUrl %></p>
        
        <h1>Card Details</h1>
        <p><%=message %></p>
        <form action="./home.jsp" method="POST">
            <p>Card Number: <input type="text" name="custcardnumber" value="" required></p>
            <p>CVV: <input type="text" name="custcvv" value="" required></p>
            <p>Expiry Date: <input type="text" name="custexpirydate" value="" required></p>
            <p>Name: <input type="text" name="custname" value="" required></p>
            <p>Amount: <input type="text" name="amount" value="" required></p>
            <input type="hidden" name="action" value="sendmoney">
                <button class="btn" type="submit" >Send Transfer</button>
        </form>
            
        <form action="http://localhost:8080/properties.jsp">
            <button type="submit">Update Shopkeeper's details</button>
        </form>
    </body>
</html>

