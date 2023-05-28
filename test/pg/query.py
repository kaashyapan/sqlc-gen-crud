# Code generated by sqlc. DO NOT EDIT.
# versions:
#   sqlc v1.18.0
# source: query.sql
import dataclasses
import decimal
from typing import AsyncIterator, Iterator, Optional

import sqlalchemy
import sqlalchemy.ext.asyncio

from authors import models


DELETE_AUTHOR = """-- name: delete_author \\:exec
DELETE FROM authors
WHERE author_id = :p1
"""


INSERT_AUTHOR = """-- name: insert_author \\:one
INSERT INTO authors
( 
    ssid
 ,  name
 ,  spouses
 ,  children
 ,  bio
 ,  acct
) VALUES (
    :p1
 ,  :p2
 ,  :p3
 ,  :p4
 ,  :p5
 ,  :p6
)
RETURNING author_id, ssid, name, spouses, children, bio, acct
"""


@dataclasses.dataclass()
class InsertAuthorParams:
    ssid: Optional[int]
    name: str
    spouses: Optional[int]
    children: Optional[int]
    bio: str
    acct: Optional[decimal.Decimal]


LIST_AUTHOR = """-- name: list_author \\:many
SELECT author_id, ssid, name, spouses, children, bio, acct FROM authors
WHERE author_id > :p1
ORDER BY author_id
LIMIT 1000
"""


SELECT_AUTHOR = """-- name: select_author \\:one
SELECT
    author_id
 ,  ssid
 ,  name
 ,  spouses
 ,  children
 ,  bio
 ,  acct
FROM authors
WHERE author_id = :p1
"""


UPDATE_AUTHOR = """-- name: update_author \\:one
UPDATE authors
SET 
    ssid = :p1
 ,  name = :p2
 ,  spouses = :p3
 ,  children = :p4
 ,  bio = :p5
 ,  acct = :p6
WHERE author_id = :p7
RETURNING author_id, ssid, name, spouses, children, bio, acct
"""


@dataclasses.dataclass()
class UpdateAuthorParams:
    ssid: Optional[int]
    name: str
    spouses: Optional[int]
    children: Optional[int]
    bio: str
    acct: Optional[decimal.Decimal]
    author_id: int


class Querier:
    def __init__(self, conn: sqlalchemy.engine.Connection):
        self._conn = conn

    def delete_author(self, *, author_id: int) -> None:
        self._conn.execute(sqlalchemy.text(DELETE_AUTHOR), {"p1": author_id})

    def insert_author(self, arg: InsertAuthorParams) -> Optional[models.Author]:
        row = self._conn.execute(sqlalchemy.text(INSERT_AUTHOR), {
            "p1": arg.ssid,
            "p2": arg.name,
            "p3": arg.spouses,
            "p4": arg.children,
            "p5": arg.bio,
            "p6": arg.acct,
        }).first()
        if row is None:
            return None
        return models.Author(
            author_id=row[0],
            ssid=row[1],
            name=row[2],
            spouses=row[3],
            children=row[4],
            bio=row[5],
            acct=row[6],
        )

    def list_author(self, *, author_id: int) -> Iterator[models.Author]:
        result = self._conn.execute(sqlalchemy.text(LIST_AUTHOR), {"p1": author_id})
        for row in result:
            yield models.Author(
                author_id=row[0],
                ssid=row[1],
                name=row[2],
                spouses=row[3],
                children=row[4],
                bio=row[5],
                acct=row[6],
            )

    def select_author(self, *, author_id: int) -> Optional[models.Author]:
        row = self._conn.execute(sqlalchemy.text(SELECT_AUTHOR), {"p1": author_id}).first()
        if row is None:
            return None
        return models.Author(
            author_id=row[0],
            ssid=row[1],
            name=row[2],
            spouses=row[3],
            children=row[4],
            bio=row[5],
            acct=row[6],
        )

    def update_author(self, arg: UpdateAuthorParams) -> Optional[models.Author]:
        row = self._conn.execute(sqlalchemy.text(UPDATE_AUTHOR), {
            "p1": arg.ssid,
            "p2": arg.name,
            "p3": arg.spouses,
            "p4": arg.children,
            "p5": arg.bio,
            "p6": arg.acct,
            "p7": arg.author_id,
        }).first()
        if row is None:
            return None
        return models.Author(
            author_id=row[0],
            ssid=row[1],
            name=row[2],
            spouses=row[3],
            children=row[4],
            bio=row[5],
            acct=row[6],
        )


class AsyncQuerier:
    def __init__(self, conn: sqlalchemy.ext.asyncio.AsyncConnection):
        self._conn = conn

    async def delete_author(self, *, author_id: int) -> None:
        await self._conn.execute(sqlalchemy.text(DELETE_AUTHOR), {"p1": author_id})

    async def insert_author(self, arg: InsertAuthorParams) -> Optional[models.Author]:
        row = (await self._conn.execute(sqlalchemy.text(INSERT_AUTHOR), {
            "p1": arg.ssid,
            "p2": arg.name,
            "p3": arg.spouses,
            "p4": arg.children,
            "p5": arg.bio,
            "p6": arg.acct,
        })).first()
        if row is None:
            return None
        return models.Author(
            author_id=row[0],
            ssid=row[1],
            name=row[2],
            spouses=row[3],
            children=row[4],
            bio=row[5],
            acct=row[6],
        )

    async def list_author(self, *, author_id: int) -> AsyncIterator[models.Author]:
        result = await self._conn.stream(sqlalchemy.text(LIST_AUTHOR), {"p1": author_id})
        async for row in result:
            yield models.Author(
                author_id=row[0],
                ssid=row[1],
                name=row[2],
                spouses=row[3],
                children=row[4],
                bio=row[5],
                acct=row[6],
            )

    async def select_author(self, *, author_id: int) -> Optional[models.Author]:
        row = (await self._conn.execute(sqlalchemy.text(SELECT_AUTHOR), {"p1": author_id})).first()
        if row is None:
            return None
        return models.Author(
            author_id=row[0],
            ssid=row[1],
            name=row[2],
            spouses=row[3],
            children=row[4],
            bio=row[5],
            acct=row[6],
        )

    async def update_author(self, arg: UpdateAuthorParams) -> Optional[models.Author]:
        row = (await self._conn.execute(sqlalchemy.text(UPDATE_AUTHOR), {
            "p1": arg.ssid,
            "p2": arg.name,
            "p3": arg.spouses,
            "p4": arg.children,
            "p5": arg.bio,
            "p6": arg.acct,
            "p7": arg.author_id,
        })).first()
        if row is None:
            return None
        return models.Author(
            author_id=row[0],
            ssid=row[1],
            name=row[2],
            spouses=row[3],
            children=row[4],
            bio=row[5],
            acct=row[6],
        )
