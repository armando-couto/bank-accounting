class Moviment < ApplicationRecord
  enum type: {deposit: "DEPOSIT", plunder: "PLUNDER", transfer: "TRANSFER"}
end