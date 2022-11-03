*** Settings ***
Documentation    Essa suite teste o site da amanzon.com.br
Resource         amazon_resouces.robot
Test Setup       Abrir navegador
Test Teardown    Fechar navegador



*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "ESQUENTA_BLACK_FRIDAY"
    [Documentation]    Esse teste verifica o menu esquenta black Friday do site da Amazon.com.br
    ...                E verifica a categoria Novas Ofertas 
    [Tags]             menus  categoria
    Acessar a home page do site Amazon.com.br
    Entrar no menu "Esquenta Black Friday"
    Verificar se aparece a frase "Amazon Prime"
    Verificar se o título da página fica "Esquenta Black Friday 2022 | Amazon.com.br"
    Verificar se aparece a categoria "Novas Ofertas"

Caso de Teste 01 - Pesquisa de um Produto
    [Documentation]    Esse teste verifica abusca de um produto do site da Amazon.com.br
    [Tags]             busca_produtos  lista_busca
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa 
    Verificar o resultado da pesquisa se está listando o produto pesquisado

