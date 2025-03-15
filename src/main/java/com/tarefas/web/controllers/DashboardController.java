package com.tarefas.web.controllers;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tarefas.domain.models.Tarefa;
import com.tarefas.domain.models.enums.Categoria;
import com.tarefas.domain.repositories.TarefaRepository;
import com.tarefas.domain.repositories.UsuarioRepository;
import com.tarefas.domain.services.DashboardService;

import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/dashboard")
public class DashboardController {
    
    private final DashboardService service;
    private final UsuarioRepository usuarioRepository;
    private final TarefaRepository tarefaRepository;

    @GetMapping
    public String graficoCategorias(Model model) {

        // 1. grafico de barras
        Map<Categoria, Long> tarefas = service.todasTarefas()
            .stream()
            .collect(Collectors.groupingBy(
                Tarefa::getCategoria,
                Collectors.counting()
            ));

        //System.out.println("tarefas);
        //{JARDINAGEM=4, RESERVAS=4, MANUT_PREDIAL=9, LIMPEZA=4}*/

        //List<Categoria> labels = tarefas.keySet().stream().collect(Collectors.toList());
        List<Categoria> labels = Arrays.asList(Categoria.values());
        List<Long> valores = tarefas.values().stream().collect(Collectors.toList());

        /*String[] labels = {"Java", "Python", "JavaScript", "C++", "PHP"};
        int[] valores = {30, 40, 20, 10, 50};*/

        model.addAttribute("labels", labels);
        model.addAttribute("valores", valores);

        // 2. gráfico de pizza
        long concluidas = service.contarConcluidas(true);
        long naoConcluidas = service.contarConcluidas(false);

        model.addAttribute("concluidas", concluidas);
        model.addAttribute("naoConcluidas", naoConcluidas);

        // 3. quantidade de usuários cadastrados
        model.addAttribute("usuarios", usuarioRepository.countByUsuario());
        model.addAttribute("tarefas", tarefaRepository.countByTarefa());

        // 4. gráfico de linhas
        model.addAttribute("dadosGraficoLinhas", service.dadosGraficoLinhas());

        return "graficos/dashboard";
    }

    /*@GetMapping
    public String graficoConcluidas(Model model) {
        long concluidas = service.contarConcluidas(true);
        long naoConcluidas = service.contarConcluidas(false);

        model.addAttribute("concluidas", concluidas);
        model.addAttribute("naoConcluidas", naoConcluidas);

        return "graficos/dashboard";
    }*/
}
