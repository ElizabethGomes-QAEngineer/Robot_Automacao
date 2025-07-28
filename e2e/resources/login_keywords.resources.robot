*** Settings *** 
Library  SeleniumLibrary

*** Keywords ***

I navegate to the login page
     [Arguments]    ${URL}
     Go to    ${URL}

Input correct credentials 
     [Arguments]      ${USERNAME}     ${PASSWORD}
     Wait Until Element Is Visible    id=user-name  
     Input Text     id=user-name      ${USERNAME}
     input Text     id=password       ${PASSWORD}

Input no credentials 
     Wait Until Element Is Visible    id=user-name 

Input wrong Credentials 
    Wait Until Element Is Visible    id=user-name  
    Input Text     id=user-name      test
    input Text     id=password       test123

wrong Expecting Message 
    [Arguments]     ${Erro_menssage}
    Wait Until Element Contains   class= error-message-container  ${Erro_menssage}

I input only the username
    [Arguments]   ${USERNAME}
    Wait Until Element Is Visible    id=user-name
    Input Text   id=user-name    ${USERNAME}

I input only the password
    [Arguments]     ${PASSWORD}
    Wait Until Element Is Visible    id=user-name
    Input Text   id=password    ${PASSWORD}

Click on the link button 
    Click Button    id=login-button

I am able view the home page
     ${location}     Get Location
     Should Be Equal    ${location}    https://www.saucedemo.com/inventory.html