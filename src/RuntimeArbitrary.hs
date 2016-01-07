{-# LANGUAGE RankNTypes, FlexibleInstances, FlexibleContexts, KindSignatures, ScopedTypeVariables, TemplateHaskell, ConstraintKinds #-}

module RuntimeArbitrary where

import Data.Typeable
import IfCxt
import Test.QuickCheck

getArbGen :: forall proxy a. (Typeable a, IfCxt (Arbitrary a)) => proxy a -> [Gen a]
getArbGen _ = ifCxt (Proxy::Proxy (Arbitrary a))
                    [arbitrary]
                    []
