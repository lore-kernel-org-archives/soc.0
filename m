Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B81C2BD09
	for <soc@archiver.kernel.org>; Mon, 24 Jun 2024 16:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4560AC4AF0C; Mon, 24 Jun 2024 16:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB271C2BBFC;
	Mon, 24 Jun 2024 16:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719247361;
	bh=M6JLWLum6NeubGv21wEYN0yfBEAq1Kwlx9HKuXir0Jk=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=hqtWE61HI8b5LWbad9/Jjk6N2hqgPAmadpitO6SrnuVmlT53ceqS0lqwQ/QsKDNQY
	 1SaIz2YL5m7XsyNt/s2sZcePQcV3CpTNbyl3YnMV3p2H0gseRfuY4Lep8TrqvGj1Sm
	 VkeY/l1OnNUiH4TSzMKMbDIZFoPFtFySxQZwK+jP6VBgaAFeDvEzt1ybP3b+Obrp6c
	 4ScY7R99SmS0hntAcdzCpRC+Hr8Sr31GHYi0j+x6AF4d8bekrQ5Fbfh/GB5BS+ROv9
	 UO43/48/csls7djLAjYxEjkLTvH+hRrAZ/afIER163Eq2wtHQ/n+l2Be2tZJXu8opg
	 FIcRzfNjxbwJw==
Date: Mon, 24 Jun 2024 17:42:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	soc@kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 2/2] dt-bindings: interrupt-controller: convert
 marvell,mpic binding to YAML
Message-ID: <20240624-glucose-error-270164cbd584@spud>
References: <20240624145355.8034-1-kabel@kernel.org>
 <20240624145355.8034-3-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/zwfOdrJRt9PPGPO"
Content-Disposition: inline
In-Reply-To: <20240624145355.8034-3-kabel@kernel.org>


--/zwfOdrJRt9PPGPO
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 04:53:55PM +0200, Marek Beh=FAn wrote:

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/marve=
ll,mpic.yaml b/Documentation/devicetree/bindings/interrupt-controller/marve=
ll,mpic.yaml
> new file mode 100644
> index 000000000000..616a41c87352
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/marvell,mpic=
=2Eyaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/marvell,mpic.yam=
l#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Marvell Armada 370, 375, 38x, 39x, XP Interrupt Controller
> +
> +maintainers:
> +  - Marek Beh=FAn <kabel@kernel.org>
> +
> +description: |

If you end up respinning, both |s from descriptions can be dropped, but
those are relatively minor and the conversion looks okay to me.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +  interrupts:
> +    items:
> +      - description: |
> +          Parent interrupt on platforms where MPIC is not the top-level
> +          interrupt controller.

--/zwfOdrJRt9PPGPO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnmh/AAKCRB4tDGHoIJi
0tqoAQC88PjCZzUFf6ALmF0ZmdFXZ41b5cukc0TsEELT6eQZ4gEApS0umNdL/Vd0
aXI/w57uSippcFJJFRCPioCXvdLbTQ4=
=HrKw
-----END PGP SIGNATURE-----

--/zwfOdrJRt9PPGPO--
