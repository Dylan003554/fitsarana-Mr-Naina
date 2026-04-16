package com.example.forage.controller;

import com.example.forage.model.Client;
import com.example.forage.model.Demande;
import com.example.forage.model.HistoriqueStatus;
import com.example.forage.repository.ClientRepository;
import com.example.forage.repository.DemandeRepository;
import com.example.forage.service.DemandeService;
import com.example.forage.service.HistoriqueStatusService;

// import org.hibernate.mapping.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

@Controller
public class DashboardController {

    private final HistoriqueStatusService historiqueStatusService;

    private final DemandeService demandeService;

    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private DemandeRepository demandeRepository;

    DashboardController(DemandeService demandeService, HistoriqueStatusService historiqueStatusService) {
        this.demandeService = demandeService;
        this.historiqueStatusService = historiqueStatusService;
    }

    @GetMapping("/")
    public String dashboard(Model model) {
        List<Demande> demandes = demandeService.findAll();
        Map<Long, HistoriqueStatus> lastStatuses = new HashMap<>();
        model.addAttribute("clients", clientRepository.findAll());

        for (Demande d : demandes) {
            HistoriqueStatus hs = historiqueStatusService.findLastStatusByDemandeId(Long.valueOf(d.getId()));
            System.out.println(hs.getStatus().getLibelle());
            lastStatuses.put(d.getId(), hs);
        }

        model.addAttribute("demandes", demandes);
        model.addAttribute("lastStatuses", lastStatuses);

        return "dashboard";
    }

    @PostMapping("/client/save")
    public String saveClient(@ModelAttribute Client client) {
        clientRepository.save(client);
        return "redirect:/";
    }


    @PostMapping("/client/delete/{id}")
    public String deleteClient(@PathVariable Long id) {
        clientRepository.deleteById(id);
        return "redirect:/";
    }

    @PostMapping("/demande/save")
    public String saveDemande(@ModelAttribute Demande demande) {
        if (demande.getDateDemande() == null) {
            demande.setDateDemande(LocalDate.now());
        }
        demandeService.save(demande);
        return "redirect:/";
    }

    @PostMapping("/demande/delete/{id}")
    public String deleteDemande(@PathVariable Long id) {
        demandeRepository.deleteById(id);
        return "redirect:/";
    }

}
