*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}                            http://amanzon.com.br
${MENU_ESQUENTA_BLACK_FRIDAY}     //*[@id="nav-xshop"]/a[3]  
${TEXT_ESQUENTA_BLACK_FRIDAY}     //*[@id="grid-main-container"]/div[2]/span[1]/span/h4
${FIST_PRODUCT}                   //*[@id="search"]/div[1]/div[1]/div/span[1]/div[1]/div[2]/div/div/div
${CATEGORIA}                      //*[@id="anonCarousel1"]/ol/li[2]/a/span[2]


*** Keywords ***

Abrir navegador
    Open Browser    browser=chrome

Fechar navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL} 
    Wait Until Element Is Visible    locator=${MENU_ESQUENTA_BLACK_FRIDAY}

Entrar no menu "Esquenta Black Friday"
    Click Element    locator=${MENU_ESQUENTA_BLACK_FRIDAY}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${TEXT_ESQUENTA_BLACK_FRIDAY}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=${CATEGORIA}



Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Click Element    locator=twotabsearchtextbox
    Input Text    locator=twotabsearchtextbox   text=${PRODUTO}

Clicar no botão de pesquisa
    Click Button    locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto pesquisado
    Wait Until Element Is Visible   locator=${FIST_PRODUCT}


# GHERKIN STEPS

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Esquenta Black Friday 2022 | Amazon.com.br"

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Esquenta Black Friday"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Esquenta Black Friday 2022 | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Amazon Prime"


E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Novas Ofertas"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa 

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto pesquisado