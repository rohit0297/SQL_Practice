# Write your MySQL query statement below
WITH friendCount AS (
    SELECT
        requester_id AS user_id,
        COUNT(*) AS friend_count
    FROM
        RequestAccepted
    GROUP BY
        requester_id
    UNION ALL
    SELECT
        accepter_id AS user_id,
        COUNT(*) AS friend_count
    FROM
        RequestAccepted
    GROUP BY
        accepter_id)

SELECT 
    user_id AS id,
    SUM(friend_count) AS num
FROM
    friendCount
GROUP BY
    id
ORDER BY
    num DESC
LIMIT 1