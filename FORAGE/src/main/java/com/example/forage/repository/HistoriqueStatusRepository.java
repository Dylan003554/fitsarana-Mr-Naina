package com.example.forage.repository;

import com.example.forage.model.HistoriqueStatus;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HistoriqueStatusRepository extends JpaRepository<HistoriqueStatus, Long> {
    List<HistoriqueStatus> findByDemandeId(Long demandeId);
    List<HistoriqueStatus> findByDemandeIdOrderByDateStatusDesc(Long demandeId);
    HistoriqueStatus findTopByDemandeIdOrderByDateStatusDesc(Long demandeId);
    
    HistoriqueStatus findTopByDemandeIdOrderByIdDesc(Long demandeId);
    
    // void deleteByDevisId(Long devisId);
}
