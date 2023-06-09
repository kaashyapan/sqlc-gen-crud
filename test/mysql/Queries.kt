// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.18.0

package com.example.authors

import java.sql.Connection
import java.sql.SQLException
import java.sql.Statement
import java.sql.Timestamp
import java.time.Instant
import java.time.LocalDateTime

interface Queries {
  @Throws(SQLException::class)
  fun countAuthor(): Long?
  
  @Throws(SQLException::class)
  fun deleteAuthor(id: Int)
  
  @Throws(SQLException::class)
  fun insertAuthor(
      name: String,
      bio: String?,
      address: String?,
      dateOfBirth: LocalDateTime?,
      lastTs: Instant?,
      savingsAmt: Double?,
      loanAmt: String?,
      disabled: Boolean?,
      married: Boolean?,
      payable: String?): Long
  
  @Throws(SQLException::class)
  fun listAuthor(id: Int): List<Author>
  
  @Throws(SQLException::class)
  fun selectAuthor(id: Int): Author?
  
  @Throws(SQLException::class)
  fun updateAuthor(
      name: String,
      bio: String?,
      address: String?,
      dateOfBirth: LocalDateTime?,
      lastTs: Instant?,
      savingsAmt: Double?,
      loanAmt: String?,
      disabled: Boolean?,
      married: Boolean?,
      payable: String?,
      id: Int)
  
}

