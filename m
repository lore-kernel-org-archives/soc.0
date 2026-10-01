Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A725226BF
	for <soc@lists.linux.dev>; Thu,  1 Oct 2026 19:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790882696; cv=none; b=DZszW00tE071NEVmawkMdnMcc2eAVFNa/tFU6voPkV0BDL2B0rUtdon/Y86xP7tA3tSSw/Bg7pefzF5c66qlZ2YYqMmp1AD7XmnuMc9vkgkLGeraGHeGyfW9XN2Grba7amaB+H433PDKv5KiCjZmnQ0L/clHKS0DXS87ELkU7eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790882696; c=relaxed/simple;
	bh=0zl8OdSxO7h7NIIa6eK3AAK31USq1E+LqAcwfp8Skpk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CLaFrOYtqX9q54mkazDMaTlaMabTN3mxUDRymOlSbJWpwYNK78/C3TRisaa8czqc3OmKaEqd8BgNj3j+ehazjkIYJvwRSi7KxXl2Xr91iRaBhQpDp3B/Jc3XQb+l0h+/Mk1NTlk0dEdw4LdUcK+J+iYbrU90BQihZL883blWsyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hE40VTv5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hE40VTv5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FF071F00898
	for <soc@lists.linux.dev>; Thu,  1 Oct 2026 19:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790882694;
	bh=vUgg6Q6C7bmDuxn2xo5vJ0z9fBM6ieoXi9Gwqqo6ztg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hE40VTv5kwI5vC8qst+3Ul5mT0paNlCQ+tf7CAY4EHEkad3Nu5hQAnl9sDO34Uc0T
	 YrVoz5Yw1WccIZzYQFyvFfnow3Gd9+veVtMXJVaJ41gEnU2Blv71WjfVfE1YG3Tkrq
	 580XnIWKwqe+M1s7w27PmqMFE6UOviplL3z3V6CS/A87ABMKsT+Wh8Rhgf6u8pIQ00
	 5lHnBb9fw820KAJvWsLfoxtfNfiGLLPPlP/ZskPfW1EqwC41p1o63Ymg8kXMcd1pRI
	 eIHpCCp2qzYzvwoy3NDA1DQ+NgOttFGltKFKhDoBo+V4cyI4JmWYM4kq6zAaWRitzl
	 VP9b/mYLMmt1w==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a87e23860cso1760071fa.0
        for <soc@lists.linux.dev>; Thu, 01 Oct 2026 12:24:54 -0700 (PDT)
X-Gm-Message-State: AFq9FYLBwYvsePbuZOsHvQAslKOKs44VleSrxL5Pc2ICwAUO4HUWQ+oH
	A953tpS65zeZR+8qWQvaoGoHt5K26vynnQODNNnyT3HJlZZ8YnwxgE3Ux4czrJ+/JRqs90HIMLF
	w7wJRlh2eUjasNbfyo4cwuZYeeJZUsu0=
X-Received: by 2002:a05:651c:1987:b0:3a4:68f1:8bee with SMTP id
 38308e7fff4ca-3a7833da2afmr10860121fa.6.1790882693269; Thu, 01 Oct 2026
 12:24:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAD++jL=vbc7DM1RB8_VfzWJhT0ZSGYegKN7NKJLbBB7bgFio2w@mail.gmail.com>
 <20261001-striped-polar-tuatara-d66794@quoll>
In-Reply-To: <20261001-striped-polar-tuatara-d66794@quoll>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 21:24:40 +0200
X-Gmail-Original-Message-ID: <CAD++jLk4Kyzi51qm1_N459xA6jxZR_97xGa+wuUQZLB_uU0A-g@mail.gmail.com>
X-Gm-Features: AclHuK-limh2gCePDThBkjOajbz9qF9G52sFUd6I5HvvxJLugmHTOb6rOCipE6c
Message-ID: <CAD++jLk4Kyzi51qm1_N459xA6jxZR_97xGa+wuUQZLB_uU0A-g@mail.gmail.com>
Subject: Re: [GIT PULL] Ux500 DTS changes for v7.4
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 2:15=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:

> > Linus Walleij (9):
> >       ARM: dts: ux500: Make panel regulators have unique names
> >       ARM: dts: ux500: Harmonize GPIO key names
> >       ARM: dts: ux500: Add the Imagis ISA to Janice DTS
> >       ARM: dts: ux500: Add the Imagis ISA to Gavini DTS
> >       ARM: dts: ux500: Add new AB8500/AB8505 regulators
> >       ARM: dts: ux500: Fix up regulator assignments
> >       ARM: dts: ux500: Add sound DAI provider cells
> >       ARM: dts: ux500: Convert HREF audio to audio-graph-card2
> >       ARM: dts: ux500: Add Samsung phone audio graphs
>
> None of this was in next:
>
> Days in linux-next:
> ----------------------------------------
>  0 | +++++++++ (9)
>
> Commits with 0 days in linux-next (9 of 9: 100.0%):
>
> What happened?

I've never had any -next tree for this SoC, I always just collected
the patches and used the SoC tree itself as testing ground as
for most minor SoCs...

Yours,
Linus Walleij
