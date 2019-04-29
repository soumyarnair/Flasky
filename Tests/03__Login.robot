*** Settings ***
Test Setup        Go To Home Page
Test Teardown     Close Browser
Resource          resource.robot

*** Test Cases ***
Verify login page contents
    Click Link    ${LOGIN_LINK}
    Title Should Be    ${LOGIN_PAGE_TITLE}
    Page Should Contain    ${APP_NAME}
    Page Should Contain    ${LOGIN_PAGE_SUBHEADER}
    Page Should Contain Element    id:${USERNAME_INPUT__ID}
    Page Should Contain Element    id:${PASSWORD_INPUT_ID}
    Page Should Contain Button    ${LOGIN_BUTTON_TEXT}

Verify that user can login successfully with valid credentials
    [Setup]    Try Register User In New Instance Of Browser    username=katie    password=password    firstname=Katie    lastname=Kane    phonenumber=358501212122
    Input Text    ${USERNAME_INPUT__ID}    katie
    Input Password    ${PASSWORD_INPUT_ID}    password
    Click Button    ${LOGIN_BUTTON_TEXT}
    Page Should Contain    ${USER_INFORMATION_TEXT}

Verify that user cannot login with invalid credentials
    Click Link    ${LOGIN_LINK}
    Input Text    ${USERNAME_INPUT__ID}    Soumya
    Input Password    ${PASSWORD_INPUT_ID}    Soumya
    Click Button    ${LOGIN_BUTTON_TEXT}
    Set Selenium Speed    ${DELAY}
    Page Should Contain    ${APP_NAME}
    Page Should Contain    ${LOGIN_FAILURE_TEXT}
    Page Should Contain    ${ERROR_MESSAGE_TEXT}
