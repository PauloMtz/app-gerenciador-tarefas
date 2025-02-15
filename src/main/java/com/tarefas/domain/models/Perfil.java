package com.tarefas.domain.models;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@RequiredArgsConstructor
@Getter
@Setter
@Entity
public class Perfil implements GrantedAuthority {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /*
     * @RequiredArgsConstructor gera construtor vazio
     * entra em conflito com @NoArgsConstructor
     * @NonNull acrescenta atributos no @RequiredArgsConstructor
     * Ver vídeo Youtube: https://www.youtube.com/watch?v=DMBvVfeSg4o&ab_channel=AlgaWorks
     */
    @NonNull
    private String perfil;

    // entidade fraca
    @ManyToMany(mappedBy = "perfis", fetch = FetchType.EAGER)
    private List<Usuario> usuarios;

    @Override
    public String getAuthority() {
        return perfil.toString();
    }
}
