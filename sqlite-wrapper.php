<?php

class MySqlite
{
	var $dbfile;
	var $dbConn;
    var $connectError;

	function MySqlite($dbfile)
	{
		$this->dbfile = $dbfile;
	}

	function connectToDb()
	{
		$connectOk = false;
		try
		{
			$this->dbConn = new SQLite3( $this->dbfile ) );
			$connectOk = true;
		}
		catch (Exception $e) {
			$this->connectError = $e->getMessage();
		}
		return $connectOk;
	}

	function isError()
	{
		$error = $this->dbConn->lastErrorCode();
		return ( $error != 0 );
	}

	function printError()
	{
		print $this->connectError;
	}

	function &query($sql)
	{
		if (!($queryResource = $dbConn->query($sql)))
		{
			$this->connectError = 'Query failed: '.$this->dbConn->lastErrorMsg()
			                    .' SQL: '.$sql;
		    return null;
		}
		return new MySqliteResult($this, $queryResource);
	}
}

class MySqliteResult
{
	var $mysqlitedb;
	var $sqlite3Result;

	function MySqliteResult($mysqlitedb, $sqlite3Result)
	{
		$this->mysqlitedb = $mysqlitedb;
		$this->sqlite3Result = $sqlite3Result;
	}

	function fetch()
	{
		return $this->sqlite3Result->fetchArray( SQLITE3_ASSOC );
	}

	function isError()
	{
		$this->mysqlitedb->isError();
	}
}
?>
