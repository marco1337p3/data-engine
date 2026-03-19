SELECT
    ID          AS beer_id,
    NAME        AS beer_name,
    STYLE       AS beer_style,
    ROUND(ABV, 2) AS abv,
    IBU,
    OUNCES,
    BREWERY_ID
FROM {{ source('beer_raw', 'BEER') }}
WHERE ABV IS NOT NULL