Return-Path: <SRS0=Svih=MK=microchip.com=prvs=850126c04=Conor.Dooley@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3807AC25B4F
	for <soc@archiver.kernel.org>; Tue,  7 May 2024 09:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 24628C4AF66; Tue,  7 May 2024 09:59:01 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B6A65C3277B;
	Tue,  7 May 2024 09:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B6A65C3277B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1715075940; x=1746611940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I8R0aOwE5F/0LpDdnQCFDvh+gCCwWQWz4yTbcx0nLZo=;
  b=qXHhzTlGYnm85TI1memoYmhLBJ0G7p+zjy2FEaIUb2as3CO+bgecFaBE
   7BXXp8Nfpsu3/KBrWdfb6DXlep17wDIp2OHSpSeX5NHplx+pvMcS+23ZN
   ex52cc1zcn1qB73Hr47PPAKF1oftYPsTnFKc4vTVzkHVJxFslBIALiYET
   AUaUViZqbvSNhc6oU5sZcNyk9GRCY21uiBxsamHxT0Nv1kuoiJUoRPdSf
   GR6apTY9++2nxQUuT6uBGO4yG6h8N3xCR8LnaoDXxGdfyu+KtAYUtnXam
   IE3Z9WVv1UcE2Sg4JrCd9p9c+nqy57lX8NryfwKhWFSVY5mVXSxRjVVIe
   A==;
X-CSE-ConnectionGUID: XpFLPF11T4C9dtakVUdILA==
X-CSE-MsgGUID: Mf+BxLsnQ1+NTzeCIox76g==
X-IronPort-AV: E=Sophos;i="6.07,260,1708412400"; 
   d="asc'?scan'208";a="23954165"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 May 2024 02:58:59 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 02:58:43 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 7 May 2024 02:58:42 -0700
Date: Tue, 7 May 2024 10:58:33 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: Conor Dooley <conor@kernel.org>, <soc@kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.10
Message-ID: <20240507-hungrily-squash-2ac370e05fc0@wendy>
References: <20240503-swimmer-botany-7368a8a17b1a@spud>
 <5222e581-a189-4477-ba6a-edf4ce369eb0@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ONhW0iJrbbQwhIht"
Content-Disposition: inline
In-Reply-To: <5222e581-a189-4477-ba6a-edf4ce369eb0@app.fastmail.com>

--ONhW0iJrbbQwhIht
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2024 at 11:27:36AM +0200, Arnd Bergmann wrote:
> On Fri, May 3, 2024, at 17:24, Conor Dooley wrote:
> > Hey Arnd,
> >
> > Please pull some dt updates for v6.10. The diff here is a little bigger
> > than my tag implies, but I've done this on top of -fixes and wanted to
> > make this obvious. I've also not really mentioned all the Kconfig stuff
> > much as you'll get that in another branch.
>=20
> Hi Conor,
>=20
> I don't have a good feeling about pulling this one, given that it
> is both really late and that it pulls in more dependencies than
> we'd like to have.
>=20
> I was really hoping to be done with new features last week
> as I pulled in the other branches. There are two other DT
> pull requests I got after that (amlogic and aspeed), which
> I added to a "soc/dt-late" branch that I could send in the
> second week of the merge window if everything goes well, but
> those don't have the dependencies.
>=20
> If you are able to extract the DT bits that don't depend
> on other branches (jh7xxx, microchip, bindings and
> new files) and resend those, I could still add them to the
> same dt-late branch.

The jh7xxx stuff does actually depend on another branch, although that
branch is fixes. Do you want that removed too? If you do, I'd say to
just drop the whole PR.

> Basing a branch on top of a fixes branch is usually fine,
> especially if those fixes were originally based on an
> early -rc. I can also make exceptions when there are
> complex dependencies between branches, but I need to be
> able to plan for those and not get them just ahead of
> the merge window.

It hadn't seemed particularly complex to me, so I didn't think to ask
you about what to do with the branches etc when I applied the patches.
I'll be more paranoid in the future...


--ONhW0iJrbbQwhIht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjn7SQAKCRB4tDGHoIJi
0nMwAQDZCzWCgZr9oQhkMEJubiubko187xG8D7ytfBOQPJYp3AEAxXWcbsAQ2abn
MelI7b/6pYnKOEMkr2ZAjdv7XkGNBwk=
=CwtN
-----END PGP SIGNATURE-----

--ONhW0iJrbbQwhIht--
