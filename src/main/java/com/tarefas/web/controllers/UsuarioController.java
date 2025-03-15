package com.tarefas.web.controllers;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tarefas.domain.models.Perfil;
import com.tarefas.domain.models.Usuario;
import com.tarefas.domain.repositories.LocalidadeRepository;
import com.tarefas.domain.repositories.PerfilRepository;
import com.tarefas.domain.services.JasperService;
import com.tarefas.domain.services.UsuarioService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;

@AllArgsConstructor
@Controller
@RequestMapping("/usuario")
public class UsuarioController {

	private final UsuarioService usuarioService;
    private final LocalidadeRepository localidadeRepository;
    private final PerfilRepository perfilRepository;
    private final JasperService jasperService;

	@GetMapping("/cadastrar")
    public String cadastrar(Model model) {
        model.addAttribute("usuario", new Usuario());
        model.addAttribute("localidades", localidadeRepository.findAll());
        return "usuarios/form"; // template
    }

    @PostMapping("/cadastrar")
    public String salvar(@Valid Usuario usuario, BindingResult result,
        Model model, RedirectAttributes attr) {

        if (result.hasErrors()) {
            model.addAttribute("localidades", localidadeRepository.findAll());
            return "usuarios/form"; // template
        }

        // cria perfil ao salvar usuário
        Perfil perfil = perfilRepository.findByPerfil("USER");
        List<Perfil> perfis = new ArrayList<Perfil>();
        perfis.add(perfil);
        usuario.setPerfis(perfis);

        String encrypt = new BCryptPasswordEncoder().encode(usuario.getPassword());
        usuario.setPassword(encrypt);
        usuario.setDataCadastro(LocalDateTime.now());

        usuarioService.salvar(usuario);

        attr.addFlashAttribute("success", "Usuário registrado com sucesso.");
        return "redirect:/usuario/login"; // rota
    }

    @GetMapping("/listar")
    public String listar(Model model) {
        return listaPaginada(model, 1);
    }

    @GetMapping("/listar/{pageNumber}")
    public String listaPaginada(Model model,
        @PathVariable(value = "pageNumber") int currentPage) {

        Page<Usuario> page = usuarioService.listaUsuarios(currentPage);
        List<Usuario> usuarios = page.getContent();
        int totalPages = page.getTotalPages();
        long totalItems = page.getTotalElements();

        String url = "/usuario/listar/";
        String pag = "";

        model.addAttribute("currentPage", currentPage);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("totalItems", totalItems);
        model.addAttribute("url", url);
        model.addAttribute("pag", pag);
        model.addAttribute("usuarios", usuarios);
        return "usuarios/lista";
    }
    
    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("usuario", new Usuario());
        return "usuarios/login"; // template
    }

    @RequestMapping("/login-error")
	public String loginError(Model model) {
		model.addAttribute("loginErro", "Login inválido, verifique as credenciais");
		return "usuarios/login";
	}

    @RequestMapping("/acesso-negado")
	public String acessoNegado(Model model) {
		return "usuarios/acesso-negado";
	}

    // exibe relatório sem parâmetros
    @GetMapping("/relatorio/pdf/jr1")
    public void exibirRelatorio1(@RequestParam("code") String code,
        @RequestParam("acao") String acao, HttpServletResponse response) throws IOException {

        byte[] bytes = jasperService.exportPDF(code);
        response.setContentType(MediaType.APPLICATION_PDF_VALUE);

        // se acao for 'v' de visualizar no navegador...
        if (acao.equals("v")) {
            response.setHeader("Content-disposition", "inline; filename=relatorio-" + code + ".pdf");
        } else {
            // se não, baixa o relatório
            response.setHeader("Content-disposition", "attachment; filename=relatorio-" + code + ".pdf");
        }

        response.getOutputStream().write(bytes);
    }
}
