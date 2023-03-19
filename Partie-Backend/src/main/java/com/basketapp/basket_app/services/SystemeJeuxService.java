package com.basketapp.basket_app.services;

import com.basketapp.basket_app.models.SystemeJeux;

public interface SystemeJeuxService {
    SystemeJeux createSystemeJeux(SystemeJeux s);
    void deleteSystemeJeux (Long id); 
    SystemeJeux updateSystemeJeux (SystemeJeux s); 
    SystemeJeux getSystemeJeux(Long id);
    SystemeJeux favoriserSystemeJeux (Long id);
}