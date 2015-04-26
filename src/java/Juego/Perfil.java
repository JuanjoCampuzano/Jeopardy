/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Juego;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author alfredo_altamirano
 */
public class Perfil {
    
    public int id;
    public List<String> temas;
    public List<List<Pista>> pistas = new ArrayList<>();
    
    public Perfil(int id, List<String> temas, List<List<Pista>> pistas) {
        this.id = id;
        this.temas = temas;
        this.pistas = pistas;
    }
    
}
