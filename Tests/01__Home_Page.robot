*** Settings ***
Test Setup        Go To Home Page
Test Teardown     Close Browser
Resource          resource.robot

*** Test Cases ***
Verify home page content
    Title Should Be    ${HOME_PAGE_TITLE}
    Page Should Contain    ${APP_NAME}
    Page Should Contain    ${HOME_PAGE_SUBHEADER}
    Page Should Contain Link    ${REGISTER_LINK}
    Page Should Contain Link    ${LOGIN_LINK}

Verify that user can navigate to Register page
    Click Link    ${REGISTER_LINK}
    Title Should Be    ${REGISTER_PAGE_TITLE}
    Page Should Contain    ${APP_NAME}
    Page Should Contain    ${REGISTER_PAGE_SUBHEADER}

Verify that user can navigate to Login page
    Click Link    ${LOGIN_LINK}
    Title Should Be    ${LOGIN_PAGE_TITLE}
    Page Should Contain    ${APP_NAME}
    Page Should Contain    ${LOGIN_PAGE_SUBHEADER}
