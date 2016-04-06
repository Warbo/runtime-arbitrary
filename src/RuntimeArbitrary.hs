{-# LANGUAGE RankNTypes, FlexibleInstances, FlexibleContexts, ScopedTypeVariables, ConstraintKinds #-}

module RuntimeArbitrary where

import Data.Typeable
import IfCxt
import Test.QuickCheck

getArbGen :: forall proxy a. (Typeable  a,
                              IfCxt (Arbitrary a),
                              IfCxt (Ord       a)) => proxy a -> [Gen a]
getArbGen _ = ifCxt        (Proxy::Proxy (Arbitrary a))
                    (ifCxt (Proxy::Proxy (Ord       a))
                           [arbitrary]
                           [])
                    []
