functor
import
	Browser
	drawing_trees at 'drawing_trees.ozf'

	define
		Level=5 LeftLim=10 RootX RightLim

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

		TreeXY = {drawing_trees.AddXY T}

		{Browser.browse TreeXY}

    {drawing_trees.DepthFirst TreeXY Level LeftLim ?RootX ?RightLim}
    {Browser.browse RootX}
    {Browser.browse RightLim}
    {Browser.browse TreeXY}
	end
end