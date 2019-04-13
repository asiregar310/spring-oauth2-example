package asiregar310.example.oauth2.resourceserver.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

/*
    Read properties from application.yml
*/

@ConfigurationProperties("security")
public class SecurityProperties {

    private OAuth2Properties oauth2;

    public OAuth2Properties getOauth2() {
        return oauth2;
    }

    public void setOauth2(OAuth2Properties oauth2) {
        this.oauth2 = oauth2;
    }

    public static class OAuth2Properties {
        private String clientId;
        private String clientSecret;
        private String checkTokenUri;

        public String getClientId() {
            return clientId;
        }

        public void setClientId(String clientId) {
            this.clientId = clientId;
        }

        public String getClientSecret() {
            return clientSecret;
        }

        public void setClientSecret(String clientSecret) {
            this.clientSecret = clientSecret;
        }

        public String getCheckTokenUri() {
            return checkTokenUri;
        }

        public void setCheckTokenUri(String checkTokenUri) {
            this.checkTokenUri = checkTokenUri;
        }
    }
}
