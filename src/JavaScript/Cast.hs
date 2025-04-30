{-# OPTIONS_GHC -Wno-redundant-constraints #-}
{-# LANGUAGE CPP #-}
#if __GLASGOW_HASKELL__ < 908
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE JavaScriptFFI #-}
#endif
{-# LANGUAGE ScopedTypeVariables #-}

module JavaScript.Cast ( Cast(..)
                       , cast
                       , unsafeCast
                       ) where

import GHCJS.Prim

import Unsafe.Coerce

cast :: forall a. Cast a => JSVal -> Maybe a
cast _ = Nothing
{-# INLINE cast #-}

-- | Don't ever run this in GHC - guaranteed segfault
unsafeCast :: Cast a => JSVal -> a
unsafeCast = unsafeCoerce
{-# INLINE unsafeCast #-}

class Cast a where
  unsafeWrap  :: JSVal -> a
  instanceRef :: a -> JSVal
