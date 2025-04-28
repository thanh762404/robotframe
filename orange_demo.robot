*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}            https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}        chrome
${USERNAME}       Admin
${PASSWORD}       admin123
${INVALID_USERNAME}    Admin1
${INVALID_PASSWORD}    admin1231
${NAME_USERNAME}  username
${NAME_PASSWORD}  password

*** Test Cases ***
Login Thành Công Với Admin 1
    Mở Trình Duyệt
    Đăng Nhập    ${USERNAME}    ${PASSWORD}
    Kiểm Tra Đăng Nhập Thành Công
    Đóng Trình Duyệt

Login Thất Bại Với Admin 2
    Mở Trình Duyệt
    Đăng Nhập    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    Kiểm Tra Đăng Nhập Thất Bại
    Đóng Trình Duyệt

*** Keywords ***
Mở Trình Duyệt
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    6s

Đăng Nhập
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Input Text    xpath=//input[@name="username"]    ${USERNAME}
    Input Text    xpath=//input[@name="password"]    ${PASSWORD}
    Click Button    xpath=//button[@type="submit"]
    Sleep    6s

Kiểm Tra Đăng Nhập Thành Công
    Page Should Contain    Dashboard

Kiểm Tra Đăng Nhập Thất Bại
    Page Should Contain Element    css=p.oxd-alert-content-text
    Element Should Contain    css=p.oxd-alert-content-text    Invalid credentials

Đóng Trình Duyệt
    Close Browser
