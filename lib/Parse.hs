module Parse where

import           Data.Function
import           Text.HTML.TagSoup

tableClass :: String
tableClass = "va-table va-table-full va-table-shaded sortable"

extractTable :: String -> String
extractTable html = parseTags html
        & dropWhile (/= TagOpen "table" [("class", tableClass)])
        & takeWhile (/= TagClose "table")
        & renderTags

