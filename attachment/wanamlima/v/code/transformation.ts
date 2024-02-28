//
//Get the real world coordinates of the area the user clicks on the screen
export function get_coords(): void {
  //
  //Get the svg element
  const svg: SVGSVGElement | null = document.querySelector("svg");
  //
  //Check if the svg element is null
  if (!svg)
    throw new Error("No element with the given id exist in your document");
  //
  //Define the point to be transformed
  const point: DOMPoint = svg.createSVGPoint();
  //
  //Attach an event listener to the svg
  svg.onclick = (evt: MouseEvent) => {
    point.x = evt.clientX;
    point.y = evt.clientY;
    //
    //Get the inverse of the transformation matrix
    const ctm: DOMMatrix | undefined = svg.getScreenCTM()?.inverse();
    //
    //Do a matrix transfomation of the point and extract the real-world coordinates
    const { x, y }: { x: number; y: number } = point.matrixTransform(ctm);
    //
    //Alert the user
    alert(`${x},${y},0.4`);
  };
  //
  //Initialize the map with the pixel coordinates
  initialize(svg);
}
//
//THis function initializes the web page given the svg element
export function administer(): void {
  //
  //Get the svg element
  const svg: SVGSVGElement | null = document.querySelector("svg");
  //
  //Check if the svg element is null
  if (!svg)
    throw new Error("No element with the given id exist in your document");
  //
  //Initialize the map with the pixel coordinates
  initialize(svg);
}
//
//Replace all the real-world coordinates with client coordinates
function initialize(svg: SVGSVGElement): void {
  //
  //Get all the area tags
  const areas: Array<HTMLAreaElement> = Array.from(
    document.body.querySelectorAll("area")
  );
  //
  //Update the coords of each area tag within the document to pixels
  areas.forEach((area) => transform_area(area, svg));
}
//
//
function transform_area(area: HTMLAreaElement, svg: SVGSVGElement): void {
  //
  //Get the coordinates string
  const str: string | null = area.getAttribute("coords");
  //
  //Ensure the coords attribute was supplid if not aler the user
  if (!str)
    throw new Error(
      "The coords attribute was not supplied on the area element"
    );
  //
  //Split to access the x, y, r values
  const [x, y, r]: Array<number> = str.split(",").map((s) => parseFloat(s));
  //
  //Transform real world co-ordinates into pixels
  const [px, py]: [number, number] = transform_point(x, y, svg);
  //
  //Transform the radius using the real world coordinates to get the pixels
  const [r0, r1]: [number, number] = transform_point(0, r, svg);
  //
  //Get the radius of the circle in pxels
  const pr: number = r0 - r1;
  //
  //Extract the x and y
  const result: string = `${px},${py},16`;
  //
  //Set the area coordinates to the pixels
  area.setAttribute("coords", result);
}
//
//Transfomation of two coordinates to pixel
function transform_point(
  //
  //The x coordinate 
  initial_x: number,
  //
  //
  initial_y: number,
  svg: SVGSVGElement
): [x: number, y: number] {
  //
  //Get the ctm matrix form the svg
  const ctm: DOMMatrix | undefined = svg.getScreenCTM() ?? undefined;
  //
  //Define the x, y point
  const point: DOMPoint = svg.createSVGPoint();
  //
  //Set the x and y
  point.x = initial_x;
  point.y = initial_y;
  //
  //Transform the point
  const { x, y }: { x: number; y: number } = point.matrixTransform(ctm);
  //
  //X
  const px: number = Math.round(x);
  //
  //y
  const py: number = Math.round(y);
  //
  //Return the pixels x and y
  return [px, py];
}
