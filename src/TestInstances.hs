module TestInstances where

import Test.QuickCheck

data Foo = AFoo deriving (Show)

instance Arbitrary Foo where
  arbitrary = return AFoo
