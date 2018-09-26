module View exposing (view)

import Html exposing (Html)
import Html as H
import Html.Attributes as HA
import Links
import Model exposing (Model)
import Sidebar exposing (sidebar)


view : Model -> Html msg
view _ =
    H.div [ HA.class "row" ]
        [ H.br [] []
        , H.div [ HA.class "medium-11 small-centered columns" ]
            [ H.div [ HA.class "row" ]
                [ H.div
                    [ HA.class "columns medium-3 sidebar"
                    , HA.style
                        "max-width"
                        "300px"
                    ]
                    [ sidebar ]
                , H.div
                    [ HA.class "columns medium-8"
                    , HA.style
                        "max-width"
                        "700px"
                    ]
                    [ centralViewport ]
                ]
            ]
        ]


experience : String -> List (Html msg) -> Html msg
experience title body =
    H.div []
        [ H.h4 [] [ H.text title ]
        , H.div [] body
        ]


bodyEntry : String -> List (Html msg) -> Html msg
bodyEntry title body =
    H.div []
        [ H.h5 [] [ H.text title ]
        , H.div [] body
        ]


workEntry : { date : String, place : String, title : String } -> List (Html msg) -> Html msg
workEntry info body =
    H.div []
        [ H.strong [] [ H.text info.place ]
        , H.text " | "
        , H.text info.title
        , H.text " | "
        , H.i [] [ H.text info.date ]
        , H.div [] body
        ]


ul : List (Html msg) -> Html msg
ul elems =
    H.ul [] (List.map (\elem -> H.li [] [ elem ]) elems)


centralViewport =
    let
        eSpacer =
            H.div [ HA.class "experience-spacer" ] []

        spacer =
            H.div [ HA.class "object-spacer" ] []
    in
        H.div []
            [ H.a [ HA.name "work" ] []
            , experience "work" <|
                List.intersperse spacer
                    [ gradSchool
                    , jana
                    , uber
                    , prezi
                    , nomic
                    ]
            , eSpacer

            -- , H.a [ HA.name "side" ] []
            -- , experience "side projects" <|
            -- List.intersperse spacer
            -- [ t3
            -- , wikiSolver
            -- ]
            -- , eSpacer
            , H.a [ HA.name "personal" ] []
            , experience "personal" <|
                List.intersperse spacer
                    [ electronics
                    , photography
                    , pottery
                    ]
            , eSpacer
            ]


summary =
    H.div [] []


gradSchool =
    workEntry { place = "UC San Diego", date = "September 2018 - Current", title = "PhD Student" }
        [ H.p [] [ H.text """Programming Languages Researcher""" ]
        ]


jana =
    workEntry { place = "Jana", date = "February 2017 - June 2018", title = "Software Engineer II" }
        [ H.p [] [ H.text """
I worked closely with our data scientists to ensure
they have the data and, equally importantly, the tools to do their job well.
     """ ]
        , ul
            [ H.text "Managed financial monitoring pipeline, tracking where the money comes from"
            , H.text "Created server to android app spanning features"
            , H.text "Develop more developer-friendly internal data pipeline libaries"
            ]
        ]


uber =
    workEntry { place = "Uber", date = "July 2015 - December 2016", title = "Software Engineer" }
        [ H.p [] [ H.text """
 Hired as a front-end engineer, I refactored and maintain business.uber.com. After a few months,
 I wanted to see more of the stack, so I transitioned to a full-stack role where I've been since.
 In my time at Uber I have:
     """ ]
        , ul
            [ H.span []
                [ H.text "Migrated "
                , H.a [ HA.href Links.bizUberCom ] [ H.text "business.uber.com" ]
                , H.text " from backbone to redux"
                ]
            , H.text "Designed and wrote frist golang service for Uber for Business"
            , H.text "Given several tech talks about: functional reactive programming, stacking diffs, and golang at Uber"
            , H.text "Added expense code management to admin tool"
            , H.text "Improved policy error messaging"
            ]

        -- , H.img [HA.src "assets/biz-uber-com.png"] []
        ]


prezi =
    workEntry { place = "Prezi", date = "June 2014 - August 2014", title = "Elm intern" }
        [ H.p [] [ H.text """
 I collaborated with Evan Czaplicki, Elm-lang's author, for a summer working at Prezi's
 headquarters in beautiful Budapest.
    """ ]
        , ul
            [ H.text "Wrote the second (and current) iteration of the time-traveling debugger"
            , H.a [ HA.href Links.timeTravel ] [ H.text "Authored the blog post about it" ]
            , H.text "Polled and worked closely with the Elm open-source community"
            , H.text "Devised a performance testing framework for Elm"
            ]

        -- , H.a [HA.href Links.timeTravel] [H.img [HA.src "assets/time-travel.png"] []]
        ]


nomic =
    workEntry { place = "Nomic", date = "June 2013 - August 2013", title = "Full-stack intern" }
        [ H.p [] [ H.text """
My first technical internship showed me how a CRUD app works from the very front to the back.
Nomic was a way to discover and show off the incredible people in your neighborhood--
learn that the barista at your local coffee shop also does pottery on the side.
The whole company was 6 people so I got to help with everything.
    """ ]
        , ul
            [ H.text "Created photo messaging feature on the Node.js backend"
            , H.text "implemented web frontend for photo feature on chat app"
            , H.text "learned and wrote the iOS feature for photo messaging"
            ]
        ]


t3 =
    bodyEntry "tic-tac-toe"
        [ H.p [] [ H.text """
You've played tic-tac-toe. This game will always beat you. It figures out the best move, naviagting
a large tree of possible moves. The code is generalized to easily apply the solver logic
to any game.
    """ ]
        ]


wikiSolver =
    bodyEntry "wiki solver"
        [ H.p [] [ H.text """
Let's play a game: I give you two wikipedia pages and you need to find the fewest page clicks
required to get there. I think the average is about 3 clicks. This server/client pair shows you
the "shortest path" between any two pages using a basic fanning out search.
    """ ]
        ]


pottery =
    bodyEntry "pottery"
        [ H.text """
I've been doing ceramics for about 10 years. I mostly make functional pieces.
I replace IKEA sets. Occasionally, I make something more abstract.
I'm currently curious about the balance between utility and form.
Exploring subtractive methods with thrown pots, I'm following the work of
Michael Boroniec.
"""
        ]


electronics =
    bodyEntry "electronics"
        [ H.text """
I wanted a nice speaker amplifier when I moved out to SF, but I didn't want to buy one.
I decided to build one. There was one problem: I didn't know anything about electrical engineering.
I've been teaching myself and built my amplifier!
It's a class D amplifier that can power two 80 watt speakers.
"""
        , H.br [] []
        , H.text "It sounds nice."
        ]


photography =
    bodyEntry "photography"
        [ H.text "phtography"
        , H.br [] []
        , H.a [ HA.href Links.flickr ] [ H.text "see my photos" ]
        ]