package tex4ht;
/*
XhtmlEmails.java (Version 1.1)

*/
import xtpipes.XtpipesUni;
import org.xml.sax.*;
import org.xml.sax.helpers.DefaultHandler;
import java.io.*;
import java.lang.reflect.*;
import java.util.HashMap;

public class XhtmlEmails extends DefaultHandler {
        PrintWriter out = null;
        String data = "";
  public XhtmlEmails(PrintWriter out,
                       HashMap<String,Object> scripts,
                       Method method, PrintWriter log, boolean trace) {
    this.out = out;
  }
  public void characters(char[] ch, int start, int length) {
    data += new String(ch, start, length);

//XtpipesUni.toUni(ch, start, length, "<>&");
  }

  public void startElement(String ns, String sName,
                                      String qName,
                                      Attributes atts) {
      String s = "<" + qName + "\n";
      for (int i = 0; i < atts.getLength(); i++) {
        String name = atts.getQName(i);
        s += (" " + name + "=\""
            + XtpipesUni.toUni(atts.getValue(i), "<>&\"")
            + "\"");
      }
      s += ">";
      while( data.indexOf('@') >0 ){
  String [] pre = data.split(
                   "[\\p{javaLowerCase}\\p{javaUpperCase}\\d\\-_\\./&]*@"
                   , 2);
if( pre[0].endsWith("}") ){
  if( pre[0].indexOf("{") != -1 ){
     pre[0] = pre[0].substring( 0, pre[0].lastIndexOf("{") );
} }
int len = pre[0] . length();
if( len > 0 ){
   out.print( XtpipesUni.toUni(pre[0], "<>&") );
   data = data.substring(len);
}

  String [] post = data.split(
                   "@[\\p{javaLowerCase}\\p{javaUpperCase}\\d\\-_\\./&]*"
                   , 2);
if( post[1] . length() > 0 ){
  data = data.substring(0, data.length() - post[1] . length());
}
if( data.indexOf("{") == -1 ){
   out.print(
      "<a href=\"mailto:" + XtpipesUni.toUni(data, "&") + "\">"
      + XtpipesUni.toUni(data, "<>&")
      + "</a>"
   );
} else {
  int idx = data.indexOf('@');
  String ext = data.substring(idx);
  data = data.substring(0,idx);
  while( true ){
   pre = data.split(
                "[\\p{javaLowerCase}\\p{javaUpperCase}\\d\\-_\\./&]+"
                , 2);
   if( pre.length < 2 ){
      out.print( XtpipesUni.toUni(data + ext, "<>&") );
      data = "";
      break;
   }
   len = pre[0] . length();
   if( len > 0 ){
      out.print( XtpipesUni.toUni(pre[0], "<>&") );
      data = data.substring(len);
   }
   data = data.substring(0, data.length() - pre[1].length());
   out.print(
      "<a href=\"mailto:" + XtpipesUni.toUni(data + ext, "&") + "\">"
      + XtpipesUni.toUni(data, "<>&")
      + "</a>"
   );
   data = pre[1];
}

}

data = post[1];

}
data = XtpipesUni.toUni(data, "<>&");

      out.print(XtpipesUni.toUni(data, "&") + s);
      data = "";
  }
  public void endElement(String ns, String sName, String qName) {
      String s = "</" + qName + ">";
      while( data.indexOf('@') >0 ){
  String [] pre = data.split(
                   "[\\p{javaLowerCase}\\p{javaUpperCase}\\d\\-_\\./&]*@"
                   , 2);
if( pre[0].endsWith("}") ){
  if( pre[0].indexOf("{") != -1 ){
     pre[0] = pre[0].substring( 0, pre[0].lastIndexOf("{") );
} }
int len = pre[0] . length();
if( len > 0 ){
   out.print( XtpipesUni.toUni(pre[0], "<>&") );
   data = data.substring(len);
}

  String [] post = data.split(
                   "@[\\p{javaLowerCase}\\p{javaUpperCase}\\d\\-_\\./&]*"
                   , 2);
if( post[1] . length() > 0 ){
  data = data.substring(0, data.length() - post[1] . length());
}
if( data.indexOf("{") == -1 ){
   out.print(
      "<a href=\"mailto:" + XtpipesUni.toUni(data, "&") + "\">"
      + XtpipesUni.toUni(data, "<>&")
      + "</a>"
   );
} else {
  int idx = data.indexOf('@');
  String ext = data.substring(idx);
  data = data.substring(0,idx);
  while( true ){
   pre = data.split(
                "[\\p{javaLowerCase}\\p{javaUpperCase}\\d\\-_\\./&]+"
                , 2);
   if( pre.length < 2 ){
      out.print( XtpipesUni.toUni(data + ext, "<>&") );
      data = "";
      break;
   }
   len = pre[0] . length();
   if( len > 0 ){
      out.print( XtpipesUni.toUni(pre[0], "<>&") );
      data = data.substring(len);
   }
   data = data.substring(0, data.length() - pre[1].length());
   out.print(
      "<a href=\"mailto:" + XtpipesUni.toUni(data + ext, "&") + "\">"
      + XtpipesUni.toUni(data, "<>&")
      + "</a>"
   );
   data = pre[1];
}

}

data = post[1];

}
data = XtpipesUni.toUni(data, "<>&");

      out.print( XtpipesUni.toUni(data, "&") + s);
      data = "";
  }

}

