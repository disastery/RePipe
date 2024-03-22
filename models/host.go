package models

import "github.com/labstack/echo/v4"

type Host struct {
	Echo       *echo.Echo
	SSLEnabled bool
	SSLCrtPem  string
	SSLKeyPem  string
}
