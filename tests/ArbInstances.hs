{-# LANGUAGE RankNTypes, FlexibleInstances, FlexibleContexts, KindSignatures, ScopedTypeVariables, TemplateHaskell, ConstraintKinds, TemplateHaskell #-}

module ArbInstances where

import IfCxt
import Test.QuickCheck
import Types

mkIfCxtInstances ''Arbitrary
