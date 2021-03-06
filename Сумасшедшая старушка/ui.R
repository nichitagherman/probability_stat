library('shiny')
library('plotly')
shinyUI(fluidPage(
  titlePanel(
    h3("Симулятор задачи о сумасшедшей старушке", style = margin(t = 15)),
    ),
  sidebarLayout(
    sidebarPanel(
      h4(tags$p("Условия задачи:", style = margin(t = 50))),
      tags$li("Пассажиры по очереди заходят в самолет и садятся на свои места, если они свободны... Все, кроме старушек..."),
      tags$li("Если пассажир - старушка, то она равновероятно садится на любое из свободных мест"),
      tags$li("Если место пассажира по билету - занято, то он равновероятно садится на одно из оставшихся свободных мест"),
      tags$li("Для каждого числа пассажиров проводится 300 симуляций для оценки ожидаемого количества пассажиров, севших на свои места"),
      tags$li(tags$b("Обратите внимание, что номер старушки, заходящей в самолет, не должен быть больше числа пассажиров в самолете"),
              tags$br(),
              tags$br()),
      selectInput(
        "kolicestvo",
        label = "Выберите количество сумасшедших старушек, попавших на тот же рейс",
        choices = 1:5,
        selected = 1
      ),uiOutput("starushki"),
      sliderInput("number_passangers",
        label = "Здесь укажите интервал исследуемых вместительностей самолета", 
        min = 2, max = 200,
        value = c(1, 15))
    ),mainPanel(
      plotlyOutput("plot", height = 500)
    )
  )
))