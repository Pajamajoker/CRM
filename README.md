# CRM 
NOTE!
1)This CRM application is just an extensively demonstrative application,coded for the purpose of showcasing the advantages and use cases of a CRM in various business sectors.
2)I've created the CRM for a Financial Services Company such as BajajFinServ OR loan lending financial Banks
3)The codebase can be modified to serve as CRM for businesses of different sectors.
4)This project is a part of my college curriculum,which uses JSP(now considered as obsolete technology)
I've created a CRM tool web application. For this application I've used MYSQL to store the data and for the user interface I have used JSP and HTML. 
Customer relationship management (CRM) is a combination of people, processes, and technology that seeks to provide understanding of customer needs, to support business strategy, and to build long-term relationships with customers. 

FUNCTIONALITIES 
1.	An up to date database of customers, probable leads, available products is maintained.

2.	Employees can add new leads, edit as well as delete the existing leads. An employee can however perform these operations on just his own leads database.

3.	Leads can be directly converted to customers, without having to re-enter his data, which when done manually is prone to data inconsistency. Depending on the product bought, the system calculates the monthly installments as well as sets deadlines for receiving payments from the customer.

4.	Since this CRM is designed for a loan-lending company, all the customers are categorized as per their repayment capacity. Thus loan amount can be granted to them only within a fixed range. 
5.	The employee can track payment details of every customer, that is payment for which months is pending, etc. He can thus contact the customers accordingly.

6.	Employees can create a to-do list for themselves, as well as set a deadline for the same. If the task isn’t completed by the deadline, he would be notified about it.

7.	Various analyses are provided such as which is the most sold product of the company, sales analysis of the past 5 months. Easy to understand graphics such as pie-charts showing number of sales of each product, status of leads in the database, have been projected. This will help the manager know where they’re falling short and hence take action on the same.

8.	For an employee to analyse his own performance, dashboard will show his most sold product as well as his total number sales. 

9.	The dashboard will project analyses of data for the whole company, as well as performance of the logged in employee. 

10.	Top salesman and Leader Board is displayed, which will help the company reward its deserving employees.

11.	 Along with the employee login, customer login is provided. Customers can check their pending payments and make payments through this portal. The employee attending that customer would then see its updated status.

FILE DESCRIPTIONS

1) The latest database is present in file named "test_jsp(6).sql"
2) The folder WebContent has all the .jsp files
3) All the Frontend Resources are in the "Resources" Folder

SCREENSHOTS:

![image](https://user-images.githubusercontent.com/46530662/68836190-ca50fb80-06df-11ea-9dee-b233e4126cc6.png)

![image](https://user-images.githubusercontent.com/46530662/68836317-10a65a80-06e0-11ea-9227-b13266f5b228.png)

![image](https://user-images.githubusercontent.com/46530662/68836344-24ea5780-06e0-11ea-8a80-78f851e14b0b.png)

![image](https://user-images.githubusercontent.com/46530662/68836386-3df30880-06e0-11ea-9e59-374c99877205.png)

![image](https://user-images.githubusercontent.com/46530662/68836364-33387380-06e0-11ea-80c3-3e737c74572e.png)


SHORTCOMINGS OF THE PROJECT
1) As I was coding this application using JSP for the first time, I realised half-way through the project how severly flawed the codebase is. I have coded the entire project in JSP without the use of explicit Java Servelets. This is a bad practice of coding since
JSPs should primarily be used only as "views" and most of the backend processing should be done on java servelets.
2)Some security flaws exist
3)Validations at a few places.
4)Outdated technology is used.

CODE REMARKS
I will try and correct the code as much as possible,however the JSP pages seem to be working fine on small scale,so explicit Java servlets are not needed for small scale purposes.
This technology is now severely outdated.



