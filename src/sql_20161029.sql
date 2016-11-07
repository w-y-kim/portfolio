
delete from MEMBER 
delete from resume
delete from academicBg
delete from career
delete from certificate
delete from projectCareer

select * from member   

--테이블 삭제한 후 생성할 것!!
create table member(
	memberId 	varchar2(20)	primary key,
	password	varchar2(20)	not null,
	name		varchar2(20)	not null,
	gender		varchar2(1)		default '0',
	birth		date 			not null,
	email		varchar2(50)	not null,
	phone		varchar2(20) 	not null
	
);
create table resume(
	resumeId		varchar2(20)	primary key,
	memberId		varchar2(20),
	constraint fk_resume_memberId foreign key(memberId) references member(memberId) on delete cascade,
	originalImgFile	varchar2(200),
	savedImgFile	varchar2(50)
);

create table academicBg(
	academicBgId	varchar2(20)	primary key,
	resumeId		varchar2(20),
	constraint fk_academicBg_resumeId foreign key(resumeId) references resume(resumeId) on delete cascade,
	adminssionYear	varchar2(20),
	graduationYear	varchar2(20),
	schoolName		varchar2(50),
	major			varchar2(50),
	degree			varchar2(20),
	remarks			varchar2(20)		
);

create table career(
	careerId		varchar2(20)	primary key,
	resumeId		varchar2(20),
	constraint fk_career_resumeId foreign key(resumeId) references resume(resumeId) on delete cascade,
	joinYear		varchar2(20),
	retirementYear	varchar2(20),
	companyName		varchar2(50),
	businessType	varchar2(20),
	department		varchar2(50),
	position		varchar2(20)
);

create table certificate(
	certificateId	varchar2(20)	primary key,
	resumeId		varchar2(20),
	constraint fk_certificate_resumeId foreign key(resumeId) references resume(resumeId) on delete cascade,
	year			varchar2(20),
	month			varchar2(20),
	certificateName	varchar2(50),
	remarks			varchar2(20)
);

create table projectCareer(
	projectCareerID		varchar2(20)	primary key,
	resumeId			varchar2(20),
	constraint fk_projectCareer_resumeId foreign key(resumeId) references resume(resumeId) on delete cascade,
	projectName			varchar2(50),
	developmentPeriod	varchar2(50),
	duration			varchar2(20),
	language			varchar2(20),
	dbos				varchar2(20),
	etc					varchar2(20)
);




--//질문
create table question(
	questionId			varchar2(20)	primary key,
	questionType		varchar2(20)	not null,
	question			varchar2(200) 	not null
);

--//답변
create table answer(	
	questionId			varchar2(20),
	constraint fk_answer_questionId foreign key(questionId) references question(questionId) on delete cascade,
	memberId			varchar2(20),
	constraint fk_answer_memberId foreign key(memberId) references member(memberId) on delete cascade,
	answer				varchar2(200)
);

select * from answer;
----------------------------------------------------------------------------------------------------------
보류 
----------------------------------------------------------------------------------------------------------
--//태그
create table tag(
	tagId			varchar2(20)	primary key,
	questionType	varchar2(20)	not null
);

--//자기소개
create table pr(
	prId 			varchar2(20)	primary key,
	resumeId		varchar2(20),
	constraint fk_pr_resumeId foreign key(resumeId) references resume(resumeId) on delete cascade,
	content			varchar2(2000),
	tagId			varchar2(20),
	constraint fk_pr_tagId foreign key(tagId) references tag(tagId) on delete cascade
);
----------------------------------------------------------------------------------------------------------
-- 더미데이터 -- 
----------------------------------------------------------------------------------------------------------

insert into question values('00000', '여가생활', '여가 생활은 잘 보내고 있니?');
insert into question values('00001', '여가생활', '여가 시간에는 주로 무엇을 하며 시간을 보내?');
insert into question values('00002', '여가생활', '"주어진 대답"의 좋은 점이 뭐라고 생각해?');
insert into question values('00003', '여가생활', '"주어진 대답" 으로 인해 네가 바뀐 부분은 뭐야?');
insert into question values('00004', '대학생활', '동아리나 클럽에 가입하고 있거나 계획이 있니?');
insert into question values('00005', '대학생활', '동아리나 클럽에?');
insert into question values('00006', '대학생활', '가입하고 있거나');
insert into question values('00007', '대학생활', '계획이 있니?');
insert into question values('00008', '대학생활', '동아리나 클럽에 가입하고 있거나 계획이 있니?');
insert into question values('00009', '대학생활', '동아리나 클럽에 가입하고 있거나 계획이 있니?');
insert into question values('00010', '대학생활', '동아리나 클럽에 가입하고 있거나 계획이 있니?');
insert into question values('00011', '대학생활', '동아리나 클럽에 가입하고 있거나 계획이 있니?');
insert into question values('00012', '대학생활', '동아리나 클럽에 가입하고 있거나 계획이 있니?');



insert into answer values('00000', 'admin', '응!');


------------------------------------------------------------------------------------------------------------
--확인용
------------------------------------------------------------------------------------------------------------
delete from question
delete from answer

select *
		from answer
		where memberId = 'admin'
		order by questionId asc;

select *
from question
order by questionId asc;

select * from answer
delete from answer where memberId = 'tooona'

select q.questionId, q.questionType, q.question, a.answer
from question q, answer a, member m
where q.questionId = a.questionId and a.memberId = m.memberId 
and m.memberId = 'admin'
order by questionId asc;

select *
from question
order by questionId asc;

select * from member



//테이블 삭제 (안되면 밑에서 부터 차례대로 삭제!!)
drop table member CASCADE CONSTRAINTS;
drop table favoriteMember CASCADE CONSTRAINTS;
drop table resume CASCADE CONSTRAINTS;
drop table pr CASCADE CONSTRAINTS;
drop table academicBg CASCADE CONSTRAINTS;
drop table career CASCADE CONSTRAINTS;
drop table certificate CASCADE CONSTRAINTS;
drop table projectCareer CASCADE CONSTRAINTS;

//데이터 삭제 (안되면 밑에서 부터 차례대로 삭제!!)
delete from  member;
delete from  favoriteMember;
delete from  resume;
delete from  academicBg;
delete from  career;
delete from  certificate;
delete from  projectCareer;
delete from  question;
delete from  answer;

select * from career
select * from member
select * from resume 
select * from academicbg;
select * from career 
select * from projectCareer where resumeId = '1a';


--친구추가 쿼리 -- 
--create table favoriteMember(
--	memberId 				varchar2(20),	
--	constraint fk_favoriteMemeber_memberId foreign key(memberId) references member(memberId) on delete cascade,
--	acceptor 				varchar2(20) 	not null,
--	favoriteCheck			varchar2(1)		default '0',
--	requestTimeStamp		date			not null,
--	acknowledgeTimeStamp	date
--);
