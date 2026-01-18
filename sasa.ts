let input: number[] = []
let target: number = 0
//output [0,1]
function twoSum(nums: number[], target: number) {
  const data = new Map<number, number>()
  for (let i = 0; i < nums.length; i++) {
    const completion = target - nums[i]
    console.log(completion);
  }
}

function mapMap(id: number, data: any) {
  const sasa = new Map<number, number>()
  if (sasa.has(id)) throw new Error("Id ada yang ada sudah")
  sasa.set(id, data)
  return {
    message: "Berhasil"
  }
}

mapMap(1, { nama: "alwan", age: 189 })
console.log(mapMap(1, { nama: "alwan", age: 178 }));
// kenpaa tidak error kan saya sudah setup id nya dengan sama 


function pointer(data: string, left: number, right: number): { left: string, right: string } {
  const split = data.split("")
  const dataLeft: string = split[left]
  c
}
}

console.log(pointer("alwan", 1, 2));

