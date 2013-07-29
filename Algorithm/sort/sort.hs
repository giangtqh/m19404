-- bubble sort
import Data.Char (digitToInt)
import Data.List 
import Data.Ord

-- running the loop till sorting in complete or N iterations :
bubble_sort' :: Ord a => [a] ->Int->([a],Int)
bubble_sort' s i = case (_bsort s) of
	  t | i==(length(s)) || (t==s) ->(t,i)
	    | otherwise ->((bubble_sort' (t) (i+1)))
	 where
	-- x,x2 first 2 elements , xs remaining of the list
	-- compare x with x2 ,if x>x2 replace x with x2 in the list,can again perform comparision with remaining list
	-- if x<x2 then we proceed to compare the remaining elements from x2 to xs
	_bsort(x:x2:xs) | x>x2=x2:(_bsort (x:xs))          -- replace
			| otherwise =x:(_bsort(x2:xs))    -- already sorted	
	_bsort s = s
	

-- returns the sorted list and number of iterations take to perform sorting operation
-- main function for bubble sort
bubble_sort :: Ord a => [a] ->([a],Int)
bubble_sort s = bubble_sort' s 0


-- selection sort
selection_sort' :: Ord a=>[a]->[a]->Int->([a],Int)
-- required with no elements in unsorted list
selection_sort' sorted [] i = (sorted,i)		
selection_sort' sorted unsorted i 			
-- when no elements in unsorted list ,another way
		  | length(unsorted)==0 =(sorted,i)	
		  | otherwise = selection_sort' (minx:sorted) ( delete minx unsorted ) (i+1) 
-- elements in unsorted list,find the maximum 
-- remove from unsorted list
-- add to head of the sorted list
		where
		minx=(maximum unsorted)	-- find the maximum in unsorted list
-- main function for selection sort
selection_sort :: Ord a => [a]->([a],Int)
selection_sort s = selection_sort' [] s 0



-- insertion sort

-- function place element x is right position in list (y:ys)
_isort :: Ord a=>a->[a]->[a]
_isort x []= [x]
--- if ordered position found 
_isort x (y:ys) | x<y = x:y:ys 
 -- finding ordered position after y in ys
		| otherwise = y:(_isort x ys)
	

--return sorted list and number of iterations
insertion_sort' :: Ord a=>[a]->[a]->Int->([a],Int)	
-- no elements in unsorted list
insertion_sort' sorted [] i = (sorted,i)	
-- recursive call
insertion_sort' sorted (x:xs) i = insertion_sort' ( _isort x sorted ) xs (i+1)

-- main function for insertion sort			
insertion_sort :: Ord a => [a]->([a],Int)
insertion_sort s = insertion_sort' [] s 0



-- merge sort



merge_sort :: Ord a =>[a]->([a],Int)
