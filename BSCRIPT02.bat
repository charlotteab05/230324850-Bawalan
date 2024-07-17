@echo off

:menu
echo Select a Shape:
echo 1. CIRCLE
echo 2. TRIANGLE
echo 3. QUADRILATERAL
choice /c 123 /m "ENTER YOUR CHOICE: "

if errorlevel 3 goto quadrilateral 
if errorlevel 2 goto triangle 
if errorlevel 1 goto circle 
echo Invalid Choice, Please Try Again.
goto menu

:CIRCLE
set /p radius=Enter the radius of the circle: 
set /a area=31415 * %radius% * %radius% /100
echo The area of the circle is: %area%
goto end

:Triangle
set /p a=Enter the length of side a: 
set /p b=Enter the length of side b: 
set /p c=Enter the length of side c: 
rem Check if the sides form a valid triangle
set /a sum_ab=%a%+%b%
set /a sum_bc=%b%+%c%
set /a sum_ca=%c%+%a%

if %sum_ab% leq %c% (
    echo The lengths do not form a valid triangle.
    goto menu
)
if %sum_bc% leq %a% (
    echo The lengths do not form a valid triangle.
    goto menu
)
if %sum_ca% leq %b% (
    echo The lengths do not form a valid triangle.
    goto menu
)

rem Simplified calculation for the area using an approximate method
set /a area=(%a% * %b%) / 2
echo The approximate area of the triangle is %area% square units.

rem Determine the type of triangle
if %a%==%b% if %b%==%c% (
    echo Type of triangle = Equilateral.
) else if %a%==%b% if not %b%==%c% (
    echo Type of triangle = Isosceles.
) else if %a%==%c% if not %c%==%b% (
    echo Type of triangle = Isosceles.
) else if %b%==%c% if not %c%==%a% (
    echo Type of triangle = Isosceles.
) else (
    echo Type of triangle = Scalene.
)
goto menu

:quadrilateral
set /p length=Enter the length: 
set /p width=Enter the width: 
set /a area=%length% * %width%
echo The area of the quadrilateral is: %area%

if %length%==%width% (
    echo The quadrilateral is a square.
) else (
    echo The quadrilateral is a rectangle.
)
goto end

:end
echo Press any key to exit.
pause