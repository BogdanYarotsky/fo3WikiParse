module Main where

import           Parse
import           Test.HUnit
import           Data.Function

test1 :: Test
test1 = TestCase (assertEqual "Table class name" expectedTable tableClass)
  where
    expectedTable = "va-table va-table-full va-table-shaded sortable"

main :: IO ()
main = do
  _ <- runTestTT (TestList [test1])
  return ()