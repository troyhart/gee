/* Copyright (C) 2014 Troy Hart. */
package com.nada.catalog;

import javax.persistence.Entity;
import java.math.BigDecimal;

/**
 * @author thart
 */
@Entity
public class Item {
    private String description;
    private String label;
    private BigDecimal unitPrice;

    public Item(String description, String label, BigDecimal unitPrice) {
        this.description = description;
        this.label = label;
        this.unitPrice = unitPrice;
    }

    public String getDescription() {
        return description;
    }

    void setDescription(String description) {
        this.description = description;
    }

    public String getLabel() {
        return label;
    }

    void setLabel(String label) {
        this.label = label;
    }
}
