DROP TABLE if exists public."User";
DROP TABLE if exists public."Membership";
DROP TABLE if exists public."Group";

CREATE TABLE public."User" (
	uid integer NOT NULL,
	name character varying(120),
	email character varying(60),
	CONSTRAINT "User_pkey" PRIMARY KEY (uid)
)

CREATE TABLE public."Group" (
	gid integer NOT NULL,
	groupName character varying(20),
	CONSTRAINT "Group_pkey" PRIMARY KEY (gid)
)

CREATE TABLE public."Membership" (
	mealTime integer NOT NULL, -- Will be stored as number of minutes after midnight
	CONSTRAINT "Membership_uid_fkey" FOREIGN KEY (uid)
		REFERENCES public."User" (uid) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT "Membership_gid_fkey" FOREIGN KEY (gid)
		REFERENCES public."Group" (gid) MATCH SIMPLE
		ON UPDATE NO ACTION ON DELETE NO ACTION
)


