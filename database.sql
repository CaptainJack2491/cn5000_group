 

CREATE TABLE MEMBERS
(
    MEMBER_ID NUMBER(9) NOT NULL,
    FNAME VARCHAR2(25) NOT NULL,
    LNAME VARCHAR2(25) NOT NULL,
    ADDRESS VARCHAR2(80) ,
    SEX CHAR(1) NULL,
    EMAIL VARCHAR(320) NOT NULL,
    CONTACT NUMBER(11),
    EMERGENCY_CONTACT NUMBER(11),
    PRIMARY KEY (MEMBER_ID)
);

CREATE TABLE HEALTH_ASSESSMENTS
(
    ASSESSMENT_ID NUMBER(9) NOT NULL,
    WEIGHT NUMBER(4,2),
    ASSESSMENT_DATE DATE,
    BMI NUMBER (4,2),
    PRIMARY KEY (ASSESSMENT_ID)
);

CREATE TABLE EQUIPMENT_RENTAL
(
    EQUIPMENT_ID NUMBER(9) NOT NULL,
    EQ_MODEL VARCHAR2(30),
    SERIAL_NUMBER NUMBER(9),
    MAINTENANCE_SCHEDULE VARCHAR2(30),
    PRIMARY KEY (EQUIPMENT_ID)
);

create table clients_guests
(
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
)

create table payments(
  payment_id    number(9) primary key not null,
  member_id     number(9) not null,
  amount        number(6) not null,
  payment_date  date,
  payment_method  varchar2(25)
)

create table membership(
  membership_id number(9) primary key not null,
  plan_id       number(9) not null,
  start_date    date,
  end_date      date,
  status        number(1) check (status in (0,1))
)

CREATE TABLE FITNESS_CENTRE
(
    CENTRE_ID NUMBER(9) PRIMARY KEY NOT NULL,
    F_NAME VARCHAR2(25) NOT NULL,
    L_NAME VARCHAR2(25),
    C_LOCATION VARCHAR2(30),
    FACILITY VARCHAR2(30)
);

CREATE TABLE MEMBERSHIP_PLANS
(
    PLAN_ID NUMBER(9) PRIMARY KEY NOT NULL,
    PLAN_NAME VARCHAR2(30) NOT NULL,
    BENEFITS VARCHAR2(80),
    RENEWAL_DATE DATE,
    PRICE DECIMAL(10, 2)
);

CREATE TABLE PROMOTIONS
(
    PROMOTION_ID NUMBER(9) PRIMARY KEY NOT NULL,
    P_TYPE VARCHAR2(30) NOT NULL,
    DISCOUNT DECIMAL(10, 2) NOT NULL
);

CREATE TABLE INVOICES
(
    INVOICE_ID NUMBER(9) PRIMARY KEY NOT NULL,
    PAYMENT_ID VARCHAR2(30) NOT NULL,
    SERVICES VARCHAR2(30)
);

CREATE TABLE PERSONAL_TRAINING_SESSIONS
(
    SESSION_ID NUMBER(9) PRIMARY KEY NOT NULL,
    DATE_TIME TIMESTAMP NOT NULL,
    DURATION INTERVAL DAY TO SECOND NOT NULL,
    TRAINER_ID NUMBER(9) NOT NULL,
    MEMBER_ID NUMBER(9) NOT NULL,
    SESSION_STATUS VARCHAR2(30),
    WORKOUT_ID NUMBER(9) NOT NULL
);


