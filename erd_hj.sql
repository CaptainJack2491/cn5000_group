CREATE TABLE fitness_class(
	class_ID NUMBER(9),
	centre_ID NUMBER(9),
	staff_ID NUMBER(9),
	fitness_class_type VARCHAR2(30) NOT NULL,
	duration TIME,
	workout_ID NUMBER(9),
	PRIMARY KEY (class_ID)
);

CREATE TABLE workshops(
	workshop_ID NUMBER(9) NOT NULL,
	member_ID NUMBER(9) NOT NULL,
	instructor_ID NUMBER(9) NOT NULL,
	centre_ID VARCHAR2(80),
	workshop_date DATE,
	PRIMARY KEY (workshop_ID)
);

CREATE TABLE staff(
	staff_ID NUMBER(9) NOT NULL,
	first_name VARCHAR2(25) NOT NULL,
	last_name VARCHAR2(25) NOT NULL,
	sex VARCHAR2(30),
	address VARCHAR2(80),
	role VARCHAR2(30) NOT NULL,
	email VARCHAR2(320),
	contact_number NUMBER(11),
	emergency_contact NUMBER(11),
	salary NUMBER(6),
	PRIMARY KEY (staff_ID, role)
);

CREATE TABLE workout_plans(
	workout_plan_ID NUMBER(9) NOT NULL,
	member_ID NUMBER(9),
	staff_ID NUMBER(9),
	centre_ID NUMBER(9),
	plan_date DATE,
	plan_time TIME,
	exercise VARCHAR2(30),
	workout_reps NUMBER(2),
	workout_sets NUMBER(2),
	PRIMARY KEY (workout_plan_ID)
);
