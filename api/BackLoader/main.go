package main

import (
	"net/http"

	"github.com/backloader/controllers"
	"github.com/backloader/models"
)

func main() {

	models.AddUser(models.User{
		ID:        1,
		FirstName: "John",
		LastName:  "Doe",
		Email:     "john.doe@gmail.com",
	})

	models.AddUser(models.User{
		ID:        2,
		FirstName: "Jane",
		LastName:  "Doe",
		Email:     "jane.doe@gmail.com",
	})

	//http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
	//	w.Write([]byte("<h1>Welcome to my web server!</h1>"))
	//})
	//log.Fatal(http.ListenAndServe(":3000", nil))

	controllers.RegisterControllers()
	http.ListenAndServe(":3000", nil)
}
