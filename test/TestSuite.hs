module Main where

import Parse
import Test.HUnit

thirdPerkTest :: String -> Test
thirdPerkTest html =
  TestCase
    (assertEqual "Third perk name" expectedThirdPerk actualThirdPerk)
 where
  expectedThirdPerk = "Gun Nut"
  actualThirdPerk = name $ extractTablePerks html !! 2

main :: IO ()
main = do
  html <- readFile "perks.html"
  _ <- runTestTT (TestList [thirdPerkTest html])
  return ()