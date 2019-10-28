functor
import
   Browser
   Gates at 'gates.ozf'

define

   A = 0|0|1|1|_
   B = 1|0|1|0|_
   C = 0|1|0|1|_
   D = 1|1|0|0|_
   E = 1|0|0|1|_
   F = 0|1|1|0|_
   
   Exp = {Gates.xorg {Gates.andg {Gates.org A B} C} {Gates.nandg {Gates.norg D F} E}}

   {Browser.browse Exp}
   
end