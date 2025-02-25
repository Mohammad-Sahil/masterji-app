# masterji user app

## bugs

1. ios splash screen (need to verify)
2. language choose ripple effect (done)
3. backspace in otp (done)
4. toast on false otp response (done)
5. maps in ios (permission and keys) (will be done during ios build)

## TODO PRODUCTION

1. package change (android done)
2. MAPS API KEY (done)
3. RAZOR PAY KEY (done)
4. about icon
5. firebase account connect (done)
6. apply coupen (not in scope)

## KEYS

```
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
```

Output

```
Alias name: androiddebugkey
Creation date: 03-Apr-2019
Entry type: PrivateKeyEntry
Certificate chain length: 1
Certificate[1]:
Owner: C=US, O=Android, CN=Android Debug
Issuer: C=US, O=Android, CN=Android Debug
Serial number: 1
Valid from: Wed Apr 03 17:09:47 IST 2019 until: Fri Mar 26 17:09:47 IST 2049
Certificate fingerprints:
         MD5:  13:43:B8:F7:D5:72:2A:05:FA:2E:C1:18:E9:36:80:4A
         SHA1: 98:A1:04:5D:C9:2F:9D:60:9D:9E:32:81:96:38:4F:1C:6D:24:53:2C
         SHA256: 21:B3:61:60:E1:17:C9:19:BD:A5:A1:97:92:94:5F:17:F5:54:D7:9E:D7:E1:6E:58:09:B7:C3:3D:19:7C:98:EA
Signature algorithm name: SHA1withRSA
Subject Public Key Algorithm: 1024-bit RSA key
Version: 1

Warning:
The JKS keystore uses a proprietary format. It is recommended to migrate to PKCS12 which is an industry standard format using "keytool -importkeystore -srckeystore /home/aditya/.android/debug.keystore -destkeystore /home/aditya/.android/debug.keystore -deststoretype pkcs12".

```

```
keytool -importkeystore -srckeystore /home/aditya/.android/debug.keystore -destkeystore /home/aditya/.android/debug.keystore -deststoretype pkcs12
```

```
Enter source keystore password:
Entry for alias androiddebugkey successfully imported.
Import command completed:  1 entries successfully imported, 0 entries failed or cancelled

Warning:
Migrated "/home/aditya/.android/debug.keystore" to Non JKS/JCEKS. The JKS keystore is backed up as "/home/aditya/.android/debug.keystore.old".
```

remove elevation from PxpansionPanel

1. Open expansion_panel.dart file, go to the build() method of \_ExpansionPanelListState and make following changes (line no 529)

```
return MergeableMaterial(
hasDividers: true,
children: items,
elevation: 0, // 1st add this line
);
```

2. Now open mergeable_material.dart file, navigate to _paintShadows (line no 690) method of _RenderMergeableMaterialListBody class and make following changes:

```
void _paintShadows(Canvas canvas, Rect rect) {

// 2nd add this line
if (boxShadows == null) return;

for (final BoxShadow boxShadow in boxShadows) {
final Paint paint = boxShadow.toPaint();
canvas.drawRRect(kMaterialEdges[MaterialType.card].toRRect(rect), paint);
}
}
```

3. change icon color in expansion_panel.dart line 469

```
 color: new Color(0xff2b10b2),
 size: 32,
```


##done 
1. accept html data in customisation page 
2. what we do -remove
3. analylitics create service file (analytics_service) and use it in main file and locator

