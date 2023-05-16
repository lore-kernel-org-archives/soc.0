Return-Path: <SRS0=4a3r=BF=microchip.com=Conor.Dooley@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C13DC77B75
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 09:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D4509C433EF; Tue, 16 May 2023 09:16:14 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E8C53C433D2;
	Tue, 16 May 2023 09:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E8C53C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684228571; x=1715764571;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kb56PZ4c03l2GhNe6a5xbJY4KvpJ9NK+1Yzfq2wlekI=;
  b=1z/jpg+5KShsat/Ckcrxsm1v8lK5H0z4jhrfViG8yHePATIPEI/gVit5
   SRPBdGRRoQqg0coXJ8NdfO+s6cM4w8go8xJwa/zh0kkzJ3yjw1LlxGM9z
   OndqwVgIEcVgMiHRSYmKr55qrjMfVhtLZGJo52krogdjo7xFgNuvC7vYp
   6i9uuvZOc9HxCQiGN+PR0kcC/LA52S2CeqsYXkR1ij4buFe/dj9T/FEZN
   H8fULavNuv+s0Q5UOXcBarrTuNtb4FBCWwT9GVYG5TFcuX6CSthfDS91Q
   Bg4WaYzfvTewT2I5Ntjk9eLuvtYX4HmyyTorlgoZX7/hY/N7ZwGS4lE9s
   g==;
X-IronPort-AV: E=Sophos;i="5.99,278,1677567600"; 
   d="asc'?scan'208";a="215627684"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 May 2023 02:16:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 16 May 2023 02:16:03 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 16 May 2023 02:16:01 -0700
Date: Tue, 16 May 2023 10:15:40 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
CC: Conor Dooley <conor@kernel.org>, <soc@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Olof Johansson <olof@lixom.net>, Palmer
 Dabbelt <palmer@dabbelt.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v1] Documentation/process: add soc maintainer handbook
Message-ID: <20230516-tactical-handcraft-d245a095faa4@wendy>
References: <20230515-geometry-olympics-b0556ff8a5f7@spud>
 <cf1c6b8c-8a3f-eca1-948f-e41946d4c34c@linaro.org>
 <20230516-grader-dejected-df65cdc584b3@wendy>
 <cca446b3-9b92-3191-ae0d-1bd7e552c90f@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PtBfR+i2mj9pXUBf"
Content-Disposition: inline
In-Reply-To: <cca446b3-9b92-3191-ae0d-1bd7e552c90f@linaro.org>

--PtBfR+i2mj9pXUBf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 16, 2023 at 11:06:41AM +0200, Krzysztof Kozlowski wrote:
> On 16/05/2023 10:57, Conor Dooley wrote:
> > On Tue, May 16, 2023 at 10:31:19AM +0200, Krzysztof Kozlowski wrote:
> >> On 15/05/2023 21:20, Conor Dooley wrote:

> >>> + - Defer the devicetree changes to a release after the binding and d=
river have
> >>> +   already been merged
> >>> +
> >>> + - Change the bindings in a shared immutable branch that is used as =
the base for
> >>> +   both the driver change and the devicetree changes
> >>
> >> The policy told to me some time ago was that no merges from driver
> >> branch or tree are allowed towards DTS branch, even if they come only
> >> with binding header change. There are exceptions for this, e.g. [1], b=
ut
> >> that would mean we need to express here rules for cross-tree merges.
> >=20
> > I've got away with having an immutable branch for dt-binding headers!
>=20
> Of course, all is in an immutable branch, but in which tree?

For example:
- dt-bindings & header with the clock defines in the base/immutable branch
  on top of -rc1
- driver patches on top of the immutable branch, in a PR to Stephen
- dts patches on top of the immutable branch, PR to Arnd

So, clock tree doesn't get the dts, soc tree doesn't get the driver.
Hopefully that clarifies what I meant.

> I talk about a case when driver tree, e.g. different clock maintainer,
> takes the binding.

If the other tree just "takes the binding", without some coordination,
then you're SOOL and have to wait a release.

> > That said, Arnd did actually have a look at this (and suggested some
> > changes) before I sent it & did not cry fowl about this section. IIRC,
> > this is actually his wording, not mine.

Probably worth Arnd chiming in & just telling us what he is okay with
taking.

Cheers,
Conor.

--PtBfR+i2mj9pXUBf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGNJvAAKCRB4tDGHoIJi
0q0lAP4yeb7Qv9khm4px8qzetAw8FByjxe7F7Hb5Iu38DARrsQEAhy8q7y1R1tmp
IJ/kRF2k57AInRDcYTR/PChtZvzF/AA=
=20NK
-----END PGP SIGNATURE-----

--PtBfR+i2mj9pXUBf--
