module TestInstances where

import Data.Typeable
import Test.QuickCheck

data Foo = AFoo deriving (Show, Eq, Typeable)

data Nat = Z | S Nat

instance Ord Foo where
  compare x y = EQ

instance Arbitrary Foo where
  arbitrary = return AFoo
