*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}       file:///Users/jessesillman/Downloads/swag_labs%20(1).html
${BROWSER}   Chrome

*** Test Cases ***
Open SwagLabs HTML Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s
    Close Browser
