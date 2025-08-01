*** Settings *** 

Library    SeleniumLibrary
variables  .././variables/variables.py

*** Keywords ***

I navegate to the login page
    Go to    ${url_Data["baseUrl"]}

Input correct credentials 
    Wait Until Element Is Visible    id=user-name  
    Input Text     id=user-name      ${login_Data["correctData"]["username"]}
    input Text     id=password       ${login_Data["correctData"]["password"]}

Input no credentials 
    Wait Until Element Is Visible    id=user-name 

Input wrong Credentials 
    Wait Until Element Is Visible    id=user-name  
    Input Text     id=user-name      ${login_Data["wrongData"]["username"]}
    input Text     id=password       ${login_Data["wrongData"]["username"]}

wrong Expecting Message no Credentials
    Wait Until Element Contains   class= error-message-container  ${erro_Messages["noCredentials"]}

wrong Expecting Message no User Name
    Wait Until Element Contains   class= error-message-container  ${erro_Messages["noUserName"]}

wrong Expecting Message no Password
    Wait Until Element Contains   class= error-message-container  ${erro_Messages["noPassword"]}

wrong Expecting Message wrong Credentials
    Wait Until Element Contains   class= error-message-container  ${erro_Messages["wrongCredentials"]}

I input only the username
    Wait Until Element Is Visible    id=user-name
    Input Text   id=user-name        ${login_Data["correctData"]["username"]}

I input only the password
    Wait Until Element Is Visible    id=user-name
    Input Text   id=password         ${login_Data["correctData"]["password"]}

Click on the link button 
    Click Button    id=login-button

I am able view the home page
    ${location}     Get Location
    ${full_Url}     Catenate   SEPARATOR=      ${URL_Data["baseUrl"]}        ${URL_Data["inventoryUrl"]}
    Should Be Equal    ${location}    ${full_Url}