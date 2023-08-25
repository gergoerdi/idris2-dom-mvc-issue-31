module Main

import Web.MVC

%default total

data Ev : Type where
  Init : Ev
  Blur : Ev

0 St : Type
St = ()

update : Ev -> St -> St
update _ = id

display : Ev -> St -> Cmd Ev
display Init _ = attr Window $ onBlur Blur
display Blur _ = liftIO_ $ putStrLn "Blur"

covering
main : IO ()
main = runMVC update display (putStrLn . dispErr) Init ()
