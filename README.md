# ErrorCodes
View Information of Error Codes of HTTP, FTP, SMTP from command line


A simple Ruby Script that will show HTTP, SMTP and FTP Error codes on terminal


::REQUIRES::
rainbow gem
$gem install rainbow
OR IN RVM
 rvm all do gem install rainbow


:: USAGE ::

$ ruby codes.rb  PROTOCOL ERROR_CODE

$ruby codes.rb http 403

>PROTOCOL:: http 		ERROR:: 403
>The request was a legal request, but the server is refusing to respond to it
