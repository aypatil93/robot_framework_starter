*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library
Library        lib/utils.py

*** Variables ***
${SERVER}         qat-avod-web.crackle.com
${BROWSER}        gc
${DELAY}          50
${VALID USER}     arunimasahoo03@gmail.com
${VALID PASSWORD}   Mama@123
${LOGIN URL}      http://${SERVER}/
${WELCOME URL}    http://${SERVER}/
${ERROR URL}      http://${SERVER}/error.html
${CSS}          div.slide-show

*** Keywords ***
Open Browser To Home Page
    Open Browser    ${WELCOME URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Home Page Should Be Open

Signin
    Click On Signin Button

Home Page Should Be Open
   page should contain  About Crackle

Click On Signin Button
    click element   css=body > div.app-content > navigation-bar > navigation-bar-avod > nav > div.account > div > ul > li:nth-child(1) > app-link > a

Input Username
    [Arguments]    ${username}
    Input Text    name=username     ${username}

Input Password
    [Arguments]    ${password}
    Input Text   password     ${password}

Submit Credentials
    click element    css=body > div.app-content > div:nth-child(5) > div > div > div:nth-child(2) > sign-in-avod > div.sign-in-avod > form > div:nth-child(3) > input

Login To Crackle
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials

Login Home Page Should Be Open
   page should contain   Hi, Arunima.
