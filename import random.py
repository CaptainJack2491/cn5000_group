import random
from datetime import datetime, timedelta

# Function to generate random timestamps
def random_timestamp(start, end):
    """Generate a random timestamp between start and end."""
    delta = end - start
    random_seconds = random.randint(0, delta.total_seconds())
    random_time = start + timedelta(seconds=random_seconds)
    return random_time

# Constants for generating entries
client_ids = range(1, 21)  # Client IDs from 1 to 20
facility_ids = [10000, 20000, 30000, 40000, 50000]  # Example Facility IDs
start_date = datetime(2024, 11, 1)
end_date = datetime(2024, 11, 30)

# Prepare the SQL statements
sql_statements = []
attendance_id = 10001011  # Starting Attendance_ID

for client_id in client_ids:
    # Randomize the number of entries for this client (1 to 22)
    num_entries = random.randint(1, 22)
    
    for _ in range(num_entries):
        # Randomize check-in and check-out timestamps
        check_in = random_timestamp(start_date, end_date)
        check_out = check_in + timedelta(hours=random.randint(1, 3))  # Check-out is 1-3 hours after check-in
        
        # Randomize Facility_ID
        facility_id = random.choice(facility_ids)
        
        # Generate the SQL statement
        sql = f"""
INSERT INTO Gym_Attendance (Attendance_ID, Client_ID, Check_in, Check_out, Facility_ID) VALUES ({attendance_id}, {str(client_id).zfill(8)}, TO_TIMESTAMP('{check_in.strftime('%Y-%m-%d %H:%M:%S.%f')}', 'YYYY-MM-DD HH24:MI:SS.FF'), TO_TIMESTAMP('{check_out.strftime('%Y-%m-%d %H:%M:%S.%f')}', 'YYYY-MM-DD HH24:MI:SS.FF'), {str(facility_id).zfill(8)});
"""
        sql_statements.append(sql.strip())
        attendance_id += 1  # Increment Attendance_ID

# Save to a file or print
with open("generated_gym_attendance.sql", "w") as file:
    file.write("\n".join(sql_statements))

print(f"Generated {len(sql_statements)} SQL insert statements.")
