import React from 'react'

import Averages from './Averages';
import Tab from 'react-bootstrap/Tab'
import Tabs from 'react-bootstrap/Tabs'

const MainTabs = () => {
    return (
        <Tabs defaultActiveKey="profile" id="uncontrolled-tab-example">
            <Tab eventKey="averages" title="Averages">
                <Averages />
            </Tab>
            <Tab eventKey="records" title="Records">
                TWO
            </Tab>
        </Tabs>
    )
}

export default MainTabs
