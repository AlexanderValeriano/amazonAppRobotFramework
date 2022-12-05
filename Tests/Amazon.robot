*** Settings ***
Documentation       This is some basic info about the whole suite
Library    SeleniumLibrary
*** Variables ***
${BROWSER}  chrome

*** Test Cases ***
User must sign in to check out
    [Documentation]             This is some basic info about the tests
    [Tags]                      Smoke
    open browser                https://www.amazon.fr/      ${browser}
    wait until page contains    amazon.fr
    input text                  id:twotabsearchtextbox  Ferrari 458
    click button                xpath://*[@id="nav-search-submit-button"]
    wait until page contains    résultats pour "Ferrari 458"
    click link                  xpath://*[@id="search"]/div[1]/div[1]/div/span[1]/div[1]/div[7]/div/div/div/div/div[1]/span/a
    wait until page contains    Retour aux résultats
    click button                id:add-to-cart-button
    wait until page contains    Ajouté au panier
    click element               name:proceedToRetailCheckout
    page should contain element     id:continue
    element text should be      id:continue         Continuer
    sleep               5s
    close browser
*** Keywords ***
