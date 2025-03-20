/*
Cleaning Datat in SQL queries

*/

select * 
from project_portfolio ..[Nashveil_housing ];


--------------------------------------------------------------------------------------------------------------------------

--Populate Property Address Date 


select *
from  project_portfolio ..[Nashveil_housing ]
--where PropertyAddress is Null
order by 2;

select a.ParcelID , a.PropertyAddress ,b.ParcelID , b.PropertyAddress , ISNULL(a.PropertyAddress ,b.PropertyAddress)
from  project_portfolio ..[Nashveil_housing ] as a 
join  project_portfolio ..[Nashveil_housing ] as b 
  on 
    a.ParcelID = b.ParcelID
	and 
	a.UniqueID <> b.UniqueID
where a.PropertyAddress is Null;



update a 
Set PropertyAddress = ISNULL(a.PropertyAddress ,b.PropertyAddress)
from  project_portfolio ..[Nashveil_housing ] as a 
join  project_portfolio ..[Nashveil_housing ] as b 
  on 
    a.ParcelID = b.ParcelID
	and 
	a.UniqueID <> b.UniqueID
where a.PropertyAddress is Null;


------------------------------------------------------------------------------------------------------------------------


---Breaking Out Address into individual Columns (Address , City , States)

select PropertyAddress
from  project_portfolio ..[Nashveil_housing ]
--where PropertyAddress is Null
--order by 2;


select 
SUBSTRING (PropertyAddress ,1 ,CHARINDEX(',' ,PropertyAddress)-1) as Address
, SUBSTRING (PropertyAddress ,CHARINDEX(',' ,PropertyAddress)+1 , Len(PropertyAddress) )as Address

from  project_portfolio ..[Nashveil_housing ];


Alter table project_portfolio ..[Nashveil_housing ]
add PropertySplitAddress Nvarchar(255);

update project_portfolio ..[Nashveil_housing ]
set PropertySplitAddress = SUBSTRING(PropertyAddress ,1 ,CHARINDEX(',' ,PropertyAddress)-1) ;


Alter table project_portfolio ..[Nashveil_housing ]
add PropertySplitCity Nvarchar(255);


update  project_portfolio ..[Nashveil_housing ]
set PropertySplitCity = SUBSTRING (PropertyAddress ,CHARINDEX(',' ,PropertyAddress)+1 , Len(PropertyAddress) );


select * 
from project_portfolio ..[Nashveil_housing ];




select OwnerAddress
from project_portfolio ..[Nashveil_housing ];

select 
PARSENAME(replace(OwnerAddress , ',' ,'.') ,3)
,PARSENAME(replace(OwnerAddress , ',' ,'.') ,2)
,PARSENAME(replace(OwnerAddress , ',' ,'.') ,1)
from project_portfolio ..[Nashveil_housing ];


Alter table project_portfolio ..[Nashveil_housing ]
add OwnerSplitAddress Nvarchar(255);

update project_portfolio ..[Nashveil_housing ]
set OwnerSplitAddress = PARSENAME(replace(OwnerAddress , ',' ,'.') ,3) 



Alter table project_portfolio ..[Nashveil_housing ]
add OwnerSplitCity Nvarchar(255);

update project_portfolio ..[Nashveil_housing ]
set OwnerSplitCity = PARSENAME(replace(OwnerAddress , ',' ,'.') ,2) ;


Alter table project_portfolio ..[Nashveil_housing ]
add OwnerSplitState Nvarchar(255);

update project_portfolio ..[Nashveil_housing ]
set OwnerSplitstate = PARSENAME(replace(OwnerAddress , ',' ,'.') ,1) ;



---------------------------------------------------------------------------------------------------------------------------------


--Change 0 and 1 to yes and no in "SoldAsVacant" Feild 


select  distinct SoldAsVacant ,count(SoldAsVacant) 
from project_portfolio ..[Nashveil_housing ] 
group by SoldAsVacant;


 select 
 SoldAsVacant,
 case 
 when  SoldAsVacant = 0 then 'No' else 'Yes'
 end
 from project_portfolio ..[Nashveil_housing ] 
 group by SoldAsVacant;

 Alter table project_portfolio ..[Nashveil_housing ] 
 alter Column SoldAsVacant varchar(3);


update project_portfolio ..[Nashveil_housing ] 
set SoldAsVacant = case 
 when  SoldAsVacant = 0 then 'No' else 'Yes'
 end;



 --------------------------------------------------------------------------------------------------------------------


 --Remove Duplicates 


 With ROW_NUMBER_CTE as 
 (
 select *,
          ROW_NUMBER()Over(
		  PARTITION  BY ParcelID,
		                PropertyAddress,
						SalePrice,
						SaleDate,
						LegalReference
						order by 
						       UniqueID) row_num
 from project_portfolio ..[Nashveil_housing ]
 ---order by ParcelID
 )
 Select*
 from ROW_NUMBER_CTE
 where row_num > 1 
 --order by PropertyAddress;




 --------------------------------------------------------------------------------------------------------------------
 -- Delete Unused Columns 

 select *
from project_portfolio ..[Nashveil_housing ]

Alter table project_portfolio ..[Nashveil_housing ]
Drop Column OwnerAddress,TaxDistrict,PropertyAddress;


