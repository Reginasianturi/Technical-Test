*** Settings ***
Library   SeleniumLibrary


*** Variables ***
${URL}               https://www.ebay.com/
${Browser}           Chrome
${Search-Keyword}    Laptop
${Item}              Macbook

*** Test Cases ***
Searching Product From Search Box
    Open Browser                        ${URL}                           ${Browser}
    maximize browser window
    wait until element is visible       id: gh-ac-box           10
    click element                       id: gh-ac-box
    input text                          id: gh-ac       ${Item}
    click element                       id: gh-cat
    click element                       xpath://option[.='Computers/Tablets & Networking']
    click element                       id: gh-btn
    wait until element is visible       xpath://span[.='Apple Macbook Pro 13" Laptop | i5 8GB RAM | 500GB HD | MacOS | 3 YRS WARRANTY']

#Verify
     ${response}   Get Text    xpath://span[.='Apple Macbook Pro 13" Laptop | i5 8GB RAM | 500GB HD | MacOS | 3 YRS WARRANTY']
     should contain any   ${response}   ${Item}

      close browser
*** Keywords ***
