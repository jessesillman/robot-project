*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser To SwagLabs
Suite Teardown    Close Browser

*** Variables ***
${URL}       https://jessesillman.github.io/robot-project/swag_labs.html
${BROWSER}   Chrome

*** Test Cases ***
SwagLabs Checkout Flow
    Input Text    id=username    standard_user
    Input Text    id=password    secret_sauce
    Click Button    id=login-button
    Wait Until Page Contains    Products
    Wait Until Element Is Visible    xpath=//div[@id='products-grid']//button[contains(text(),'Add to Cart')]
    Click Button    xpath=(//div[@id='products-grid']//button[contains(text(),'Add to Cart')])[1]
    Click Button    xpath=(//div[@id='products-grid']//button[contains(text(),'Add to Cart')])[2]
    Click Element   xpath=//div[contains(@class, 'cart-icon')]
    Click Button    xpath=(//button[text()='Remove'])[1]
    Input Text      id=first-name    Jesse
    Input Text      id=last-name     Sillman
    Input Text      id=postal-code   12345
    Click Button    xpath=//button[contains(text(),'Complete Purchase')]
    Wait Until Page Contains    Thank You For Your Order!

*** Keywords ***
Open Browser To SwagLabs
    Open Browser    ${URL}    ${BROWSER}    options=add_argument(--headless)    options=add_argument(--no-sandbox)   
    Maximize Browser Window
    Set Selenium Speed    0.5s


