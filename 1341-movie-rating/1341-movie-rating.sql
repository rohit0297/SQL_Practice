# Write your MySQL query statement below
WITH UserRatingCount AS  (
    SELECT u.name, COUNT(mr.movie_id) AS rating_count 
    FROM MovieRating mr 
    LEFT JOIN Users u
    ON u.user_id = mr.user_id
    GROUP BY u.name
),

MaxRating AS (
    SELECT name
    FROM UserRatingCount
    WHERE rating_count = (SELECT MAX(rating_count) FROM UserRatingCount)
    ORDER BY name
    LIMIT 1
),

MovieAvgRating AS (
    SELECT m.title, AVG(mr.rating) AS avg_rating
    FROM MovieRating mr
    JOIN Movies m
    ON mr.movie_id = m.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY m.title
),

MaxMovie AS (
    SELECT title
    FROM MovieAvgRating
    WHERE avg_rating = (SELECT MAX(avg_rating) FROM MovieAvgRating)
    ORDER BY title
    LIMIT 1 
)

SELECT name AS results FROM MaxRating

UNION ALL

SELECT title FROM MaxMovie