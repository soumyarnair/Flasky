*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${SERVER}         http://127.0.0.1:5000    # Flasky local server address
${DELAY}          0
${HOME_PAGE_TITLE}    index page - Demo App
${REGISTER_PAGE_TITLE}    Register - Demo App
${LOGIN_PAGE_TITLE}    Log In - Demo App
${REGISTER_LINK}    /register
${LOGIN_LINK}     /login
${REGISTER_BUTTON_TEXT}    Register
${LOGIN_BUTTON_TEXT}    Log In
${APP_NAME}       Demo app
${HOME_PAGE_SUBHEADER}    index page
${REGISTER_PAGE_SUBHEADER}    Register
${LOGIN_PAGE_SUBHEADER}    Log In
${USERNAME_INPUT_ID}    username
${PASSWORD_INPUT_ID}    password
${FIRSTNAME_INPUT_ID}    firstname
${LASTNAME_INPUT_ID}    lastname
${PHONE_INPUT_ID}    phone
${USER_INFORMATION_TEXT}    User Information
${LOGIN_FAILURE_TEXT}    Login Failure
${ERROR_MESSAGE_TEXT}    You provided incorrect login details

*** Keywords ***
Go To Home Page
    Open Browser    ${SERVER}    ${BROWSER}

Try Register User
    [Arguments]    ${username}    ${password}    ${firstname}    ${lastname}    ${phonenumber}
    Click Link    ${REGISTER_LINK}
    Input Text    ${USERNAME_INPUT__ID}    ${username}
    Input Password    ${PASSWORD_INPUT_ID}    ${password}
    Input Text    ${FIRSTNAME_INPUT_ID}    ${firstname}
    Input Text    ${LASTNAME_INPUT_ID}    ${lastname}
    Input Text    ${PHONE_INPUT_ID}    ${phonenumber}
    Click Button    ${REGISTER_BUTTON_TEXT}

Try Register User In New Instance Of Browser
    [Arguments]    ${username}    ${password}    ${firstname}    ${lastname}    ${phonenumber}
    Go To Home Page
    Try Register User    ${username}    ${password}    ${firstname}    ${lastname}    ${phonenumber}
