// Code generated by sqlc. DO NOT EDIT.
// version: sqlc v1.18.0
// for nuget package Npgsql.FSharp --version 5.7.0

namespace PAuthors

open System
open Npgsql
open Npgsql.FSharp
open PAuthors.Readers

module Sqls = 

  [<Literal>]
  let selectAuthor =
    """
    SELECT
    author_id
 ,  ssid
 ,  name
 ,  spouses
 ,  children
 ,  bio
 ,  acct
FROM authors
WHERE author_id = @author_id
  """

  [<Literal>]
  let deleteAuthor =
    """
    DELETE FROM authors
WHERE author_id = @author_id
  """

  [<Literal>]
  let updateAuthor =
    """
    UPDATE authors
SET 
    ssid = @ssid
 ,  name = @name
 ,  spouses = @spouses
 ,  children = @children
 ,  bio = @bio
 ,  acct = @acct
WHERE author_id = @author_id
RETURNING author_id, ssid, name, spouses, children, bio, acct
  """

  [<Literal>]
  let insertAuthor =
    """
    INSERT INTO authors
( 
    ssid
 ,  name
 ,  spouses
 ,  children
 ,  bio
 ,  acct
) VALUES (
    @ssid
 ,  @name
 ,  @spouses
 ,  @children
 ,  @bio
 ,  @acct
)
RETURNING author_id, ssid, name, spouses, children, bio, acct
  """

  [<Literal>]
  let listAuthor =
    """
    SELECT author_id, ssid, name, spouses, children, bio, acct FROM authors
WHERE author_id > @author_id
ORDER BY author_id
LIMIT 1000
  """

  [<Literal>]
  let countAuthor =
    """
    SELECT count(*) as author_count from authors
  """

  [<Literal>]
  let selectBook =
    """
    SELECT
    book_id
 ,  name
FROM books
WHERE book_id = @book_id
  """

  [<Literal>]
  let deleteBook =
    """
    DELETE FROM books
WHERE book_id = @book_id
  """

  [<Literal>]
  let updateBook =
    """
    UPDATE books
SET 
    name = @name
WHERE book_id = @book_id
RETURNING book_id, name
  """

  [<Literal>]
  let insertBook =
    """
    INSERT INTO books
( 
    name
) VALUES (
    @name
)
RETURNING book_id, name
  """

  [<Literal>]
  let listBook =
    """
    SELECT book_id, name FROM books
ORDER BY book_id
  """

  [<Literal>]
  let countBook =
    """
    SELECT count(*) as book_count from books
  """

[<RequireQualifiedAccessAttribute>]
type DB (conn: string) =
  // https://www.connectionstrings.com/npgsql

  /// Select one Author using author_id
  member this.selectAuthor  (authorId: int64) =

    let parameters = [ ("author_id", Sql.int64 authorId) ]
    
    conn
    |> Sql.connect
    |> Sql.query Sqls.selectAuthor
    |> Sql.parameters parameters
    |> Sql.executeRow authorReader

  /// Delete one Author using author_id
  member this.deleteAuthor  (authorId: int64) =

    let parameters = [ ("author_id", Sql.int64 authorId) ]
    
    conn
    |> Sql.connect
    |> Sql.query Sqls.deleteAuthor
    |> Sql.parameters parameters
    |> Sql.executeNonQuery

  /// Update one row of Author using author_id
  member this.updateAuthor  (name: string, bio: string, authorId: int64, ?ssid: int, ?spouses: int, ?children: int, ?acct: decimal) =

    let parameters = [ ("ssid", Sql.intOrNone ssid); ("name", Sql.string name); ("spouses", Sql.intOrNone spouses); ("children", Sql.intOrNone children); ("bio", Sql.string bio); ("acct", Sql.decimalOrNone acct); ("author_id", Sql.int64 authorId) ]
    
    conn
    |> Sql.connect
    |> Sql.query Sqls.updateAuthor
    |> Sql.parameters parameters
    |> Sql.executeRow authorReader

  /// Insert one row of Author
  member this.insertAuthor  (name: string, bio: string, ?ssid: int, ?spouses: int, ?children: int, ?acct: decimal) =

    let parameters = [ ("ssid", Sql.intOrNone ssid); ("name", Sql.string name); ("spouses", Sql.intOrNone spouses); ("children", Sql.intOrNone children); ("bio", Sql.string bio); ("acct", Sql.decimalOrNone acct) ]
    
    conn
    |> Sql.connect
    |> Sql.query Sqls.insertAuthor
    |> Sql.parameters parameters
    |> Sql.executeRow authorReader

  /// Lists 1000 Author having id > @author_id
  member this.listAuthor  (authorId: int64) =

    let parameters = [ ("author_id", Sql.int64 authorId) ]
    
    conn
    |> Sql.connect
    |> Sql.query Sqls.listAuthor
    |> Sql.parameters parameters
    |> Sql.execute authorReader

  /// Count # of Author
  member this.countAuthor  () =

    conn
    |> Sql.connect
    |> Sql.query Sqls.countAuthor
    |> Sql.executeRow (fun r -> r.int64 "author_count")

  /// Select one Book using book_id
  member this.selectBook  (bookId: Guid) =

    let parameters = [ ("book_id", Sql.uuid bookId) ]
    
    conn
    |> Sql.connect
    |> Sql.query Sqls.selectBook
    |> Sql.parameters parameters
    |> Sql.executeRow bookReader

  /// Delete one Book using book_id
  member this.deleteBook  (bookId: Guid) =

    let parameters = [ ("book_id", Sql.uuid bookId) ]
    
    conn
    |> Sql.connect
    |> Sql.query Sqls.deleteBook
    |> Sql.parameters parameters
    |> Sql.executeNonQuery

  /// Update one row of Book using book_id
  member this.updateBook  (name: string, bookId: Guid) =

    let parameters = [ ("name", Sql.string name); ("book_id", Sql.uuid bookId) ]
    
    conn
    |> Sql.connect
    |> Sql.query Sqls.updateBook
    |> Sql.parameters parameters
    |> Sql.executeRow bookReader

  /// Insert one row of Book
  member this.insertBook  (name: string) =

    let parameters = [ ("name", Sql.string name) ]
    
    conn
    |> Sql.connect
    |> Sql.query Sqls.insertBook
    |> Sql.parameters parameters
    |> Sql.executeRow bookReader

  /// Lists all Book 
  member this.listBook  () =

    conn
    |> Sql.connect
    |> Sql.query Sqls.listBook
    |> Sql.execute bookReader

  /// Count # of Book
  member this.countBook  () =

    conn
    |> Sql.connect
    |> Sql.query Sqls.countBook
    |> Sql.executeRow (fun r -> r.int64 "book_count")

