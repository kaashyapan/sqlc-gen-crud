
// Code generated by sqlc. DO NOT EDIT.
// version: sqlc v1.18.0

namespace PAuthors

open System
open Npgsql
open Npgsql.FSharp
open PAuthors.Readers

module Sqls = 

  [<Literal>]
  let deleteAuthor =
    """
    DELETE FROM authors
WHERE author_id = @author_id
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

[<RequireQualifiedAccessAttribute>]
type DB (conn: string) =
  // https://www.connectionstrings.com/npgsql

  /// Delete one Author using author_id
  member this.deleteAuthor  (authorId: int64) =

    let parameters = [ ("author_id", Sql.int64 authorId) ]
    
    conn
    |> Sql.connect
    |> Sql.query Sqls.deleteAuthor
    |> Sql.parameters parameters
    |> Sql.executeNonQuery

  /// Insert one row of Author
  member this.insertAuthor  (name: string, bio: string, ?ssid: int, ?spouses: int, ?children: int, ?acct: decimal) =

    let parameters = [ ("ssid", Sql.intOrNone ssid); ("name", Sql.string name); ("spouses", Sql.intOrNone spouses); ("children", Sql.intOrNone children); ("bio", Sql.string bio); ("acct", Sql.decimalOrNone acct) ]
    
    conn
    |> Sql.connect
    |> Sql.query Sqls.insertAuthor
    |> Sql.parameters parameters
    |> Sql.executeRow authorReader

  /// Lists 1000 Author having id > @id
  member this.listAuthor  (authorId: int64) =

    let parameters = [ ("author_id", Sql.int64 authorId) ]
    
    conn
    |> Sql.connect
    |> Sql.query Sqls.listAuthor
    |> Sql.parameters parameters
    |> Sql.execute authorReader

  /// Select one Author using author_id
  member this.selectAuthor  (authorId: int64) =

    let parameters = [ ("author_id", Sql.int64 authorId) ]
    
    conn
    |> Sql.connect
    |> Sql.query Sqls.selectAuthor
    |> Sql.parameters parameters
    |> Sql.executeRow authorReader

  /// Update one row of Author using author_id
  member this.updateAuthor  (name: string, bio: string, authorId: int64, ?ssid: int, ?spouses: int, ?children: int, ?acct: decimal) =

    let parameters = [ ("ssid", Sql.intOrNone ssid); ("name", Sql.string name); ("spouses", Sql.intOrNone spouses); ("children", Sql.intOrNone children); ("bio", Sql.string bio); ("acct", Sql.decimalOrNone acct); ("author_id", Sql.int64 authorId) ]
    
    conn
    |> Sql.connect
    |> Sql.query Sqls.updateAuthor
    |> Sql.parameters parameters
    |> Sql.executeRow authorReader
