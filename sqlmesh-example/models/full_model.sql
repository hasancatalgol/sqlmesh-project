MODEL (
  name sqlmesh_example.full_model,
  kind FULL,
  cron '@daily',
  grain item_id,
  audits (assert_positive_order_ids),
  description "Aggregates order count per item from the incremental model."
);

SELECT
  item_id,
  COUNT(DISTINCT id) AS num_orders,
FROM
  sqlmesh_example.incremental_model
GROUP BY item_id
  