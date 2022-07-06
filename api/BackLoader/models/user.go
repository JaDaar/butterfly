package models

import (
	"errors"
	"fmt"
)

type User struct {
	ID        int
	FirstName string
	LastName  string
	Email     string
}

var (
	users  []*User
	nextID = 1
)

func GetUsers() []*User {
	return users
}

func AddUser(u User) (User, error) {
	if u.ID != 0 {
		return User{}, errors.New("new user must ID that is equal to zero")
	}
	u.ID = nextID
	nextID++
	users = append(users, &u)
	fmt.Printf("New User Added: '%v", u.FirstName)
	return u, nil
}

func GetUserByID(id int) (User, error) {
	for _, u := range users {
		if u.ID == id {
			return *u, nil
		}
	}
	return User{}, fmt.Errorf("user with '%v' not found", id)
}

func UpdateUser(u User) (User, error) {
	for i, v := range users {
		if v.ID == u.ID {
			users[i] = &u
			return u, nil
		}
	}
	return User{}, fmt.Errorf("user with '%v' not found", u.ID)
}

func RemoveUserById(id int) (bool, error) {
	for i, v := range users {
		if v.ID == id {
			//	take the user out of the slice
			// 	the users up to the index, then the users after the index
			users = append(users[:i], users[i+1:]...)
			return true, nil
		}
	}
	return false, fmt.Errorf("user with '%v' not found", id)
}
