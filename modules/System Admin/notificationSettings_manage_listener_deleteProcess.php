<?php
/*
Gibbon: the flexible, open school platform
Founded by Ross Parker at ICHK Secondary. Built by Ross Parker, Sandra Kuipers and the Gibbon community (https://gibbonedu.org/about/)
Copyright © 2010, Gibbon Foundation
Gibbon™, Gibbon Education Ltd. (Hong Kong)

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

use Gibbon\Domain\System\NotificationGateway;

include '../../gibbon.php';

$gibbonNotificationEventID = $_GET['gibbonNotificationEventID'] ?? null;
$gibbonNotificationListenerID = $_GET['gibbonNotificationListenerID'] ?? null;
$URL = $session->get('absoluteURL').'/index.php?q=/modules/'.getModuleName($_GET['address'])."/notificationSettings_manage_edit.php&gibbonNotificationEventID=".$gibbonNotificationEventID;

if (isActionAccessible($guid, $connection2, '/modules/System Admin/notificationSettings_manage_edit.php') == false) {
    $URL .= '&return=error0';
    header("Location: {$URL}");
    exit;
} else {
    //Proceed!
    if (empty($gibbonNotificationEventID) || empty($gibbonNotificationListenerID)) {
        $URL .= '&return=error1';
        header("Location: {$URL}");
        exit;
    } else {
        $gateway = new NotificationGateway($pdo);

        $result = $gateway->selectNotificationListener($gibbonNotificationListenerID);
        if ($result->rowCount() != 1) {
            $URL .= '&return=error1';
            header("Location: {$URL}");
            exit;
        }

        $result = $gateway->deleteNotificationListener($gibbonNotificationListenerID);

        $URL .= '&return=success0';
        header("Location: {$URL}");
        exit;
    }
}