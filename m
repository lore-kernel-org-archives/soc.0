Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FDDC30653
	for <soc@archiver.kernel.org>; Thu,  4 Jul 2024 17:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7D226C4AF0A; Thu,  4 Jul 2024 17:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843A0C3277B;
	Thu,  4 Jul 2024 17:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720115505;
	bh=QmNtYETo+LSMjDpgpqGtzayLtLBpJJhN0N8w0nwzzSQ=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=TZBKdqndvghJgB+e9TdfXQ0zB/3q3A23PgJezT3r2rmkRq6Qb+Zxt9dSg5XSClKCS
	 Ws1SgCydHVphcjKZ7LJZmnz8+KoDspbpZi51FwUoogoxOCx9jdcET75KZPWSMu3pfQ
	 HQg3FWK5ZYGW95IMYi0c8jfEjkPpXDjCieJUh3mnDc8fQm7hMsfrcxr0HeFl4EOKQY
	 y6IStVppYD9mOjnoOj6NWhjg4HoVJhXwtVuLjZMQZQ8+SURhLZFFyhKf1cX7G0AP9Z
	 ZJ6Ug372/MvLH9yTJut4Okkuwr3+fvn/piVoRv8uMqRDh5UPwUn+TvWXs0WeDwoboP
	 xXpZ8SV/tVPeQ==
Date: Thu, 4 Jul 2024 18:51:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Drew Fustini <drew@pdp7.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] MAINTAINERS: thead: add git tree
Message-ID: <20240704-zesty-audio-4774bf482048@spud>
References: <20240704174921.2514921-1-drew@pdp7.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="umQ9gQCL/QRKdSiN"
Content-Disposition: inline
In-Reply-To: <20240704174921.2514921-1-drew@pdp7.com>


--umQ9gQCL/QRKdSiN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04, 2024 at 10:49:21AM -0700, Drew Fustini wrote:
> Add git tree for T-Head device tree files and, in the future, drivers for
> the T-Head TH1520 SoC.
>=20
> Signed-off-by: Drew Fustini <drew@pdp7.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 120351e41ef7..d60b066d5880 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19322,6 +19322,7 @@ M:	Guo Ren <guoren@kernel.org>
>  M:	Fu Wei <wefu@redhat.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Maintained
> +T:	git https://github.com/pdp7/linux.git
>  F:	arch/riscv/boot/dts/thead/

Could you squash in
diff --git a/MAINTAINERS b/MAINTAINERS
index 691f98fe8ed3..2bb4796d3e12 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19513,6 +19513,7 @@ F:	arch/riscv/boot/dts/
 X:	arch/riscv/boot/dts/allwinner/
 X:	arch/riscv/boot/dts/renesas/
 X:	arch/riscv/boot/dts/sophgo/
+X:	arch/riscv/boot/dts/thead/
=20
 RISC-V PMU DRIVERS
 M:	Atish Patra <atishp@atishpatra.org>

please to avoid it being confusing to have 2 different git trees
covering the same platforms?

Cheers,
Conor.


--umQ9gQCL/QRKdSiN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZobhLgAKCRB4tDGHoIJi
0mYzAP9UUP8jq+98LnIdqdhqMvezMSCLAkgxFIsrHAgt9iB9DwEApUT0igPzr577
4VbVRzeRjNwXgoLCxCcyoWY8u6+mZAE=
=2kX8
-----END PGP SIGNATURE-----

--umQ9gQCL/QRKdSiN--
