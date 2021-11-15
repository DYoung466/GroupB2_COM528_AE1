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
    String bankUrl = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.url");
    String cardnumber = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.cardnumber");
    String cvv = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.cvv");
    String expirydate = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.expirydate");
    String issuenumber = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.issuenumber");
    String name = propertiesDao.getProperty("org.solent.ood.simplepropertiesdaowebapp.name");
    String message = "";
    
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
    }

%>
<jsp:include page="header.jsp" />
<h1>Card Details</h1>
<main role="main" class="container">
    <p><%=message %></p>
    <p><%=reply %></p>
    <br>
    <div id="Card Details">
        <form action="./home.jsp" method="POST">  
            <table class="table">
               <tbody>
                  <tr>
                     <td>Name</td>
                     <td><input type="text" name="custname" value="<%=cust_name%>" required></td>
                  </tr>
                  <tr>
                     <td>Credit Card Number</td>
                     <td><input type="text" name="custcardnumber" value="<%=cust_cardnumber%>" required></td>
                  </tr>
                  <tr>
                     <td>Expiry Date</td>
                     <td><input type="text" name="custexpirydate" value="<%=cust_expirydate%>" required></td>
                  </tr>
                  <tr>
                     <td>CVV Code</td>
                     <td><input type="text" name="custcvv" value="<%=cust_cvv%>" required></td>
                  </tr>
                  <tr>
                     <td>Issue Number</td>
                     <td><input type="text" name="custissuenumber" value="<%=cust_issuenumber%>" required></td>
                  </tr>
                  <tr>
                     <td>Amount</td>
                     <td><input type="text" name="amount" value="" required></td>
                  </tr>
               </tbody>
            </table>
            <input class="btn ml-2 rounded" type="submit" name="sendmoney" value="Transfer Money">
            <input class="btn ml-2 rounded" type="submit" name="refund" value="Refund">
        </form>
    </div>
         
         
      

