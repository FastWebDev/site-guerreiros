<?php 

$query['pavmegamenu'][]  = "DELETE FROM `".DB_PREFIX ."setting` WHERE `code`='pavmegamenu_params' and `key` = 'pavmegamenu_params'";
$query['pavmegamenu'][] =  " 
INSERT INTO `".DB_PREFIX ."setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(0, 0, 'pavmegamenu_params', 'pavmegamenu_params', '[{\"id\":40,\"group\":0,\"cols\":1,\"subwidth\":900,\"submenu\":1,\"align\":\"aligned-left\",\"rows\":[{\"cols\":[{\"widgets\":\"wid-50\",\"colwidth\":2},{\"widgets\":\"wid-43\",\"colwidth\":5},{\"widgets\":\"wid-44\",\"colwidth\":5}]}]},{\"submenu\":1,\"subwidth\":350,\"id\":2,\"align\":\"aligned-left\",\"group\":0,\"cols\":3,\"rows\":[{\"cols\":[{\"widgets\":\"wid-49\",\"colwidth\":12}]}]},{\"id\":19,\"group\":0,\"cols\":1,\"submenu\":1,\"align\":\"aligned-left\",\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":12}]}]},{\"id\":23,\"group\":0,\"cols\":1,\"submenu\":1,\"align\":\"aligned-left\",\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":12}]}]},{\"id\":29,\"group\":0,\"cols\":1,\"submenu\":1,\"align\":\"aligned-left\",\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":12}]}]}]', 0);
";

$query['pavverticalmenu'][]  = "DELETE FROM `".DB_PREFIX ."setting` WHERE `code`='pavverticalmenu_params' and `key` = 'params'";
$query['pavverticalmenu'][] =" 
INSERT INTO `".DB_PREFIX ."setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(0, 0, 'pavverticalmenu_params', 'params', '[{\"id\":2,\"group\":0,\"cols\":3,\"subwidth\":525,\"submenu\":1,\"rows\":[{\"cols\":[{\"widgets\":\"wid-23\",\"colwidth\":12},{\"widgets\":\"wid-31\",\"colwidth\":12}]}]},{\"submenu\":1,\"subwidth\":893,\"id\":5,\"group\":0,\"cols\":1,\"rows\":[{\"cols\":[{\"widgets\":\"wid-27\",\"colwidth\":3},{\"widgets\":\"wid-29\",\"colwidth\":9}]}]},{\"id\":3,\"group\":0,\"cols\":1,\"submenu\":1,\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":12}]}]},{\"id\":26,\"group\":0,\"cols\":1,\"submenu\":1,\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":12}]}]},{\"id\":28,\"group\":0,\"cols\":1,\"submenu\":1,\"rows\":[{\"cols\":[{\"type\":\"menu\",\"colwidth\":12}]}]}]', 0);
";

$query['pavblog'][] ="
INSERT INTO `".DB_PREFIX ."layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES

(33, 12, 0, 'pavblog/'),
(222, 16, 0, 'pavblog/blogs'),
(221, 16, 0, 'pavblog/category'),
(220, 16, 0, 'pavblog/blog');

";
$query['pavblog'][] ="
INSERT INTO `".DB_PREFIX ."layout` (`layout_id`, `name`) VALUES
(16, 'Pav Blog');
";
?>