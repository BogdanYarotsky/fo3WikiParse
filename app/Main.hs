module Main where

import Parse

main :: IO ()
main = do
  html <- readFile "perks.html"
  putStrLn "hello world"