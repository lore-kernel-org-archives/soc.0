Return-Path: <SRS0=3O4a=BT=microchip.com=Conor.Dooley@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF06CC7EE23
	for <soc@archiver.kernel.org>; Tue, 30 May 2023 13:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 795F9C4339C; Tue, 30 May 2023 13:12:40 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 122C0C433EF;
	Tue, 30 May 2023 13:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 122C0C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685452359; x=1716988359;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rgP8/DkgE67Jn/btWtUmo2sPLJIt6my6BaVAXky+q5g=;
  b=g+SAKZ4SYEysn11ETMlWgbSNyVIGB6N9nbS2FzadZdLmxhyYfqjF+IoT
   lYqxo01h/dqrrPyfd1xzL3VbYc2vwh9IF5QdOye4ejK68zAHuWJV4frwC
   taJmBvxbWSXTztBZzLg6U9SORSfqlbsDtzYYsT4U1zgQnQGvcVlPLkM1d
   3XXZSrLbkl1mVDcxZ/u7LZ7R/bve72t7Tz5t4d75jVoGBXAFSzlG4iJX1
   LKvh3KaOKD3MAdOKuMUFZPtySXl7mUKuzIS+gA7S7wucKl4j2Tgzg5HHt
   3/vr7L19hwJmVPYLKZoPibApIHjUZk4ZkD+X771y9NaZ8dnTgJqkI/iL9
   g==;
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="asc'?scan'208";a="213720607"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 May 2023 06:12:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 30 May 2023 06:12:32 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 30 May 2023 06:12:30 -0700
Date: Tue, 30 May 2023 14:12:07 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jonathan Corbet <corbet@lwn.net>
List-Id: <soc.lore.kernel.org>
CC: <soc@kernel.org>, <conor@kernel.org>, <devicetree@vger.kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <olof@lixom.net>, <palmer@dabbelt.com>,
	<robh+dt@kernel.org>, <arnd@arndb.de>
Subject: Re: [PATCH v2] Documentation/process: add soc maintainer handbook
Message-ID: <20230530-enviable-poise-183119e695bf@wendy>
References: <20230530-multiple-whooping-ee5706fceb67@wendy>
 <87bki23rbx.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Vd/KN9AFeCUUrCcz"
Content-Disposition: inline
In-Reply-To: <87bki23rbx.fsf@meer.lwn.net>

--Vd/KN9AFeCUUrCcz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 07:02:26AM -0600, Jonathan Corbet wrote:
> Conor Dooley <conor.dooley@microchip.com> writes:

> > diff --git a/Documentation/devicetree/bindings/ABI.rst b/Documentation/=
devicetree/bindings/ABI.rst
> > index a885713cf184..93ec82f78ae5 100644
> > --- a/Documentation/devicetree/bindings/ABI.rst
> > +++ b/Documentation/devicetree/bindings/ABI.rst
> > @@ -1,5 +1,7 @@
> >  .. SPDX-License-Identifier: GPL-2.0
> > =20
> > +.. _devicetree-abi:
>=20
> Somehow we've developed this habit of putting labels at the top of each
> file; I really think that they just add clutter and are best left out.
> Without the label, this reference:
>=20
> > +Perhaps one of the most important things to highlight is that dt-bindi=
ngs
> > +document the ABI between the devicetree and the kernel. Please see
> > +:ref:`devicetree-abi` more information on the ABI.
>=20
> ...can just be written as "Please see
> Documentation/devicetree/bindings/ABI.rst".  The cross-reference link
> will be generated as expected, and readers of the plain-text docs don't
> have to go grepping to find the reference.

Sure. As someone who does read these things in their editor that sounds
preferable to me. I didn't know that I could do that, as the whole
"building the docs" thing is new to me ;)
I'll wait a bit before resubmitting for obvious reasons.

Cheers,
Conor.

--Vd/KN9AFeCUUrCcz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHX2JwAKCRB4tDGHoIJi
0jE3AP9pDjLP9d6RnL00Efrio6ZoaKZjOG0zDOEg+4VAprMwmwEAjpD8+2LaBcMN
FnbPRUS5wn47utSB1NzZVqP8Ep4rLAE=
=VH3D
-----END PGP SIGNATURE-----

--Vd/KN9AFeCUUrCcz--
