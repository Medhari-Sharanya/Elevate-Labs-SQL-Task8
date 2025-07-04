# Elevate-Labs-SQL-Task8

# Task 8: Stored Procedures and Functions

## 🎯 Objective
Learn to create reusable SQL blocks using stored procedures and functions in MySQL.

## 🛠 Tools Used
- MySQL Workbench / DB Browser for SQLite (using MySQL syntax)
- GitHub for submission

## 🗃️ Database Schema

**Database Name:** `CompanyDB`

**Table:** `Employees`

| Column  | Type         |
|---------|--------------|
| EmpID   | INT (PK, Auto Increment) |
| Name    | VARCHAR(100) |
| Salary  | DECIMAL(10,2)|

## 📌 What I Did

1. **Created Table:** `Employees` with sample data.
2. **Stored Procedure:** `IncreaseSalary` - Increases salary of an employee by given percentage.
3. **Stored Function:** `GetAnnualSalary` - Returns annual salary (Salary × 12) for an employee.
4. **Tested both** using `CALL` and `SELECT`.

## 💡 Usage

### Call Stored Procedure
```sql
CALL IncreaseSalary(1, 10);
