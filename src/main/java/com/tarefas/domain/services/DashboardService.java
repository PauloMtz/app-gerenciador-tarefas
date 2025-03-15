package com.tarefas.domain.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.tarefas.domain.models.Tarefa;
import com.tarefas.domain.repositories.TarefaRepository;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class DashboardService {
    
    private final TarefaRepository tarefaRepository;

    public List<Tarefa> todasTarefas() {
        return tarefaRepository.findAll();
    }

    public long contarConcluidas(boolean concluida) {
        return tarefaRepository.findAll()
            .stream()
            .filter(t -> t.isConcluida() == concluida).count();
    }

    public Map<String, Object> dadosGraficoLinhas() {
        List<Object[]> tarefas = tarefaRepository.contarTarefasPorMes();

        List<String> meses = new ArrayList<>();
        List<Long> contagens = new ArrayList<>();

        for (Object[] tarefa : tarefas) {
            meses.add((String) tarefa[0]);
            contagens.add((Long) tarefa[1]);
        }

        Map<String, Object> dados = new HashMap<>();
        dados.put("labels", meses);
        dados.put("data", contagens);

        return dados;
    }
}
