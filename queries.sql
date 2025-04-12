-- View all departments
SELECT * FROM department;

-- View all roles
SELECT role.id, role.title, role.salary, department.name AS department 
FROM role 
JOIN department ON role.department_id = department.id;

-- View all employees
SELECT e.id, e.first_name, e.last_name, role.title, department.name AS department, role.salary, 
       COALESCE(m.first_name || ' ' || m.last_name, 'None') AS manager 
FROM employee e
JOIN role ON e.role_id = role.id
JOIN department ON role.department_id = department.id
LEFT JOIN employee m ON e.manager_id = m.id;

-- Add a department
INSERT INTO department (name) VALUES ($1);

-- Add a role
INSERT INTO role (title, salary, department_id) VALUES ($1, $2, $3);

-- Add an employee
INSERT INTO employee (first_name, last_name, role_id, manager_id) VALUES ($1, $2, $3, $4);

-- Update an employee role
UPDATE employee SET role_id = $1 WHERE id = $2;
