import csv
import random

# Define lists for data generation
events = ['decision', 'skip', 'transfer']
languages = ['English', 'Arabic', 'Persian', 'Hindi', 'French', 'Italian']
orgs = ['A', 'B', 'C', 'D']
dates = [f'2020/11/{str(day).zfill(2)}' for day in range(1, 31)]

# Generate the CSV file
with open('job_data_5000.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(['job_id', 'actor_id', 'event', 'language', 'time_spent', 'org', 'ds'])
    
    for i in range(5000):
        job_id = i + 1
        actor_id = random.randint(1001, 1050)
        event = random.choice(events)
        language = random.choice(languages)
        time_spent = random.randint(10, 120)
        org = random.choice(orgs)
        ds = random.choice(dates)
        writer.writerow([job_id, actor_id, event, language, time_spent, org, ds])

print("Data generation complete. File 'job_data_5000.csv' created.")
