
mysql> create database Task8;
Query OK, 1 row affected (0.07 sec)

mysql> use Task8;
Database changed
mysql> CREATE DATABASE CompanyDB;
Query OK, 1 row affected (0.01 sec)

mysql> USE CompanyDB;
Database changed
mysql>
mysql> CREATE TABLE Employees (
    ->     EmpID INT AUTO_INCREMENT PRIMARY KEY,
    ->     Name VARCHAR(100),
    ->     Salary DECIMAL(10,2)
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql>
mysql> INSERT INTO Employees (Name, Salary) VALUES
    -> ('Alice', 50000),
    -> ('Bob', 60000),
    -> ('Charlie', 55000);
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> DELIMITER //
mysql>
mysql> CREATE PROCEDURE IncreaseSalary(
    ->     IN emp_id INT,
    ->     IN percent DECIMAL(5,2)
    -> )
    -> BEGIN
    ->     UPDATE Employees
    ->     SET Salary = Salary + (Salary * percent / 100)
    ->     WHERE EmpID = emp_id;
    -> END //
Query OK, 0 rows affected (0.05 sec)

mysql>
mysql> DELIMITER ;
mysql> CALL IncreaseSalary(1, 10); -- Increases Alice’s salary by 10%
Query OK, 1 row affected (0.02 sec)

mysql> DELIMITER //
mysql>
mysql> CREATE FUNCTION GetAnnualSalary(emp_id INT)
    -> RETURNS DECIMAL(10,2)
    -> DETERMINISTIC
    -> BEGIN
    ->     DECLARE annual_salary DECIMAL(10,2);
    ->     SELECT Salary * 12 INTO annual_salary
    ->     FROM Employees
    ->     WHERE EmpID = emp_id;
    ->     RETURN annual_salary;
    -> END //
Query OK, 0 rows affected (0.01 sec)

mysql>
mysql> DELIMITER ;
mysql> SELECT GetAnnualSalary(2) AS AnnualSalary; -- Bob’s annual salary
+--------------+
| AnnualSalary |
+--------------+
|    720000.00 |
+--------------+
1 row in set (0.01 sec)