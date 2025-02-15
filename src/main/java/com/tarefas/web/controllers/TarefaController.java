package com.tarefas.web.controllers;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tarefas.domain.models.Tarefa;
import com.tarefas.domain.models.Usuario;
import com.tarefas.domain.services.TarefaService;
import com.tarefas.domain.services.UsuarioService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/tarefa")
public class TarefaController {
    
    private final TarefaService tarefaService;
    private final UsuarioService usuarioService;

    @GetMapping("/cadastrar")
    public ModelAndView cadastro() {
        Tarefa tarefa = new Tarefa();
        var mv = new ModelAndView("tarefas/form");
        mv.addObject("tarefa", tarefa);
        return mv;
    }

    @PostMapping("/cadastrar")
    public String cadastrar(@Valid Tarefa tarefa, BindingResult result, HttpServletRequest request,
        Model model, RedirectAttributes attr) throws IOException {

        if (result.hasErrors()) {
            return "tarefas/form"; // template
        }

        if(tarefa.getDataExpiracao() == null) { // valida a data
            result.rejectValue("dataExpiracao", "tarefa.dataExpiracaoInvalida", "Data de expiração nula.");
        } else {
            if(tarefa.getDataExpiracao().before(new Date())) { // valida a data
                result.rejectValue("dataExpiracao", "tarefa.dataExpiracaoInvalida", "Data de expiração inválida.");
            }
        }

        // pega o usuário logado pelo e-mail
        // abaixo no editar, pega pela sessão utilizando o spring security
        String emailUsuario = request.getUserPrincipal().getName();
        Usuario usuarioLogado = usuarioService.buscarPorEmail(emailUsuario);
        tarefa.setUsuario(usuarioLogado);

        tarefa.setDataCriacao(LocalDateTime.now());
        tarefaService.salvar(tarefa);
        attr.addFlashAttribute("success", "Registro inserido com sucesso.");
        return "redirect:/tarefa/listar"; // rota
    }

    /*@GetMapping("/listar")
    public String lista(HttpServletRequest request) {
        var mv = new ModelAndView("tarefas/lista");
        Pageable emailUsuario = request.getUserPrincipal().getName();
        mv.addObject("tarefas", tarefaRepository.carregarTarefasPorUsuario(emailUsuario));
        return mv;
    }*/

    @GetMapping("/listar")
    public String listarTarefasPorUsuario(HttpServletRequest request, Model model) {
        return listaPaginada(request, model, 1);
    }

    @GetMapping("/listar/{pageNumber}")
    public String listaPaginada(HttpServletRequest request, Model model,
        @PathVariable(value = "pageNumber") int currentPage) {
        
        String emailUsuario = request.getUserPrincipal().getName();
        Page<Tarefa> tarefasUsuario = tarefaService.listaComPaginacao(emailUsuario, currentPage);
        List<Tarefa> tarefas = tarefasUsuario.getContent();
        int totalPages = tarefasUsuario.getTotalPages();
        long totalItems = tarefasUsuario.getTotalElements();

        String url = "/tarefa/listar/";
        String pag = "";

        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalItems", totalItems);
        model.addAttribute("url", url);
        model.addAttribute("pag", pag);
        model.addAttribute("tarefas", tarefas);
        return "tarefas/lista";
    }

    @GetMapping("/editar/{id}")
    public String editar(@PathVariable Long id, Model model, RedirectAttributes attr) {

        Tarefa tarefa = tarefaService.buscarPorId(id);

        if (tarefa == null) {
            attr.addFlashAttribute("error", "Registro não encontrado");
            return "redirect:/tarefa/listar"; // rota
        }

        model.addAttribute("tarefa", tarefa);
        return "tarefas/form"; // template
    }

    @PostMapping("/editar/{id}")
	public String editar(@Valid Tarefa tarefa, Model model, BindingResult result, 
        RedirectAttributes attr) {

        if (result.hasErrors()) {
            return "tarefas/form"; // template
        }

		if (tarefa.getDataExpiracao() == null) { // valida a data
			result.rejectValue("dataExpiracao", "tarefa.dataExpiracaoInvalida", "Data de expiração nula.");
		} else {
			if(tarefa.getDataExpiracao().before(new Date())) { // valida a data
				result.rejectValue("dataExpiracao", "tarefa.dataExpiracaoInvalida", "Data de expiração inválida.");
			}
		}

        // pega o usuário logado pela sessão
        Authentication usuarioLogado = SecurityContextHolder.getContext().getAuthentication();
        Usuario usuario = usuarioService.buscarPorEmail(usuarioLogado.getName());
        tarefa.setUsuario(usuario);
        
        tarefaService.salvar(tarefa);
        attr.addFlashAttribute("success", "Registro atualizado com sucesso.");
		return "redirect:/tarefa/listar";
    }

    @GetMapping("/excluir/{id}")
    public String excluir(@PathVariable Long id, RedirectAttributes attr) {
        try {
            tarefaService.excluir(id);
            attr.addFlashAttribute("success", "Registro excluído com sucesso.");
            return "redirect:/tarefa/listar"; // rota
        } catch (Exception e) {
            attr.addFlashAttribute("error", "Esse registro não pode ser excluído");
            return "redirect:/tarefa/listar"; // rota
        }
    }

    @GetMapping("/concluir/{id}")
	public String concluir(@PathVariable("id") Long id) {
		Tarefa tarefa = tarefaService.buscarPorId(id);
		tarefa.setConcluida(true);
        tarefa.setDataConclusao(LocalDateTime.now());
		tarefaService.salvar(tarefa);
		return "redirect:/tarefa/listar";
	}
}
