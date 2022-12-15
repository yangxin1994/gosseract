package gosseract

// #cgo CXXFLAGS: -std=c++0x
// #cgo LDFLAGS: -L/usr/local/lib -llept -ltesseract
// #cgo CPPFLAGS: -Wno-unused-result
import "C"
