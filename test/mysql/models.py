# Code generated by sqlc. DO NOT EDIT.
# versions:
#   sqlc v1.18.0
import dataclasses
from typing import Any, Optional


@dataclasses.dataclass()
class Author:
    id: Any
    name: Any
    bio: Optional[Any]
    address: Optional[Any]
    date_of_birth: Optional[Any]
    last_ts: Optional[Any]
    savings_amt: Optional[Any]
    loan_amt: Optional[Any]
    disabled: Optional[Any]
    married: Optional[Any]
    payable: Optional[Any]
