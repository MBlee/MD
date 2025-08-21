#### 数据类

```shell
# lodash
# validator
```

~~~js
#! lodash
const isEmpty = require('lodash/isEmpty')
~~~

~~~js
#! validator
const validator = require('validator')
validator.isEmpty()
validator.isEmail()
validator.equals(d1,d2)
~~~

#### 密码类

```shell
# crypto-es|js
```

```js
/*** crypto-es ***/
import CryptoES from 'crypto-es'
import {MD5} from 'crypto-es/lib/md5.js'

CryptoES.MD5('str').toString()
CryptoES.SHA1('str')|sha3('str')

```

