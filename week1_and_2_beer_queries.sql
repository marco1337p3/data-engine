-- Total beers
SELECT COUNT(*) FROM BEER.PUBLIC.BEER;

-- Highest, lowest, average ABV
SELECT MAX(ABV), MIN(ABV), ROUND(AVG(ABV), 2) AS avg_abv
FROM BEER.PUBLIC.BEER;

-- Beers per style
SELECT STYLE, COUNT(*) AS number_of_beers
FROM BEER.PUBLIC.BEER
GROUP BY STYLE
ORDER BY number_of_beers DESC;

-- Strong beers above 8%
SELECT * FROM BEER.PUBLIC.BEER
WHERE ABV > 8;

-- Top 10 highest ABV
SELECT NAME, ABV
FROM BEER.PUBLIC.BEER
WHERE ABV IS NOT NULL
ORDER BY ABV DESC
LIMIT 10;

-- Rank by ABV
SELECT NAME, ABV,
    RANK() OVER (ORDER BY ABV DESC) AS abv_rank
FROM BEER.PUBLIC.BEER
WHERE ABV IS NOT NULL;

-- Average ABV by style using CTE
WITH avg_abv_by_style AS (
    SELECT
        NAME,
        STYLE,
        ROUND(ABV, 2) AS ABV,
        ROUND(AVG(ABV) OVER (PARTITION BY STYLE), 2) AS avg_abv
    FROM BEER.PUBLIC.BEER
    WHERE ABV IS NOT NULL
)
SELECT * FROM avg_abv_by_style;