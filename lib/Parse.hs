module Parse where

import Control.Monad (guard)
import Data.Function ((&))
import Data.Maybe (mapMaybe)
import Text.HTML.TagSoup (
        Tag (TagClose, TagOpen),
        innerText,
        parseTags,
        partitions,
        renderTags,
        (~==),
 )
import Text.HTML.TagSoup.Match (tagClose)

tableClass :: String
tableClass = "va-table va-table-full va-table-shaded sortable"

data TablePerk = TablePerk
        { name :: String
        , benefit :: String
        , ranks :: Int
        , requiredLevel :: Int
        , otherRequirements :: String
        }
        deriving (Show)

tableRowToPerk :: [Tag String] -> Maybe TablePerk
tableRowToPerk row = do
        let cells = partitions (~== "<td>") row
        guard (length cells >= 5)
        let name = innerText $ head cells
        return $ TablePerk name "" 1 1 ""

extractTablePerks :: String -> [TablePerk]
extractTablePerks html =
        parseTags html
                & dropWhile (/= TagOpen "table" [("class", tableClass)])
                & takeWhile (/= TagClose "table")
                & partitions (~== "<tr>")
                & tail
                -- & filter () todo - get only tr tags
                & mapMaybe tableRowToPerk -- parse each <tr> element
