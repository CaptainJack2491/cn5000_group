# CN5000 Coursework Report

## 1. Designing Part (20 Marks)

### 1.1 Entities and ERD (10 Marks)

#### Identification of Potential Entities
In the initial phase of the design, we identified **17 entities** as shown in the brainstorming process. These entities were:
1. Fitness Center
2. Membership Plans
3. Fitness Classes
4. Personal Training Sessions
5. Health Assessments
6. Equipment Rentals
7. Gym Attendance
8. Payments
9. Workout Routines
10. Support Staff
11. Trainers
12. Clients - Guests
13. Clients - Members
14. Instructors
15. Workshops
16. Membership
17. Invoice

#### Refinement of Entities
Through analysis and refinement, the identified entities were streamlined to eliminate redundancies, weak entities, and overlapping concepts. This resulted in a final set of **12 entities** that accurately represent the system requirements for the **Gym Management System**. The final entities are:

1. **Clients**
2. **Membership**
3. **Fitness_Classes**
4. **Class_Bookings**
5. **Personal_Training_Sessions**
6. **Health_Assessments**
7. **Gym_Attendance**
8. **Billing**
9. **Discounts**
10. **Staff**
11. **Facilities**
12. **Equipment_Rentals**

#### Appropriate Naming for Entities
Appropriate and consistent naming conventions were used for all entities to ensure clarity, ease of understanding, and alignment with database design principles. Entities are represented using singular nouns and underscores to separate words where necessary (e.g., **Fitness_Classes**, **Class_Bookings**). These naming conventions align with standard database design practices.

#### Entity-Relationship Diagram (ERD)
The Entity-Relationship Diagram (ERD) was created to represent the relationships among the final 12 entities. Key design considerations included:
- **Identification of Major Entities**: All major entities critical to the system have been retained in the final design.
- **Weak Entities**: Weak or redundant entities (e.g., "Support Staff" and "Trainers" merged into **Staff**) were eliminated to simplify the design.
- **Relationships**: The relationships between entities were clearly defined, ensuring a logical flow of data within the system.
- **Multiplicity and Optionality**: Each relationship is annotated to indicate the multiplicity (one-to-one, one-to-many) and optionality (mandatory/optional) between entities. For instance:
  - A **Client** can have one or more **Memberships**.
  - **Fitness_Classes** can be booked by multiple **Clients** through **Class_Bookings**.
  - **Billing** records are associated with **Clients** and reflect applicable **Discounts**.

The ERD visually illustrates these entities, their attributes, and the relationships that facilitate data integrity and functionality within the **Gym Management System**. The use of CASE tools ensures precision in the design and compliance with database modeling standards.

---

### ERD Diagram
The final ERD, which depicts the relationships and multiplicity, will be provided as part of the **Appendices** section, showing:
- Entities with primary and foreign keys.
- Relationships between tables.
- Multiplicity and constraints clearly defined.

This comprehensive approach ensures that the database design is normalized, logically structured, and aligned with the requirements of the Gym Management System.
