/*
 * Copyright (C) 2016 Anselmo L. S. Melo <anselmolsm@gmail.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick
import QtQuick.Layouts
import org.kde.plasma.components as PlasmaComponents
import org.kde.plasma.workspace.calendar as PlasmaCalendar

PlasmaComponents.Label {
  id: label

  property string prefix: plasmoid.configuration.customPrefix

  PlasmaCalendar.Calendar {
    id: calendarBackend
  }

  Timer {
    interval: 60000  // Update every minute
    running: true
    repeat: true
    onTriggered: label.text = label.prefix + label.currentWeek()
  }

  horizontalAlignment: Text.AlignHCenter
  verticalAlignment: Text.AlignVCenter
  text: label.prefix + label.currentWeek()

  function currentWeek() {
    // Sunday & First 4-day week == ISO-8601, which is followed by Qt
    let week = calendarBackend.currentWeek();

    if (plasmoid.configuration.firstWeekOfYearIndex === 1) {
      // Check if January 1st is after Wednesday.
      const date = new Date();
      const janFirst = new Date(date.getFullYear(), 0, 1); // January is 0 in JS
      const janFirstDayOfWeek = janFirst.getDay();
      // Wednesday == 3, week starting on Sunday
      if (janFirstDayOfWeek > 3)
        week = week + 1;
    }
    return week < 10 ? "0" + week : week
  }

  Layout.minimumWidth: 50
}
