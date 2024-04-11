module Main where

import           Data.Function
import           Text.HTML.TagSoup

tableClass :: String
tableClass = "va-table va-table-full va-table-shaded sortable"

main :: IO ()
main = do
  html <- readFile "perks.html"
  let perksTable = parseTags html
        & dropWhile (/= TagOpen "table" [("class", tableClass)])
        & takeWhile (/= TagClose "table")
        & renderTags
  putStrLn perksTable
