#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(tidyverse)
library(readxl)
library(leaflet)
library(sf) #Para leer el archivo del perimmetro de los municipios para el mapa interactivo
library(tidygeocoder)
library(shiny)
library(ggplot2)
#library(rsconnetc)

 # Leer los datos guardados en CSV (ya procesados)
  
localizacion <- read_csv("localizacion.csv")

#Definir UI (Interfaz)

ui <- fluidPage(
  
  # CSS para hacer que el mapa ocupe toda la pantalla

  tags$style(
    HTML("
      #mapa {
        height: 80vh !important; /* 80% de la altura de la pantalla */
        width: 100% !important;
      }
    ")
   ),
  
  
  titlePanel("Mapa de Municipios TJ"),
  
  sidebarLayout(
    sidebarPanel(
      
      # Menú desplegable para filtrar por Comunidad, provincia y municipio 
      
      selectInput("comunidad", "Filtrar por Comunidad Autónoma:",
                  choices = c("Todas", unique(localizacion$Comunidades)),
                  selected = "Todas"),
      
      selectInput("provincia", "Filtrar por provincia:",
                  choices = c("Todas", unique(localizacion$Provincias)),
                  selected = "Todas"),
      
      selectInput("municipio", "Filtrar por municipio:",   
                  choices = c("Todos", unique(localizacion$Municipios)),   
                  selected = "Todos"),
    ),  
    
    mainPanel(  
      
      
      
      leafletOutput("mapa"),  # Mapa interactivo para mostrar los avistamientos 
      plotOutput("grafico")   # Grafico
    )
  )
)

#Definir Server (Lógica de la app)

server <- function(input, output, session) {
  
 # Filtrar datos según la selección del usuario
  
  datos_filtrados <- reactive({
    
      datos <- localizacion  # Hacemos una copia para trabajar sobre ella
      
      if (input$comunidad != "Todas") {
        datos <- datos[datos$Comunidades == input$comunidad, , drop = FALSE]
      }
      
      if (input$provincia != "Todas") {
        datos <- datos[datos$Provincias == input$provincia, , drop = FALSE]
      }
      
      if (input$municipio != "Todos") {
        datos <- datos[datos$Municipios == input$municipio, , drop = FALSE]
      }
      
      return(datos)  # Se devuelve el dataset filtrado sin modificar el original
    })
  
 # Renderizar el mapa en la app
  
  output$mapa <- renderLeaflet({
    
    req(datos_filtrados())  # Asegura que datos_filtrados no sea NULL
    
    leaflet(datos_filtrados()) %>%
      addTiles() %>%  # Mapa base
      addCircleMarkers(
        ~long, ~lat,  # Coordenadas
        popup = ~paste0(  # Información en el popup
          "<b>Comunidad:</b> ", Comunidades, "<br>",
          "<b>Provincia:</b> ", Provincias, "<br>",
          "<b>Municipio:</b> ", Municipios, "<br>",
          "<b>Zona TJ:</b> ", `Zona TJ`
        ),
        color = "darkgreen",  # Color de los puntos
        radius = 8  # Tamaño de los puntos
      )
  })
  
  output$grafico <- renderPlot({
    
    req(datos_filtrados())
    
    ggplot(datos_filtrados(), aes(x = Provincias)) +
      geom_bar(fill = "blue") +
      theme_minimal() +
      labs(title = "Cantidad de municipios por provincia", 
           x = "Provincias", y = "Número de municipios") +
      theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Inclinar etiquetas
  })
  
}

#Ejecutar la aplicación Shiny

shinyApp(ui, server)






