SELECT
    b.beer_id,
    b.beer_name,
    b.beer_style,
    b.abv,
    b.ibu,
    b.ounces,
    br.brewery_name,
    br.brewery_city,
    br.brewery_state,
FROM {{ref('stg_beers')}} b
LEFT JOIN {{ref('stg_breweries')}} br
    ON b.brewery_id = br.brewery_id