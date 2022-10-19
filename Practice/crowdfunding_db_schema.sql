-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [campaign] (
    [cf_id] int  NOT NULL ,
    [contact_id] int  NOT NULL ,
    [company_name] varchar(100)  NOT NULL ,
    [description] text  NOT NULL ,
    [goal] numeric(10,2)  NOT NULL ,
    [pledged] numeric(10,2)  NOT NULL ,
    [outcome] varchar(50)  NOT NULL ,
    [backers_count] int  NOT NULL ,
    [country] varchar(10)  NOT NULL ,
    [currency] varchar(10)  NOT NULL ,
    [launch_date] date  NOT NULL ,
    [end_date] date  NOT NULL ,
    [category_id] varchar(10)  NOT NULL ,
    [subcategory_id] varchar(10)  NOT NULL ,
    CONSTRAINT [PK_campaign] PRIMARY KEY CLUSTERED (
        [cf_id] ASC
    )
)

CREATE TABLE [categories] (
    [category_id] varchar(10)  NOT NULL ,
    [category] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED (
        [category_id] ASC
    )
)

CREATE TABLE [subcategories] (
    [subcategory_id] varchar(10)  NOT NULL ,
    [subcategory] varchar(50)  NOT NULL ,
    CONSTRAINT [PK_subcategories] PRIMARY KEY CLUSTERED (
        [subcategory_id] ASC
    )
)

CREATE TABLE [contacts] (
    [contact_id] int  NOT NULL ,
    [first_name] varchar(50)  NOT NULL ,
    [last_name] varchar(50)  NOT NULL ,
    [email] varchar(100)  NOT NULL ,
    CONSTRAINT [PK_contacts] PRIMARY KEY CLUSTERED (
        [contact_id] ASC
    )
)

ALTER TABLE [campaign] WITH CHECK ADD CONSTRAINT [FK_campaign_contact_id] FOREIGN KEY([contact_id])
REFERENCES [contacts] ([contact_id])

ALTER TABLE [campaign] CHECK CONSTRAINT [FK_campaign_contact_id]

ALTER TABLE [campaign] WITH CHECK ADD CONSTRAINT [FK_campaign_category_id] FOREIGN KEY([category_id])
REFERENCES [categories] ([category_id])

ALTER TABLE [campaign] CHECK CONSTRAINT [FK_campaign_category_id]

ALTER TABLE [campaign] WITH CHECK ADD CONSTRAINT [FK_campaign_subcategory_id] FOREIGN KEY([subcategory_id])
REFERENCES [subcategories] ([subcategory_id])

ALTER TABLE [campaign] CHECK CONSTRAINT [FK_campaign_subcategory_id]

COMMIT TRANSACTION QUICKDBD