package gcsresource

import (
	"bytes"
	"encoding/json"
	"fmt"
	"os"

	"github.com/mitchellh/colorstring"
)

func Fatal(doing string, err error) {
	Sayf(colorstring.Color("[red]error %s: %s\n"), doing, err)
	os.Exit(1)
}

func Sayf(message string, args ...interface{}) {
	fmt.Fprintf(os.Stderr, message, args...)
}

func PrettifyJson(jsonString string) string {
	var prettyJson bytes.Buffer
	err := json.Indent(&prettyJson, []byte(jsonString), "", "    ")
	if err != nil {
		return jsonString
	}
	return prettyJson.String()
}
