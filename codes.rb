#!/usr/bin/env ruby
#AUTHOR : ORIONG33KS

begin
require 'rainbow/ext/string'
rescue LoadError
puts "Gem Not Found. Do \"gem install rainbow\" in terminal"
exit
end

ftp={
:'Restart_Marker_Apply' => 110,
:'Service Ready in n minutes' => 120,
:'Data Connection Already open.Transfer starting' => 125,
:'File status okay; about to open data connection' => 150,
:'Command okay' => 200,
:'Command not implemented, superfluous at this site' => 202,
:'System status, or system help reply' => 211,
:'Directory status' => 212,
:'File status' => 213,
:'Help message' => 214,
:'NAME system type :: Where NAME is an official system name from the list in the Assigned Numbers document. ' => 215,
:'Service ready for new user' => 220,
:'Service closing control connection' => 221,
:'Data connection open; no transfer in progress' => 225,
:'Closing data connection' => 226,
:'Entering Passive Mode' => 227,
:'User logged in, proceed. This status code appears after the client sends the correct password. It indicates that the user has successfully logged on' => 230,
:'Requested file action okay, completed' => 250,
:'PATHNAME created' => 257,
:'User name okay, need password.' => 331,
:'Need account for login' => 332,
:'Requested file action pending further information' => 350,
:'Error 421 Service not available, closing control connection
            Error 421 User limit reached
            Error 421 You are not authorized to make the connection
            Error 421 Max connections reached
            Error 421 Max connections exceeded' =>421,
:'Cannot open data connection' => 425,           
:'Connection closed; transfer aborted' => 426,
:'Requested file action not taken' => 450,
:'Requested action aborted: local error in processing' => 451,
:'Requested action not taken. Insufficient storage space in system' => 452,
:'Syntax error, command unrecognized, command line too long' => 500,
:'Syntax error in parameters or arguments' => 501,
:'Command not implemented' => 502,
:'Bad sequence of commands' => 503,
:'Command not implemented for that parameter' => 504,
:'User not logged in' => 530,
:'Need account for storing files' => 532,
:'Requested action not taken. File unavailable, not found, not accessible' =>550,
:'Requested file action aborted. Exceeded storage allocation' => 552,
:'Requested action not taken. File name not allowed' => 553,
:'Connection reset by peer. The connection was forcibly closed by the remote host' => 10054,
:'Cannot connect to remote server' => 10060,
:'Cannot connect to remote server. The connection is actively refused by the server' => 10061,
:'Directory not empty' => 10066,
:'Too many users, server is full' => 10068

}

http={
:'The server has received the request headers, and the client should proceed to send the request body' =>100,
:'The requester has asked the server to switch protocols' =>101,
:'Used in the resumable requests proposal to resume aborted PUT or POST requests'=>103,
:'The request is OK (this is the standard response for successful HTTP requests)'=>200,
:'The request has been fulfilled, and a new resource is created'=>201,
:'The request has been accepted for processing, but the processing has not been completed' =>202,
:'The request has been successfully processed, but is returning information that may be from another source' => 203,
:'The request has been successfully processed, but is not returning any content' =>204,
:'The request has been successfully processed, but is not returning any content, and requires that the requester reset the document view' =>205,
:'The server is delivering only part of the resource due to a range header sent by the client' => 206,
:'A link list. The user can select a link and go to that location. Maximum five addresses' => 300,
:'The requested page has moved to a new URL' => 301,
:'FOund:The requested page has moved temporarily to a new URL' => 302,
:'The requested page can be found under a different URL' =>303,
:'Indicates the requested page has not been modified since last requested' => 304,
:'No longer used' => 306,
:'The requested page has moved temporarily to a new URL' => 307,
:'Resume Incomoplete:Used in the resumable requests proposal to resume aborted PUT or POST requests' => 308,
:'The request cannot be fulfilled due to bad syntax' => 400,
:'The request was a legal request, but the server is refusing to respond to it. For use when authentication is possible but has failed or not yet been provided' => 401,
:'Reserved for future use'  => 402,
:'The request was a legal request, but the server is refusing to respond to it' => 403,
:'The requested page could not be found but may be available again in the future' => 404,
:'A request was made of a page using a request method not supported by that page' => 405,
:'The server can only generate a response that is not accepted by the client' => 406,
:'The client must first authenticate itself with the proxy' => 407,
:'The server timed out waiting for the request ' => 408,
:'The request could not be completed because of a conflict in the request' => 409,
:'The requested page is no longer available' => 410,
:'The "Content-Length" is not defined. The server will not accept the request without it  ' => 411,
:'The precondition given in the request evaluated to false by the server ' => 412,
:'The server will not accept the request, because the request entity is too large ' => 413,
:'The server will not accept the request, because the URL is too long. Occurs when you convert a POST request to a GET request with a long query information  ' => 414,
:'The server will not accept the request, because the media type is not supported  ' => 415,
:'The client has asked for a portion of the file, but the server cannot supply that portion' => 416,
:'The server cannot meet the requirements of the Expect request-header field' => 417 ,
:'A generic error message, given when no more specific message is suitable' => 500,
:'The server either does not recognize the request method, or it lacks the ability to fulfill the request' =>501 ,
:'The server was acting as a gateway or proxy and received an invalid response from the upstream server' => 502,
:'The server is currently unavailable (overloaded or down) ' => 503,
:'The server was acting as a gateway or proxy and did not receive a timely response from the upstream server' => 504,
:'The server does not support the HTTP protocol version used in the request ' => 505,
:'The client needs to authenticate to gain network access' => 511
}


smtp={
:'The server is unable to connect.' => 101,
:'Connection refused or inability to open an SMTP stream.' =>111 ,
:'System status message or help reply.' => 211,
:'A response to the HELP command.' => 214,
:'The server is ready.' => 220,
:'The server is closing its transmission channel. It can come with side messages like "Goodbye" or "Closing connection".' => 221,
:'Its typical side message is "Requested mail action okay completed": meaning that the server has transmitted a message.' => 250,
:'User not local will forward the recipient\'s account is not on the present server, so it will be relayed to another.' =>251 ,
:'The server cannot verify the user, but it will try to deliver the message anyway.' =>252 ,
:'The side message can be very cryptic ("Start mail input end <CRLF>.<CRLF>"). It\'s the typical response to the DATA command.' => 354,
:'Timeout connection problem: there have been issues during the message transfer.' => 420,
:'The service is unavailable due to a connection problem: it may refer to an exceeded limit of simultaneous connections, or a more general temporary problem.' => 421,
:'The recipient\'s mailbox has exceeded its storage limit' => 422,
:'Not enough space on the disk, or an "out of memory" condition due to a file overload.' => 431,
:'Typical side-message: "The recipient\'s Exchange Server incoming mail queue has been stopped".' => 432,
:'The recipient\'s server is not responding.' => 441,
:'The connection was dropped during the transmission.' => 442,
:'The maximum hop count was exceeded for the message: an internal loop has occurred.' =>446 ,
:'Your outgoing message timed out because of issues concerning the incoming server.' => 447,
:'A routing error.' => 449,
:'"Requested action not taken – The user\'s mailbox is unavailable". The mailbox has been corrupted or placed on an offline server, or your email hasn\'t been accepted for IP problems or blacklisting.' => 450,
:'"Requested action aborted – Local error in processing". Your ISP\'s server or the server that got a first relay from yours has encountered a connection problem.' => 451,
:'Too many emails sent or too many recipients: more in general, a server storage limit exceeded.' => 452,
:'An error of your mail server, often due to an issue of the local anti-spam filter.' => 471,
:'A syntax error: the server couldn\'t recognize the command.' => 500,
:'Another syntax error, not in the command but in its parameters or arguments.' => 501,
:'The command is not implemented.' => 502,
:'The server has encountered a bad sequence of commands, or it requires an authentication.' => 503,
:'A command parameter is not implemented.' => 504,
:'Bademail address' => 510,
:'Bad email address.' => 511,
:'A DNS error: the host server for the recipient\'s domain name cannot be found. ' => 512,
:'"Address type is incorrect": another problem concerning address misspelling. In few cases, however, it\'s related to an authentication issue.' => 513,
:'The total size of your mailing exceeds the recipient server\'s limits.' =>523 ,
:'Normally, an authentication problem. But sometimes it\'s about the recipient\'s server blacklisting yours, or an invalid email address.' => 530,
:'The recipient address rejected your message: normally, it\'s an error caused by an anti-spam filter.' => 541,
:'It usually defines a non-existent email address on the remote side.' => 550,
:'"User not local or invalid address – Relay denied". Meaning, if both your address and the recipient\'s are not locally hosted by the server, a relay can be interrupted.' => 551,
:'"Requested mail actions aborted – Exceeded storage allocation": simply put, the recipient\'s mailbox has exceeded its limits.' => 552,
:'"Requested action not taken – Mailbox name invalid". That is, there\'s an incorrect email address into the recipients line. ' =>553,
:'This means that the transaction has failed. It\'s a permanent error and the server will not try to send the message again.' =>554,
}



def pre(proto,code)
        return "\nPROTOCOL:: #{proto} \t\tERROR:: #{code.to_i}".color(:orange)
end


if ARGV.count==0
puts "Usage:: ruby codes.rb PROTOCOL ERRORCODE"
exit
elsif ARGV[0] =~/smtp/i and smtp.values.include?(ARGV[1].to_i)
        puts pre(ARGV[0],ARGV[1])
        puts smtp.key(ARGV[1].to_i),"\n"
    elsif ARGV[0] =~/http/i and http.values.include?(ARGV[1].to_i)
        puts pre(ARGV[0],ARGV[1])        
        puts http.key(ARGV[1].to_i),"\n"
elsif ARGV[0] =~/ftp/i and ftp.values.include?(ARGV[1].to_i)
    puts pre(ARGV[0],ARGV[1])
    puts ftp.key(ARGV[1].to_i),"\n"
else
    puts "Found Nothing Appropriate.".color(:red),"Maybe u mispelled or code not found.".color(:cyan),"Supported protocols are FTP, HTTP, SMTP\n ".color(:green).bright
end



