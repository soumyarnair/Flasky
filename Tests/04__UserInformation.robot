*** Settings ***
Test Teardown     Close Browser
Resource          resource.robot

*** Test Cases ***
Verify user can review her user information from the main view
    [Setup]    Try Register User In New Instance Of Browser    username=tim    password=password    firstname=Tim    lastname=Kane    phonenumber=358501212122
    Input Text    ${USERNAME_INPUT__ID}    tim
    Input Password    ${PASSWORD_INPUT_ID}    password
    Click Button    ${LOGIN_BUTTON_TEXT}
    Page Should Contain    ${USER_INFORMATION_TEXT}
    Table Cell Should Contain    id:content    2    2    tim    INFO
    Table Cell Should Contain    id:content    3    2    Tim    INFO
    Table Cell Should Contain    id:content    4    2    Kane    INFO
    Table Cell Should Contain    id:content    5    2    358501212122    INFO
