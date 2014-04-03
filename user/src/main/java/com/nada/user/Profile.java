/* Copyright (C) 2014 Troy Hart. */

package com.nada.user;

import javax.persistence.Entity;

/**
 * @author thart
 */
@Entity
public class Profile
{
  private String name;

  /**
   * @return the name
   */
  public String getName()
  {
    return name;
  }

  /**
   * @param name the name to set
   */
  void setName(String name)
  {
    this.name = name;
  }
}
