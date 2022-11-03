*** Settings ***
Documentation    Essa suite teste o site da amanzon.com.br
Resource         amazon_resouces.robot
Test Setup       Abrir navegador
Test Teardown    Fechar navegador



*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Eletronico"
    [Documentation]    Esse teste verifica o menu esquenta black Friday do site da Amazon.com.br
    ...                E verifica a categoria Novas Ofertas 
    [Tags]             menus  categoria
    Dado que estou na home page da Amazon.com.br
    Quando acessar o menu "Eletrônicos"
    Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    E a categoria "Computadores e Informática" deve ser exibida na página

Caso de Teste 01 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica abusca de um produto do site da Amazon.com.br
    [Tags]             busca_produtos  lista_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página
