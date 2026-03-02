// two sums

function twoSum(nums: number[], target: number): [number, number] {
  const penyimpanan = new Map<number, number>(); // nilai -> index

  for (let i = 0; i < nums.length; i++) {
    const angkaSekarang = nums[i];
    const angkaYangDibutuhkan = target - angkaSekarang;

    if (penyimpanan.has(angkaYangDibutuhkan)) {
      return [penyimpanan.get(angkaYangDibutuhkan)!, i];
    }

    penyimpanan.set(angkaSekarang, i); 
  } 

  throw new Error("Tidak ada pasangan yang cocok");
}
 


function twoSums2(nums: number[], target: number): [number, number] {
  const data = new Map<number, number>()
  for (let i = 0; i < nums.length; i++) {
    const dataNow = nums[i]// [1, 2,3 4, 5, 6]
    const dataDibutuhkan = target - dataNow
    if (data.has(dataDibutuhkan)) {
      return [data.get(dataDibutuhkan)!, i] 
    }
    data.set(dataNow, i)
  }

  throw new Error("ada yang salah")
}


//pair defference 
function pairDifference(nums: number[], k: number): [number, number] {
  const data = new Map<number, number>(); // nilai -> index

  for (let i = 0; i < nums.length; i++) {
    const dataNow = nums[i];

    const butuhPlus = dataNow + k;
    const butuhMinus = dataNow - k;

    // cek selisih ke dua arah
    if (data.has(butuhPlus)) {
      return [data.get(butuhPlus)!, i];
    }

    if (data.has(butuhMinus)) {
      return [data.get(butuhMinus)!, i];
    }

    data.set(dataNow, i);
  }

  throw new Error("Tidak ada pasangan dengan selisih tersebut");
}




