
CREATE TABLE clients_guests (
    guest_id   NUMBER(9) NOT NULL,
    member_id  NUMBER(9) NOT NULL,
    f_name     VARCHAR2(25) NOT NULL,
    l_name     VARCHAR2(25),
    address    VARCHAR2(80),
    relation   VARCHAR2(25) NOT NULL,
    contact_no NUMBER(10)
);

ALTER TABLE clients_guests ADD CONSTRAINT clients_guests_pk PRIMARY KEY ( guest_id );

CREATE TABLE equipment_rental (
    equipment_id         NUMBER(9) NOT NULL,
    eq_model             VARCHAR2(30),
    price                NUMBER(4, 2),
    serial_number        NUMBER(9),
    maintenance_schedule VARCHAR2(30)
);

ALTER TABLE equipment_rental ADD CONSTRAINT equipment_rental_pk PRIMARY KEY ( equipment_id );

CREATE TABLE fitness_centre (
    centre_id  NUMBER(9) NOT NULL,
    f_name     VARCHAR2(25) NOT NULL,
    l_name     VARCHAR2(25),
    c_location VARCHAR2(30),
    facility   VARCHAR2(30)
);

ALTER TABLE fitness_centre ADD CONSTRAINT fitness_centre_pk PRIMARY KEY ( centre_id );

CREATE TABLE fitness_class (
    class_id           NUMBER(9) NOT NULL,
    centre_id          NUMBER(9),
    staff_id           NUMBER(9),
    fitness_class_type VARCHAR2(30) NOT NULL,
    duration           TIMESTAMP,
    workout_id         NUMBER(9)
);

ALTER TABLE fitness_class ADD CONSTRAINT fitness_class_pk PRIMARY KEY ( class_id );

CREATE TABLE gym_attendance (
    member_id NUMBER(9) NOT NULL,
    check_in  DATE NOT NULL,
    check_out DATE,
    centre_id NUMBER(9),
    guest_id  NUMBER(9)
);

ALTER TABLE gym_attendance ADD CONSTRAINT gym_attendance_pk PRIMARY KEY ( member_id,
                                                                          check_in );

CREATE TABLE health_assessments (
    assessment_id   NUMBER(9) NOT NULL,
    weight          NUMBER(4, 2),
    assessment_date DATE,
    bmi             NUMBER(4, 2)
);

ALTER TABLE health_assessments ADD CONSTRAINT health_assessments_pk PRIMARY KEY ( assessment_id );

CREATE TABLE invoices (
    invoice_id NUMBER(9) NOT NULL,
    payment_id VARCHAR2(30) NOT NULL,
    promotion_id  NUMBER(9),
    equipment_id   NUMBER(9),
    services   VARCHAR2(30)
);

ALTER TABLE invoices ADD CONSTRAINT invoices_pk PRIMARY KEY ( invoice_id );

CREATE TABLE members (
    member_id         NUMBER(9) NOT NULL,
    plan_id           NUMBER(9),
    fname             VARCHAR2(25) NOT NULL,
    lname             VARCHAR2(25) NOT NULL,
    address           VARCHAR2(80),
    sex               CHAR(1),
    email             VARCHAR2(320) NOT NULL,
    contact           NUMBER(11),
    emergency_contact NUMBER(11)
);

ALTER TABLE members ADD CONSTRAINT members_pk PRIMARY KEY ( member_id );

CREATE TABLE membership (
    membership_id NUMBER(9) NOT NULL,
    plan_id       NUMBER(9) NOT NULL,
    start_date    DATE,
    end_date      DATE,
    status        NUMBER(1)
);

ALTER TABLE membership
    ADD CHECK ( status IN ( 0, 1 ) );

ALTER TABLE membership ADD CONSTRAINT membership_pk PRIMARY KEY ( membership_id );

CREATE TABLE membership_plans (
    plan_id      NUMBER(9) NOT NULL,
    plan_name    VARCHAR2(30) NOT NULL,
    benefits     VARCHAR2(80),
    renewal_date DATE,
    price        NUMBER(10, 2)
);

ALTER TABLE membership_plans ADD CONSTRAINT membership_plans_pk PRIMARY KEY ( plan_id );

CREATE TABLE payments (
    payment_id     NUMBER(9) NOT NULL,
    member_id      NUMBER(9) NOT NULL,
    amount         NUMBER(6) NOT NULL,
    payment_date   DATE,
    payment_method VARCHAR2(25)
);

ALTER TABLE payments ADD CONSTRAINT payments_pk PRIMARY KEY ( payment_id );

CREATE TABLE personal_training_sessions (
    session_id     NUMBER(9) NOT NULL,
    date_time      TIMESTAMP NOT NULL,
    duration       INTERVAL DAY TO SECOND NOT NULL,
    trainer_id     NUMBER(9) NOT NULL,
    member_id      NUMBER(9) NOT NULL,
    session_status VARCHAR2(30),
    workout_id     NUMBER(9) NOT NULL
);

ALTER TABLE personal_training_sessions ADD CONSTRAINT personal_training_sessions_pk PRIMARY KEY ( session_id );

CREATE TABLE promotions (
    promotion_id NUMBER(9) NOT NULL,
    p_type       VARCHAR2(30) NOT NULL,
    discount     NUMBER(10, 2) NOT NULL
);

ALTER TABLE promotions ADD CONSTRAINT promotions_pk PRIMARY KEY ( promotion_id );

CREATE TABLE staff (
    staff_id          NUMBER(9) NOT NULL,
    first_name        VARCHAR2(25) NOT NULL,
    last_name         VARCHAR2(25) NOT NULL,
    sex               VARCHAR2(30),
    address           VARCHAR2(80),
    role              VARCHAR2(30) NOT NULL,
    email             VARCHAR2(320),
    contact_number    NUMBER(11),
    emergency_contact NUMBER(11),
    salary            NUMBER(6)
);

ALTER TABLE staff ADD CONSTRAINT staff_pk PRIMARY KEY ( staff_id );

CREATE TABLE workout_plans (
    workout_plan_id NUMBER(9) NOT NULL,
    member_id       NUMBER(9),
    staff_id        NUMBER(9),
    centre_id       NUMBER(9),
    assessment_id   NUMBER(9),
    plan_date       DATE,
    plan_time       TIMESTAMP,
    exercise        VARCHAR2(30),
    workout_reps    NUMBER(2),
    workout_sets    NUMBER(2)
);

ALTER TABLE workout_plans ADD CONSTRAINT workout_plans_pk PRIMARY KEY ( workout_plan_id );

CREATE TABLE workshops (
    workshop_id              NUMBER(9) NOT NULL,
    member_id                NUMBER(9) NOT NULL,
    instructor_id            NUMBER(9) NOT NULL,
    centre_id                VARCHAR2(80),
    workshop_date            DATE,
);

ALTER TABLE workshops ADD CONSTRAINT workshops_pk PRIMARY KEY ( workshop_id );

alter table members
    add constraint members_membership_plans_fk foreign key ( plan_id )
        references membership_plans ( plan_id )
    not deferrable;

alter table clients_guests
    add constraint clients_guests_members_fk foreign key ( member_id )
        references members ( member_id )
    not deferrable;

ALTER TABLE gym_attendance
    ADD CONSTRAINT gym_attendance_members_fk FOREIGN KEY ( member_id )
        REFERENCES members ( member_id )
    NOT DEFERRABLE;


ALTER TABLE payments
    ADD CONSTRAINT payments_members_fk FOREIGN KEY ( member_id )
        REFERENCES members ( member_id )
    NOT DEFERRABLE;


ALTER TABLE membership
    ADD CONSTRAINT payments_members_fk FOREIGN KEY ( plan_id )
        REFERENCES membership_plans ( plan_id )
    NOT DEFERRABLE;


ALTER TABLE invoices
    ADD CONSTRAINT invoice_equipment_fk FOREIGN KEY ( equipment_id )
        REFERENCES equipment_rental ( equipment_id )
    NOT DEFERRABLE;

ALTER TABLE invoices
    ADD CONSTRAINT invoice_payments_fk FOREIGN KEY ( payment_id )
        REFERENCES payments ( payment_id )
    NOT DEFERRABLE;

ALTER TABLE invoices
    ADD CONSTRAINT invoice_promotions_fk FOREIGN KEY ( promotion_id )
        REFERENCES promotions ( promotion_id )
    NOT DEFERRABLE;


ALTER TABLE personal_training_sessions
    ADD CONSTRAINT personal_training_sessions_staff_fk FOREIGN KEY ( trainer_id )
        REFERENCES staff ( staff_id )
    NOT DEFERRABLE;

ALTER TABLE personal_training_sessions
    ADD CONSTRAINT personal_training_sessions_members_fk FOREIGN KEY ( member_id )
        REFERENCES members ( member_id )
    NOT DEFERRABLE;

ALTER TABLE personal_training_sessions
    ADD CONSTRAINT personal_training_sessions_workout_plans_fk FOREIGN KEY ( workout_id )
        REFERENCES workout_plans ( workout_plan_id )
    NOT DEFERRABLE;


ALTER TABLE fitness_class
    ADD CONSTRAINT fitness_class_fitness_centre_fk FOREIGN KEY ( centre_id )
        REFERENCES fitness_centre ( centre_id )
    NOT DEFERRABLE;

ALTER TABLE fitness_class
    ADD CONSTRAINT fitness_class_staff_fk FOREIGN KEY ( staff_id )
        REFERENCES staff ( staff_id )
    NOT DEFERRABLE;

ALTER TABLE fitness_class
    ADD CONSTRAINT fitness_class_staff_fk FOREIGN KEY ( workout_id )
        REFERENCES workout_plans ( workout_plan_id )
    NOT DEFERRABLE;


ALTER TABLE workshops
    ADD CONSTRAINT workshops_members_fk FOREIGN KEY ( member_id )
        REFERENCES members ( member_id )
    NOT DEFERRABLE;

ALTER TABLE workshops
    ADD CONSTRAINT workshops_staff_fk FOREIGN KEY ( instructor_id )
        REFERENCES staff ( staff_id )
    NOT DEFERRABLE;

ALTER TABLE workshops
    ADD CONSTRAINT workshops_fitness_centre_fk FOREIGN KEY ( centre_id )
        REFERENCES fitness_centre ( centre_id )
    NOT DEFERRABLE;


ALTER TABLE workout_plans
    ADD CONSTRAINT workout_plans_members_fk FOREIGN KEY ( member_id )
        REFERENCES members ( member_id )
    NOT DEFERRABLE;

ALTER TABLE workout_plans
    ADD CONSTRAINT workout_plans_staff_fk FOREIGN KEY ( staff_id )
        REFERENCES staff ( staff_id )
    NOT DEFERRABLE;

ALTER TABLE workout_plans
    ADD CONSTRAINT workout_plans_fitness_centre_fk FOREIGN KEY ( centre_id )
        REFERENCES fitness_centre ( centre_id )
    NOT DEFERRABLE;

ALTER TABLE workout_plans
    ADD CONSTRAINT workout_plans_health_assessments_fk FOREIGN KEY ( assessment_id )
        REFERENCES health_assessments ( assessment_id )
    NOT DEFERRABLE;
