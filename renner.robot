

*** Settings ***
Library     SeleniumLibrary

*** Variables ***
# Dados do site
${url}          https://www.lojasrenner.com.br/
${browser}      Chrome

# Dados do login e senha
${click_button_Entre}        xpath=//span[contains(text(),'Entre ou cadastre-se')]
${input_email}               xpath=//input[@name='login']
${input_senha}               xpath=//input[@name='password']
${click_entrar}              xpath=//button[normalize-space()='ENTRAR']
${cookies_popup}             xpath=//*[@id="__next"]/div/div[1]/div[1]/header/div[1]/div[3]/div/div[1]/label/span

*** Test Cases ***
Efetuar login
    Dado que o usuário acesse o site
    Quando ele clica em "Entre ou cadastre-se"
    E preenche o campo email e senha
    E clica no botão entrar
    # Adicione verificações aqui, se necessário

*** Keywords ***
Dado que o usuário acesse o site
    Open Browser   ${url}          ${browser}
    Maximize Browser Window
    Aceitar Cookie

Quando ele clica em "Entre ou cadastre-se"
    Click Element           ${click_button_Entre}
    Wait Until Element Is Visible    ${input_email}

E preenche o campo email e senha
    Input Text             ${input_email}    martarochapbi@hotmail.com
    Input Password         ${input_senha}    casa36935882

E clica no botão entrar
    Click Element       ${click_entrar}
    # Adicione verificações aqui, se necessário

Aceitar Cookie    Click Element       ${cookies_popup}
    Wait Until Element Is Not Visible   ${cookies_popup}
