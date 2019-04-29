## Instructions to build/run demo app test application

Robot framework is used as the test automation framework and web testing library used is SeleniumLibrary. IDE used for writing and running tests is RIDE. To run the test scripts, follow the instructions below

- checkout the test automation code from https://github.com/soumyarnair/Flasky-TA to folder of your choice ( eg: C:\CRF\Flasky-TA)
- Install robot framework using command 'pip install robotframework', make sure robot is installed using command 'robot --version' in command line
- Install seleniumlibrary using command 'pip install --upgrade robotframework-seleniumlibrary'
- Install RIDE (Test data editor for Robot Framework) using command 'pip install --upgrade robotframework-ride'
- Install chrome driver from http://chromedriver.chromium.org/downloads for the matching chrome browser installed.
- Install geckodriver from https://github.com/mozilla/geckodriver/releases for the matching firefox browser installed

Automated test cases can run using following methods. User is expected to specify the browser to which tests to be executed 

- Using RIDE
	- Open directory where test files are present in RIDE using File -> Open Directory
	- Specify argument  --variable BROWSER:chrome and run tests (For tests to be run in firefox, --variable BROWSER:firefox has to be passed as argument)

- Use robot command in command line 
	- open command line and run  'robot --variable BROWSER:chrome C:\CRF\Flasky-TA' (For tests to be run in firefox, --variable BROWSER:firefox has to be passed as argument)
	
[Instructions to run the CRF provided demo app can be found here ](/RunDemoApp.md)

## Test strategy

Test strategy used for testing the demo app is a combination of functionality testing(black box), flow testing, scenario testing, user testing, security testing and automation testing based on keyword driven approach.

## potential gaps in application

- SSL certificate should be implemented for secure web application
- Demo app is not localised and supports only english.
- Validation is missing for all the input fields in register page and minimum and maximum lengths should be set for all the input fields
- Naming is not consistent at time in UI. for eg: In Register page, user has to fill the family name, but when viewing the user information, its been show as 'last name'
- Back/cancel button is missing in login/register page and visibility of elements in top header should be based on the content in the active page. There is no point in showing register link, when the user is already in the register page or login link when user is already in login page.
- After 3 or 5 or 'n' unsuccessful attempts of login, user login credentials should be locked for specific period
- After 'n' minutes of inactivity, user should be prompted to check whether user should like to continue use the app, else log out.
- Once user navigates away from 'User information', there is no way to access 'User information' and user had to log out and log in again to see the 'User information. This could be potentially solved by making the 'user' shown left to log out action  a hyper link to 'user information'
- Pressing browser back button after successful login causes the UI to get into corrupted state ( eg: UI shown asking user to enter username/password where as top right header indicates user is already logged in)


## Report of automated test run

Screenshot of test automation report is attached here
![report](/TestAutomationReport.png)


## Report of executed tests
Login details for TestRail is below 
> URL: https://soumyarnair.testrail.io/index.php

> username: rnair.soumya@gmail.com

> password: Tester1234

Screenshot from test rail is attached here
![Screenshot of testrail report](/TestRailReport.png)


## Report of found issues

Login details for Jira is below 
> URL: https://flaskyta.atlassian.net

> username: rnair.soumya@gmail.com

> password: Tester1234

Screenshot from jira is attached here
![Screenshot of jira report](/JiraReport.png)



## How much time it took

It took approximately 25 hours 






