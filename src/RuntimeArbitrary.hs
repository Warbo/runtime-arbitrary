{-# LANGUAGE RankNTypes, FlexibleInstances, FlexibleContexts, KindSignatures, ScopedTypeVariables, TemplateHaskell, ConstraintKinds #-}

module RuntimeArbitrary where

import Data.Typeable
import IfCxt
import Test.QuickCheck

getArbGen :: forall proxy a. (IfCxt (Typeable  a),
                              IfCxt (Arbitrary a),
                              IfCxt (Ord       a)) => proxy a -> [Gen a]
getArbGen _ = ifCxt               (Proxy::Proxy (Arbitrary a))
                    (ifCxt        (Proxy::Proxy (Typeable  a))
                           (ifCxt (Proxy::Proxy (Ord       a))
                                  [arbitrary]
                                  [])
                           [])
                    []
