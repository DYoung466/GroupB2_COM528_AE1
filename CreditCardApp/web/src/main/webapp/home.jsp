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
<%@page import="solent.ac.uk.ood.examples.cardcheck.RegexCardValidator"%>
<%@page import="solent.ac.uk.ood.examples.cardcheck.CardValidationResult"%>
<%@page import="solent.ac.uk.ood.examples.cardcheck.CalculateLunnDigit"%>

<%@ page import="org.apache.logging.log4j.Logger" %>
<%@ page import="org.apache.logging.log4j.LogManager" %>
        <% Logger log = LogManager.getLogger(this.getClass());
           log.error("Show ERROR message");
           %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    PropertiesDao propertiesDao = WebObjectFactory.getPropertiesDao();
    
    // Sets properties values from properties.jsp into variables
    String bankUrl = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.url");
    String cardnumber = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.cardnumber");
    String cvv = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.cvv");
    String expirydate = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.expirydate");
    String issuenumber = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.issuenumber");
    String name = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.name");
    String message = "";
    String cardcheckreply = "";
    
    // Takes input from user in HTML form for customer details
    String cust_cardnumber = request.getParameter("custcardnumber");
    String cust_cvv = request.getParameter("custcvv");
    String cust_expirydate = request.getParameter("custexpirydate");
    String cust_name = request.getParameter("custname");
    String cust_issuenumber = request.getParameter("custissuenumber");
    
    
    //Starts client
    BankRestClient client = new BankRestClientImpl(bankUrl);
    
    // Defining variables
    TransactionReplyMessage reply = null;
    
    CreditCard fromCard = null;
    CreditCard toCard = null;

    
    //Get action
   
    
    if (request.getParameter("sendmoney") != null) {
        // Message to show successful transfer
        message = "Successful Transfer!";
        
        // Card from
        fromCard = new CreditCard();
        fromCard.setCardnumber(cust_cardnumber);
        fromCard.setCvv(cust_cvv);
        fromCard.setEndDate(cust_expirydate);
        fromCard.setIssueNumber(cust_issuenumber); 
        fromCard.setName(cust_name);
        
        //Card to
        toCard = new CreditCard();
        toCard.setCardnumber(cardnumber);
        toCard.setCvv(cvv);
        toCard.setEndDate(expirydate);
        toCard.setIssueNumber(issuenumber);
        toCard.setName(name);
        
        // Customer amount
        Double amount = Double.parseDouble(request.getParameter("amount").toString());
        

        reply = client.transferMoney(fromCard, toCard, amount);

    } else if (request.getParameter("refund") != null) {
        message = "Successful Refund!";
        //Card From
        fromCard = new CreditCard();
        fromCard.setCardnumber(cust_cardnumber);
        fromCard.setCvv(cust_cvv);
        fromCard.setEndDate(cust_expirydate);
        fromCard.setIssueNumber(cust_issuenumber); 
        fromCard.setName(cust_name);
        
        //Card to
        toCard = new CreditCard();
        toCard.setCardnumber(cardnumber);
        toCard.setCvv(cvv);
        toCard.setEndDate(expirydate);
        toCard.setIssueNumber(issuenumber);
        toCard.setName(name);
       
       //Amount
       double amount = Double.parseDouble(request.getParameter("amount").toString());
       
       reply = client.transferMoney(toCard, fromCard, amount);
    } else if (request.getParameter("checkcard") != null) {
        cardcheckreply = "";
        CardValidationResult result = RegexCardValidator.isValid(cust_cardnumber);
        
        if (result.isValid()){
            cardcheckreply = result.getCardNo() + "&nbsp; is a valid card number issued by &nbsp;" + result.getCardType();

        } else {
            cardcheckreply = result.getCardNo() + "&nbsp; is an invalid card number issued by &nbsp;" + result.getError();
        }
    }

%>
<head>
    <!-- The below 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
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
<jsp:include page="header.jsp" />

<script src="./resources/js/keypad.js" defer></script>
<h1>Card Details</h1>
<main role="main" class="container">
    <p><%=message %></p>
    <p><%=reply %></p>
    <p><%=cardcheckreply %></p>
    <br>
    <div id="Card Details">
        <form action="./home.jsp" method="POST">  
            <table class="table">
               <tbody>
                  <tr>
                     <td>Name On Card</td>
                     <td><input type="text" name="custname" value="<%=cust_name%>" required></td>
                  </tr>
                  <tr>
                     <td>Card Number</td>
                     <td><input type="text" name="custcardnumber" value="<%=cust_cardnumber%>" required></td>
                     <td><button name="editbtn" type="button" class="btn ml-2 rounded" value="custcardnumber">Edit</button></td>
                  </tr>
                  <tr>
                     <td>Expiry Date</td>
                     <td><input type="text" name="custexpirydate" value="<%=cust_expirydate%>" required></td>
                     <td><button name="editbtn" type="button" class="btn ml-2 rounded" value="custexpirydate">Edit</button></td>
                  </tr>
                  <tr>
                     <td>CVV Code</td>
                     <td><input type="text" name="custcvv" value="<%=cust_cvv%>" required></td>
                     <td><button name="editbtn" type="button" class="btn ml-2 rounded" value="custcvv">Edit</button></td>
                  </tr>
                  <tr>
                     <td>Issue Number</td>
                     <td><input type="text" name="custissuenumber" value="<%=cust_issuenumber%>" required></td>
                     <td><button name="editbtn" type="button" class="btn ml-2 rounded" value="custissuenumber">Edit</button></td>
                  </tr>
                  <tr>
                     <td>Amount</td>
                     <td><input type="text" name="amount" value="" required></td>
                     <td><button name="editbtn" type="button" class="btn ml-2 rounded" value="amount">Edit</button></td>
                  </tr>
               </tbody>
            </table>
            <input class="btn ml-2 rounded" type="submit" name="sendmoney" value="Transfer Money">
            <input class="btn ml-2 rounded" type="submit" name="refund" value="Refund">
            <input class="btn ml-2 rounded" type="submit" name="checkcard" value="Check Card - Verification">
        </form>
    </div>
    
    <div id="numpad" class="text-center">
            <div class="btn-group btn-group-lg" role="group">
               <button name="numpad" type="button" class="btn ml-2 rounded" onclick="document.getElementsByName ('custcardnumber')[0].value = document.getElementsByName('custcardnumber')[0].value + '1';">1</button>
               <button name="numpad" type="button" class="btn ml-2 rounded" onclick="document.getElementsByName('custcardnumber')[0].value = document.getElementsByName('custcardnumber')[0].value + '2';">2</button>
               <button name="numpad" type="button" class="btn ml-2 rounded" onclick="document.getElementsByName('custcardnumber')[0].value = document.getElementsByName('custcardnumber')[0].value + '3';">3</button>
            </div>
            <br>
            <div class="btn-group btn-group-lg" role="group">
               <button name="numpad" type="button" class="btn ml-2 rounded" onclick="document.getElementsByName('custcardnumber')[0].value = document.getElementsByName('custcardnumber')[0].value + '4';">4</button>
               <button name="numpad" type="button" class="btn ml-2 rounded" onclick="document.getElementsByName('custcardnumber')[0].value = document.getElementsByName('custcardnumber')[0].value + '5';">5</button>
               <button name="numpad" type="button" class="btn ml-2 rounded" onclick="document.getElementsByName('custcardnumber')[0].value = document.getElementsByName('custcardnumber')[0].value + '6';">6</button>
            </div>
            <br>
            <div class="btn-group btn-group-lg" role="group">
               <button name="numpad" type="button" class="btn ml-2 rounded" onclick="document.getElementsByName('custcardnumber')[0].value = document.getElementsByName('custcardnumber')[0].value + '7';">7</button>
               <button name="numpad" type="button" class="btn ml-2 rounded" onclick="document.getElementsByName('custcardnumber')[0].value = document.getElementsByName('custcardnumber')[0].value + '8';">8</button>
               <button name="numpad" type="button" class="btn ml-2 rounded" onclick="document.getElementsByName('custcardnumber')[0].value = document.getElementsByName('custcardnumber')[0].value + '9';">9</button>
            </div>
            <br>
            <div class="btn-group btn-group-lg" role="group">
               <button name="numpad-back" type="button" class="btn btn-danger py-3" onclick="document.getElementsByName('custcardnumber')[0].value = document.getElementsByName('custcardnumber')[0].value.slice(0, -1);">Back</button>
               <button name="numpad" type="button" class="btn ml-2 rounded" onclick="document.getElementsByName('custcardnumber')[0].value = document.getElementsByName('custcardnumber')[0].value + '0';">0</button>
               <button name="numpad-clear" type="button" class="btn btn-danger py-3" onclick="document.getElementsByName('custcardnumber')[0].value = document.getElementsByName('custcardnumber')[0].value = '';">Clear</button>
            </div>
    </div>
    
         
         
      

