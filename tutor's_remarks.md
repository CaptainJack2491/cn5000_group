1. make an ERD.
   
2. Show a clear difference between the ERD and Nornalized ERD.
   
3. Use Data modler to creating the ERD Diagram. (Export the script and use in APEX).
   
4. Create Tables
   
5. Queries.
   
   1. Show all the fitness classes in teh gyn, yoga pilated, hit, lower body, strength trainng, upper body,
   2. Straightforward quiery.
   3. grab everything, do the calculations, show the result.(From Biling)
   4. **Change the "Training" table name to "Personal_Training_Sessions".**
   5. easy.
   6. have a way to figure out which members are the most "active" sort using "time spent at gym in a week" (hint: can use operators).
   7. particularly for business. go to the revenue table
   8. Use Sub-Query **we need someting called progress in the ERD** (Hint: It has more than 1 query, that;s all she can give.)
      1. Define in the system that all our plans are 90 days, and decide progress based on the days attended.
   
6. Trigger & Store Procedure.
   
   1. set one of the m;embers' expiry date and time at the time of the presentation to make it sexier!
      1. (All the memberships end at 11:20 in the morning!)
   2. Rename **"Max_Capacity" to "Available_Spots"** for all the classes and decrease as the spaces are booked.
   3. How to do this? 
      1. set a specific time before when the notifications go to the members.
      2. set the notifications every day around the time the member visits the gym.


      #  Ids' Keys :-
1. clint_id - first two degits starting from right .
2. membership_id - first two degits starting from right where third degit from right is 1.
3. Discount_id - forth and fifth digit from right starting at 11 ending at 14.
4. facilities_id  - fifth digit from right  starting form 1 ending at 5.
5. staff_Id  - third and forth digits starting from right.
6. fitness_classes - seventh and eighth digit starting from right.
7. training_id  - first two digits form right where sixth digit form right is 1.
8. assessment_id - first and second digits form right starting form 10 ending at 19 where fifth and eight digits are 1.
9. attendence_id  - first and second digits form right where forth and eighth digits are 1.
10. rantal_id - first and second digits form right where third and eighth digits are 1.
11. booking_id - first and second digits form right where seventh and eighth digits are 1.
12. billing_id  -first and second digits form right where  third ,forth,seventh and eighth digits are 1.




# TO DO FOR QUERIES
Q2:
    - added yoga and pilates
Q3:
    - add service type in billing
Q6:
    - changed workout_details in PTS to Exercies type



Coursework Deadline: -
18th December 2024

