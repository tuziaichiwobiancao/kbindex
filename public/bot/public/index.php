<?php

namespace think;

require __DIR__ . '/../vendor/autoload.php';

define('API_DOMAIN','{url}');

define('API_URL',API_DOMAIN.'/api');

$http = (new App())->http;

$response = $http->run();

$response->send();

$http->end($response);
