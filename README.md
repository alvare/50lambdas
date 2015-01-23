50 Shades of Lambda
===================

Source code for [50 Shades of Lambda](http://50shadesoflambda.tumblr.com/).

A dead simple implementation of [Data.MarkovChain](https://hackage.haskell.org/package/markov-chain)

## Usage

Just build a file named `corpus` with the texts `cat` together.

Then:

```bash
cabal update
cabal install --only-dependencies
cabal run <n> <k>
# for example:
# cabal run 200 3
```

The program runs in an infinite loop. It spits "pages" of **n** words
from a markov chain with a prediction context of size **k**.
You can ask for the next "page" by pressing **Enter**.
