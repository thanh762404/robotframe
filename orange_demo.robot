*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}       Chrome
${VALID_USER}    Admin
${VALID_PASS}    admin123
${INVALID_USER}  wronguser
${INVALID_PASS}  wrongpass

*** Test Cases ***

TC_Login_01_Valid_Login
    [Documentation]    Đăng nhập với thông tin hợp lệ - hiển thị Dashboard
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    name=username
    Input Text    name=username    ${VALID_USER}
    Input Text    name=password    ${VALID_PASS}
    Click Button    xpath=//button[@type='submit']
    Wait Until Element Is Visible    xpath=//h6[text()='Dashboard']    timeout=10s
    Page Should Contain Element    xpath=//h6[text()='Dashboard']
    
*** Test Cases ***
TC_Login_02_Invalid_Login
    [Documentation]    Đăng nhập với thông tin sai - hiển thị thông báo lỗi
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    name=username
    Input Text    name=username    ${INVALID_USER}
    Input Text    name=password    ${INVALID_PASS}
    Click Button    xpath=//button[@type='submit']
    Wait Until Element Is Visible    xpath=//div[contains(., 'Invalid credentials')]    timeout=15s
    Page Should Contain    Invalid credentials

