/****************************************************************************
**
** Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies).
** All rights reserved.
** Contact: Nokia Corporation (qt-info@nokia.com)
**
** This file is part of the Qt Components project on Qt Labs.
**
** No Commercial Usage
** This file contains pre-release code and may not be distributed.
** You may use this file in accordance with the terms and conditions contained
** in the Technology Preview License Agreement accompanying this package.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** If you have questions regarding the use of this file, please contact
** Nokia at qt-info@nokia.com.
**
****************************************************************************/

import QtQuick 1.0
import "ButtonGroup.js" as Engine

Row {
    id: root

    // Common public API
    property bool exclusive: true
    property Item checkedButton

    property int privateDirection: Qt.Horizontal

    function privateGraphicsName(button, buttonType) {
        var siblingButtons = Engine.visibleItems(root)
        var imageName

        if (siblingButtons.length > 1) {
            if (buttonType == 0)
                imageName = "qtg_fr_pushbutton_segmented"
            else if (buttonType == 1)
                imageName = "qtg_fr_toolbutton_segmented"

            if (button === siblingButtons[0])
                imageName += "_l_"
            else if (button === siblingButtons[siblingButtons.length - 1])
                imageName += "_r_"
            else
                imageName += "_c_"

            return imageName
        }

        if (buttonType == 0)
            imageName = "qtg_fr_pushbutton_"
        else if (buttonType == 1)
            imageName = "qtg_fr_toolbutton_"

        return imageName
    }

    function privateModeName(button, buttonType) {
        var siblingButtons = Engine.visibleItems(root)
        if (!button.enabled)
            return "disabled"
        else if (button.checked && siblingButtons.length > 1)
            return "latched"
        else
            return "normal"
    }

    Component.onCompleted: Engine.create(root)

    Component.onDestruction: Engine.destroy()
}
