-- Find all ingredients in two particular recipes
select distinct I.iid, I.name
from   ingredients I
join   assignments A using (iid)
join   recipes R using (rid)
where  R.name = 'Spiced Pumpkin Soup'
    or R.name = 'Sugar Cookie Icing';

-- alt approach
select I.iid, I.name
from   ingredients I
join   assignments A using (iid)
join   recipes R using (rid)
where  R.name = 'Spiced Pumpkin Soup'
union
select I.iid, I.name
from   ingredients I
join   assignments A using (iid)
join   recipes R using (rid)
where  R.name = 'Sugar Cookie Icing';

-- Review from last time
-- Get maximum servings for each ingredient
-- with ingredients in at least two recipes
select I.iid, I.name, MAX(A.servings)
from   assignments A
join   ingredients I using (iid)
group by I.iid, I.name
having count(*) >= 2;


--For each ingredient with at least 100 calories per serving, find the number of recipes that it appears in.

select I.iid, I.name, count(*) as count
from ingredients I
join assignments A using (iid)
group by I.iid, I.name
having cal >= 50;




-- Show the decade and the average recipe rating for that decade, for the decades where the average rating is less than 8.0. You should completely exclude all recipes with titles with 20 characters or less.

select 10*(R.year / 10) as decade, AVG(rating)
from recipes R
where length(R.name)  > 15
group by decade
having avg(rating) < 8.0;


--- Another subquery example
select R.rid, R.name
from   recipes R
where  R.year = (select max(R2.year)
                 from recipes R2);

-- An alternative approach is to
-- represent the subquery as virtually done

with my_temp_result(year) as
    (select max(recipes.year)
     from recipes)
select R.rid, R.name
from recipes R
join my_temp_result using (year);

-- "with" creates a temporary virtual relation
-- called a "view"
-- or a CTE (common table expression)


-- insert into recipes values (10, 'Cheeseburgered Apple Pie', 2, 2026);

-- Get count of ingredients for all recipes
select r.rid, r.name, count(*)
from recipes R
join assignments A using (rid)
group by r.rid, r.name;

select *
from recipes R
join assignments A using (rid);


-- ^^^^ missing new recipe

-- want a version of the join that says
-- if there are any tuples in the left
-- relation that are not in the right,
-- keep them anyway
select *
from recipes R
left outer join assignments A using (rid);

-- bad, counts 1 for new recipe
select r.rid, r.name, count(*)
from recipes R
left outer join assignments A using (rid)
group by r.rid, r.name;

-- good, counts nulls as not counting (0)
select r.rid, r.name, count(iid)
from recipes R
left outer join assignments A using (rid)
group by r.rid, r.name;





















