Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6B6C4332F
	for <soc@archiver.kernel.org>; Wed,  4 Jan 2023 09:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D6E9EC433D2; Wed,  4 Jan 2023 09:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113ABC433EF;
	Wed,  4 Jan 2023 09:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672824196;
	bh=8Nio75pRnguUldoMBvKssmpiVY656R5TJYi2km9hpHU=;
	h=Date:From:To:List-Id:CC:Subject:In-Reply-To:References:From;
	b=Dl40jAfb0bAzXiN+4O8wnsocGGC+3Jl1+BEd48BzdXvQsDmz2HDtWBv8P2TPmugRy
	 OnI4bHyeefK584AuavsZaZGI5dDMmOU9dD9FWLAmaU+EfWoibogzx362P2K1nFKD7u
	 P1dbdTymqyYjc2UGVBLnY4lWzyfwtYQCLISKAS2gp8XFJiEFYXrEBaTqa2RELzfmQa
	 l674S/6hnp5nc3HRJCajbi0wszsLdv5/LrMiwH7YJSesdUv+1e6AGE8Y+d0WaVRN6o
	 G2YhZrAh6vw7cDuznIgQhZxYIMk3GHvbkSGfZYqZj5GJSYHV3Y6lCO/h9AqNuoPzay
	 xy2J5+cwvkbMg==
Date: Wed, 04 Jan 2023 09:23:14 +0000
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Prabhakar <prabhakar.csengg@gmail.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, guoren <guoren@kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>,
 Jisheng Zhang <jszhang@kernel.org>, krzysztof.kozlowski+dt@linaro.org,
 linux-kernel@vger.kernel.org,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Magnus Damm <magnus.damm@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>,
 "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Rob Herring <robh+dt@kernel.org>, Samuel Holland <samuel@sholland.org>,
 soc@kernel.org, Daire McNamara <daire.mcnamara@microchip.com>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_v5=2E1_9/9=5D_=5BDON=27T_APPLY=5D_cache=3A_si?= =?US-ASCII?Q?five-ccache=3A_add_cache_flushing_capability?=
User-Agent: K-9 Mail for Android
In-Reply-To: <ed198390-1bde-44ec-9f3f-b0e016b4b24c@app.fastmail.com>
References: <Y62nOqzyuUKqYDpq@spud> <20230103210400.3500626-10-conor@kernel.org> <b5712732-40a2-4e29-b29f-e0ab5516d518@app.fastmail.com> <Y7TBh+CJdZPJ6Xzl@spud> <ed198390-1bde-44ec-9f3f-b0e016b4b24c@app.fastmail.com>
Message-ID: <CFB874A3-3E6F-4C5B-B47D-381EB1E07C02@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 4 January 2023 08:17:41 GMT, Arnd Bergmann <arnd@arndb=2Ede> wrote:
>On Wed, Jan 4, 2023, at 01:00, Conor Dooley wrote:
>> On Tue, Jan 03, 2023 at 10:28:19PM +0100, Arnd Bergmann wrote:
>>> On Tue, Jan 3, 2023, at 22:04, Conor Dooley wrote:
>>> > From: Daire McNamara <daire=2Emcnamara@microchip=2Ecom>
>>> >
>>> > SiFive L2 cache controller can flush L2 cache=2E Expose this capabil=
ity via
>>> > driver=2E
>>> >
>>> > Signed-off-by: Daire McNamara <daire=2Emcnamara@microchip=2Ecom>
>>> > [Conor: rebase on top of move to cache subsystem]
>>> > Signed-off-by: Conor Dooley <conor=2Edooley@microchip=2Ecom>
>>> > ---
>>> > This commit needs more work, and a way to enable it from errata=2E I=
've
>>> > not gone and done this as PolarFire SoC has archid etc all set to ze=
ro=2E
>>> > So we need to go figure out a workaround for this, before adding in
>>> > errata enabling code for this=2E I've included it here as a second u=
ser of
>>> > the cache management stuff, since what's currently upstream for the
>>> > ccache driver does not do any cache management=2E
>>> > ---
>>> >  drivers/cache/sifive_ccache=2Ec | 45 ++++++++++++++++++++++++++++++=
+++++
>>> >  1 file changed, 45 insertions(+)
>>>=20
>>> My feeling here is that the cacheflush code is unrelated to the
>>> EDAC code and it should just be a separate file=2E From what I can
>>> tell, all of the existing contents of this file can simply
>>> get merged into drivers/edac/sifive_edac=2Ec, with the newly
>>> added code becoming a standalone driver=2E
>>
>> Sure? I'd like to do that independently of whatever is done for the
>> ax45mp CMOs though, don't think it's worth holding up that platform's
>> support on me splitting this out=2E
>
>Right, no need to touch the existing file as part of this series,
>it probably just gets in the way of defining a good interface here=2E

Sure=2E Can leave it where it was & I'll sort it out later when it's errat=
a etc get added=2E

Btw, would you mind pointing out where you wanted to have that if/else you=
 mentioned on IRC?

Thanks,
Conor=2E

