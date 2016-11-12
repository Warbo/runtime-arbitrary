module Test.TestInstances where

import Data.Typeable
import Test.QuickCheck

data Foo = AFoo deriving (Show, Eq, Typeable)

instance Ord Foo where
  compare x y = EQ

instance Arbitrary Foo where
  arbitrary = return AFoo

data Nat = Z | S Nat deriving (Show, Eq, Typeable)

instance Ord Nat where
  Z   <=   y = True
  S x <= Z   = False
  S x <= S y = x <= y

instance Arbitrary Nat where
  arbitrary = toNat <$> arbitrary

toNat :: Integer -> Nat
toNat 0 = Z
toNat n = S (toNat (abs n - 1))
