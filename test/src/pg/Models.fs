// Code generated by sqlc. DO NOT EDIT.
// version: sqlc v1.18.0

namespace PAuthors

open System
open Npgsql

type Author = 
    {
        AuthorId : int64
        Ssid : int option
        Name : string
        Spouses : int option
        Children : int option
        Bio : string
        Acct : decimal option
    }

type Book = 
    {
        BookId : Guid
        Name : string
    }

