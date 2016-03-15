package signin;

import javax.servlet.http.Cookie;

/**
 * Created by kipka on 11.03.2016.
 */
public class CookiePlacer {

    String cookieName = null;
    String cookieContent = null;

    public CookiePlacer(String cookieName, String cookieContent){
        this.cookieName = cookieName;
        this.cookieContent = cookieContent;
    }

    public Cookie generateCookie(){
        Cookie newCookie = new Cookie(cookieName, cookieContent);
        return newCookie;
    }

}
