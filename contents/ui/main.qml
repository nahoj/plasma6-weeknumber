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
import org.kde.plasma.plasmoid

PlasmoidItem {
    id: root
    
    // In Plasma 6, we need to import the components from the same directory explicitly
    Component {
        id: compactRepComponent
        CompactRepresentation {}
    }
    
    compactRepresentation: compactRepComponent
    fullRepresentation: compactRepComponent
}
