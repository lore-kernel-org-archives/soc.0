Return-Path: <SRS0=F+Ij=BV=microchip.com=Conor.Dooley@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44779C77B7A
	for <soc@archiver.kernel.org>; Thu,  1 Jun 2023 14:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 259E5C4339B; Thu,  1 Jun 2023 14:13:55 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 96741C433D2;
	Thu,  1 Jun 2023 14:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 96741C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685628833; x=1717164833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SOJvV7HqozaTtO1Lcs1pdOUa558kUviCYZEEXg0IcGA=;
  b=gzfbbgCD1Rh/vVwluNj3ICnKNE2JDdeHZhXEjkIDhlx4ipupLVD8G61e
   7oCyeuQvecMuEzqDNrTyBb2quM1Bw3CcmgY3LCjg1NYhUm8OreE9n0QV/
   VErA6JgqM1KaCgMrnL0gVQZTLsL1gi5IEEK+AgQ/GDSANU2Rwt0Lo1+T2
   quE6aeN+h37j9c9olxSKxKo0C6vX/B2JIWqkwZrB46we7cmnJjyVYdSXn
   GZ7qPTtCsM1BTDfAv7Q9rvR0Z/Nf3hLD4PWtjmrDF1c00UHCIZ19OYIVo
   vYdh1RyS7fnEngTyYr3WEul7NLDrWXKrakYRz9+MDL7uUhK39T0jYCohs
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="asc'?scan'208";a="216403503"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Jun 2023 07:13:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 1 Jun 2023 07:13:45 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 1 Jun 2023 07:13:43 -0700
Date: Thu, 1 Jun 2023 15:13:20 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: <soc.lore.kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>, Aurelien Jarno
	<aurelien@aurel32.net>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH 0/2] arm*/dts: Enable symbols for rpi device trees
Message-ID: <20230601-rake-calamari-eda0c88bd9bf@wendy>
References: <20230530175624.2360218-1-u.kleine-koenig@pengutronix.de>
 <20230601140214.i4yvya763sotyjz7@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PgvLnnJC8TCb4t8C"
Content-Disposition: inline
In-Reply-To: <20230601140214.i4yvya763sotyjz7@pengutronix.de>

--PgvLnnJC8TCb4t8C
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 01, 2023 at 04:02:14PM +0200, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Tue, May 30, 2023 at 07:56:22PM +0200, Uwe Kleine-K=F6nig wrote:
> > based on an earlier submission by Aurelien Jarno, I rebased and slightly
> > simplified the patches.
> >=20
> > There was some related irc conversion in #armlinux. Quoting the relevant
> > parts:
> >=20
> > 1685078851< ukleinek> arnd, [florian]: Who would pick up https://lore.k=
ernel.org/linux-arm-kernel/20220410225940.135744-1-aurelien@aurel32.net ?
> > 1685078920< ukleinek> arnd, [florian]: If there is an agreement in gene=
ral that this is a good idea, I can coordinate with Aurelien that for arm64=
 there is a v2 with the simpler approach I pointed out.
> > 1685083481< arnd> ukleinek: I have no objections to this, if [florian] =
wants to pick it up and send me for 6.5.
> > 1685083809< arnd> robher: any comments on this one?
> > 1685466520 < [florian]> ukleinek: I was hoping we would get an Ack for =
robher before picking it up in the brcm soc tree, don't want to ruffle any =
feathers unnecessarily
> >=20
> > So it seems to start a beneficial chain reaction, only Rob's Ack is
> > needed.
>=20
> Not sure this might help, but as Rob seems to be away for mail, I'll
> try: arch/arm64/boot/dts/nvidia/Makefile and
> arch/arm64/boot/dts/ti/Makefile also make use of -@. So this patch at
> least isn't a completely new thing and maybe Florian might dare to take
> this patch even without Rob's explicit consent?!

FWIW you can have mine, unless it is explicitly Rob's you want Florian.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--PgvLnnJC8TCb4t8C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHingAAKCRB4tDGHoIJi
0ub3APwJLXqorAtnmOtj1QhSqoDgjUnXj1APLB+gBicwWoKtBQD+MBPdQy9AX2g0
rUffj84RC6B4rrwcwGo+ytVk0XZ1YQQ=
=/pN2
-----END PGP SIGNATURE-----

--PgvLnnJC8TCb4t8C--
