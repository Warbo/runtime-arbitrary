module Main where

import           ArbInstances
import           RuntimeArbitrary
import           Test.QuickCheck
import           Test.Tasty (defaultMain, testGroup)
import           Test.Tasty.QuickCheck (testProperty)
import           Types

main = defaultMain $ testGroup "All tests" [
    testProperty "Have an Int generator" haveIntGen
  , testProperty "Int generator works"   intGenWorks
  , testProperty "Have a Foo generator"  haveFooGen
  , testProperty "Foo generator works"   fooGenWorks
  ]

intGens :: [Gen Int]
intGens = getArbGen [0 :: Int]

haveIntGen = not (null intGens)

intGenWorks = testGens intGens

fooGens :: [Gen Foo]
fooGens = getArbGen [undefined]

haveFooGen = not (null fooGens)

fooGenWorks = testGens fooGens

testGens gs = not (null gs) ==> forAll (oneof gs) (const True)
