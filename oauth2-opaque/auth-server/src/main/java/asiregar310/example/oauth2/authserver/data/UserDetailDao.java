package asiregar310.example.oauth2.authserver.data;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserDetailDao extends JpaRepository<User, Integer> {
    Optional<User> findByUsername(String username);
}
