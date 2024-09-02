create sequence ujon.seq_tag__tag_id
    start with 1
    increment by 1
    no minvalue
    no maxvalue
    cache 1
    as bigint;

create table ujon.tbl_tag
(
    tag_id bigint      not null default nextval('seq_tag__tag_id'::regclass),
    name   varchar(50) not null,
    constraint pk_tag primary key (tag_id)
);

create table ujon.tbl_blog
(
    blog_id       uuid                     not null,
    title         varchar(100)             not null,
    language_code varchar(2),
    status        varchar(25)              not null,
    created_at    timestamp with time zone not null default now(),
    updated_at    timestamp with time zone not null default now(),
    constraint pk_blog primary key (blog_id)
);

comment on column ujon.tbl_blog.language_code is 'ISO 639-1';
comment on column ujon.tbl_blog.status is 'type: pending, publish, delete';


create table ujon.tbl_blog_tag
(
    blog_id uuid   not null,
    tag_id  bigint not null,
    constraint pk_blog_tag primary key (blog_id, tag_id),
    constraint fk_blog_tag__blog_id foreign key (blog_id) references ujon.tbl_blog (blog_id) on delete cascade,
    constraint fk_blog_tag__tag_id foreign key (tag_id) references ujon.tbl_tag (tag_id) on delete cascade
);

create index idx_blog_tag__blog_id ON ujon.tbl_blog_tag (blog_id);
