SELECT
    user_id,
    inventory.item_id,
    inventory.amount
FROM
    USER
INNER JOIN inventory ON inventory.user_id = user_id
WHERE user_id=3
