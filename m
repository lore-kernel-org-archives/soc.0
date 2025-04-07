Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B0A20A5CB
	for <soc@lists.linux.dev>; Mon,  7 Apr 2025 16:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044248; cv=none; b=cpi2BzgpQtBbodr/olYwawVlAtfMXpjDZAeg1ElhregU1lsGLGIcVaq+Px1/LJCFwvOjrq/XLFcRmhpXjWjfcepgMwUmAE/QWIYglmtofGIypWP/eNhhVexQXCa956N79D9MYr1nRMTYVo/Ci2WpZ09vjt66hl74s4dn+y+hjUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044248; c=relaxed/simple;
	bh=Y/hLJ//pzM4un2bQ2ayC32XDMKmA5ak0QqcGXXfNyzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hTw9S639jaNscFPApULJOJb8W4mDt6xQc+W6tN+L9yxI8UaMLU48ck5UvYenP6QjKKJwxVYM1LskW3tW4q3AJI+mtVxpTZZF9nWJmgAYqBxVH3iUjx8h/6fYUw5auFYl4VBWSV3fPCgByMHPI7/bbD44FIKKlLokviudKjXKAgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UzmZScU/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UzmZScU/"
Received: by smtp.kernel.org (Postfix)
	id 77C91C4CEE9; Mon,  7 Apr 2025 16:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B411C4CEDD;
	Mon,  7 Apr 2025 16:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744044248;
	bh=Y/hLJ//pzM4un2bQ2ayC32XDMKmA5ak0QqcGXXfNyzk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UzmZScU/uoH9Tm7HKXop1oqBcJA6LDr4GPS1uR1DSHakslwRy1DtdncBdZ5/WgSPy
	 ItZncV+gWIzdjdOr1Fs2isqKIhqTGKfjj96bllzDPg0YjbwRZ72Km8WlxhZSDKdXIs
	 tyW6tdu7e1NVcAsVtDjOiUkiCct05PAIPW36DOR29uyaZWxJ/CnD/011tAAGLrq+V1
	 fa2zK4EXjyVpViVpLfHRbgzDSqN0ux+kPZZ++2xCk4pZ+hbTbijyZbjGtx8X28CBJw
	 nRWEtHbuGhSE7B4SDonOGz3rjB2azaqo5CdDBSgYKWSaORrINMmWxvEDpoJQYXSG72
	 MzVCQm/tw5+kQ==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac73723b2d5so961691766b.3;
        Mon, 07 Apr 2025 09:44:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+h5m0ttPNMzgCrEsef+yhZ8eySm3yipxiCwoUGpvd1asZm1n73/eM1J4FghDjC5UyKks=@kernel.org
X-Gm-Message-State: AOJu0YyCmbjX99Uf2xAc7l1OHMIcfIYGqHZiIMpmEY6WMPtRddeJ4kIo
	q9M0/sAF9CdjZA7aA0RYReHATbhY4IUyvry1vOcsgvmP/yegTkRbCadcNeYM2j7jsMgGig84MeH
	v/wNY1BQFS1EjDRufd8eVJp08vQ==
X-Google-Smtp-Source: AGHT+IGLOtOLmhpSq0PLbaQYhuI2hTXNomO3c9M6XDkDTB0xbkcQkN/9c1/rJNryKU1+tfluzQLXvqqsDiAM+1t+d6w=
X-Received: by 2002:a17:907:da7:b0:ac2:3ea:c23c with SMTP id
 a640c23a62f3a-ac7e7116fd7mr754949966b.5.1744044246963; Mon, 07 Apr 2025
 09:44:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5552256.Sb9uPGUboI@phil> <CAL_JsqJo+9ycUFHVZ2Darh_RWaRuJGX6KKQGsbeuDWav7vKA2g@mail.gmail.com>
 <8512245.T7Z3S40VBb@diego>
In-Reply-To: <8512245.T7Z3S40VBb@diego>
From: Rob Herring <robh@kernel.org>
Date: Mon, 7 Apr 2025 11:43:54 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJVi5tf8bh6AnZwNwiBe+EG2CHQRGQGLK6SdMzQiiSbWA@mail.gmail.com>
X-Gm-Features: ATxdqUFxaCjS80Qj_U9puWLvAEoD3V9o6VjAwVp2ZHTzEA7_GR-X9ZqxugryY_s
Message-ID: <CAL_JsqJVi5tf8bh6AnZwNwiBe+EG2CHQRGQGLK6SdMzQiiSbWA@mail.gmail.com>
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.15 #3
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: arm@kernel.org, soc@kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 11:40=E2=80=AFAM Heiko St=C3=BCbner <heiko@sntech.de=
> wrote:
>
> Hi Rob,
>
> Am Montag, 7. April 2025, 17:56:37 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Rob Herring:
> > On Wed, Mar 19, 2025 at 6:56=E2=80=AFPM Heiko Stuebner <heiko@sntech.de=
> wrote:
> > >
> > > Hi soc maintainers,
> > >
> > > I made an error and accidentially applied a patch that was meant for
> > > the mfd tree. Thankfully Stephen noticed that when the duplicate
> > > commit appeared in linux-next.
> >
> > Both commits are in v6.15-rc1 now and the revert is not, so this
> > should not get applied/pulled. Or you will need to revert the revert.
>
> yes, that was the intention.
>
> Back when I submitted this PR, I talked with Arnd on IRC the next day.
>
> As both commits are identical sans some Signed-off-by lines, he suggested
> not trying to put a revert in, but instead let git solve it itself, becau=
se
>
> arnd on IRC:
> > [...], but I worry that this would make things worse if 'git merge'
> > ends up doing the revert on top of the original commit once it gets to
> > torvalds. Not sure if that's still a problem in git these days, but
> > I've seen it happen in the past.
> > if two identical patches are in different branches, just leaving them
> > there is usually easier
>
> So this PR was already marked as "superseeded" in patchwork back
> on march 20th.
>
>
> Nevertheless, thanks for making sure no funky revert happens now.

The commit is still in linux-next though. That's how I happened upon this.

Rob
