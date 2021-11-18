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

## How to setup
1. `git clone https://github.com/DYoung466/GroupB2_COM528_AE1.git`
2. Open cloned project and navigate to the web module inside
3. Run the webserver
4. Locate at [http://localhost:8080/](http://localhost:8080)

![Run Project](https://user-images.githubusercontent.com/71655080/142452529-2d05e5d8-65b2-4b0c-b112-c2f7bcf7398d.png)

## How to use the app
After setting up the app and running it, you are greeted by the index page. Click the link shown to access the app

![Home Page](https://user-images.githubusercontent.com/71655080/142453024-e86e74fc-f826-490c-9c70-87ce7418586e.png)

To use the pinpad, hit the edit button next to your wanted input field and try clicking on some numbers. The 'Clear' button clears the whole input and the 'Back' button removes the last digit you entered into the input field.


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
* Users are able to:
     * Enter their card number, name, expiry date, cvv code
     * Enter and submit a transaction
     * Refund the transaction
     * Check the entered card

## Roles and Contributions
At the start, we all decided on what sections we would complete to benefit the culmination of the running application as shown in the table below. We spoke regularly on calls and messaged frequently to ensure we all knew what was expected as well as helping one another complete given tasks.

| Ben Lever | Daniel Young | Arran Strang |
|-------------|--------------------|-------------|
|Setting Up Project||Robustness Diagram|
|Testing/Test Plan|Design Plan|UML Class Diagram  |
|Refactoring Code|Wireframes|Use Cases|
|HTML/CSS/JS|
|Backend code/Java|
## Design plan

![Index_design_plan](https://user-images.githubusercontent.com/71987991/142270737-634f89dd-1620-4de7-9ebb-bf7a6933f2ab.png)
We deviated from our initial rudimetary design as we found more features were required. However, this remained useful as an indication of what features were essential and how to lay them out.

## Use cases
User:
| Step | Action | Response |
| -----| ----------- | ----------- |
| 1    | User interacts with the application through a web browser      |   Sends user to home page     |
| 2    | User enters the correct card information      |  Using inputs provided user will enter details and the applicaiton will check its validity, a pass message will be shown |
| 3    | User enters wrong card information      | Using inputs provided user will enter details and the applicaiton will check its validity, an error message will be shown  |
| 4   | User enters the cash amount for transaction      |   Using inputs provided user will enter cash amount    |
| 5    | User completes transaction      |  Bank client will handle the transaction   |

Administrator:
| Step | Action | Response |
| -----| ----------- | ----------- |
| 1    | Admin enters application  |  Sends admin to home page  |
| 2    | Admin enters their information     |   Using inputs provided admin will enter details    |
| 3    | Admin saves/updates their information     |  Information is saved to the application     |
| 4    | Admin sends or refunds money       |   Bank client will handle the transaction |


![Copy of use case](https://user-images.githubusercontent.com/57259804/142338944-44482045-0bf3-4d8e-9c74-b9ea0da7a17c.png)

## Test plan
| Test Case | Action                                                                                            | Expected Reaction                                                                                                                                   | Status |
| --------- | ------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- | ------ |
| TC1       | User enters the [url](http://localhost:8080/) for the  web app.                | If cloned, built and ran correctly the user will be redirected to the index page, if not they will get a 404 error| Passed |
| TC2     | User doesn't enter details into all input fields, a pop my field will alert them of the missing entity| The alert is shown when user tries to submit without entering all details.                                                                               | Passed |
| TC3     | User submits a send request and has sufficient funds.                                    | The transaction is submitted and the user is alerted of its success with details of the transfer                                                 | Passed |
| TC4     | User submits a send request and has insufficient funds.     | The transaction fails, with the user being notified that the account does not have the funds to do so.                                                                                     | Passed |
| TC5     | User submits a send request with invalid card details. | The transaction fails, with the user recieving an error message and status message.                                 | Passed |
| TC6     | User submits a refund request and has sufficient funds. | The transaction is submitted and the user is alerted of its success with details of the refund.                                 | Passed |
| TC7     | User submits a refund request and has insufficient funds. | The transaction fails, with the user being notified that the account does not have the funds to do so.                       | Passed |
| TC8     | User submits a request for the card check with a valid credit card number.| The action passes with the user being notified of the card type.                       | Passed |
| TC9     | User submits a request for the card check with a invalid credit card number. | The action fails with the user being notified of the error they have encountered.                       | Passed |
| TC10     | User clicks pinpad buttons | The number corresponding with the button pressed will input into the currently selected field.          | Passed |
| TC11     | User clicks edit button. | The edit button corresponding with the input field pressed will select it for the pinpad to enter into. | Passed |
## UML Class diagram
We created a UML diagram to help us visualise how the application’s classes will interact with one another and how our project will work as a whole.

![Copy of UML](https://user-images.githubusercontent.com/57259804/142338616-c9f8ee18-1b89-4810-b829-9ff36e3cabe6.png)

## Robustness diagram
The robustness diagram shows the steps the user takes while using the application we create. It simplifies the UML diagram we created previously.

![Copy of robustness](https://user-images.githubusercontent.com/57259804/142338928-b7338077-426e-42bf-89c8-22d4a82a91d3.png)
