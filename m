Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE81A1BCA0F
	for <soc@lists.linux.dev>; Tue,  8 Apr 2025 14:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744120894; cv=none; b=ZvsnvU+6SHpY1x4SKd0sAu6N/ftfZJ0BuyrBr8KKMCNjrGDcPIHGSh9kR74ft8jYtMbuKFIFKSv+Vx2JRY6tfs57uUS2lvqD8mGlI8rwgLjmxd0XqUVQgrZKFRpAjtj35AYciVDY1HuwGfRYHFrGNzDxIjJvfVmP1VGf+LFbApI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744120894; c=relaxed/simple;
	bh=AJTrUxLCpXkjwGm6dEFFx0uFraK+mSJsogVi5jpWzW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UcX6+vNEQ6agdHFDNOJ+Y9h3cYR8jIxbKOwE8NShJMZ3fqzw/SMV40CpUEmIXuuWCYUx7LOMfUdnEuxF9iRQMlKhEaFU3QytyAs8AaHVGHeLxlNqwu+IZZNUkjxom1Ar4tjxsfXTr6n2mT6R/FbDFa7GcFrqkqxgvPTFR04qvO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SdQDNuMJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SdQDNuMJ"
Received: by smtp.kernel.org (Postfix)
	id 6CCB5C4CEEC; Tue,  8 Apr 2025 14:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B6DC4CEE5;
	Tue,  8 Apr 2025 14:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744120894;
	bh=AJTrUxLCpXkjwGm6dEFFx0uFraK+mSJsogVi5jpWzW4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SdQDNuMJUZiUKqMg7G2AxEx6L+8ROcLJ5YjYK8jQvdj5gH4XXKyNbnJODutqrJnL6
	 nQ4YUZF4QwmTk9zf7B1D2TKImQlcS6Vn0hicpxawkbkZCHBiXz3fQJm+kJSLFrMosk
	 jcmUUjRoIbf937/GwutW51y6T/ka5LGoWp88RL+ITgtG7AtGAyWu0V+27or5TlZXkm
	 DhD6ryUJPDr0Umq+gkHlYIxLxsiKNrS4dMKTyWa8mJrc9bK5B3pzzHM4h8jKD+VK1C
	 JJzsBaqpMzRdN0IvjUAfWC9CGUCG3LTVVE396nBaDmQLmkoTUDUp+cbg++uny93Zd3
	 FEpXcrIRL1S/g==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5cd420781so10032176a12.2;
        Tue, 08 Apr 2025 07:01:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfz0tuYytA/zoktI0FL7xw/DxWnYRiSHoZp+4u6aaaqnw+Q2pt7KHau7orp3b4uvfpBlk=@kernel.org
X-Gm-Message-State: AOJu0Yxlm94DK2SGZK44itlzjm6dbOgngmlcyOUqdQkXvF7j4OBcGZRy
	3vzH2NDFG1vl01b4E7WP41z1SIb1it6X+yFGUFdkRS3JnIKqmCOh65fNBkc8BO4X4gY/tbVErVw
	RMcK+iGWj70x+YY5xQAIFnxHnLA==
X-Google-Smtp-Source: AGHT+IGP9sd4kwLQh9cskvbaOURGKlmbwlRvhOGqjeU+701fsh0fIkFAcBdv9E8PkoqmV6SOnJfOslOAlnpG7pMPeOA=
X-Received: by 2002:a05:6402:5108:b0:5ee:497:d713 with SMTP id
 4fb4d7f45d1cf-5f0db8b37ccmr10221419a12.33.1744120892804; Tue, 08 Apr 2025
 07:01:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5552256.Sb9uPGUboI@phil> <8512245.T7Z3S40VBb@diego>
 <CAL_JsqJVi5tf8bh6AnZwNwiBe+EG2CHQRGQGLK6SdMzQiiSbWA@mail.gmail.com> <2000188.PYKUYFuaPT@diego>
In-Reply-To: <2000188.PYKUYFuaPT@diego>
From: Rob Herring <robh@kernel.org>
Date: Tue, 8 Apr 2025 09:01:21 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+EwYZYYePusUZbOh+n6-MVt2AFGEiPg8AzHR73K-9-BQ@mail.gmail.com>
X-Gm-Features: ATxdqUH8Tr9HDZeB4zegoj3RV-fkJZt-T-YIfzDJpk3-wYrrf7UR40vozxN9hLk
Message-ID: <CAL_Jsq+EwYZYYePusUZbOh+n6-MVt2AFGEiPg8AzHR73K-9-BQ@mail.gmail.com>
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.15 #3
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 11:49=E2=80=AFAM Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
>
> Am Montag, 7. April 2025, 18:43:54 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Rob Herring:
> > On Mon, Apr 7, 2025 at 11:40=E2=80=AFAM Heiko St=C3=BCbner <heiko@sntec=
h.de> wrote:
> > >
> > > Hi Rob,
> > >
> > > Am Montag, 7. April 2025, 17:56:37 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Rob Herring:
> > > > On Wed, Mar 19, 2025 at 6:56=E2=80=AFPM Heiko Stuebner <heiko@sntec=
h.de> wrote:
> > > > >
> > > > > Hi soc maintainers,
> > > > >
> > > > > I made an error and accidentially applied a patch that was meant =
for
> > > > > the mfd tree. Thankfully Stephen noticed that when the duplicate
> > > > > commit appeared in linux-next.
> > > >
> > > > Both commits are in v6.15-rc1 now and the revert is not, so this
> > > > should not get applied/pulled. Or you will need to revert the rever=
t.
> > >
> > > yes, that was the intention.
> > >
> > > Back when I submitted this PR, I talked with Arnd on IRC the next day=
.
> > >
> > > As both commits are identical sans some Signed-off-by lines, he sugge=
sted
> > > not trying to put a revert in, but instead let git solve it itself, b=
ecause
> > >
> > > arnd on IRC:
> > > > [...], but I worry that this would make things worse if 'git merge'
> > > > ends up doing the revert on top of the original commit once it gets=
 to
> > > > torvalds. Not sure if that's still a problem in git these days, but
> > > > I've seen it happen in the past.
> > > > if two identical patches are in different branches, just leaving th=
em
> > > > there is usually easier
> > >
> > > So this PR was already marked as "superseeded" in patchwork back
> > > on march 20th.
> > >
> > >
> > > Nevertheless, thanks for making sure no funky revert happens now.
> >
> > The commit is still in linux-next though. That's how I happened upon th=
is.
>
> Ah right. I've recreated my next branch earlier today, after the -rc1
> release, so this should be gone with the next linux-next.

Still there today and now we have:

['tsd,px30-cobra-ltk050h3146w', 'rockchip,px30-cobra', 'rockchip,px30']
['tsd,px30-cobra-ltk050h3146w-a2', 'rockchip,px30-cobra', 'rockchip,px30']
['tsd,px30-cobra-ltk500hd1829', 'tsd,px30-cobra', 'rockchip,px30']

Which appear on no list.

Rob
