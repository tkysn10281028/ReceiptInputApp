package utils


func filter(stream []interface{},condition bool) ([]interface{}) {
	output := make([]interface{},0)
	for i := 0;i < len(stream);i++{
		if !condition{
			continue
		}
		output = append(output,stream[i])
	}
	return output
}