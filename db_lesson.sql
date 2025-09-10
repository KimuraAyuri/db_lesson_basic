
-- 練習問題


-- 1
CREATE TABLE epartmednts(
  department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP CURRENT_TIMESTAMP,
  updated_at TIMESTAMP CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 2
ALTER TABLE people ADD department_id INT UNSIGNED 'emailの後ろに追加する';

-- 3
INSERT INTO departments (name)
VALUES
  ('営業'),
  ('開発'),
  ('経理'),
  ('人事'),
  ('情報システム');

INSERT INTO people (name, email, age, gender, department_id)
VALUES
  ('高橋うきょう', 'takahashi@gizumo.jp', 24, 1, 1),
  ('岡田こうた', 'okada@gizumo.jp', 24, 1, 1),
  ('吉原あかり', 'yoshihara@gizumo.jp', 26, 2, 1),
  ('木村あゆり', 'kimura@gizumo.jp', 20, 2, 2),
  ('稲葉りん', 'inaba@gizumo.jp', 21, 2, 2),
  ('田代ののか', 'tashiro@gizumo.jp', 20, 2, 2),
  ('笹山ななか', 'sasayama@gizumo.jp', 20, 2, 2),
  ('坂野れいか', 'sakano@gizumo.jp', 22, 2, 3),
  ('野口しょうご', 'noguthi@gizumo.jp', 27, 1, 4),
  ('菅野こうすけ', 'kanno@gizumo.jp', 27, 1, 5);
  
INSERT INTO reports (person_id, content)
VALUES
  (7, '本日は資料作成に集中し、提案書を2件完成させました。'),
  (8, '午前中は会議対応、午後はクライアントへの返信業務を行いました。'),
  (9, '不具合の原因を特定し、修正対応を実施しました。'),
  (10, 'マニュアルの更新作業を進め、全体の6割を完了しました。'),
  (11, '新人の業務サポートを行い、手順の説明も担当しました。'),
  (12, '顧客対応でイレギュラーが発生しましたが、無事解決しました。'),
  (13, '社内レビューを通して、プロジェクト資料の改善点を指摘しました。'),
  (14, 'スケジュール調整を行い、来週の進行計画を再構築しました。'),
  (15, '昨日から継続中の分析作業を完了し、レポートを提出しました。'),
  (16, '定例ミーティングで進捗報告を実施し、次回課題を確認しました。');

-- 4
SELECT * FROM people;
UPDATE people SET department_id = 1 WHERE person_id IS NULL;

-- 5
SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;

-- 6
-- pepleテーブルから営業の人の名前、メール、年齢のレコードのみを
-- 作成日時の昇順で取得する。

-- 7
SELECT name FROM people 
WHERE (gender = 2 AND age BETWEEN 20 AND 29) OR (gender = 1 AND age BETWEEN 40 AND 49);

-- 8
SELECT * FROM people WHERE department_id = 1 ORDER BY age;

-- 9
SELECT AVG(age) AS average_age FROM people WHERE gender = 2 AND department_id = 2;

-- 10
SELECT p.name, d.name, r.content FROM people p 
JOIN reports r USING (person_id) JOIN departments d USING (department_id);

-- 11
SELECT p.name FROM people p LEFT JOIN reports r ON p.person_id = r.person_id
WHERE r.report_id IS NULL;
SHOW DATABASES;
CREATE DATABASE db_lesson;
SHOW DATABASES;
USE db_lesson;
SHOW TABLES;
CREATE TABLE `people` (
  `id` INT,
  `name` VARCHAR(255),
  `email` VARCHAR(255),
  `password` CHAR(8)
);
SHOW TABLES;
DESCRIBE people;
DROP TABLE people;
SHOW DATABASES;
CREATE TABLE people (
person_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
email VARCHAR(150) UNIQUE,
age INT,
gender TINYINT COMMENT '1が男、2が女',
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
DESC people;
ALTER TABLE people MODIFY age TINYINT UNSIGNED;
DROP TABLE people;
CREATE TABLE people (
person_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
email VARCHAR(150) UNIQUE,
age TINYINT UNSIGNED,
gender TINYINT COMMENT '1が男、2が女',
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
DESC people;
ALTER TABLE people MODIFY person_id INT UNSIGNED;
DESC people;
INSERT INTO people (name, email, age, gender)
  VALUES
  ('鈴木たかし', 'suzuki@gizumo.jp', 20, 1),
  ('田中ゆうこ', 'tanaka@gizumo.jp', 25, 2),
  ('福田だいすけ', 'fukuda@gizumo.jp', 42, 1),
  ('豊島はなこ', 'toyoshima@gizumo.jp', 34, 2),
  ('早坂てつお', 'hayasaka@gizumo.co.jp', 61, 1),
  ('不思議沢みちこ', NULL, NULL, NULL);
DESC field list;
SELECT * FROM people;
UPDATE people SET email = 'hayasaka@gizumo.jp' WHERE person_id = 5;
SELECT * FROM people WHERE person_id = 5;
DELETE FROM people WHERE person_id = 5;
SELECT * FROM people WHERE age > 40;  -- ageカラムが40よりも大きいレコードを取得
SELECT * FROM people WHERE age >= 40; -- ageカラムが40以上のレコードを取得
SELECT * FROM people WHERE age < 40;  -- ageカラムが40未満のレコードを取得
SELECT * FROM people WHERE age <= 40; -- ageカラムが40以下のレコードを取得
SELECT * FROM people WHERE name IN ('鈴木たかし', '豊島はなこ');
SELECT * FROM people WHERE name NOT IN ('鈴木たかし', '豊島はなこ');
SELECT * FROM people WHERE age > 40 AND gender = 1;  
SELECT * FROM people WHERE age > 40 OR age < 20;
SELECT * FROM people WHERE 20 <= age AND age <= 40;
SELECT * FROM people WHERE age BETWEEN 20 AND 40;
SELECT * FROM people WHERE age NOT BETWEEN 20 AND 40;
SELECT * FROM people WHERE age IS NULL;
SELECT * FROM people WHERE name LIKE '%こ';
SELECT * FROM people WHERE name LIKE '田%';
SELECT * FROM people WHERE name LIKE '%田%';
SELECT * FROM people LIMIT 3;
SELECT * FROM people LIMIT 3 OFFSET 3;
SELECT * FROM people LIMIT 3, 3;
SELECT DISTINCT gender FROM people;
SELECT DISTINCT gender, created_at FROM people;
CREATE TABLE reports (
report_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
person_id INT UNSIGNED NOT NULL,
content TEXT NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO reports(person_id, content)
 VALUES
 (1, 'hello'),
 (1, 'hello'),
 (2, 'hello'),
 (2, 'hello'),
 (3, 'hello'),
 (3, 'hello'),
 (4, 'hello'),
 (4, 'hello'),
 (5, 'hello'),
 (7, 'hello');
SELECT p.person_id, p.name, r.content FROM people p JOIN reports r USING (person_id);
SELECT p.person_id, p.name, r.content FROM people p LEFT OUTER JOIN reports r USING (person_id);
SELECT gender FROM people GROUP BY gender;
SELECT gender, MAX(age) AS max_age, MIN(age) AS min_age FROM people GROUP BY gender;
SELECT gender, COUNT(*) AS people_count FROM people GROUP BY gender;
SELECT gender, MAX(age) AS max_age, MIN(age) AS min_age FROM people GROUP BY gender;
SELECT AVG(age) AS average_age FROM people GROUP BY gender;
SELECT SUM(age) AS total_age FROM people GROUP BY gender;

-- 練習問題


-- 1
CREATE TABLE epartmednts(
  department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP CURRENT_TIMESTAMP,
  updated_at TIMESTAMP CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 2
ALTER TABLE people ADD department_id INT UNSIGNED 'emailの後ろに追加する';

-- 3
INSERT INTO departments (name)
VALUES
  ('営業'),
  ('開発'),
  ('経理'),
  ('人事'),
  ('情報システム');

INSERT INTO people (name, email, age, gender, department_id)
VALUES
  ('高橋うきょう', 'takahashi@gizumo.jp', 24, 1, 1),
  ('岡田こうた', 'okada@gizumo.jp', 24, 1, 1),
  ('吉原あかり', 'yoshihara@gizumo.jp', 26, 2, 1),
  ('木村あゆり', 'kimura@gizumo.jp', 20, 2, 2),
  ('稲葉りん', 'inaba@gizumo.jp', 21, 2, 2),
  ('田代ののか', 'tashiro@gizumo.jp', 20, 2, 2),
  ('笹山ななか', 'sasayama@gizumo.jp', 20, 2, 2),
  ('坂野れいか', 'sakano@gizumo.jp', 22, 2, 3),
  ('野口しょうご', 'noguthi@gizumo.jp', 27, 1, 4),
  ('菅野こうすけ', 'kanno@gizumo.jp', 27, 1, 5);
  
INSERT INTO reports (person_id, content)
VALUES
  (7, '本日は資料作成に集中し、提案書を2件完成させました。'),
  (8, '午前中は会議対応、午後はクライアントへの返信業務を行いました。'),
  (9, '不具合の原因を特定し、修正対応を実施しました。'),
  (10, 'マニュアルの更新作業を進め、全体の6割を完了しました。'),
  (11, '新人の業務サポートを行い、手順の説明も担当しました。'),
  (12, '顧客対応でイレギュラーが発生しましたが、無事解決しました。'),
  (13, '社内レビューを通して、プロジェクト資料の改善点を指摘しました。'),
  (14, 'スケジュール調整を行い、来週の進行計画を再構築しました。'),
  (15, '昨日から継続中の分析作業を完了し、レポートを提出しました。'),
  (16, '定例ミーティングで進捗報告を実施し、次回課題を確認しました。');

-- 4
SELECT * FROM people;
UPDATE people SET department_id = 1 WHERE person_id IS NULL;

-- 5
SELECT name, age FROM people WHERE gender = 1 ORDER BY age DESC;

-- 6
-- pepleテーブルから営業の人の名前、メール、年齢のレコードのみを
-- 作成日時の昇順で取得する。

-- 7
SELECT name FROM people 
WHERE (gender = 2 AND age BETWEEN 20 AND 29) OR (gender = 1 AND age BETWEEN 40 AND 49);

-- 8
SELECT * FROM people WHERE department_id = 1 ORDER BY age;

-- 9
SELECT AVG(age) AS average_age FROM people WHERE gender = 2 AND department_id = 2;

-- 10
SELECT p.name, d.name, r.content FROM people p 
JOIN reports r USING (person_id) JOIN departments d USING (department_id);

-- 11
SELECT p.name FROM people p LEFT JOIN reports r ON p.person_id = r.person_id
WHERE r.report_id IS NULL;
