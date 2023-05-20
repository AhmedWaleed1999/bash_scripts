``` bash

read -p "Enter the first number: " num1

read -p "Enter the second number: " num2


read -p "Enter the operation (+, -, *, /): " operation


case $operation in
    "+")
        result=$(echo "scale=2; $num1 + $num2" | bc)
        ;;
    "-")
        result=$(echo "scale=2; $num1 - $num2" | bc)
        ;;
    "*")
        result=$(echo "scale=2; $num1 * $num2" | bc)
        ;;
    "/")
        result=$(echo "scale=2; $num1 / $num2" | bc)
        ;;
    *)
        echo "Invalid operation"
        exit 1
        ;;
esac


echo "The result is: $result"


```
