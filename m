Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77713C7EE29
	for <soc@archiver.kernel.org>; Mon, 22 May 2023 21:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C419C4339B; Mon, 22 May 2023 21:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F292C433D2;
	Mon, 22 May 2023 21:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684791271;
	bh=9IvHbwxWotRDGLurTj9kBGUNDEMevIUG0y7FUrF3eGo=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=rLgjnFw894v6/OxfNpvLixauDGVx9TiVYw2+j2jHtrwSFQQVTeC5MN1BdyQKuwOYj
	 x1r4GT9VdN34Fki1AkrDzQNfTUJtZwlBut1d0b8AtbZe7sntfwYH43qtowDeQllFhV
	 SsrBdhxbdF9T7xnmO2LwwE2OXr6Tq3qk5LnWVXf5d8mZpzFuQ1FquXXuc/wvVo6Wu0
	 C6JTMz4uFg0dgjOCg9vbBfVGMquAt51X1y82DNKiRuL2FOMNyIsH91kqZ2Ni0OoSDU
	 Qnzrwv4g4uWka5frZ9rdrdkVk6DVKrHu2KBtTiZjwWrMv7FncqwxtAkLOndCKQNYq8
	 W28l5oxFt0X4w==
Date: Mon, 22 May 2023 22:34:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Olof Johansson <olof@lixom.net>,
	Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1] Documentation/process: add soc maintainer handbook
Message-ID: <20230522-concrete-unpeeled-7e4718e61b46@spud>
References: <20230515-geometry-olympics-b0556ff8a5f7@spud>
 <cf1c6b8c-8a3f-eca1-948f-e41946d4c34c@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d2KZAKHL08ilPcp3"
Content-Disposition: inline
In-Reply-To: <cf1c6b8c-8a3f-eca1-948f-e41946d4c34c@linaro.org>


--d2KZAKHL08ilPcp3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 16, 2023 at 10:31:19AM +0200, Krzysztof Kozlowski wrote:
> On 15/05/2023 21:20, Conor Dooley wrote:

> > +devicetree ABI stability
> > +~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +Perhaps one of the most important things to highlight is that dt-bindi=
ngs
> > +document the ABI between the devicetree and the kernel.  Once dt-bindi=
ngs have
> > +been merged (and appear in a release of the kernel) they are set in st=
one, and
> > +any changes made must be compatible with existing devicetrees.  This m=
eans that,
> > +when changing properties, a "new" kernel must still be able to handle =
an old
> > +devicetree.  For many systems the devicetree is provided by firmware, =
and
> > +upgrading to a newer kernel cannot cause regressions.  Ideally, the in=
verse is
> > +also true, and a new devicetree will also be compatible with an old ke=
rnel,
> > +although this is often not possible.
>=20
> I would prefer to skip it and instead: enhance
> Documentation/devicetree/bindings/ABI.rst and then reference it here.
>=20
> > +
> > +If changes are being made to a devicetree that are incompatible with o=
ld
> > +kernels, the devicetree patch should not be applied until the driver i=
s, or an
> > +appropriate time later.  Most importantly, any incompatible changes sh=
ould be
> > +clearly pointed out in the patch description and pull request, along w=
ith the
> > +expected impact on existing users.

I'm not really sure that I like this truncated section so much, but here
it is... I kept the last paragraph intact as it does not talk about the
ABI, but rather exceptions of submaintainers.

devicetree ABI stability
~~~~~~~~~~~~~~~~~~~~~~~~

Perhaps one of the most important things to highlight is that dt-bindings
document the ABI between the devicetree and the kernel. Please see
:ref:`devicetree-abi` for devicetree ABI rules.

If changes are being made to a devicetree that are incompatible with old
kernels, the devicetree patch should not be applied until the driver is, or=
 an
appropriate time later.  Most importantly, any incompatible changes should =
be
clearly pointed out in the patch description and pull request, along with t=
he
expected impact on existing users.


--d2KZAKHL08ilPcp3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGvf4QAKCRB4tDGHoIJi
0tlRAP0Xv64GpLbhEZCmHfeE6R0ZjOht40u/pXgdh7zKn+HlQQD/cR99qreVnVJr
ISgfexcq8exhTueLUoA4bLLbeWj+GwM=
=DvjU
-----END PGP SIGNATURE-----

--d2KZAKHL08ilPcp3--
