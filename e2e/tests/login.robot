*** Settings ***

Resource   ../resources/login_keywords.resources.robot
Suite Setup   open browser        browser=chrome


*** Test Cases ***

sucessful Login
    I navegate to the login page     
    Input correct credentials      
    Click on the link button   
    I am able view the home page
    
Unsucessful Login - No credential 
    I navegate to the login page   
    Input no credentials  
    Click on the link button 
    wrong Expecting Message noCredentials

Unsucessful Login - without Username
    I navegate to the login page    
    I input only the password       
    Click on the link button
    wrong Expecting Message noUserName

Unsucessful Login - only with username
    I navegate to the login page    
    I input only the username     
    Click on the link button
    wrong Expecting Message noPassword 

Unsucessful Login - Wrong credentials 
    I navegate to the login page    
    Input wrong Credentials 
    Click on the link button 
    wrong Expecting Message wrongCredentials