package gosseract

// #cgo CXXFLAGS: -std=c++0x
// #cgo CPPFLAGS: -Wno-unused-result -IC:/vcpkg/installed/x64-windows/include
// #cgo LDFLAGS: -LC:/vcpkg/installed/x64-windows/lib -l:leptonica-1.84.0.lib -l:tesseract53.lib
import "C"
