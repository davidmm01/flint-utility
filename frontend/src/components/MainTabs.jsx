import React from 'react';

import Averages from './Averages';
import Ladder from './Ladder';
import Records from './Records';
import Tab from 'react-bootstrap/Tab';
import Tabs from 'react-bootstrap/Tabs';

const MainTabs = () => {
    return (
        <Tabs defaultActiveKey="profile" id="uncontrolled-tab-example">
            <Tab eventKey="averages" title="Averages">
                <Averages />
            </Tab>
            <Tab eventKey="ladder" title="Ladder">
                <Ladder />
            </Tab>
            <Tab eventKey="records" title="Records">
                <Records />
            </Tab>
        </Tabs>
    )
}

export default MainTabs
