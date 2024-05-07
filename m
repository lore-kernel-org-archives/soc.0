Return-Path: <SRS0=Svih=MK=microchip.com=prvs=850126c04=Conor.Dooley@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5F8C25B4F
	for <soc@archiver.kernel.org>; Tue,  7 May 2024 10:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B3F89C3277B; Tue,  7 May 2024 10:22:24 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B23DEC2BBFC;
	Tue,  7 May 2024 10:22:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B23DEC2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1715077343; x=1746613343;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/ylm28bgQwjCsaq+PkwbOcOTeoJ2+0gYNXlHCfijRyE=;
  b=AEf4To9HrlrIRZfoLoyel2upKcvUewjRSw2NeRDuJ7GzXloncI5jTOq6
   G4vUhpNjlnJFtwt4PXaardFS57RSso6rfgsdhu1kv71OxRzIL9H7MUA6h
   d/mTj/+EiQyH239OFtc1f5jydj86TuYHPeHpZlZrqP6aZP2JwYOeXJA5G
   Dz2Oib0NrCbwGZVcyR0mlmQH7GNg/OWeOJsCwDM7rxfiXE8c64E/1cHff
   sKEaE/48wnY/67I1PNSSoAfmm8auJ9Ps4wnDZu+U1FE3bTYcELObvru/6
   EKN0MX33IOMx7VhJy+4oHo9Nb7AXquvyLQnI/EJqacr4zE0i32GblZKdy
   A==;
X-CSE-ConnectionGUID: Vms0K4hKTRCVKW0S9ZejhQ==
X-CSE-MsgGUID: e0l32h4fRqap+iJ+yGpwow==
X-IronPort-AV: E=Sophos;i="6.07,261,1708412400"; 
   d="asc'?scan'208";a="191279130"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 May 2024 03:22:22 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 03:21:51 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Tue, 7 May 2024 03:21:50 -0700
Date: Tue, 7 May 2024 11:21:41 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
CC: Conor Dooley <conor@kernel.org>, <soc@kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.10
Message-ID: <20240507-concrete-come-2899fab0888e@wendy>
References: <20240503-swimmer-botany-7368a8a17b1a@spud>
 <5222e581-a189-4477-ba6a-edf4ce369eb0@app.fastmail.com>
 <20240507-hungrily-squash-2ac370e05fc0@wendy>
 <b618c311-8925-4717-b6bf-f3699b106189@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XB/fNXaRpUVZDCGL"
Content-Disposition: inline
In-Reply-To: <b618c311-8925-4717-b6bf-f3699b106189@app.fastmail.com>

--XB/fNXaRpUVZDCGL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2024 at 12:08:13PM +0200, Arnd Bergmann wrote:
> On Tue, May 7, 2024, at 11:58, Conor Dooley wrote:
> > On Tue, May 07, 2024 at 11:27:36AM +0200, Arnd Bergmann wrote:
> >> On Fri, May 3, 2024, at 17:24, Conor Dooley wrote:

> >> If you are able to extract the DT bits that don't depend
> >> on other branches (jh7xxx, microchip, bindings and
> >> new files) and resend those, I could still add them to the
> >> same dt-late branch.
> >
> > The jh7xxx stuff does actually depend on another branch, although that
> > branch is fixes. Do you want that removed too? If you do, I'd say to
> > just drop the whole PR.
>=20
> As I wrote below, it's fine to have a branch based on a
> fixes branch, so please keep that part.

Cool, just wasn't sure if you were intentionally contradicting yourself
or if the "below" part had just been some general remarks. I'll try to
get a "revised" PR sent tomorrow.

Cheers,
Conor.

--XB/fNXaRpUVZDCGL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjoAtQAKCRB4tDGHoIJi
0i7+AQDAE0G9BqtJOa773r+ubjod/SR22z4KPR/43eTZxk8+PQD9G166SffJh2y4
hASKKKljSskRAWBSYLfrb4/V2wMq5g4=
=pLeS
-----END PGP SIGNATURE-----

--XB/fNXaRpUVZDCGL--
