
export interface CategoryProductApp {
  id: number,
  name_category: string,
  createdAt: Date,
  updatedAt: Date
}


export interface TypeProductApp {
  id: number,
  name_type: string,
  createdAt: Date,
  updatedAt: Date,
}
export interface ProductsApp {
  id: number,
  name_product: string,
  createdAt: Date,
  updateAd: Date,
  category_product: CategoryProductApp,
  type: TypeProductApp
}
export enum UserStatus {
  ACTIVE = 'ACTIVE',
  INACTIVE = 'INACTIVE',
  BANNED = 'BANNED'
}
export interface User {
  id: number,
  user_name: string,
  password: string,
  status: UserStatus,
  email: string,
  balance: number,
  createdAt: Date,
  updatedAt: Date
}


export interface OrderProduct {
  id: number,
  userId: number,
  items: ProductsApp[],
  cretaedAt: Date,
  updatedAt: Date
}

const userAlwan: User = {
  id: 1,
  createdAt: new Date(),
  status: UserStatus.ACTIVE,
  updatedAt: new Date(),
  balance: 90000,
  email: "alwan@gmail.com",
  password: "sangatterbang",
  user_name: "alwan"
}

const typeProductv1: TypeProductApp = {
  id: 1,
  createdAt: new Date(),
  updatedAt: new Date(),
  name_type: "app_premium"
}
const categoryProduct1: CategoryProductApp = {
  id: 1,
  createdAt: new Date(),
  updatedAt: new Date(),
  name_category: "app_premium_pro"
}
const productV1App: ProductsApp = {
  id: 1,
  type: typeProductv1,
  createdAt: new Date(),
  category_product: categoryProduct1,
  name_product: "capcutpro_premium",
  updateAd: new Date()
}

const orderUser: OrderProduct = {
  id: 1,
  updatedAt: new Date(),
  items: [productV1App],
  userId: 1,
  cretaedAt: new Date()
}

function appStoreProductPremium() {

}

const dabaseUser: User[] = []

function regositerUser(input: User) {

  if (!input.id) throw new Error("id sangat wajib di isi")
  if (!input.createdAt) throw new Error("CretadeAt sangat wajib di isi")
  if (!input.updatedAt) throw new Error("Update at sangat wajib di isi")
  dabaseUser.push(input)
  const user = dabaseUser[0]
  if (!user) throw new Error("User sangat tidak di temukan")
  return {
    status: "200",
    message: "User berhasil di buat",
    data: user
  }
}

const databaseOrderProduct: OrderProduct[] = []
function orderProductAppAlwan(input: OrderProduct) {

  if (!input.id) throw new Error("id sangat wajib di isi")
  if (!input.cretaedAt) throw new Error("CretadeAt sangat wajib di isi")
  if (!input.updatedAt) throw new Error("Update at sangat wajib di isi")
  databaseOrderProduct.push(input)
  const order = databaseOrderProduct[0]
  if (!order) throw new Error("Order sangat tidak ada")
  return {
    status: "200",
    message: "User berhasil di buat",
    data: order
  }

}
console.log(regositerUser(userAlwan));
console.log(orderProductAppAlwan(orderUser).data.items);


