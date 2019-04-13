package asiregar310.example.oauth2.authserver.service;

import asiregar310.example.oauth2.authserver.data.AuthUserDetail;
import asiregar310.example.oauth2.authserver.data.User;
import asiregar310.example.oauth2.authserver.data.UserDetailDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AccountStatusUserDetailsChecker;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service("userDetailsService")
public class UserDetailServiceImpl implements UserDetailsService {
    @Autowired
    private UserDetailDao userDetailDao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        User user = userDetailDao.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("Incorrect username or password."));

        UserDetails userDetails = new AuthUserDetail(user);

        // check user status. invalid status will raise an exception
        new AccountStatusUserDetailsChecker().check(userDetails);

        return userDetails;
    }
}
