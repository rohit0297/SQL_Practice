# Write your MySQL query statement below
WITH firstLogin AS (
    SELECT
        player_id,
        MIN(event_date) AS event_date
    FROM
        Activity
    GROUP BY
        player_id)

SELECT
    ROUND(COUNT(DISTINCT a.player_id)/COUNT(DISTINCT ed.player_id), 2) AS fraction
FROM
    firstLogin ed
LEFT JOIN
    Activity a
ON ed.player_id = a.player_id
AND a.event_date = DATE_ADD(ed.event_date, INTERVAL 1 DAY)