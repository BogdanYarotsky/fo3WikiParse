module Main where

import Text.HTML.TagSoup

tableClass :: String
tableClass = "va-table va-table-full va-table-shaded sortable"

main :: IO ()
main = do
  html <- readFile "perks.html"
  let tags = parseTags html
  let html2 =
        takeWhile (/= TagClose "table") $
          dropWhile (/= TagOpen "table" [("class", tableClass)]) $ -- Use tail to drop the first TagOpen that matches the condition
            tags

  -- Convert the extracted tags back to a string
  let htmlString = renderTags html2

  putStrLn htmlString
