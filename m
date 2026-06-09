Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609FF221FCD
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 14:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781013771; cv=none; b=bRpRG7JBGS+2HD1hciufM8Clv3oh2cCqkN1RKfkB9YWFTHVbnZtWS4V1UO86p/qUahoHR1awR6HMWjJIjZZOo68lQb7mFaUlbMc1XqYnxyQdi0cpaYIvzAO0T8SEJRII2rS5xRs0ubMOzJJVLmWigLnbk907k+n0g+ugIhPNU80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781013771; c=relaxed/simple;
	bh=NPfPBQi3GZaYiqpC6PjvVqhJD/njMB0gPDTeHS688UU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ghI/5v6s7A0+bhS0Y0E0D9KPTuwFK38+2+JycaWZInJrITxUDz3wTLwxUn7su1CfiNEz5fVpI+5m/wZGaBg5SWkcmu6o3s/+i2Xc5v3F3uyhur5Z8ACh0fyztUt+NuOwG2ndRoOrrLSc3IIlYuDhiQ5zw2SB0QJy5wn8/m9pJjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DtK0gtAX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DtK0gtAX"
Received: by smtp.kernel.org (Postfix)
	id 06F1D1F0089E; Tue,  9 Jun 2026 14:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E55F41F00898
	for <soc@kernel.org>; Tue,  9 Jun 2026 14:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781013769;
	bh=DIZIK8PnwGd41Y19B48/hAerlfXbkRInPJ4vUvQE2jE=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=DtK0gtAX8eIXWHYN93mHVyi7G4V5d26VPGTSorr0U3q+qd8grJ6ybJdxkrr0hTOzg
	 Ht8cg25AcKGji9l+BZZdfZS2G/LCF+fvbp0oXqDqXebWUdqdXtz+dWxPkGBXaMjemP
	 tRdRNm4+043Ok1t3TXifWlz6DJhYNVsP3BujyC+6YNOaaorFJNVuKohB9M+DbLJXwR
	 vYtbWo9tW/jDp1T9RTb/E+eWZTE+CTSxL0xoGDlSes9Hl/3TANjV02U2JztKQRixhm
	 3M8Dxr/86jH2F0KzYBbt1SnZ8mKRuzlSvVADe7AB1l2um6pR6pc8Kjpm1IEFbkfJfL
	 ZefaiEV4rJojw==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3967725a77fso55256601fa.1
        for <soc@kernel.org>; Tue, 09 Jun 2026 07:02:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8jX9OXI9+eKvZWH/JYRswL5F12fghdeZUSKd3c8cP6mEFS9vqylZVRmHfyvHrj4fqjgYI=@kernel.org
X-Gm-Message-State: AOJu0YwOtwSx5NzW/eeekaY+clsknl9qBU85BhFRnh+5moT4STFN3OrT
	qjbC+IwXwG9SgJmrKEiN4TFdqMAvnGULP5z42eIH7VEaqUf/3qjOPSVrSRlWczZd7iNqWzopI+u
	jBwZt73+Xki8Butt40hNeP0qDfyPQbWE=
X-Received: by 2002:a05:6512:3b9a:b0:5aa:6e86:55e5 with SMTP id
 2adb3069b0e04-5acf6be8927mr979674e87.13.1781013768217; Tue, 09 Jun 2026
 07:02:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ah3ZAPLzh8ORGmpH@home.wens.tw> <20260609-mighty-excellent-shoebill-04d7fa@quoll>
 <CAGb2v64guguXmg-=WYmZyz=rw3PNRvh+TnEE1yWFz=AJbryssw@mail.gmail.com>
 <98f3e864-3a9e-4f96-a633-0c0053ec35fb@kernel.org> <CAGb2v64o+tgnLqK_xDoauB4ThF_0979_5XPB38KiZHYyh1BnVQ@mail.gmail.com>
 <e2bf1f8b-677e-4184-b752-26e987f29121@kernel.org> <CAGb2v654d6kj_CjWKtCGE+mLnSUBrQhywA9aCAGFhqh1SGQ1vg@mail.gmail.com>
 <aigZP9W6AWzde2qo@collins>
In-Reply-To: <aigZP9W6AWzde2qo@collins>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 9 Jun 2026 23:02:36 +0900
X-Gmail-Original-Message-ID: <CAGb2v64Qk9uWDiuR3oM5aE5xSi_eC+cVZT3ZUT3JJQUazE6g8w@mail.gmail.com>
X-Gm-Features: AVVi8Cccpi1_OhVw7fhQSEKzKM9A1mVInpapc_87jyD4L-bqqQfD3ViCMlP8kbM
Message-ID: <CAGb2v64Qk9uWDiuR3oM5aE5xSi_eC+cVZT3ZUT3JJQUazE6g8w@mail.gmail.com>
Subject: Re: [GIT PULL] Allwinner DT Changes for 7.2
To: Paul Kocialkowski <paulk@sys-base.io>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, soc@kernel.org, Jernej Skrabec <jernej@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 10:46=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.i=
o> wrote:
>
> Hi,
>
> Le Tue 09 Jun 26, 22:26, Chen-Yu Tsai a =C3=A9crit :
> > On Tue, Jun 9, 2026 at 10:18=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> > >
> > > On 09/06/2026 14:38, Chen-Yu Tsai wrote:
> > > > On Tue, Jun 9, 2026 at 8:51=E2=80=AFPM Krzysztof Kozlowski <krzk@ke=
rnel.org> wrote:
> > > >>
> > > >> On 09/06/2026 13:48, Chen-Yu Tsai wrote:
> > > >>> On Tue, Jun 9, 2026 at 8:43=E2=80=AFPM Krzysztof Kozlowski <krzk@=
kernel.org> wrote:
> > > >>>>
> > > >>>> On Tue, Jun 02, 2026 at 03:09:52AM +0800, Chen-Yu Tsai wrote:
> > > >>>>> The following changes since commit 254f49634ee16a731174d2ae34bc=
50bd5f45e731:
> > > >>>>>
> > > >>>>>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> > > >>>>>
> > > >>>>> are available in the Git repository at:
> > > >>>>>
> > > >>>>>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.g=
it tags/sunxi-dt-for-7.2
> > > >>>>>
> > > >>>>> for you to fetch changes up to 44cf19e41c769720750dbb8752aca75c=
247e565f:
> > > >>>>>
> > > >>>>>   arm64: dts: allwinner: a523: add gpadc node (2026-05-25 05:02=
:58 +0800)
> > > >>>>>
> > > >>>>>
> > > >>>>> As mentioned in the tag, this pull request contains a change th=
at should
> > > >>>>> be shared between the soc and clk trees. However since I don't =
have any
> > > >>>>> clk changes to send this cycle, I think it can just go through =
the soc
> > > >>>>> tree without any issues.
> > > >>>>
> > > >>>> But the clock driver change cannot be in the DTS branch. This sh=
ould go
> > > >>>> via clock tree even if it is one change. And definitely not via =
DTS
> > > >>>> branch.
> > > >>>
> > > >>> It is a shared change, because it moves two symbols from the driv=
er's
> > > >>> private header to the public DT binding header. I don't see how t=
his
> > > >>> can go through just the clk tree when one of the subsequent patch=
es
> > > >>> uses those new symbols.
> > > >>>
> > > >>> "clk: sunxi-ng: v3s: Export MBUS and DRAM clocks to the public he=
ader"
> > > >>> is needed by "ARM: dts: sun8i: v3s: Add mbus node to represent th=
e
> > > >>> interconnect".
> > > >>>
> > > >>> The other way to go about this is to use raw numbers first, then
> > > >>> another patch in the next cycle to switch the numbers to actual
> > > >>> macros. IMHO not worth the churn and headache.
> > > >>
> > > >> You can have a duplicated define.
> > > >
> > > > I honestly did not know that it worked.
> > > >
> > > > However, splitting what is effectively one logical change (*move*
> > > > something) into two patches just to be able to merge them through t=
wo
> > > > separate trees still seems wrong to me.
> > >
> > > It is not really one logical change. Defining a new ABI (binding head=
er
> > > define) is considered one change. Merging binding change into driver
> > > commit breaks rule of splitting bindings from implementation.
> > >
> > > Second rule is that DTS branch CANNOT take driver changes. So if you =
do
> > > not want to adhere to the above rule you still cannot combine it into
> > > DTS branch.
> >
> > Very well. I will drop the two changes and send a revised pull request.
> >
> > Paul, can you redo the clk changes as requested in the next cycle?
>
> Sure, so if I understand correctly, commit:
> clk: sunxi-ng: v3s: Export MBUS and DRAM clocks to the public headersunxi
>
> should be split into two, one adding the definitions to the dt-bindings
> headers first and a second one removing them from the clk driver?

Correct.

> Can it still make it for 7.2?

If you send it out soon, then maybe I can send both in a PR to Stephen.
But the v3s dts patch is not going to make it.


ChenYu
