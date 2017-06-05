{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Add where

import Foundation
import Yesod.Core
import Text.Julius
-- usar toWidget quando nao houver whamlet
getAddR :: Int -> Int -> Handler Html
getAddR x y =  defaultLayout $ do
        setTitle "Addition"
        msg <- return $ "Ola de dentro do Haskell"
        toWidget [lucius|
            h1{
                color: red;
                background-color: yellow;
            }
        |]
        toWidgetHead [julius|
            function teste(){
                var h1 = document.getElementById("h1");
                h1.addEventListener("click",function(e){
                    alert(e.target.innerHTML);
                    alert(#{rawJS $ show msg});
                });
            }
            window.onload = teste;
        |]
        [whamlet|
           <h1 id="h1">
               #{x} + #{y} = #{z}
        |]
  where
    z = x + y
