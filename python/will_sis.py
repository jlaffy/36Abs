import qualified Data.Map as M
import Data.Maybe

main =
    let pairs = buildFinalMap actualData
        in print $ findMatches ["H1", "A3"] pairs

        actualData =
            [(["H1", "A3", "L2"], "Ross Geller")
                 ,(["H2", "A2", "L2"], "Monica Geller")
                 ,(["H1", "A1", "L3"], "Chandler Bing")
                 ,(["H3", "A1", "L1"], "Joey Tribbiani")
                 ,(["H1", "A3", "L1"], "Pheobe Buffet")
                 ]

            primeAlist =
                [("L1", 2)
                     ,("L2", 3)
                     ,("L3", 5)
                     ,("H1", 7)
                     ,("H2", 11)
                     ,("H3", 13)
                     ,("A1", 17)
                     ,("A2", 19)
                     ,("A3", 23)
                     ]

                primeMap key = M.lookup key $ M.fromList primeAlist

                sumKeys = product . catMaybes . map primeMap

                buildFinalMap = foldl (\acc (keys,v) -> (sumKeys keys, v):acc) []

                findMatches keys =
                    let total = sumKeys keys
                        in map snd . filter (\(k,_) -> k `mod` total == 0)
