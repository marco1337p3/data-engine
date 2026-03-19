SELECT
ID AS brewery_id,
NAME AS brewery_name,
CITY AS brewery_city,
STATE AS brewery_state
FROM {{source('beer_raw', 'BREWERIES')}}