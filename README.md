# Creating an EVENT in MySQL to Know the Status of the Inventory


The use case addressed by this project is quite common in the industry. 
I’m creating a query to make sure this company knows how’s its current inventory by product for every store they own, so that they avoid running out of it. 

First, I added a new column to the inventory table, called “Inventory_Status”. This field will mention whether the stock quantities are good or need to be replenished. 

![image](https://github.com/lmmendivil/EVENT-to-Replenish-Stock/assets/159588430/72ec530d-395c-4415-bbcd-8fecb644b59c)

![image](https://github.com/lmmendivil/EVENT-to-Replenish-Stock/assets/159588430/67b8d852-df82-4d10-b2d1-c9a2d71c068a)






Then, I made sure there were no current EVENTS active on the program. 

![image](https://github.com/lmmendivil/EVENT-to-Replenish-Stock/assets/159588430/7f8f747d-317d-47e7-a768-0e3a99aebf15)


I proceeded to create the EVENT query.

![image](https://github.com/lmmendivil/EVENT-to-Replenish-Stock/assets/159588430/b0761d4f-caa0-4a2c-bfb6-32601e7bba47)




And made sure it was enabled. 

![image](https://github.com/lmmendivil/EVENT-to-Replenish-Stock/assets/159588430/a682a2fd-8b33-4dc9-a4a9-641b385e5acd)


Now we know that every minute that goes by, the system will check the quantities of products in every store. 

Here’s a screenshot of the inventory table before the EVENT was created. There was an evident error in that information, made on purpose, to test the event recenlty created. If there were 200 units available of Product_ID 2, then it the status label should be “GOOD”, right? 



![image](https://github.com/lmmendivil/EVENT-to-Replenish-Stock/assets/159588430/b0783c2d-01c9-4da9-9fbb-a1395b55ee68)



A minute after the EVENT was created, this is how the inventory table looked like. 



![image](https://github.com/lmmendivil/EVENT-to-Replenish-Stock/assets/159588430/bb4300cc-c46b-410a-a1ce-c38f7197577e)



It corrected the error. 


Then I proceeded to ask for the current time as I run the queries, only for demonstration purposes. 
In this example, I want you to take a look at the units available of Product_ID 3 and 7 for Store_ID 1. 
After some sales of those products, the Inventory_Status should change. 




![image](https://github.com/lmmendivil/EVENT-to-Replenish-Stock/assets/159588430/9c64f76f-bd64-4c81-9ea9-ca536aea906c)




So, these two sales happened:




![image](https://github.com/lmmendivil/EVENT-to-Replenish-Stock/assets/159588430/6281ab4b-b27e-4533-b2e8-f4685cfb35ad)




And with these transactions, the sales table looks like the image below. 



![image](https://github.com/lmmendivil/EVENT-to-Replenish-Stock/assets/159588430/fd104e03-19ba-4614-af80-1df0f4f16a28)




Let’s see how’s the inventory table after the new sales. 
A minute went by and the Inventory_Status changed for those two products, from “replenish” to “almost out” and from “almost out” to “out” respectively. 
That means, the EVENT is working fine. 



![image](https://github.com/lmmendivil/EVENT-to-Replenish-Stock/assets/159588430/33bbae93-99ea-462d-855b-b8b22d75667d)


Let’s replenish the stock for product_ID 1 and 5. 

![image](https://github.com/lmmendivil/EVENT-to-Replenish-Stock/assets/159588430/6193807f-019f-4c50-9682-c7ccb98f4357)



![image](https://github.com/lmmendivil/EVENT-to-Replenish-Stock/assets/159588430/88724e01-6955-4066-98bf-1b24c7bf74ac)


It all seems to work perfectly. However, the company decided to update the EVENT from updating the status every 1 minute to updating it every 24 hours. 
And this is how I did it:


![image](https://github.com/lmmendivil/EVENT-to-Replenish-Stock/assets/159588430/01dd0e73-0bb3-45e3-b67e-c5c2bb9f1c60)




