*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource       ../keywords/Crackle_resource.robot

*** Test Cases ***
Open Browser
    [Documentation]  Launch URL with Verification of text About Crackle
    [Tags]  WatchNow_Home
    Open Browser To Home Page

Valid Login
    [Documentation]  Login With Valid Credentials & Verification With Text "Hi, Arunima"
    [Tags]  SignIn
    Signin
    Login To Crackle     arunimasahoo03@gmail.com   Mama@123
    Login Home Page Should Be Open
    [Teardown]    Close Browser




