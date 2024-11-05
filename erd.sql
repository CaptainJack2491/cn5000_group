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

--jayrup's code
create table clients_guests(
  guest_id      number(9) primary key not null,
  member_id     number(9) not null,
  f_name        varchar2(25) not null,
  l_name        varchar2(25),
  address       varchar2(80),
  relation      varchar2(25) not null,
  contact_no    number(10)
);

create table gym_attendence(
  member_id     number(9) primary key not null,
  check_in      date primary key not null,
  check_out     date,
  centre_id     number(9),
  guest_id      number(9)
);

create table payments(
  payment_id    number(9) primary key not null,
  member_id     number(9) not null,
  amount        number(6) not null,
  payment_date  date,
  payment_method  varchar2(25)
);

create table membership(
  membership_id number(9) primary key not null,
  plan_id       number(9) not null,
  start_date    date,
  end_date      date,
  status        number(1) check (status in (0,1))
);
-- shyam;s code

CREATE TABLE FITNESS_CENTRE (
    CENTRE_ID NUMBER(9) PRIMARY KEY NOT NULL,
    F_NAME VARCHAR2(25) NOT NULL,
    L_NAME VARCHAR2(25),
    C_LOCATION VARCHAR2(30),
    FACILITY VARCHAR2(30)
);

CREATE TABLE MEMBERSHIP_PLANS (
    PLAN_ID NUMBER(9) PRIMARY KEY NOT NULL,
    PLAN_NAME VARCHAR2(30) NOT NULL,
    BENEFITS VARCHAR2(80),
    RENEWAL_DATE DATE,
    PRICE DECIMAL(10, 2)
);

CREATE TABLE PROMOTIONS (
    PROMOTION_ID NUMBER(9) PRIMARY KEY NOT NULL,
    P_TYPE VARCHAR2(30) NOT NULL,
    DISCOUNT DECIMAL(10, 2) NOT NULL
);

CREATE TABLE INVOICES (
    INVOICE_ID NUMBER(9) PRIMARY KEY NOT NULL,
    PAYMENT_ID VARCHAR2(30) NOT NULL,
    SERVICES VARCHAR2(30)
);

CREATE TABLE PERSONAL_TRAINING_SESSIONS (
    SESSION_ID NUMBER(9) PRIMARY KEY NOT NULL,
    DATE_TIME TIMESTAMP NOT NULL,
    DURATION INTERVAL DAY TO SECOND NOT NULL,
    TRAINER_ID NUMBER(9) NOT NULL,
    MEMBER_ID NUMBER(9) NOT NULL,
    SESSION_STATUS VARCHAR2(30),
    WORKOUT_ID NUMBER(9) NOT NULL
);
-- yogi's code

