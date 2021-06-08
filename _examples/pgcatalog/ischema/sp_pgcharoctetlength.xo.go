// Package ischema contains the types for schema 'information_schema'.
package ischema

import "github.com/xo/xo/examples/pgcatalog/pgtypes"

// Code generated by xo. DO NOT EDIT.

// PgCharOctetLength calls the stored procedure 'information_schema._pg_char_octet_length(oid, integer) integer' on db.
func PgCharOctetLength(db XODB, v0 pgtypes.Oid, v1 int) (int, error) {
	var err error

	// sql query
	const sqlstr = `SELECT information_schema._pg_char_octet_length($1, $2)`

	// run query
	var ret int
	XOLog(sqlstr, v0, v1)
	err = db.QueryRow(sqlstr, v0, v1).Scan(&ret)
	if err != nil {
		return 0, err
	}

	return ret, nil
}