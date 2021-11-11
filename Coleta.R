require(rvest)
require(httr)
require(dplyr)
require(stringr)
require(tidytext)
require(tidyr)
require(tm)
require(wordcloud2)
require(textcat)
require(ggplot2)
library(xml2)
#colocou a sequencia que encontra o texto

#fez uma matrix para acomodar o coletado
discursos<- data.frame()
for(j in 0:15){
  if (j ==0){x = 0}else{x=x+30}
  
  url_discursos <- paste("https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/discursos?b_start:int=",x,sep='')
  print(paste('página: ',j+1,sep = ""))
  for(i in 1:30){
    acessar <- url_discursos %>%
      GET() %>% 
      read_html() %>% 
      html_nodes(xpath = str_c('//*[@id="content-core"]/article[',i,']')) 
    url <- xml_attrs(xml_child(xml_child(xml_child(acessar[[1]], 1), 1), 1))[["href"]]
    texto <- url %>%
      GET()%>%
      read_html() %>%
      html_nodes(xpath = str_c('//*[@id="content-core"]')) %>% 
      html_text() 
    titulo <- url %>%
      GET()%>%
      read_html() %>%
      html_nodes(xpath = str_c('//*[@id="content"]/h1')) %>% 
      html_text() 
    dia <- url %>%
      GET()%>%
      read_html() %>%
      html_nodes(xpath = str_c('//*[@id="plone-document-byline"]/span[1]/span[2]')) %>% 
      html_text() 
    
    discurso_temp = data.frame(titulo,dia,texto,url)
    
    if ((j == 0)&(i==1)){
      discursos <- discurso_temp
    }else{
      discursos<- rbind(discursos,discurso_temp)
    }
  
}
}


discursos$ind = 1:dim(discursos)[1]
discursos$texto <- str_remove_all(discursos$texto,'\n')
discursos$texto <- str_trim(discursos$texto)

library(openxlsx)
setwd('C:/Users/Windows/Documents/Ultimo_semestre (Apagar quando acabar)/TCC')
openxlsx::write.xlsx(discursos,'Discursos.xlsx')
