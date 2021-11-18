# Group B1 AE1
# Object Orientated Design And Development (COM528)

## Group B1 members:
* Ben Lever 
* Daniel Young 
* Arran Strang

## Software used

* [Apache NetBeans](https://netbeans.apache.org/ "Netbeans link")
* [Apache Tomcat](http://tomcat.apache.org/ "Tomcat link")
* [Apache Maven](https://maven.apache.org/ "Maven link")
* [Java 11](https://jdk.java.net/11/ "Jdk link")
* Web browser
* [Diagrams.net](https://www.diagrams.net/ "diagrams.net link") 
* [Bootstrap (formatting)](https://getbootstrap.com/ "Bootstrap link")

## Introduction
With this project, we aim to create an application which allows a user to enter their credit card details and cash amount for a transaction, as well as an administrator to enter their details so money can be transferred between the accounts.  The application will be web based and hosted on a Tomcat Server, different web pages will be made for the administrator and the user. Card details and other information will be entered using text fields and buttons with a keypad also being available to use on the application. 

## Constraints
Various constraints were outlined in the assessment brief, we had to take these into consideration when designing and planning the creation of our project.

The application is web-based which brings about numerous constraints we will need to address with our application. Firstly, the application will be web dependent meaning the application will only be accessible to those with an internet connection, this limits how users can interact with the application and how we can access the application to develop, test and update it. Web-based applications will have limited security as they are prone to a variety of attacks that can be carried out through a web browser, usually this would be combated by using a web application firewall as a barrier between the application and the attacker. Our application will not be publicly available so we did not need to worry about the security risks to the application.

The application needs to interact with the bank client provided to us, therefore we are limited to the restrictions of that client. The application we create will interact with this mock bank client using a ReST interface, fortunately ReST interfaces are very flexible and can handle different types of data and calls.

The application is on a small scale with only a single transaction between two users being executed. The application is on a small scale with transactions between two users being executed; this helped us define the scope of the project.

## Requirements
  * ###  As per the COM528 assessment brief:
  * Implement a simple user interface using CSS & Javascript libraries (Bootstrap)
  * Store bank url in properties DAO alongwith shopkeeper details
  * Record all transactions in a log file
  * Users should be able to:
     * Enter a new transaction
     * Refund a transaction
     * Check card number via [Luhn algorithm](https://en.wikipedia.org/wiki/Luhn_algorithm "Luhn algorthim wiki link")
     *  Allow entry of a card number, name, expiry date, cvv code
  * The application should interact with the bank service and money should be transfered between accounts/

## Feature list
* The program features a simple and effective user interface, formatted through bootstrap
* Writes details to the properties DAO file
* Logs all transactions
* ### (Doesn't check luhn code i think (?))
* Users are able to:
     * Enter their card number, name, expiry date, cvv code
     * Enter and submit a transaction
     * Refund the transaction

## Setting up the project

## Project use

## Design plan

![Index_design_plan](https://user-images.githubusercontent.com/71987991/142270737-634f89dd-1620-4de7-9ebb-bf7a6933f2ab.png)
We deviated from our initial rudimetary design as we found more features were required. However, this remained useful as an indication of what features were essential and how to lay them out.

## Test plan

## Use cases
User:
| Step | Action | Response |
| -----| ----------- | ----------- |
| 1    | User interacts with the application through a web browser      |   Sends user to home page     |
| 2    | User enters their card information      |  Using inputs provided user will    |
| 3    | User enters the cash amount for transaction      |   Using inputs provided user will enter cash amount    |
| 4    | User completes transaction      |  Bank client will handle the transaction   |

Administrator:
| Step | Action | Response |
| -----| ----------- | ----------- |
| 1    | Admin enters application  |  Sends admin to home page  |
| 2    | Text        |   Using inputs provided admin will enter details    |
| 3    | Title       |  Information is saved to the application     |
| 4    | Admin sends or refunds money       |   Bank client will handle the transaction |

## UML Class diagram
We created a UML diagram to help us visualise how the application’s classes will interact with one another and how our project will work as a whole.

![Copy of UML](https://user-images.githubusercontent.com/57259804/142338616-c9f8ee18-1b89-4810-b829-9ff36e3cabe6.png)

