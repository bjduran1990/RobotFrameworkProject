*** Settings ***
Library             SeleniumLibrary 
Library             DateTime     
Suite Teardown      Close Browser


*** Variables ***
${url}                  https://www.facebook.com/login
${browser}              chrome
${email}                spartacus2235@gmail.com
${password}             123456
${invalid_email}        Wrong Credentials
${facebookname}         facebookname
${timestamp}             

*** Keywords ***
Get Current timestamp
    ${timestamp}     Get Current Date    result_format=%Y%m%d%H%M%S
    Set Global Variable    ${timestamp}
Go to UAT
    Open Browser                ${url}      ${browser}
    Wait until page contains     Log in
    Get Current timestamp
    Capture Page Screenshot      ./Screenshots/${SUITE_NAME}/${TEST_NAME}/result-${timestamp}.png
Login to site Successful
    Input Text                  email     ${email}
    Input Password              pass      ${password}
    Click Button                Log In
    Wait until page contains    ${facebookname}
    Get Current timestamp
    Capture Page Screenshot      ./Screenshots/${SUITE_NAME}/${TEST_NAME}/result-${timestamp}.png
Login to site Invalid Email
    Input Text                  email     ${email}
    Input Password              pass      ${password}
    Click Button                Log In
    Wait until page contains    ${invalid_email}   
    Get Current timestamp
    Capture Page Screenshot      ./Screenshots/${SUITE_NAME}/${TEST_NAME}/result-${timestamp}.png  
*** Test Cases ***
Check go to UAT
    Go to UAT
Login Successful
    Login to site Successful
Login Failed Invalid Email 
    Login to site Invalid Email