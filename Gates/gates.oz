functor
export 
   andg:AndG
   org:OrG
   nandg:NandG
   norg:NorG
   xorg:XorG
   
define
   fun{GateMaker F}
      fun {$ Xs Ys}
         fun {GateLoop Xs Ys}
            case Xs#Ys of (X|Xr)#(Y|Yr) then 
               {F X Y}|{GateLoop Xr Yr}
            end
         end
      in
         thread {GateLoop Xs Ys} end
      end   
   end

   AndG  =  {GateMaker fun{$ Xs Ys} Xs*Ys end}
   OrG   =  {GateMaker fun{$ Xs Ys} Xs+Ys-Xs*Ys end}
   NandG =  {GateMaker fun{$ Xs Ys} 1-Xs*Ys end}
   NorG  =  {GateMaker fun{$ Xs Ys} 1-Xs-Ys+Xs*Ys end}
   XorG  =  {GateMaker fun{$ Xs Ys} Xs+Ys-2*Xs*Ys end}
end

