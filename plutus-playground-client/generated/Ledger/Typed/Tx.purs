-- File auto generated by purescript-bridge! --
module Ledger.Typed.Tx where

import Prelude
import Control.Lazy (defer)
import Data.Argonaut.Core (jsonNull)
import Data.Argonaut.Decode (class DecodeJson)
import Data.Argonaut.Decode.Aeson ((</$\>), (</*\>), (</\>))
import Data.Argonaut.Encode (class EncodeJson, encodeJson)
import Data.Argonaut.Encode.Aeson ((>$<), (>/\<))
import Data.Bounded.Generic (genericBottom, genericTop)
import Data.Enum (class Enum)
import Data.Enum.Generic (genericPred, genericSucc)
import Data.Generic.Rep (class Generic)
import Data.Lens (Iso', Lens', Prism', iso, prism')
import Data.Lens.Iso.Newtype (_Newtype)
import Data.Lens.Record (prop)
import Data.Maybe (Maybe(..))
import Data.Newtype (unwrap)
import Data.Show.Generic (genericShow)
import Data.Tuple.Nested ((/\))
import Plutus.V1.Ledger.Address (Address)
import Plutus.V1.Ledger.Scripts (DatumHash)
import Plutus.V1.Ledger.Tx (TxInType, TxOutRef)
import Type.Proxy (Proxy(Proxy))
import Data.Argonaut.Decode.Aeson as D
import Data.Argonaut.Encode.Aeson as E
import Data.Map as Map

data ConnectionError
  = WrongValidatorAddress Address Address
  | WrongOutType WrongOutTypeError
  | WrongInType TxInType
  | MissingInType
  | WrongValidatorType String
  | WrongRedeemerType String
  | WrongDatumType String
  | NoDatum TxOutRef DatumHash
  | UnknownRef

derive instance eqConnectionError :: Eq ConnectionError

instance showConnectionError :: Show ConnectionError where
  show a = genericShow a

instance encodeJsonConnectionError :: EncodeJson ConnectionError where
  encodeJson =
    defer \_ -> case _ of
      WrongValidatorAddress a b -> E.encodeTagged "WrongValidatorAddress" (a /\ b) (E.tuple (E.value >/\< E.value))
      WrongOutType a -> E.encodeTagged "WrongOutType" a E.value
      WrongInType a -> E.encodeTagged "WrongInType" a E.value
      MissingInType -> encodeJson { tag: "MissingInType", contents: jsonNull }
      WrongValidatorType a -> E.encodeTagged "WrongValidatorType" a E.value
      WrongRedeemerType a -> E.encodeTagged "WrongRedeemerType" a E.value
      WrongDatumType a -> E.encodeTagged "WrongDatumType" a E.value
      NoDatum a b -> E.encodeTagged "NoDatum" (a /\ b) (E.tuple (E.value >/\< E.value))
      UnknownRef -> encodeJson { tag: "UnknownRef", contents: jsonNull }

instance decodeJsonConnectionError :: DecodeJson ConnectionError where
  decodeJson =
    defer \_ ->
      D.decode
        $ D.sumType "ConnectionError"
        $ Map.fromFoldable
            [ "WrongValidatorAddress" /\ D.content (D.tuple $ WrongValidatorAddress </$\> D.value </*\> D.value)
            , "WrongOutType" /\ D.content (WrongOutType <$> D.value)
            , "WrongInType" /\ D.content (WrongInType <$> D.value)
            , "MissingInType" /\ pure MissingInType
            , "WrongValidatorType" /\ D.content (WrongValidatorType <$> D.value)
            , "WrongRedeemerType" /\ D.content (WrongRedeemerType <$> D.value)
            , "WrongDatumType" /\ D.content (WrongDatumType <$> D.value)
            , "NoDatum" /\ D.content (D.tuple $ NoDatum </$\> D.value </*\> D.value)
            , "UnknownRef" /\ pure UnknownRef
            ]

derive instance genericConnectionError :: Generic ConnectionError _

--------------------------------------------------------------------------------
_WrongValidatorAddress :: Prism' ConnectionError { a :: Address, b :: Address }
_WrongValidatorAddress =
  prism' (\{ a, b } -> (WrongValidatorAddress a b)) case _ of
    (WrongValidatorAddress a b) -> Just { a, b }
    _ -> Nothing

_WrongOutType :: Prism' ConnectionError WrongOutTypeError
_WrongOutType =
  prism' WrongOutType case _ of
    (WrongOutType a) -> Just a
    _ -> Nothing

_WrongInType :: Prism' ConnectionError TxInType
_WrongInType =
  prism' WrongInType case _ of
    (WrongInType a) -> Just a
    _ -> Nothing

_MissingInType :: Prism' ConnectionError Unit
_MissingInType =
  prism' (const MissingInType) case _ of
    MissingInType -> Just unit
    _ -> Nothing

_WrongValidatorType :: Prism' ConnectionError String
_WrongValidatorType =
  prism' WrongValidatorType case _ of
    (WrongValidatorType a) -> Just a
    _ -> Nothing

_WrongRedeemerType :: Prism' ConnectionError String
_WrongRedeemerType =
  prism' WrongRedeemerType case _ of
    (WrongRedeemerType a) -> Just a
    _ -> Nothing

_WrongDatumType :: Prism' ConnectionError String
_WrongDatumType =
  prism' WrongDatumType case _ of
    (WrongDatumType a) -> Just a
    _ -> Nothing

_NoDatum :: Prism' ConnectionError { a :: TxOutRef, b :: DatumHash }
_NoDatum =
  prism' (\{ a, b } -> (NoDatum a b)) case _ of
    (NoDatum a b) -> Just { a, b }
    _ -> Nothing

_UnknownRef :: Prism' ConnectionError Unit
_UnknownRef =
  prism' (const UnknownRef) case _ of
    UnknownRef -> Just unit
    _ -> Nothing

--------------------------------------------------------------------------------
data WrongOutTypeError
  = ExpectedScriptGotPubkey
  | ExpectedPubkeyGotScript

derive instance eqWrongOutTypeError :: Eq WrongOutTypeError

derive instance ordWrongOutTypeError :: Ord WrongOutTypeError

instance showWrongOutTypeError :: Show WrongOutTypeError where
  show a = genericShow a

instance encodeJsonWrongOutTypeError :: EncodeJson WrongOutTypeError where
  encodeJson = defer \_ -> E.encode E.enum

instance decodeJsonWrongOutTypeError :: DecodeJson WrongOutTypeError where
  decodeJson = defer \_ -> D.decode D.enum

derive instance genericWrongOutTypeError :: Generic WrongOutTypeError _

instance enumWrongOutTypeError :: Enum WrongOutTypeError where
  succ = genericSucc
  pred = genericPred

instance boundedWrongOutTypeError :: Bounded WrongOutTypeError where
  bottom = genericBottom
  top = genericTop

--------------------------------------------------------------------------------
_ExpectedScriptGotPubkey :: Prism' WrongOutTypeError Unit
_ExpectedScriptGotPubkey =
  prism' (const ExpectedScriptGotPubkey) case _ of
    ExpectedScriptGotPubkey -> Just unit
    _ -> Nothing

_ExpectedPubkeyGotScript :: Prism' WrongOutTypeError Unit
_ExpectedPubkeyGotScript =
  prism' (const ExpectedPubkeyGotScript) case _ of
    ExpectedPubkeyGotScript -> Just unit
    _ -> Nothing
