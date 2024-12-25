-- Update school year dates
UPDATE gibbonSchoolYear SET name=CONCAT(LEFT(name, 4)+1, '-', RIGHT(name, 4)+1) WHERE status='Upcoming';
UPDATE gibbonSchoolYear SET name=CONCAT(LEFT(name, 4)+1, '-', RIGHT(name, 4)+1) WHERE status='Current';
UPDATE gibbonSchoolYear SET firstDay = DATE(firstDay + INTERVAL (1 - DAYOFWEEK(firstDay)) DAY + INTERVAL 1 YEAR), lastDay = DATE_ADD(lastDay, INTERVAL 1 YEAR);

-- Update term dates
UPDATE gibbonSchoolYearTerm SET firstDay = DATE(firstDay + INTERVAL (1 - DAYOFWEEK(firstDay)) DAY + INTERVAL 1 YEAR), lastDay = DATE(lastDay + INTERVAL (7 - DAYOFWEEK(lastDay)) DAY + INTERVAL 1 YEAR);
UPDATE gibbonSchoolYearTerm JOIN gibbonSchoolYear ON (gibbonSchoolYear.gibbonSchoolYearID=gibbonSchoolYearTerm.gibbonSchoolYearID) SET gibbonSchoolYearTerm.firstDay=gibbonSchoolYear.firstDay WHERE gibbonSchoolYearTerm.nameShort='T1';
UPDATE gibbonSchoolYearTerm JOIN gibbonSchoolYear ON (gibbonSchoolYear.gibbonSchoolYearID=gibbonSchoolYearTerm.gibbonSchoolYearID) SET gibbonSchoolYearTerm.lastDay=gibbonSchoolYear.lastDay WHERE gibbonSchoolYearTerm.nameShort='T3';

-- Update timetable day dates
UPDATE gibbonTTDayDate SET date=date + INTERVAL (DAYOFWEEK(date) - DAYOFWEEK(date + INTERVAL 1 YEAR)) DAY + INTERVAL 1 YEAR;

-- Update planner entry dates
UPDATE gibbonPlannerEntry SET date=date + INTERVAL (DAYOFWEEK(date) - DAYOFWEEK(date + INTERVAL 1 YEAR)) DAY + INTERVAL 1 YEAR;


