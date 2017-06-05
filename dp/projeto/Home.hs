{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Home where

import Foundation
import Yesod.Core

getHomeR :: Handler Html
getHomeR = defaultLayout $ do
    setTitle "Minimal Multifile"
    toWidget [lucius|
        ul{
           list-style-type: none;
           margin: 0;
           padding: 0;
           overflow: hidden;
           background-color: #333333;
        }    
        li{
           float: left;   
        }
        li a{
             display: block; 
             color: white;
             text-align: center;
             padding: 16px;
             text-decoration:none;
        }
        li a:hover{
                   background-color: #CCC;
        }
    |]
    [whamlet|
        <p>
          <a href=@{AddR 5 7}>HTML addition
        <ul>   
          <li>
             <a href=@{Pagina1R}>Pagina1
          <li>
             <a href=@{Pagina2R}>Pagina2
          <li>
             <a href=@{Pagina3R}>Pagina3
    |]
