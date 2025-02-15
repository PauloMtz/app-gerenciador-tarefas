package com.tarefas.domain.models.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum Categoria {
    
    MANUT_PREDIAL("Manutenção Predial"),
    LIMPEZA("Limpeza"),
    JARDINAGEM("Jardinagem"),
    RESERVAS("Reservas");

    private String descricao;
}
