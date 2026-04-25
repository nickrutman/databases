-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema university
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `university` DEFAULT CHARACTER SET utf8mb3 ;
USE `university` ;

-- -----------------------------------------------------
-- Table `university`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`department` (
  `department_id` INT NOT NULL,
  `college` VARCHAR(45) NULL DEFAULT NULL,
  `department` VARCHAR(45) NULL DEFAULT NULL,
  `department_code` VARCHAR(5) NULL DEFAULT NULL,
  PRIMARY KEY (`department_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `university`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`course` (
  `course_id` INT NOT NULL,
  `course` VARCHAR(45) NULL DEFAULT NULL,
  `course_num` INT NULL DEFAULT NULL,
  `course_title` VARCHAR(45) NULL DEFAULT NULL,
  `credits` INT NULL DEFAULT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`course_id`),
  INDEX `fk_course_department1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_department1`
    FOREIGN KEY (`department_id`)
    REFERENCES `university`.`department` (`department_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `university`.`term`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`term` (
  `term_id` INT NOT NULL,
  `year` YEAR NULL DEFAULT NULL,
  `term` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`term_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `university`.`section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`section` (
  `section_id` INT NOT NULL,
  `section` VARCHAR(45) NULL DEFAULT NULL,
  `capacity` INT NULL DEFAULT NULL,
  `course_id` INT NOT NULL,
  `term_id` INT NOT NULL,
  PRIMARY KEY (`section_id`),
  INDEX `fk_section_course1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_section_term1_idx` (`term_id` ASC) VISIBLE,
  CONSTRAINT `fk_section_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `university`.`course` (`course_id`),
  CONSTRAINT `fk_section_term1`
    FOREIGN KEY (`term_id`)
    REFERENCES `university`.`term` (`term_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `university`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`student` (
  `student_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `gender` ENUM('M', 'F') NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `state` CHAR(2) NULL DEFAULT NULL,
  `birthdate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`student_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `university`.`enrollment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`enrollment` (
  `student_id` INT NOT NULL,
  `section_id` INT NOT NULL,
  PRIMARY KEY (`student_id`, `section_id`),
  INDEX `fk_student_has_section_section1_idx` (`section_id` ASC) VISIBLE,
  INDEX `fk_student_has_section_student1_idx` (`student_id` ASC) VISIBLE,
  CONSTRAINT `fk_student_has_section_section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `university`.`section` (`section_id`),
  CONSTRAINT `fk_student_has_section_student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `university`.`student` (`student_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `university`.`faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`faculty` (
  `faculty_id` INT NOT NULL,
  `faculty_fname` VARCHAR(45) NULL DEFAULT NULL,
  `faculty_lname` VARCHAR(45) NULL DEFAULT NULL,
  `course_id` INT NOT NULL,
  PRIMARY KEY (`faculty_id`),
  INDEX `fk_faculty_course1_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `fk_faculty_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `university`.`course` (`course_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `university`.`faculty_section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `university`.`faculty_section` (
  `section_id` INT NOT NULL,
  `faculty_id` INT NOT NULL,
  PRIMARY KEY (`section_id`, `faculty_id`),
  INDEX `fk_section_has_faculty_faculty1_idx` (`faculty_id` ASC) VISIBLE,
  INDEX `fk_section_has_faculty_section1_idx` (`section_id` ASC) VISIBLE,
  CONSTRAINT `fk_section_has_faculty_section1`
    FOREIGN KEY (`section_id`)
    REFERENCES `university`.`section` (`section_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_has_faculty_faculty1`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `university`.`faculty` (`faculty_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

insert department values
(1, 'College of Physical Science and Engineering', 'Computer Information Technology', 'ITM'),
(2, 'College of Business and Communication', 'Economics', 'ECON'),
(3, 'College of Language and Letters', 'Humanities and Philosophy', 'HUM');

insert course values
(1, 'ITM 111', 111, 'Intro to Databases', 3, 1),
(2, 'ECON 388', 388, 'Econometrics', 4, 2),
(3, 'ECON 150', 150, 'Micro Economics', 3, 2),
(4, 'HUM 376', 376, 'Classical Heritage', 2, 3);

insert student values
(1, 'Paul', 'Miller', 'M', 'Dallas', 'TX', '1996-02-22'),
(2, 'Katie', 'Smith', 'F', 'Provo', 'UT', '1995-07-22'),
(3, 'Kelly', 'Jones', 'F', 'Provo', 'UT', '1998-06-22'),
(4, 'Devon', 'Merrill', 'M', 'Mesa', 'AZ', '2000-07-22'),
(5, 'Mandy', 'Murdock', 'F', 'Topeka', 'KS', '1996-11-22'),
(6, 'Alece', 'Adams', 'F', 'Rigby', 'ID', '1997-05-22'),
(7, 'Bryce', 'Carlson', 'M', 'Bozeman', 'MT', '1997-11-22'),
(8, 'Preston', 'Larsen', 'M', 'Decatur', 'TN', '1996-09-22'),
(9, 'Julia', 'Madsen', 'F', 'Rexburg', 'ID', '1998-09-22'),
(10,  'Susan', 'Sorensen', 'F', 'Mesa', 'AZ', '1998-08-09');

insert faculty values
(1, 'Marty', 'Morring', 1),
(2, 'Nate', 'Norris', 3),
(3, 'Ben', 'Barrus', 2),
(4, 'John', 'Jensen', 4),
(5, 'Bill', 'Barney', 1);

insert term values
(1, 2019, 'Fall'),
(2, 2018, 'Winter');

insert section values
(1, 1, 30, 1, 1), -- ITM 111 Section 1 Fall
(2, 2, 30, 1, 2), -- ITM 111 Section 2 Winter
(3, 3, 35, 1, 2), -- ITM 111 Section 3 Winter
(4, 1, 50, 3, 1), -- ECON 150 Section 1 Fall
(5, 2, 50, 3, 1), -- ECON 150 Section 2 Fall
(6, 1, 50, 3, 2), -- ECON 150 Section 1 Winter
(7, 2, 50, 3, 2), -- ECON 150 Section 2 Winter
(8, 1, 35, 2, 1), -- ECON 388 Section 1 Fall
(9, 1, 30, 4, 1), -- HUM 376 Section 1 Fall
(10, 1, 30, 4, 2); -- HUM 376 Section 1 Winter

insert faculty_section values
(1,1),
(2,1),
(3,5),
(4,2),
(5,2),
(6,2),
(7,2),
(8,3),
(9,4),
(10,4);

insert enrollment values
(6,3),
(7,2),
(7,6),
(7,10),
(4,9),
(9,7),
(2,8),
(3,8),
(5,8),
(5,9),
(1,1),
(1,5),
(8,7),
(10,2);

-- 1. Students, and their birthdays, of students born in September. Format the date to look like it is shown in the result set. Sort by the student's last name.
use university;
select first_name as 'fname', last_name as 'lname', date_format(birthdate, '%M %d, %Y') as 'Sept Birthdays'
from student
where month(birthdate) = 9
order by last_name;

-- 2. Student's age in years and days as of Jan. 5, 2017. Sorted from oldest to youngest. (You can assume a 365 day year and ignore leap day.) Hint: Use modulus for days left over after years. The 5th column is just the 3rd and 4th column combined with labels.
select last_name as 'fname', first_name as 'lname', 
 FLOOR(DATEDIFF('2017-01-05', birthdate) / 365) AS Years,
  MOD(DATEDIFF('2017-01-05', birthdate), 365) AS Days,
  CONCAT(
    FLOOR(DATEDIFF('2017-01-05', birthdate) / 365), ' - years ', 
    MOD(DATEDIFF('2017-01-05', birthdate), 365), ' - days'
  ) AS 'Years and Days'
  from student
  order by years desc, days desc;
  
  -- 3. Students taught by John Jensen. Sorted by student's last name
  select s.first_name as 'fname', s.last_name as 'lname'
  from student s
  left join enrollment e
  on s.student_id = e.student_id
  left join section se
  on e.section_id = se.section_id
  left join faculty f
  on se.course_id = f.course_id
  where f.faculty_lname = 'Jensen'
  order by s.last_name asc;
  
  -- 4. Instructors Bryce will have in Winter 2018. Sort by the faculty's last name.
  select distinct f.faculty_fname as 'fname', f.faculty_lname as 'lname'
  from student s
  join enrollment e
  on s.student_id = e.student_id
  join section se
  on e.section_id = se.section_id
  join faculty_section fs
  on se.section_id = fs.section_id
  join faculty f
  on fs.faculty_id = f.faculty_id
  join term t
  on se.term_id = t.term_id
  where s.first_name = 'Bryce' and t.term = 'Winter' and t.year = 2018
  order by f.faculty_lname asc;
  
  -- 5. Students that take Econometrics in Fall 2019. Sort by student last name.
  select s.first_name as 'fname', s.last_name as 'lname'
  from student s
  join enrollment e
  on s.student_id = e.student_id
  join section se
  on e.section_id = se.section_id
  join course c
  on se.course_id = c.course_id
  join term t
  on se.term_id = t.term_id
  where c.course_id = 2 and t.term = 'Fall' and t.year = '2019'
  order by s.last_name asc;
  
  -- 6. Report showing all of Bryce Carlson's courses for Winter 2018. Sort by the name of the course.
  select d.department_code, c.course_num, c.course_title as 'name'
  from student s
   join enrollment e
  on s.student_id = e.student_id
  join section se
  on e.section_id = se.section_id
  join course c
  on se.course_id = c.course_id
  join term t
  on se.term_id = t.term_id
  join department d
  on c.department_id = d.department_id
  where s.first_name = 'Bryce' and t.term_id = 2
  order by c.course_title;
  
  -- 7. The number of students enrolled for Fall 2019
  select t.term, t.year, count(s.first_name) as 'Enrollment'
  from student s
    join enrollment e
  on s.student_id = e.student_id
  join section se
  on e.section_id = se.section_id
  join term t
  on se.term_id = t.term_id
  where t.term_id = 1;
  
  -- 8. The number of courses in each college. Sort by college name.
  select distinct d.college as 'Colleges', count(c.course) as 'Courses'
  from department d
  join course c
  on d.department_id = c.department_id
  group by d.college
  order by d.college asc;
  
  -- 9. The total number of students each professor can teach in Winter 2018. Sort by that total number of students (teaching capacity).
  select f.faculty_fname as 'fname', f.faculty_lname as 'lname', sum(se.capacity) as 'TeachingCapacity'
  from faculty f
  join faculty_section fs
  on f.faculty_id = fs.faculty_id
  join section se
  on fs.section_id = se.section_id
  join term t
  on se.term_id = t.term_id
  where t.term_id = 2
  group by f.faculty_id, t.term
  order by sum(se.capacity);
  
  -- 10. Each student's total credit load for Fall 2019, but only students with a credit load greater than three.  Sort by credit load in descending order. 
  select s.last_name as 'lname', s.first_name as 'fname', sum(c.credits) as 'Credits'
  from student s
  join enrollment e
  on s.student_id = e.student_id
  join section se
  on e.section_id = se.section_id
  join term t
  on se.term_id = t.term_id
  join course c
  on se.course_id = c.course_id
  where t.term_id = 1
  group by s.student_id, s.last_name, s.first_name
  having sum(c.credits) > 3
  order by Credits desc;