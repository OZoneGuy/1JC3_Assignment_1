{- Assignment 1
 - Name: Omar Alkersh
 - Date: TODO add of completion
 -}
module Assign_1_ExtraCredit where

import           Data.Complex
-- see https://www.stackage.org/haddock/lts-8.24/base-4.9.1.0/Data-Complex.html

macid = "alkersho"

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
cubeRoot x = signum x * abs x ** (1/3)



{- -----------------------------------------------------------------
 - cubicS
 - -----------------------------------------------------------------
 - Description: Finds S using Q and R
 -}
cubicS :: Double -> Double -> Double
cubicS q r = cubeRoot(r+sqrt(q^3 + r^2))

cubicComplexS :: Double -> Double -> Complex Double
cubicComplexS q r = if cubicDisc q r >= 0
 then (cubicS q r :+ 0)
 else ((r + sqrt(-(q^3 + r^2))):+1)**(1/3)


{- -----------------------------------------------------------------
 - cubicT
 - -----------------------------------------------------------------
 - Description: Finds T using Q and R
 -}
cubicT :: Double -> Double -> Double
cubicT q r = cubeRoot(r-sqrt(q^3 + r^2))

cubicComplexT :: Double -> Double -> Complex Double
cubicComplexT q r = if cubicDisc q r >= 0
 then (cubicT q r :+ 0)
 else ((r - sqrt(-(q^3 + r^2))):+1)**(1/3)

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
       
       
cubicComplexSolutions :: Double -> Double -> Double -> Double -> [Complex Double]
cubicComplexSolutions a b c d =
  let
    q = cubicQ a b c
    r = cubicR a b c d
    s = cubicComplexS q r
    t = cubicComplexT q r
    x1 = (realPart s + realPart t - (b / (3*a))):+ (imagPart s + imagPart t)
    fstTrm = (realPart s + realPart t)/2 :+ (imagPart s + imagPart t)/2 --returns a complex number
    sndTrm = b/(3*a) -- returns a real number
    sDt = (realPart s - realPart t) :+ (imagPart s - imagPart t)
    trdTrm = (-(((sqrt 3)/2)*imagPart sDt)) :+ ((sqrt 3)/2)*realPart sDt-- returns a complex number
    x2 = (-(realPart fstTrm) - sndTrm + (realPart trdTrm)):+( -(imagPart fstTrm) + (imagPart trdTrm))
    x3 = (-realPart fstTrm - sndTrm - realPart trdTrm):+( - imagPart fstTrm - imagPart trdTrm)
    in [x1, x2, x3]






