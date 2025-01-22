# Construction--equipment-Tracking
A project to track construction equipment usage and costs.

Project Overview:
This project is designed to manage and analyse construction equipment data, including tracking usage, costs, and maintenance. The goal is to provide insights into equipment utilisation and expenses to optimise operational efficiency.

Features:

1) Database Schema: A relational database to track equipment, usage, and costs.

2) Data Analysis Queries: Advanced SQL queries for insights such as:

2.1) Most expensive equipment to maintain.

2.2) Total usage hours for each piece of equipment.

2.3) Cost breakdown by month and type.



Database Schema

Tables:

1) Equipment

Tracks details about construction equipment.

Columns: equipment_id, equipment_name, equipment_type, purchase_date, initial_cost.

2) Usage

Records the usage hours for each piece of equipment.

Columns: usage_id, equipment_id, start_time, end_time, hours_used.

3) Cost

Logs various costs associated with equipment.

Columns: cost_id, equipment_id, cost_type, cost_amount, date_incurred.
