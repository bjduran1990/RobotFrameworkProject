*** Settings ***
Library             SeleniumLibrary
Suite Teardown      Close Browser


*** Variables ***
${url}             https://www.facebook.com/login
${browser}          chrome
${email}            spartacus2233@gmail.com
${password}         123456
${invalid_email}    The email you entered isn’t connected to an account.
${facebookname}     facebookname

*** Keywords ***
Go to UAT
    Open Browser                ${url}      ${browser}
    Wait until page contains     Log in
Login to site Successful
    Input Text                  email     ${email}
    Input Password              pass      ${password}
    Click Button                Log In
    Wait until page contains    ${facebookname}
Login to site Invalid Email
    Input Text                  email     ${email}
    Input Password              pass      ${password}
    Click Button                Log In
    Wait until page contains    ${invalid_email}     

*** Test Cases ***
Check go to UAT
    Go to UAT
Login Successful
    Login to site Successful
Login Failed Invalid Email 
    Login to site Invalid Email