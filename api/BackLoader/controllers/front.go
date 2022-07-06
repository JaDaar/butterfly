package controllers

import (
	"encoding/json"
	"io"
	"net/http"
)

func RegisterControllers() {
	uc := newUserController()

	http.Handle("/users/", *uc)
	http.Handle("/users", *uc)
}

func encodeResponseAsJSON(data interface{}, w io.Writer) {
	json.NewEncoder(w).Encode(data)
	//enc.Encode(data)
}
