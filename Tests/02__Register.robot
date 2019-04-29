*** Settings ***
Test Setup        Go To Home Page
Test Teardown     Close Browser
Resource          resource.robot

*** Test Cases ***
Verify Register page contents
    Click Link    ${REGISTER_LINK}
    Title Should Be    ${REGISTER_PAGE_TITLE}
    Page Should Contain    ${APP_NAME}
    Page Should Contain    ${REGISTER_PAGE_SUBHEADER}
    Page Should Contain Element    id:${USERNAME_INPUT__ID}
    Page Should Contain Element    id:${PASSWORD_INPUT_ID}
    Page Should Contain Element    id:${FIRSTNAME_INPUT_ID}
    Page Should Contain Element    id:${LASTNAME_INPUT_ID}
    Page Should Contain Element    id:${PHONE_INPUT_ID}
    Page Should Contain Button    ${REGISTER_BUTTON_TEXT}

Verify that a user can register successfully with all mandatory fields and redirect to login page
    Try Register User    username=tom    password=password    firstname=Tom    lastname=Kane    phonenumber=358501212121
    #Once user is succesfully registered, test app navigates to login page
    Page Should Contain Button    ${LOGIN_BUTTON_TEXT}

Verify user cannot register with an already registered username and proper informational message is shown to user
    [Setup]    Try Register User In New Instance Of Browser    username=sam    password=password    firstname=Sam    lastname=Kane    phonenumber=358501212122
    Try Register User    username=sam    password=password    firstname=Sam    lastname=Kane    phonenumber=358501212122
    Page Should Contain    User sam is already registered

Verify that user cannot proceed without filling mandatory field on register page
    Click Link    ${REGISTER_LINK}
    Input Text    ${USERNAME_INPUT__ID}    sam
    Input Text    ${FIRSTNAME_INPUT_ID}    Sam
    Input Text    ${LASTNAME_INPUT_ID}    Kaine
    Input Text    ${PHONE_INPUT_ID}    358501212122
    Click Button    ${REGISTER_BUTTON_TEXT}
    #Couldn't find a way to get the input validation message using Selenium. TODO investigate solution in https://stackoverflow.com/questions/52029267/how-to-get-html5-validation-message-with-selenium/52030901
    sleep    2s
    Page Should Contain Button    ${REGISTER_BUTTON_TEXT}
