Return-Path: <SRS0=GgcP=3N=icenowy.me=uwu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FA1C43217
	for <soc@archiver.kernel.org>; Sun, 13 Nov 2022 15:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 21E73C433D7; Sun, 13 Nov 2022 15:52:54 +0000 (UTC)
Received: from sender4-op-o18.zoho.com (sender4-op-o18.zoho.com [136.143.188.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 54CB5C433D6;
	Sun, 13 Nov 2022 15:52:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 54CB5C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=icenowy.me
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=icenowy.me
ARC-Seal: i=1; a=rsa-sha256; t=1668354758; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gHOJwP6zpewX5QvCaBFfraBePoe+k7neGcm3lef2/KK4x5uraJD5VXML3+k6c/wKONgvRO1TWH63cSQQHY4fO/rsxUlotRSFy7wr4kv56owldZyQB12wwKTQI73Tz+cnOH977nKoRajBhBrkAQDc/1PKe180X1cICYJQvWpYdys=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1668354758; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=YkDk6M25XeDPr4xNswMMCbsPLXGMgbObjH2sDwUGYhU=; 
	b=LXlKdK8h2RBrc/zKOWWCg0XitXpi+Rz2uoDP7lr2yvJOlOsm3K9KNYaxlnWclyQ6zTJpZObl8HGEHItw501kFxvZuNVhriW4xyJEYNN7vbgf5oiJHSBODBefWzkfg86lKP/WtED4ggS3m/H6zaLT3D45Iu6LNA43ZhMxbIt2jDw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1668354758;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=YkDk6M25XeDPr4xNswMMCbsPLXGMgbObjH2sDwUGYhU=;
	b=glC0obqpRiP0qU8q2MDvgfAOXvuKhaTPCqymJu4esV+DzUoGUGChPPL6O5+u83rT
	3HWEc7t4cJt/Aym99jSXhmEaY0Fnhjl171hFfrlK7Lktl9K1SCdj1WLWGi7z9/V7P+d
	oMljvGh1TyF7nfPpbg9u84GAamMoKpySq+60UYvI=
Received: from edelgard.fodlan.icenowy.me (112.94.100.40 [112.94.100.40]) by mx.zohomail.com
	with SMTPS id 1668354757017164.46539775376436; Sun, 13 Nov 2022 07:52:37 -0800 (PST)
Message-ID: <d52afd275eaa8db2ec1fb56e9ab52c28392e2bb1.camel@icenowy.me>
Subject: Re: Should we merge arch/riscv/boot/dts via the SOC tree?
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>,  Arnd Bergmann <arnd@arndb.de>, Conor Dooley
 <conor@kernel.org>, kernel@esmil.dk
List-Id: <soc.lore.kernel.org>
Cc: masahiroy@kernel.org, mkl@pengutronix.de, davem@davemloft.net, 
	linux-riscv@lists.infradead.org, soc@kernel.org
Date: Sun, 13 Nov 2022 23:52:32 +0800
In-Reply-To: <882e75f9-dc96-4084-a64b-ace4246c88ff@kernel.org>
References: <mhng-e4210f56-fcc3-4db8-abdb-d43b3ebe695d@palmer-ri-x1c9a>
	 <882e75f9-dc96-4084-a64b-ace4246c88ff@kernel.org>
Organization: Anthon Open-Source Community
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External

=E5=9C=A8 2022-11-07=E6=98=9F=E6=9C=9F=E4=B8=80=E7=9A=84 18:51 +0100=EF=BC=
=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
> On 07/11/2022 17:46, Palmer Dabbelt wrote:
> > This has come up a bunch of times, but I don't think we've ever
> > really
> > made a decision.=C2=A0 Historically that's not been such a big deal
> > because
> > the RISC-V device trees were pretty inactive, but that's changed --
> > both
> > because Conor has been cleaning everything up, and also because
> > there's
> > a bunch of SOCs showing up with RISC-V cores in them.=C2=A0 We talked
> > about
> > this again at plumbers a few times, but Arnd wasn't around it
> > person so
> > I figured it's best to just start an email thread and see how
> > people
> > feel.
> >=20
> > A lot of these new SOCs are based on Arm designs and the device
> > trees
> > very much reflect that, so it makes sense to me to just keep the
> > device
> > tree merges via as similar a path as possible.=C2=A0=20
>=20
> Recent Renesas r9a07g043 (sharing between arm64 and riscv) is example
> of
> that. If changes to them start coming via different trees, we might
> have
> a lot of conflicts.
>=20
> > IIUC that happens via
> > the SOC tree these days, so it makes sense to me that we start
> > handling
> > the RISC-V device trees that way as well.=C2=A0 That would make things
> > easier
> > for contributors, as they'll have one workflow for all their SOCs,
> > but
> > also easier for me as a lot of this SOC stuff touches bits I really
> > don't understand and thus get kind of lost trying to review.
> >=20
> > Arnd: looks like you're handling most of the merges these days so
> > this
> > would be increasing your workload.=C2=A0 I feel kind of bad just dumpin=
g
> > a
> > bunch of stuff on you, but I think at least now the RISC-V DTS are
> > in
> > reasonable shape so hopefully it's not that bad.=C2=A0 It'd certainly
> > help
> > things on my end, and I'm happy to try and re-direct some of that
> > saved
> > time to helping out in SOC land but I'm not sure how well that'd
> > work
> > out in practice as I'm pretty buried.
> >=20
> > On a somewhat related note, Conor has offered to pick up the
> > otherwise
> > unmaintained RISC-V SOCs.=C2=A0 That's sort of its own discussion, but
> > if we
> > change over to the SOC tree we might as well just do everything at
> > the
> > same time.
> >=20
>=20
> On the other hand MIPS DTS is not coming via SoC tree, so there is no
> yet such wide approach.

Fewer SoC vendors share the most of their SoC designs between ARM and
RISC-V ones.

>=20
> Best regards,
> Krzysztof
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

