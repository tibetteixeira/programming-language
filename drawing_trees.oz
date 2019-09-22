declare T Scale=30 FullLeft
T = tree(key:a val:111
	 left:tree(key:b val:55
		   left:tree(key:x val:100
			     left:tree(key:z val:56 left:leaf right:leaf)
			     right:tree(key:w val:23 left:leaf right:leaf))
		   right:tree(key:y val:105 left:leaf
			      right:tree(key:r val:77 left:leaf right:leaf)))
	 right:tree(key:c val:123
		    left:tree(key:d val:119
			      left:tree(key:g val:44 left:leaf right:leaf)
			      right:tree(key:h val:50
					 left:tree(key:i val:5 left:leaf right:leaf)
					 right:tree(key:j val:6 left:leaf right:leaf)))
		    right:tree(key:e val:133 left:leaf right:leaf)))

proc {FullLeft Tree ?Key ?Value}
   case Tree
   of tree(key:K val:V left:leaf right:R) then
      Key = K
      Value = V
   [] tree(key:K val:V left:L right:R) then
      {FullLeft L ?Key ?Value}
   end
end

local X Y
in
   {FullLeft T X Y}
   {Browse X}
   {Browse Y}
end



proc {DepthFirst Tree Level LeftLim ?RootX ?RightLim}
   case Tree
   of tree(key:K val:V left:leaf right:leaf) then
      X=RootX=RightLim=LeftLim
      Y=Scale*Level
   [] tree(x:X y:Y left:L right:leaf) then
      X=RootX
      Y=Scale*Level
      {DepthFirst L Level+1 LeftLim RootX RightLim}
   [] tree(x:X y:Y left:leaf right:R) then
      X=RootX
      Y=Scale*Level
      {DepthFirst R Level+1 LeftLim RootX RightLim}
   [] tree(x:X y:Y left:L right:R) then
      LRootX LRightLim RRootX RLeftLim
   in
      Y=Scale*Level
      {DepthFirst L Level+1 LeftLim LRootX LRightLim}
      RLeftLim=LRightLim+Scale
      {DepthFirst R Level+1 RLeftLim RRootX RightLim}
      X=RootX=(LRootX+RRootX) div 2
   end
end

proc {DepthFirst Tree}
   case Tree
   of tree(left:L right:R) then
      {DepthFirst L}
      {DepthFirst R}
   [] leaf then
      skip
   end
end

fun {AddXY Tree}
   case Tree
   of tree(left:L right:R ...) then
      {Adjoin Tree
       tree(x:_ y:_ left:{AddXY L} right:{AddXY R})}
   [] leaf then
      leaf
   end
end