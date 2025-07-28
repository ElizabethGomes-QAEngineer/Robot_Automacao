*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/login_keywords.resources.robot
Test Setup  open browser        browser=chrome

*** Variables ***

${URL}       https://www.saucedemo.com/ 
${BROWSER}   chrome
${USERNAME}  standard_user
${PASSWORD}  secret_sauce

*** Test Cases ***

sucessful Login
    I navegate to the login page    ${URL}
    Input correct credentials       ${USERNAME}   ${PASSWORD}
    Click on the link button   
    I am able view the home page
    
Unsucessful Login - No credential 
    I navegate to the login page    ${URL}
    Input no credentials  
    Click on the link button 
    wrong Expecting Message     Epic sadface: Username is required 

Unsucessful Login - without Username
    I navegate to the login page    ${URL}
    I input only the password       ${PASSWORD}
    Click on the link button
    wrong Expecting Message     Epic sadface: Username is required

Unsucessful Login - only with username
    I navegate to the login page    ${URL}
    I input only the username       ${USERNAME}
    Click on the link button
    wrong Expecting Message     Epic sadface: Password is required

Unsucessful Login - Wrong credentials 
    I navegate to the login page    ${URL}
    Input wrong Credentials 
    Click on the link button 
    wrong Expecting Message      Epic sadface: Username and password do not match any user in this service 