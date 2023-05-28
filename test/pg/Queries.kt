// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.18.0

package com.example.authors

import java.sql.Connection
import java.sql.SQLException
import java.sql.Statement

interface Queries {
  @Throws(SQLException::class)
  fun deleteAuthor(authorId: Long)
  
  @Throws(SQLException::class)
  fun insertAuthor(
      ssid: Int?,
      name: String,
      spouses: Int?,
      children: Int?,
      bio: String,
      acct: java.math.BigDecimal?): Author?
  
  @Throws(SQLException::class)
  fun listAuthor(authorId: Long): List<Author>
  
  @Throws(SQLException::class)
  fun selectAuthor(authorId: Long): Author?
  
  @Throws(SQLException::class)
  fun updateAuthor(
      ssid: Int?,
      name: String,
      spouses: Int?,
      children: Int?,
      bio: String,
      acct: java.math.BigDecimal?,
      authorId: Long): Author?
  
}
