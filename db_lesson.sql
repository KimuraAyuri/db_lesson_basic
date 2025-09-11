
-- 練習問題


-- 1
CREATE TABLE epartmednts(
  department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  created_at TIMESTAMP CURRENT_TIMESTAMP,
  updated_at TIMESTAMP CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 2
ALTER TABLE people ADD department_id INT UNSIGNED;

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
-- people テーブルから、department_id が1、つまり営業の部署所属の方のレコードを対象に、
-- name・email・age カラムを取り出し、created_atカラム順、つまり作成日時順に並べるSQL文です。

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
