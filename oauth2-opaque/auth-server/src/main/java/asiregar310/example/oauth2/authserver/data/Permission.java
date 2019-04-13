package asiregar310.example.oauth2.authserver.data;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "s_permission")
@Data
public class Permission {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @Column(name = "name")
    private String name;
}