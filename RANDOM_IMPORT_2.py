import random
from datetime import datetime, timedelta

# Function to generate random check-in and check-out times for a specific day
def random_daily_check_in_and_out(day):
    """Generate a random check-in and check-out time on a specific day."""
    check_in_time = datetime.combine(day, datetime.min.time()) + timedelta(hours=random.randint(6, 18))  # Random time between 6 AM and 6 PM
    check_out_time = check_in_time + timedelta(hours=random.randint(1, 3))  # Check-out is 1-3 hours after check-in
    return check_in_time, check_out_time

# Constants for generating entries
client_ids = range(1, 21)  # Client IDs from 1 to 20
facility_ids = [10000, 20000, 30000, 40000, 50000]  # Example Facility IDs
start_date = datetime(2024, 11, 1)
end_date = datetime(2024, 11, 30)

# Prepare the SQL statements
sql_statements = []
attendance_id = 10001011  # Starting Attendance_ID
days_range = [start_date + timedelta(days=x) for x in range((end_date - start_date).days + 1)]  # List of all days in the range

for client_id in client_ids:
    # Determine a random number of entries between 14 and 22
    num_entries = random.randint(14, 22)

    # Create a set to store unique dates for this client
    used_dates = set()

    for _ in range(num_entries):
        # Generate a random date
        random_date = random.choice(days_range)

        # Ensure the date is unique for this client
        while random_date in used_dates:
            random_date = random.choice(days_range)

        used_dates.add(random_date)

        # Randomize check-in and check-out times for this day
        check_in, check_out = random_daily_check_in_and_out(random_date)

        # Randomize Facility_ID
        facility_id = random.choice(facility_ids)

        
        # Generate the SQL statement
        sql = f"""
INSERT INTO Gym_Attendance (Attendance_ID, Client_ID, Check_in, Check_out, Facility_ID) VALUES ({attendance_id}, {str(client_id).zfill(8)}, TO_TIMESTAMP('{check_in.strftime('%Y-%m-%d %H:%M:%S.%f')}', 'YYYY-MM-DD HH24:MI:SS.FF'), TO_TIMESTAMP('{check_out.strftime('%Y-%m-%d %H:%M:%S.%f')}', 'YYYY-MM-DD HH24:MI:SS.FF'), {str(facility_id).zfill(8)});
"""
        sql_statements.append(sql.strip())
        attendance_id += 1  # Increment Attendance_ID

# Save to a file or print
print("\n".join(sql_statements))

print(f"Generated {len(sql_statements)} SQL insert statements.")
