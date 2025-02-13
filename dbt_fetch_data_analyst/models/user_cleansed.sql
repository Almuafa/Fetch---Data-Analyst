user as (
    select * from user_takehome
)
select 
id,
created_date,
birth_date,
state,
coalesce('unknown',null) as language,

-- standardizing the gender field
case when gender in 'non-specifeid' then  as 
gender

from user