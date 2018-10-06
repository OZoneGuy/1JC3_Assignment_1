{- Assignment 1
 - Name: Omar Alkersh
 - Date: 22/09/2018
 -}
module Assign_1 where
import           Data.Complex

macid :: String
macid = "alkersho"
{-
 - Throughout this file I will be referring to https://proofwiki.org/wiki/Cardano%27s_Formula
 - and the variables listed within it.
 - Equation in the form of: ax^3 + bx^2 + cx + d = 0
-}
{- -----------------------------------------------------------------
 - cubicQ
 - -----------------------------------------------------------------
 - Description: Finds Q, refer to website
 -}
cubicQ :: Double -> Double -> Double -> Double
cubicQ a b c = ((3*a*c)-b^2)/(9*a^2)

{- -----------------------------------------------------------------
 - cubicR
 - -----------------------------------------------------------------
 - Description: Finds R using
 -}
cubicR :: Double -> Double -> Double -> Double -> Double
cubicR a b c d = ((9*a*b*c)-(27*a^2*d)-(2*b^3))/(54*a^3)

{- -----------------------------------------------------------------
 - cubicDisc
 - -----------------------------------------------------------------
 - Description: Finds the discriminant
 - when the disc > 0, there is one real solution
 - when the disc = 0, there are two real solutions
 - when the disc < 0, there are three real solutions
 -}
cubicDisc :: Double -> Double -> Double
cubicDisc q r = q^3 + r^2


--Returns the cube root of a number
cubeRoot :: Double -> Double
cubeRoot x = x ** (1/3)

{- -----------------------------------------------------------------
 - cubicS
 - -----------------------------------------------------------------
 - Description: Finds S using Q and R
 -}
cubicS :: Double -> Double -> Double
cubicS q r = cubeRoot(r+sqrt(q^3 + r^2))

{- -----------------------------------------------------------------
 - cubicT
 - -----------------------------------------------------------------
 - Description: Finds T using Q and R
 -}
cubicT :: Double -> Double -> Double
cubicT q r = cubeRoot(r-sqrt(q^3 + r^2))



{- -----------------------------------------------------------------
 - cubicRealSolutions
 - -----------------------------------------------------------------
 - Description: Finds the roots/solutions of the cubic equaition
 - when the disc > 0, there is one real solution
 - when the disc = 0, there are two real solutions
 - when the disc < 0, there are three real solutions
 -}
cubicRealSolutions :: Double -> Double -> Double -> Double -> [Double]
cubicRealSolutions a b c d =
  let
    q = cubicQ a b c
    r = cubicR a b c d
    s = cubicS q r
    t = cubicT q r
    x1 = s + t - (b / (3*a))
    x2 = -((s+t)/2)-(b/3*a)+((sqrt 3 / 2)*(s-t))
    tol = 1e-5
    in if cubicDisc q r > 0
     then [x1]
     else if abs (cubicDisc q r) == 0.0
       then [x1, x2, x2]
       else []
{- -----------------------------------------------------------------
 - Test Cases
 - -----------------------------------------------------------------
 -}

--test returns True if test succeds
--Formulae in question:
-- x^3 + 3x^2 + 3x + 1 = (x+1)^3
-- x^3 - 6x^2 + 9x + 0 = x(x-3)^2
test :: (Double, Double) -> (Double, Double) -> (Double, Double) -> Bool
test xs1 xs2 xs3 = let
 a = fst xs1 * fst xs2 * fst xs3 
 b = fst xs1 * fst xs2 * snd xs3 + fst xs1 * snd xs2 * fst xs3 + snd xs1 * fst xs2 * fst xs3
 c = fst xs1 * snd xs2 * snd xs3 + snd xs1 * fst xs2 * snd xs3 + snd xs1 * snd xs2 * fst xs3
 d = snd xs1 * snd xs2 * snd xs3
 x1 = -(snd xs1 / fst xs1)
 x2 = -(snd xs2 / fst xs2)
 x3 = -(snd xs3 / fst xs3)
 in cubicRealSolutions a b c d == [x1, x2, x2] || cubicRealSolutions a b c d == [] || cubicRealSolutions a b c d == [x1]
 









