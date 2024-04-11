module Main where

import           Parse

main :: IO ()
main = do
  html <- readFile "perks.html"
  let perksTable = extractTable html
  putStrLn perksTable