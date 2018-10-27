<?php
$url = "https://slack.com/api/emoji.list?pretty=1&token=";
$token = "";
$res = json_decode(file_get_contents($url.$token), true);

    foreach($res['emoji'] as $key => $val) {
        $fileName = $key.'.png';

        echo "downloading ".$key."\n";
        $data = file_get_contents($val);
        file_put_contents('./'.$fileName, $data);
    }