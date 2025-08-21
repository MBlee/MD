

## ......

## 基本语法

```php
# 数据类型
gettype($b)
var_dump($b)
printf|sprintf('%s',...)
print_r($b)
# 判断空值 
- isset($b)
- empty($b)
- is_null($b)
# 全局变量|常量
$GLOBALS
$_SERVER
$_REQUEST|$_POST|$_GET
$_FILES|$_ENV
define('const','val') => const('$b')
const k = 'val'
get_defined_constants(true)('k')
__LINE__|__DIR__|__FILE__
__FUNCTION__|__CLASS__|__METHOD__
# 字符串
- "{$b}"
- <<<EOF EOF;
# 日期
date()|time()
strtotime()
# 数组
$arr = array('',...)
$arr = [''=>'',...]
$arr[0]
foreach($arr as $key=>$val){}
- count($arr)
- +|
# 函数
unset($b)
isset($b)
declare(strict_types=1)
function fn(int $a,int $b){
	global $b
    static $b
}
```

```php
## 类
interface I
abstract Abs { abstract functions }
trait T => use T1,T2 { T1::fn inteadof T2, T1::fn as TFn }
class Cls implements I1,I2
final class Cls extends C{
  	const CON = ''
	public|protected|private static
   	function __construct()
    function __destruct()
    self::|parent::|static::
  	func_get_args()|func_num_args()
}
```

```php
## 服务器
- htmlspecialchars($_POST['user'])
## 数据库（MySQLi）
# 面向过程
$conn = mysqli_connect($servername,$user,$password)
if(!$conn) { die('err:'.mysqli_connect_error()) }
	try catch($e) die('err:'.$e->getMessage())
mysqli_close($conn)
# 面向对象
$conn = new mysqli($servername,$user,$password)
if($conn->connect_error){ die('err:'.$conn->connect_error) }

$conn->real_escape_string($sql)
$ps = $conn->prepare($sql)
$ps->bind_param('ss',$?,$?)
$ps->execute()
$res=$ps->get_result()
if($ps->affected_rows>0) echo 'success'

$conn->execute_query($sql,[...])  
  
if($conn->query($sql) === TRUE) ...else echo $conn->error
if($conn->multi_query($sql) === TRUE) ...else echo $conn->error
$res = $conn->query($sql)
if($res->num_rows >0){
	while($row= $res->fetch_row|assoc())    
	while($row= $res->fetch_all(MYSQLI_ASSOC))    
	while($row= $res->fetch_array())    
}
$res->free_result()
## 数据库（PDO）
```

## 命令行

```php
# 获取命令行输入
$input = readline('请输入：')
$input = fgets(STDIN)
```

## 应用架构

- PhpStudy
- CodeRunner（VSCode）


## 案例