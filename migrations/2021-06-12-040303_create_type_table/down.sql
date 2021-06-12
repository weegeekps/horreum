ALTER TABLE "storehouse" DROP CONSTRAINT storehouse_type_fkey;
ALTER TABLE "storehouse" DROP COLUMN "type";
DROP TABLE "type";
