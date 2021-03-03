*** Settings ***
Library   SeleniumLibrary


*** Variables ***
${URL}               https://gist.github.com
${Browser}           Chrome
${Email}             Input your username
${Password}          Input your password
${FileName}          Hello1
${GistDescription}   Test Add Gist
${Body}              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est la


*** Test Cases ***
Scenario : As a user, I want to create a public gist
    Open Browser                        ${URL}                           ${Browser}
    maximize browser window
    wait until element is visible       xpath://div[@class='Header-item f4 mr-0']/a[1]
    click element                       xpath://div[@class='Header-item f4 mr-0']/a[1]
#Given user access gist
    wait until element is visible       id:login_field
    click element                       id:login_field
    input text                          id:login_field                ${Email}
    click element                       id:password
    input text                          id:password                  ${Password}
    click element                       name:commit
#Added New Publict gist
    wait until element is visible       css:.d-none.octicon-plus
    click element                       css:.d-none.octicon-plus
    wait until element is visible       name:gist[contents][][name]
    click element                       name:gist[contents][][name]
    input text                          name:gist[contents][][name]       ${FileName}
    click element                       name:gist[description]
    input text                          name:gist[description]            ${GistDescription}
    click element                       css:.CodeMirror-line
    input text                          css:.CodeMirror-line                ${Body}
    click element                       css:.select-menu-button
    wait until element is visible       xpath://span[.='Create public gist']
    click element                       xpath://span[.='Create public gist']
    click element                       css:.BtnGroup
    wait until element is visible       css:span.author > [data-hovercard-type='user']
    click element                       css:span.author > [data-hovercard-type='user']
#Edit an existing gist
    wait until element is visible       xpath://a[.='Hello1']
    click element                       xpath://a[.='Hello1']
    wait until element is visible       xpath: //a[contains(.,'Edit')]
    click element                       xpath: //a[contains(.,'Edit')]
    Press Keys                          css:.CodeMirror-line    CTRL+a+BACKSPACE
    input text                          css:.CodeMirror-line    Update
    click element                       css:.btn-primary
    wait until element is visible       css:span.author > [data-hovercard-type='user']
    click element                       css:span.author > [data-hovercard-type='user']
#Delete an existing gist
    wait until element is visible       xpath://a[.='Hello1']
    click element                       xpath://a[.='Hello1']
    wait until element is visible       css: .btn-danger
    click element                       css: .btn-danger
    Alert Should Be Present

    close browser
*** Keywords ***
