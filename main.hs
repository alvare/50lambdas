{-# LANGUAGE OverloadedStrings, LambdaCase #-}
module Main where

import Control.Applicative
import Data.MarkovChain (run)
import Data.Char
import System.Random
import System.Environment
import Data.ByteString (ByteString)
import qualified Data.ByteString as B


main :: IO ()
main = do
    getArgs >>= \case
        [n', f'] -> do
            let (n, f) = (read n', read f') :: (Int, Int)
            words <- B.split (fromIntegral . ord $ ' ') <$> B.readFile "corpus"
            start <- randomRIO (0, length words)
            loop n $ run f words start (mkStdGen 9878)
        _ -> error "Must supply 2 arguments"

loop :: Int -> [ByteString] -> IO ()
loop n markov = do
    let (this, next) = splitAt n markov
    mapM_ (\w -> B.putStr w >> B.putStr " ") this
    _ <- getLine
    loop n next
