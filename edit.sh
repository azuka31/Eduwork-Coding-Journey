echo "202401" >file1.sql
echo "202402" >file2.sql
echo "202403" >file3.sql
echo "202404" >file4.sql
echo "202405" >file5.sql

sed "s/2024/2023/g" file1.sql >file1_tmp.sql
sed "s/2024/2023/g" file2.sql >file2_tmp.sql
sed "s/2024/2023/g" file3.sql >file3_tmp.sql
sed "s/2024/2023/g" file4.sql >file4_tmp.sql
sed "s/2024/2023/g" file5.sql >file5_tmp.sql

mv file1_tmp.sql file1_2023.sql
mv file2_tmp.sql file2_2023.sql
mv file3_tmp.sql file3_2023.sql
mv file4_tmp.sql file4_2023.sql
mv file5_tmp.sql file5_2023.sql

mv file1.sql file1_2024.sql
mv file2.sql file2_2024.sql
mv file3.sql file3_2024.sql
mv file4.sql file4_2024.sql
mv file5.sql file5_2024.sql
