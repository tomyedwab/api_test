// Title: FooBar
// Description: Test description (ha!)

SELECT COUNT(*)
FROM (
  SELECT IFNULL(STRING(user_key.id), user_key.name) AS user_id
  FROM [2015_04_04.BaseUserMission]
  WHERE class = 'PersonalMission') pm
INNER JOIN (
  SELECT REGEXP_EXTRACT(__key__.path, '"UserData", "([^"]+)"') AS user_id
  FROM [2015_04_04_transformed.UserDataInfo]
  WHERE personal_recommendations_migrated != true
  GROUP EACH BY user_id) udi
ON pm.user_id = udi.user_id;
