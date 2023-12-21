<?php 

$array1 = array('Satu', 'Dua', 'Tiga', 'Lima');
$array2 = array('Tiga', 'Empat', 'Lima', 'Enam');
$newArray = array();

$object1 = (object)['Satu', 'Dua', 'Tiga', 'Lima'];
$object2 = (object)['Tiga', 'Empat', 'Lima', 'Enam'];

echo "Array 1 : <br>";
print_r($array1);

echo "<br> Array 2 : <br>";
print_r($array2);

echo "<br><br>";
echo "Object 1 : <br>";
print_r($object1);

echo "<br> Object 2 : <br>";
print_r($object2);


//Soal A
$newArray = array_intersect($array1, $array2);
sort($newArray);
echo "<br><br>Array baru yang berisi irisan antara Array 1 dan Array 2 : <br>";
echo "<pre>";
print_r($newArray);
echo "</pre>";

//Soal B
$arrayObject1 = (array)$object1;
$arrayObject2 = (array)$object2;
$newArrayObject = array();

$newArrayObject = array_intersect($arrayObject1, $arrayObject2);
sort($newArrayObject);

$newObject = (object) $newArrayObject;

echo "<br>Object baru yang berisi irisan antara Object 1 dan Object 2 : <br>";
echo "<pre>";
print_r($newObject);
echo "</pre>";

?>
