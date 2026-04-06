select max(R.year)
from recipes R;

-- Find the most number of servings for any ingredient
-- in a recipe
select A.iid, max(A.servings)
from assignments A;
group by A.iid;

-- Find the most number of servings for any ingredient
-- in a recipe (get the ingred name also)
select A.iid, I.name, max(A.servings)
from assignments A
join ingredients I
on A.iid=I.iid
group by A.iid, I.name;


-- Number of times each ingredient appears
-- count(*) = count rows
select A.iid, count(*)
from assignments A
group by A.iid;


-- Number of times each ingredient appears
-- but only for ingredients that appear at least twice
select A.iid, count(*)
from assignments A
group by A.iid
