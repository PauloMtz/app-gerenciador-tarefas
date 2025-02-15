package com.tarefas.domain.models;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;

@Data
@Entity
@Table(name = "localidades")
public class Localidade {
    
    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

    @NotBlank
    @Column(name = "cidade", nullable = false, length = 60)
	private String cidade;

    @NotBlank
    @Column(name = "estado", nullable = false, length = 2)
	private String estado;

    @OneToMany(mappedBy = "localidade")
    private List<Usuario> usuarios;
}
