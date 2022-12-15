package gosseract

// #cgo CXXFLAGS: -std=c++0x
// #cgo LDFLAGS: -Ltesseract -llibtesseract -Llept -lliblept
// #cgo CPPFLAGS: -Wno-unused-result
import "C"
