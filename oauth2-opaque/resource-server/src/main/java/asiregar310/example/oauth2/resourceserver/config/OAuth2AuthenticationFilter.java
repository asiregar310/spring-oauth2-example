package asiregar310.example.oauth2.resourceserver.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.oauth2.provider.authentication.BearerTokenExtractor;
import org.springframework.security.oauth2.provider.authentication.OAuth2AuthenticationManager;
import org.springframework.security.oauth2.provider.authentication.OAuth2AuthenticationProcessingFilter;
import org.springframework.security.oauth2.provider.token.RemoteTokenServices;

@Configuration
@EnableConfigurationProperties(SecurityProperties.class)
public class OAuth2AuthenticationFilter {

    @Autowired
    private SecurityProperties securityProperties;

    private RemoteTokenServices getRemoteTokenServices(){

        SecurityProperties.OAuth2Properties oAuth2Properties = securityProperties.getOauth2();

        RemoteTokenServices remoteTokenServices = new RemoteTokenServices();
        remoteTokenServices.setClientId(oAuth2Properties.getClientId());
        remoteTokenServices.setClientSecret(oAuth2Properties.getClientSecret());
        remoteTokenServices.setCheckTokenEndpointUrl(oAuth2Properties.getCheckTokenUri());

        return remoteTokenServices;
    }


    @Bean
    public OAuth2AuthenticationProcessingFilter getOAuth2AuthenticationProcessingFilter() {
        // configure token Extractor
        BearerTokenExtractor tokenExtractor = new BearerTokenExtractor();

        // configure Auth manager
        OAuth2AuthenticationManager manager = new OAuth2AuthenticationManager();

        // configure RemoteTokenServices with your client Id and auth server endpoint
        manager.setTokenServices(getRemoteTokenServices());

        OAuth2AuthenticationProcessingFilter filter = new OAuth2AuthenticationProcessingFilter();
        filter.setTokenExtractor(tokenExtractor);
        filter.setAuthenticationManager(manager);
        return filter;
    }
}
