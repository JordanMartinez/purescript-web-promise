module Web.Promise.Internal where

import Prelude

import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2)
import Web.Promise.Rejection (Rejection)

foreign import data Promise :: Type -> Type

foreign import new :: forall a. EffectFn1 (EffectFn2 (EffectFn1 a Unit) (EffectFn1 Rejection Unit) Unit) (Promise a)

foreign import then_ :: forall a b. EffectFn2 (EffectFn1 a (Promise b)) (Promise a) (Promise b)

foreign import catch :: forall a b. EffectFn2 (EffectFn1 Rejection (Promise b)) (Promise a) (Promise b)

foreign import finally :: forall a. EffectFn2 (Effect (Promise Unit)) (Promise a) (Promise a)

foreign import resolve :: forall a. a -> Promise a

foreign import reject :: forall a. Rejection -> Promise a

foreign import all :: forall a. EffectFn1 (Array (Promise a)) (Promise (Array a))

foreign import race :: forall a. EffectFn1 (Array (Promise a)) (Promise a)