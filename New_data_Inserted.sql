-- Membership new
INSERT INTO Membership (Membership_ID, Client_ID, Plan_Type, Start_Date, End_Date, Status, Price) VALUES (2706, 4338, 'Platinum', to_date('2024-05-10', 'YYYY-MM-DD'), to_date('2025-05-10', 'YYYY-MM-DD'), 'Active', 342.78);
INSERT INTO Membership (Membership_ID, Client_ID, Plan_Type, Start_Date, End_Date, Status, Price) VALUES (9291, 6685, 'Gold', to_date('2024-05-19', 'YYYY-MM-DD'), to_date('2024-11-19', 'YYYY-MM-DD'), 'Active', 363.65);
INSERT INTO Membership (Membership_ID, Client_ID, Plan_Type, Start_Date, End_Date, Status, Price) VALUES (7150, 7535, 'Gold', to_date('2024-10-13', 'YYYY-MM-DD'), to_date('2025-04-13', 'YYYY-MM-DD'), 'Active', 450.11);
INSERT INTO Membership (Membership_ID, Client_ID, Plan_Type, Start_Date, End_Date, Status, Price) VALUES (9527, 6617, 'Silver', to_date('2024-05-10', 'YYYY-MM-DD'), to_date('2025-07-08', 'YYYY-MM-DD'), 'Active', 434.75);
INSERT INTO Membership (Membership_ID, Client_ID, Plan_Type, Start_Date, End_Date, Status, Price) VALUES (9045, 8108, 'Silver', to_date('2024-01-12', 'YYYY-MM-DD'), to_date('2024-3-18', 'YYYY-MM-DD'), 'Active', 252.37);
INSERT INTO Membership (Membership_ID, Client_ID, Plan_Type, Start_Date, End_Date, Status, Price) VALUES (8493, 4338, 'Platinum', to_date('2024-05-03', 'YYYY-MM-DD'), to_date('2024-5-20', 'YYYY-MM-DD'), 'Active', 230.82);
INSERT INTO Membership (Membership_ID, Client_ID, Plan_Type, Start_Date, End_Date, Status, Price) VALUES (8683, 7575, 'Platinum', to_date('2024-09-01', 'YYYY-MM-DD'), to_date('2025-09-10', 'YYYY-MM-DD'), 'Active', 342.13);
INSERT INTO Membership (Membership_ID, Client_ID, Plan_Type, Start_Date, End_Date, Status, Price) VALUES (6479, 6685, 'Gold', to_date('2024-10-19', 'YYYY-MM-DD'), to_date('2025-04-20', 'YYYY-MM-DD'), 'Active', 79.48);
INSERT INTO Membership (Membership_ID, Client_ID, Plan_Type, Start_Date, End_Date, Status, Price) VALUES (4726, 9019, 'Gold', to_date('2024-02-24', 'YYYY-MM-DD'), to_date('2024-08-15', 'YYYY-MM-DD'), 'Inactive', 248.44);
INSERT INTO Membership (Membership_ID, Client_ID, Plan_Type, Start_Date, End_Date, Status, Price) VALUES (7824, 8284, 'Platinum', to_date('2024-08-08', 'YYYY-MM-DD'), to_date('2025-08-26', 'YYYY-MM-DD'), 'Active', 53.13);
INSERT INTO Membership (Membership_ID, Client_ID, Plan_Type, Start_Date, End_Date, Status, Price) VALUES (1972, 9626, 'Gold', to_date('2024-01-16', 'YYYY-MM-DD'), to_date('2024-06-08', 'YYYY-MM-DD'), 'Inactive', 490.04);
INSERT INTO Membership (Membership_ID, Client_ID, Plan_Type, Start_Date, End_Date, Status, Price) VALUES (8332, 3465, 'Gold', to_date('2024-03-17', 'YYYY-MM-DD'), to_date('2024-09-17', 'YYYY-MM-DD'), 'Inactive', 62.47);
INSERT INTO Membership (Membership_ID, Client_ID, Plan_Type, Start_Date, End_Date, Status, Price) VALUES (7168, 8888, 'Silver', to_date('2024-04-22', 'YYYY-MM-DD'), to_date('2024-7-17', 'YYYY-MM-DD'), 'Inactive', 491.67);
INSERT INTO Membership (Membership_ID, Client_ID, Plan_Type, Start_Date, End_Date, Status, Price) VALUES (7993, 9019, 'Platinum', to_date('2024-08-01', 'YYYY-MM-DD'), to_date('2025-08-21', 'YYYY-MM-DD'), 'Active', 355.72);
INSERT INTO Membership (Membership_ID, Client_ID, Plan_Type, Start_Date, End_Date, Status, Price) VALUES (3965, 5383, 'Gold', to_date('2024-04-02', 'YYYY-MM-DD'), to_date('2025-10-25', 'YYYY-MM-DD'), 'Active', 254.81);



INSERT INTO Fitness_Classes (Class_ID, Class_Name, Class_Type, Schedule, Instructor_ID, Available_Slots) VALUES (8323, 'HIIT', 'Aerobic Fitness', to_timestamp('2024-11-20 16:55:28.290814', 'YYYY-MM-DD HH24:MI:SS:FF'), 2568, 12);
INSERT INTO Fitness_Classes (Class_ID, Class_Name, Class_Type, Schedule, Instructor_ID, Available_Slots) VALUES (1308, 'Outdoor', 'Core Exercises', to_timestamp('2024-11-15 04:26:20.828879', 'YYYY-MM-DD HH24:MI:SS:FF'), 4554, 11);
INSERT INTO Fitness_Classes (Class_ID, Class_Name, Class_Type, Schedule, Instructor_ID, Available_Slots) VALUES (6933, 'AMRAP', 'Balance Training', to_timestamp('2024-11-17 18:43:02.687510', 'YYYY-MM-DD HH24:MI:SS:FF'), 4554, 30);
INSERT INTO Fitness_Classes (Class_ID, Class_Name, Class_Type, Schedule, Instructor_ID, Available_Slots) VALUES (2134, 'Outdoor', 'Flexibility and Stretching', to_timestamp('2024-11-01 02:11:39.171266', 'YYYY-MM-DD HH24:MI:SS:FF'), 2568, 10);
INSERT INTO Fitness_Classes (Class_ID, Class_Name, Class_Type, Schedule, Instructor_ID, Available_Slots) VALUES (5107, 'HIIT', 'Flexibility and Stretching', to_timestamp('2024-11-25 11:24:47.551170', 'YYYY-MM-DD HH24:MI:SS:FF'), 3400, 22);
INSERT INTO Fitness_Classes (Class_ID, Class_Name, Class_Type, Schedule, Instructor_ID, Available_Slots) VALUES (6747, 'Bodyweight', 'Flexibility and Stretching', to_timestamp('2024-11-15 04:05:44.544806', 'YYYY-MM-DD HH24:MI:SS:FF'), 5118, 10);
INSERT INTO Fitness_Classes (Class_ID, Class_Name, Class_Type, Schedule, Instructor_ID, Available_Slots) VALUES (5767, 'Bodyweight', 'Core Exercises', to_timestamp('2024-11-05 03:32:51.824732', 'YYYY-MM-DD HH24:MI:SS:FF'), 2568, 14);
INSERT INTO Fitness_Classes (Class_ID, Class_Name, Class_Type, Schedule, Instructor_ID, Available_Slots) VALUES (4778, 'Outdoor', 'Aerobic Fitness', to_timestamp('2024-11-17 19:58:01.738331', 'YYYY-MM-DD HH24:MI:SS:FF'), 3400, 22);
INSERT INTO Fitness_Classes (Class_ID, Class_Name, Class_Type, Schedule, Instructor_ID, Available_Slots) VALUES (8941, 'TRX', 'Aerobic Fitness', to_timestamp('2024-11-10 09:47:19.652765', 'YYYY-MM-DD HH24:MI:SS:FF'), 4706, 21);
INSERT INTO Fitness_Classes (Class_ID, Class_Name, Class_Type, Schedule, Instructor_ID, Available_Slots) VALUES (3109, 'AMRAP', 'Strength Training', to_timestamp('2024-11-22 05:42:07.748604', 'YYYY-MM-DD HH24:MI:SS:FF'), 4706, 11);





-- PERSONAL TRAINING SESSIONS NEW
INSERT INTO Personal_Training_Sessions (Training_ID, Client_ID, Trainer_ID, Session_Schedule, Workout_Details) VALUES (1281, 9153, 7857, to_timestamp('2024-11-11 14:51:03.883603', 'YYYY-MM-DD HH24:MI:SS:FF'), 'Corporis modi explicabo enim reiciendis illum ipsam. Numquam sint neque repellat quam.
Repellat rerum ipsa.');
INSERT INTO Personal_Training_Sessions (Training_ID, Client_ID, Trainer_ID, Session_Schedule, Workout_Details) VALUES (2882, 4811, 3729, to_timestamp('2024-11-02 06:16:37.431314', 'YYYY-MM-DD HH24:MI:SS:FF'), 'Provident delectus dolore nulla. Est labore optio magni labore exercitationem alias. Incidunt eum ab magni asperiores hic sed.
Delectus quae ab pariatur.');
INSERT INTO Personal_Training_Sessions (Training_ID, Client_ID, Trainer_ID, Session_Schedule, Workout_Details) VALUES (3275, 3167, 4841, to_timestamp('2024-11-02 07:57:03.590898', 'YYYY-MM-DD HH24:MI:SS:FF'), 'Ducimus magnam eaque sunt culpa porro. Nesciunt sint minima repellendus quisquam beatae. Labore maxime velit ipsum.');
INSERT INTO Personal_Training_Sessions (Training_ID, Client_ID, Trainer_ID, Session_Schedule, Workout_Details) VALUES (8759, 9081, 7363, to_timestamp('2024-11-15 01:38:39.756307', 'YYYY-MM-DD HH24:MI:SS:FF'), 'Ipsum quisquam minima qui ullam. Inventore labore sunt dolorem ex possimus doloremque. Enim molestias ducimus saepe ad.');
INSERT INTO Personal_Training_Sessions (Training_ID, Client_ID, Trainer_ID, Session_Schedule, Workout_Details) VALUES (7203, 9573, 7926, to_timestamp('2024-11-03 06:52:34.408842', 'YYYY-MM-DD HH24:MI:SS:FF'), 'Laudantium quod beatae minus. Natus beatae harum impedit quam aut fugit. Dolorem quisquam dolores animi illum labore quidem. Laboriosam repellendus nobis debitis ex. Illo maiores vero ratione.');
INSERT INTO Personal_Training_Sessions (Training_ID, Client_ID, Trainer_ID, Session_Schedule, Workout_Details) VALUES (6316, 4962, 7926, to_timestamp('2024-11-19 12:50:02.062975', 'YYYY-MM-DD HH24:MI:SS:FF'), 'Error fuga in tempore rem. Neque perspiciatis earum nesciunt. Maiores doloremque maxime. Quae numquam ipsum tempora. Necessitatibus sequi mollitia ipsum voluptatem vero. Neque blanditiis velit ab.');
INSERT INTO Personal_Training_Sessions (Training_ID, Client_ID, Trainer_ID, Session_Schedule, Workout_Details) VALUES (4652, 2731, 3729, to_timestamp('2024-11-24 17:58:40.590574', 'YYYY-MM-DD HH24:MI:SS:FF'), 'Maxime iste maxime. Animi numquam ipsum exercitationem corporis explicabo. Commodi ab perferendis sequi reprehenderit. Dolorum aliquam neque eius earum consectetur. Aspernatur alias tempora.');
INSERT INTO Personal_Training_Sessions (Training_ID, Client_ID, Trainer_ID, Session_Schedule, Workout_Details) VALUES (6542, 1528, 3729, to_timestamp('2024-11-12 00:50:31.533478', 'YYYY-MM-DD HH24:MI:SS:FF'), 'Provident veniam quasi perferendis dicta. Vel sed unde reprehenderit quasi repellat enim perferendis. Odio in culpa numquam odio voluptas. Eos esse in nisi.');
INSERT INTO Personal_Training_Sessions (Training_ID, Client_ID, Trainer_ID, Session_Schedule, Workout_Details) VALUES (5845, 2071, 7857, to_timestamp('2024-11-12 18:25:18.753276', 'YYYY-MM-DD HH24:MI:SS:FF'), 'Officiis iure distinctio autem voluptates sequi voluptatibus magni. Dolorem earum ipsa. Quod soluta iusto consequuntur quis quibusdam laboriosam.');
INSERT INTO Personal_Training_Sessions (Training_ID, Client_ID, Trainer_ID, Session_Schedule, Workout_Details) VALUES (1352, 2697, 1987, to_timestamp('2024-11-10 12:48:38.755188', 'YYYY-MM-DD HH24:MI:SS:FF'), 'Est architecto odio. Amet iusto doloremque qui quasi. Alias in ad praesentium ratione suscipit recusandae. Maxime dolor occaecati adipisci quibusdam.');



--NEW HEALTH ASSESSMENTS
INSERT INTO Health_Assessments (Assessment_ID, Client_ID, Trainer_ID, Assessment_Time, Weight, BMI, Body_Fat_Percentage) VALUES (9773, 6128, 8878, to_timestamp('2024-02-20 13:10:56.384739', 'YYYY-MM-DD HH24:MI:SS:FF'), 82.41, 29.16, 36.9);
INSERT INTO Health_Assessments (Assessment_ID, Client_ID, Trainer_ID, Assessment_Time, Weight, BMI, Body_Fat_Percentage) VALUES (8715, 1983, 5308, to_timestamp('2024-03-06 12:54:28.064248', 'YYYY-MM-DD HH24:MI:SS:FF'), 77.06, 22.54, 27.0);
INSERT INTO Health_Assessments (Assessment_ID, Client_ID, Trainer_ID, Assessment_Time, Weight, BMI, Body_Fat_Percentage) VALUES (7028, 8967, 5308, to_timestamp('2024-04-17 12:49:50.370394', 'YYYY-MM-DD HH24:MI:SS:FF'), 72.27, 19.14, 25.7);
INSERT INTO Health_Assessments (Assessment_ID, Client_ID, Trainer_ID, Assessment_Time, Weight, BMI, Body_Fat_Percentage) VALUES (7383, 9511, 6195, to_timestamp('2024-01-25 10:53:39.043383', 'YYYY-MM-DD HH24:MI:SS:FF'), 70.51, 24.05, 11.68);
INSERT INTO Health_Assessments (Assessment_ID, Client_ID, Trainer_ID, Assessment_Time, Weight, BMI, Body_Fat_Percentage) VALUES (1600, 8967, 8878, to_timestamp('2024-11-01 20:42:08.104667', 'YYYY-MM-DD HH24:MI:SS:FF'), 76.41, 22.12, 19.24);
INSERT INTO Health_Assessments (Assessment_ID, Client_ID, Trainer_ID, Assessment_Time, Weight, BMI, Body_Fat_Percentage) VALUES (5053, 1431, 9059, to_timestamp('2024-09-06 18:44:41.331434', 'YYYY-MM-DD HH24:MI:SS:FF'), 56.63, 21.1, 28.26);
INSERT INTO Health_Assessments (Assessment_ID, Client_ID, Trainer_ID, Assessment_Time, Weight, BMI, Body_Fat_Percentage) VALUES (5274, 9726, 8912, to_timestamp('2024-11-04 08:47:27.612969', 'YYYY-MM-DD HH24:MI:SS:FF'), 89.99, 26.25, 26.62);
INSERT INTO Health_Assessments (Assessment_ID, Client_ID, Trainer_ID, Assessment_Time, Weight, BMI, Body_Fat_Percentage) VALUES (3535, 5488, 5506, to_timestamp('2024-04-01 09:12:11.560210', 'YYYY-MM-DD HH24:MI:SS:FF'), 66.04, 27.04, 13.73);
INSERT INTO Health_Assessments (Assessment_ID, Client_ID, Trainer_ID, Assessment_Time, Weight, BMI, Body_Fat_Percentage) VALUES (7647, 7042, 2531, to_timestamp('2024-01-22 17:52:34.653641', 'YYYY-MM-DD HH24:MI:SS:FF'), 65.83, 24.53, 18.26);
INSERT INTO Health_Assessments (Assessment_ID, Client_ID, Trainer_ID, Assessment_Time, Weight, BMI, Body_Fat_Percentage) VALUES (4771, 8967, 6195, to_timestamp('2024-08-15 15:31:37.468016', 'YYYY-MM-DD HH24:MI:SS:FF'), 54.94, 26.67, 37.5);




INSERT INTO Gym_Attendance (Attendance_ID, Client_ID, Check_in, Check_out, Facility_ID) VALUES (7556, 6019, to_timestamp('2024-11-17 10:58:06.256762', 'YYYY-MM-DD HH24:MI:SS:FF'), to_timestamp('2024-11-17 21:54:57.804243', 'YYYY-MM-DD HH24:MI:SS:FF'), 3317);
INSERT INTO Gym_Attendance (Attendance_ID, Client_ID, Check_in, Check_out, Facility_ID) VALUES (2555, 6079, to_timestamp('2024-11-12 16:27:56.106181', 'YYYY-MM-DD HH24:MI:SS:FF'), to_timestamp('2024-11-15 20:32:42.535105', 'YYYY-MM-DD HH24:MI:SS:FF'), 8196);
INSERT INTO Gym_Attendance (Attendance_ID, Client_ID, Check_in, Check_out, Facility_ID) VALUES (1109, 4281, to_timestamp('2024-11-02 00:27:09.510413', 'YYYY-MM-DD HH24:MI:SS:FF'), to_timestamp('2024-11-02 16:22:50.755512', 'YYYY-MM-DD HH24:MI:SS:FF'), 9790);
INSERT INTO Gym_Attendance (Attendance_ID, Client_ID, Check_in, Check_out, Facility_ID) VALUES (2961, 6019, to_timestamp('2024-11-02 05:55:08.228431', 'YYYY-MM-DD HH24:MI:SS:FF'), to_timestamp('2024-11-02 07:05:39.993567', 'YYYY-MM-DD HH24:MI:SS:FF'), 4770);
INSERT INTO Gym_Attendance (Attendance_ID, Client_ID, Check_in, Check_out, Facility_ID) VALUES (8724, 6108, to_timestamp('2024-11-05 06:20:39.220176', 'YYYY-MM-DD HH24:MI:SS:FF'), to_timestamp('2024-11-05 09:06:28.339086', 'YYYY-MM-DD HH24:MI:SS:FF'), 3317);
INSERT INTO Gym_Attendance (Attendance_ID, Client_ID, Check_in, Check_out, Facility_ID) VALUES (8517, 5210, to_timestamp('2024-11-19 07:33:16.296696', 'YYYY-MM-DD HH24:MI:SS:FF'), to_timestamp('2024-11-19 11:55:13.619340', 'YYYY-MM-DD HH24:MI:SS:FF'), 9790);
INSERT INTO Gym_Attendance (Attendance_ID, Client_ID, Check_in, Check_out, Facility_ID) VALUES (1817, 6154, to_timestamp('2024-11-21 11:31:43.807801', 'YYYY-MM-DD HH24:MI:SS:FF'), to_timestamp('2024-11-21 14:52:44.837924', 'YYYY-MM-DD HH24:MI:SS:FF'), 8196);
INSERT INTO Gym_Attendance (Attendance_ID, Client_ID, Check_in, Check_out, Facility_ID) VALUES (3402, 4281, to_timestamp('2024-11-17 18:03:49.815275', 'YYYY-MM-DD HH24:MI:SS:FF'), to_timestamp('2024-11-17 21:14:43.707832', 'YYYY-MM-DD HH24:MI:SS:FF'), 9790);
INSERT INTO Gym_Attendance (Attendance_ID, Client_ID, Check_in, Check_out, Facility_ID) VALUES (9870, 6108, to_timestamp('2024-11-22 18:00:21.729636', 'YYYY-MM-DD HH24:MI:SS:FF'), to_timestamp('2024-11-22 20:39:47.778137', 'YYYY-MM-DD HH24:MI:SS:FF'), 3468);
INSERT INTO Gym_Attendance (Attendance_ID, Client_ID, Check_in, Check_out, Facility_ID) VALUES (1682, 5294, to_timestamp('2024-11-09 19:37:26.840638', 'YYYY-MM-DD HH24:MI:SS:FF'), to_timestamp('2024-11-09 21:35:55.654264', 'YYYY-MM-DD HH24:MI:SS:FF'), 4770);

