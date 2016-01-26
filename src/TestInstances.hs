module TestInstances where

import Data.Typeable
import Test.QuickCheck

data Foo = AFoo deriving (Show, Eq, Typeable)

instance Ord Foo where
  compare x y = EQ

instance Arbitrary Foo where
  arbitrary = return AFoo
