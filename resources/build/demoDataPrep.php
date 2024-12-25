<?php
/*
Gibbon, Flexible & Open School System
Copyright (C) 2010, Ross Parker

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program. If not, see <http://www.gnu.org/licenses/>.
*/

//BEFORE RUNNING THIS SCRIPT, PLACE IT IN absolutePath/tests
// Setup to run
require_once __DIR__.'/../../gibbon.php';

if (empty($connection2)) {
    die('Your request failed due to a database error.');
}

$tables = [
    'gibbonActivity' => '',
    'gibbonActivitySlot' => '',
    'gibbonActivityStaff' => '',
    'gibbonCourse' => '',
    'gibbonCourseClass' => '',
    'gibbonCourseClassPerson' => '',
    'gibbonDepartment' => '',
    'gibbonDepartmentStaff' => '',
    'gibbonFamily' => '',
    'gibbonFamilyAdult' => '',
    'gibbonFamilyChild' => '',
    'gibbonFinanceFeeCategory' => '--where="gibbonFinanceFeeCategoryID>1"',
    'gibbonHouse' => '',
    'gibbonLibraryItem' => '',
    'gibbonOutcome' => '',
    'gibbonPerson' => '--where="gibbonPersonID>1"',
    'gibbonPlannerEntry' => '',
    'gibbonResource' => '',
    'gibbonResourceTag' => '',
    'gibbonFormGroup' => '',
    'gibbonRubric' => '',
    'gibbonRubricCell' => '',
    'gibbonRubricColumn' => '',
    'gibbonRubricRow' => '',
    'gibbonSpace' => '',
    'gibbonStaff' => '--where="gibbonStaffID>1"',
    'gibbonStudentEnrolment' => '',
    'gibbonTT' => '',
    'gibbonTTColumn' => '',
    'gibbonTTColumnRow' => '',
    'gibbonTTDay' => '',
    'gibbonTTDayDate' => '',
    'gibbonTTDayRowClass' => '',
    'gibbonTTDayRowClassException' => '',
    'gibbonUnit' => '',
    'gibbonUnitBlock' => '',
    'gibbonUnitClass' => '',
    'gibbonUnitClassBlock' => '',
    'gibbonSchoolYear' => '',
    'gibbonSchoolYearTerm' => '',
    'gibbonSchoolYearSpecialDay' => '',
];

$config = $gibbon->getConfig();
$filename = 'gibbon_demo.sql';

if (!file_exists($filename)) {
    touch($filename);
}

if (!is_writable($filename)) {
    die('File is not writeable!');
}

if (!$file = fopen($filename, 'w')) {
    die('Cannot open file');
}

$tableCount = $lineCount = 0;
foreach ($tables as $table => $where) {
    $output = [];

    exec("/Applications/MAMP/Library/bin/mysqldump --compact --skip-opt --comments --no-create-info --no-create-db --complete-insert --extended-insert -u{$config['databaseUsername']} -p{$config['databasePassword']} {$config['databaseName']} {$table} {$where}", $output);
    
    foreach ($output as $line) {
        $line = str_replace([') VALUES (', '),(0'], [")\r\nVALUES\r\n    (", "),\r\n    (0"], $line)."\r\n";
        fwrite($file, $line);
        $lineCount++;
    }

    $tableCount++;
}

fclose($file);

echo "Success! Processed {$tableCount} tables and {$lineCount} lines into {$filename}";

