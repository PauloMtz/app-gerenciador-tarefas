package com.tarefas.web.controllers;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tarefas.domain.models.Tarefa;
import com.tarefas.domain.services.TarefaService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class HomeController {

    private final TarefaService service;
    
    /*@RequestMapping("/")
    public String index(Model model) {
        List<Tarefa> tarefas = service.listaSemPaginacao();
        model.addAttribute("tarefas", tarefas);
        return "home";
    }*/

    @GetMapping("/home")
    public String listar(Model model) {
        return listaPaginada(model, 1);
    }

    @GetMapping("/home/{pageNumber}")
    public String listaPaginada(Model model,
        @PathVariable(value = "pageNumber") int currentPage) {

        Page<Tarefa> page = service.listaTarefasNaoConcluidas(currentPage);
        List<Tarefa> tarefas = page.getContent();
        int totalPages = page.getTotalPages();
        long totalItems = page.getTotalElements();

        String url = "/home/";
        String pag = "";

        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalItems", totalItems);
        model.addAttribute("url", url);
        model.addAttribute("pag", pag);
        model.addAttribute("tarefas", tarefas);

        return "home"; //template
    }

    @RequestMapping("/")
    public String home() {
        return "redirect:/home"; // rota
    }
}
