Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA089EB64DA
	for <soc@archiver.kernel.org>; Fri, 14 Jul 2023 12:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ADE5FC433C9; Fri, 14 Jul 2023 12:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C23FC433C8;
	Fri, 14 Jul 2023 12:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689339038;
	bh=DoZpylxY7CpGy+jXG63llo8yl91RkUWNQaLRWeuGCCE=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=e7tm9XWxIja6kysawKaQufaiJn2ZDTPDaXByuDmRUZyFmZ6lMPkXr75Hd8h5/iYNX
	 JKNDsRukUAolIFfThkw5xeJkmAmY9/Tnt/w6URBCzqGkD+2LnVR4CPlXF4FVQZmhBR
	 XC7SAVFoAvo4+aBmnQHVwkvAM8GTCcwaAeyV02La2uivNBye8CbQhXfduZATP1R3kS
	 fNhWWpf/vOoF5EVQ8ZLix6xHtKQtZHHcY/wr2jxu44SY6Pee+fMuYWsaAq2AVrWF/X
	 XBmAbbVfluCAE0Wt/sRbuAhE3o0mKuTr6Q0JfjjqkOJDkO7CZiwJJI9h7KSOVBWwgR
	 nvmaRj4YEsi1w==
Date: Fri, 14 Jul 2023 13:50:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Nishanth Menon <nm@ti.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/3] Documentation/process: maintainer-soc: add clean
 platforms profile
Message-ID: <20230714-verbose-unwound-fb8b1df29d25@spud>
References: <20230714084725.27847-1-krzysztof.kozlowski@linaro.org>
 <20230714084725.27847-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NA94SPv0l+97UIr8"
Content-Disposition: inline
In-Reply-To: <20230714084725.27847-2-krzysztof.kozlowski@linaro.org>


--NA94SPv0l+97UIr8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Krzysztof,

On Fri, Jul 14, 2023 at 10:47:24AM +0200, Krzysztof Kozlowski wrote:
> Some SoC platforms require that commits must not bring any new
> dtbs_check warnings.  Maintainers of such platforms usually have some
> automation set, so any new warning will be spotted sooner or later.
> Worst case: they run the tests themselves.  Document requirements for
> such platforms, so contributors can expect their patches being dropped
> or ignored, if they bring new warnings for existing boards.

Definitely a more scalable approach than your previous version!

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../process/maintainer-handbooks.rst          |  1 +
>  .../process/maintainer-soc-clean-dts.rst      | 22 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 24 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/process/maintainer-soc-clean-dts.rst
>=20
> diff --git a/Documentation/process/maintainer-handbooks.rst b/Documentati=
on/process/maintainer-handbooks.rst
> index 9992bfd7eaa3..976391cec528 100644
> --- a/Documentation/process/maintainer-handbooks.rst
> +++ b/Documentation/process/maintainer-handbooks.rst
> @@ -17,5 +17,6 @@ Contents:
> =20
>     maintainer-netdev
>     maintainer-soc
> +   maintainer-soc-clean-dts
>     maintainer-tip
>     maintainer-kvm-x86
> diff --git a/Documentation/process/maintainer-soc-clean-dts.rst b/Documen=
tation/process/maintainer-soc-clean-dts.rst
> new file mode 100644
> index 000000000000..87feeb5543ff
> --- /dev/null
> +++ b/Documentation/process/maintainer-soc-clean-dts.rst
> @@ -0,0 +1,22 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +SoC Platforms with Strict DTS

I don't think that this title makes much sense, it feels like it has
been truncated. Perhaps add "Requirements" to the end?

> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> +
> +Overview
> +--------
> +
> +SoC platforms or subarchitectures follow all the rules from

s/follow/should follow/?

> +Documentation/process/maintainer-soc.rst.  However platforms referencing=
 this
> +document impose additional requirements listed below.
> +
> +Strict DTS DT schema compliance
> +-------------------------------
Should there be a blank line here to match the other section headings?
Also, to match the title case you used elsewhere, "Schema Compliance"?

> +None of the changes to the SoC platform Devicetree sources (DTS files) c=
an
> +bring new ``make dtbs_check W=3D1`` warnings.  The platform maintainers =
have

Nitpickery again, but perhaps the first sentence here would read better as
"No changes to the SoC platform Devicetree sources (DTS files) should
introduce new ``make dtbs_check W=3D1`` warnings."?

> +automation in place which should point out any new warnings.
> +
> +If a commit introducing new warning gets accepted somehow, the resulting=
 issues
> +shall be fixed in reasonable time (e.g. within one release) or the commit
> +reverted.

It is loosely related, but I was wondering if we should also try to push
people that change the platform's bindings to update the DTS also, so
that binding changes do not introduce W=3D1 complaints?
For many bindings the platform entry in MAINTAINERS does not cover them,
but things like the arm64 Apple stuff mention them specifically & others
will get coverage due to regexes.

Anyway, nitpickery aside I like this approach.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index b61289fa7891..7405fb6e38c3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1561,7 +1561,7 @@ S:	Maintained
>  P:	Documentation/process/maintainer-soc.rst
>  C:	irc://irc.libera.chat/armlinux
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
> -F:	Documentation/process/maintainer-soc.rst
> +F:	Documentation/process/maintainer-soc*.rst
>  F:	arch/arm/boot/dts/Makefile
>  F:	arch/arm64/boot/dts/Makefile
> =20
> --=20
> 2.34.1
>=20

--NA94SPv0l+97UIr8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLFElwAKCRB4tDGHoIJi
0kqwAQC44ASC2klMAo0/1jE5EXiNVwDS+ImG7dllbwYdtwFm8AD/bT80toX21q3w
EnYoc8f17xuSoSCoaZcdDBdT9Fcq0wg=
=w5dv
-----END PGP SIGNATURE-----

--NA94SPv0l+97UIr8--
