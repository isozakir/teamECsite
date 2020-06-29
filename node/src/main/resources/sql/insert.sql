INSERT INTO mst_user(id, user_name,PASSWORD,family_name,first_name,family_name_kana,first_name_kana,gender,created_at,updated_at) VALUES
(1, "yamada@abc.com", "123456", "山田", "太郎", "やまだ", "たろう", 0, now(), now()),
(2, "tanaka@abc.com", "789123", "田中", "花子", "たなか", "はなこ", 1 , now(), now()),
(3, "suzuki@abc.com", "456789", "鈴木", "三郎", "すずき", "さぶろう", 0, now(), now());

INSERT INTO mst_category(id, category_name, created_at, updated_at) VALUES
(1, "北海道・東北地方", now(), now()),
(2, "関東・中部地方", now(), now()),
(3, "近畿地方", now(), now()),
(4, "中国・四国地方", now(), now()),
(5, "九州・沖縄地方", now(), now());

INSERT INTO mst_product(id, product_name, product_name_kana, product_description, category_id, price, image_full_path, release_date, release_company, created_at, updated_at) VALUES
(1, "じゃがいも", "じゃがいも", "sampleDescriptionForじゃがいも", 1, 2000, "/img/01.jpg", "2018/06/22", "Node", now(), now()),
(2, "牛タン", "ぎゅうたん", "sampleDescriptionFor牛タン", 1, 5000, "/img/02.jpg", "2018/06/22", "Node", now(), now()),
(3, "お茶", "おちゃ", "sampleDescriptionForお茶", 2, 1000, "/img/03.jpg", "2018/06/22", "Node", now(), now()),
(4, "そば", "そば", "sampleDescriptionForそば", 2, 3000, "/img/04.jpg", "2018/06/22", "Node", now(), now()),
(5, "神戸牛", "こうべぎゅう", "sampleDescriptionFor神戸牛", 3, 30000, "/img/05.jpg", "2018/06/22", "Node", now(), now()),
(6, "たこやき", "たこやき", "sampleDescriptionForたこやき", 3, 1000, "/img/06.jpg", "2018/06/22", "Node", now(), now()),
(7, "牡蠣", "かき", "sampleDescriptionFor牡蠣", 4, 3000, "/img/07.jpg", "2018/06/22", "Node", now(), now()),
(8, "みかん", "みかん", "sampleDescriptionForみかん", 4, 2000, "/img/08.jpg", "2018/06/22", "Node", now(), now()),
(9, "ゴーヤ", "ごーや", "sampleDescriptionForごーや", 5, 2500, "/img/09.jpg", "2018/06/22", "Node", now(), now()),
(10, "めんたいこ", "めんたいこ", "sampleDescriptionForめんたいこ", 5, 4000, "/img/10.jpg", "2018/06/22", "Node", now(), now());

INSERT INTO mst_destination(id, user_id, family_name, first_name, tel_number, address) VALUES
(1, 1, '山田', '太郎', "0353211111", '東京都新宿区西新宿2-8-1'),
(2, 2, '田中', '花子', "0112314111", '北海道札幌市中央区北3条西6丁目'),
(3, 3, '鈴木', '三郎', "0988662333", '沖縄県那覇市泉崎1-2-2');

INSERT INTO tbl_cart(id, user_id, product_id, product_count, created_at, updated_at)VALUES
(1, 1, 1, 2, now(), now()),
(2, 1, 2, 2, now(), now()),
(3, 1, 3, 2, now(), now()),
(4, 2, 4, 3, now(), now()),
(5, 2, 5, 3, now(), now()),
(6, 2, 6, 3, now(), now()),
(7, 3, 7, 4, now(), now()),
(8, 3, 8, 4, now(), now()),
(9, 3, 9, 4, now(), now());

INSERT INTO tbl_purchase_history(id, user_id, product_id, product_count, price, destination_id, status, purchased_at, created_at, updated_at)VALUES
(1, 1, 4, 2, 3000, 1, 1, now(), now(), now()),
(2, 1, 5, 2, 30000, 1, 1, now(), now(), now()),
(3, 1, 6, 2, 1000, 1, 1, now(), now(), now()),
(4, 2, 7, 3, 3000, 2, 1, now(), now(), now()),
(5, 2, 8, 3, 2000, 2, 1, now(), now(), now()),
(6, 2, 9, 3, 2500, 2, 1, now(), now(), now()),
(7, 3, 10, 4, 4000, 3, 1, now(), now(), now()),
(8, 3, 1, 4, 2000, 3, 1, now(), now(), now()),
(9, 3, 2, 4, 5000, 3, 1, now(), now(), now());