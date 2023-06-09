// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.18.0

package com.example.authors

import java.sql.Timestamp
import java.time.Instant
import java.time.LocalDateTime

data class Author (
  val id: Int,
  val name: String,
  val bio: String?,
  val address: String?,
  val dateOfBirth: LocalDateTime?,
  val lastTs: Instant?,
  val savingsAmt: Double?,
  val loanAmt: String?,
  val disabled: Boolean?,
  val married: Boolean?,
  val payable: String?
)

