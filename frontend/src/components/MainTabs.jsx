import React from 'react'
import Tab from 'react-bootstrap/Tab'
import Tabs from 'react-bootstrap/Tabs'
import Averages from './Averages';

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
