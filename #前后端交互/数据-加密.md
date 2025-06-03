#### 加密

```js
// URI编码
- encodeURI(URL)
- decodeURI(URL)
- encodeURIComponent()
- decodeURIComponent()
```

- Base64

  - npm install js-base64 -S

  - Base64.btoa|atob

    Base64.encode|decode

- 编码|解码

  - escape|unescape(value)

- AES/DES-加解密

  - cnpm install crypto-js --save

  - CryptoJS.AES.encrypt(message, CryptoJS.enc.Utf8.parse(key),{

    ​	mode: CryptoJS.mode.ECB,

    ​	padding: CrytoJS.pad.Pkcs7

    }).toString()

  - CryptoJS.AES.descrypt(encrypt,

    CryptoJS.enc.Utf8.parse(key),{

    ​	mode: CryptoJS.mode.ECB,

    ​	padding: CrytoJS.pad.Pkcs7

    }).toString(CryptoJS.enc.Utf8)

- MD5（不可选）

  - npm install blueimp-md5 -S

  - hex_md5(value)

    b64_md5(value)

    str_md5(value)

- Sha1（不可选）

  - npm install js-sha1 -S
  - sha1(value)