# Recuperacao_Informacao


🏁 O objetivo geral deste trabalho é a modelagem de um Sistema de Recuperação de Informação (SRI), utilizando técnicas de Processamento de Linguagem Natural (PLN), dos discursos oficiais do presidente Jair Bolsonaro, que retorne discursos com relevância contextual e semântica sobre o tópico de interesse do usuário. 

🌐 Com o auxílio do script Coleta.R foram coletados dados do site do Governo Federal (https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos). 
Foram coletados 456 discursos do presidente, do período de 01/01/2019 à 15/10/2021.

‼ Os 456 discursos do presidente Bolsonaro passaram por uma série de processos de limpeza, que foram realizadas no script TCC.ipynb, para que ficassem aptos para a utilização no modelo, pois os discursos na sua forma original carregam muitas palavras sem valor semântico.

👨‍💻 A idéia do modelo é que o usuário insira uma entrada, chamada de termo de indexação, que expresse a sua necessidade. Após isso, é realizada uma série de procedimentos de processamento de linguagem nos discursos
e na busca para que eles fiquem aptos para utilização do modelo. Ao final desse procedimentos, a busca e os discursos são representados por uma lista de vetores, que foi criada por uma técnica chamada word-embedding. 

👨‍💻 Após a representação da busca e dos documentos, é realizado o cálculo de similaridade de cosseno. Com esse cálculo é indicado os trechos dos discursos que são mais relevantes em relação àquela busca realizada pelo usuário. 

