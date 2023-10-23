Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BB71C001E0
	for <soc@archiver.kernel.org>; Mon, 23 Oct 2023 08:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2BF2BC433CA; Mon, 23 Oct 2023 08:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB43C433C7;
	Mon, 23 Oct 2023 08:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698049631;
	bh=VMTJfimWxD2ILNYWo5Q0hGhuuxNAiNQL2dtWaGJDBpw=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=jZAm89CXNCvRLVD0qs765vwkdARbZ/9snD8N/JQ6Hcc03nuQkEMBg44K6dVaWto9B
	 q5hGkg1GBU/IcjmkgseTGzzkLsEBfa+fO5F7AhdJZ2kKN4YPBXqUfrPNnXUh5wxbdR
	 nzrmIPKPlMzzc+kwbvt4wp2298sjtFnUs3pPB47Vb1HsQwgSJkifSRjW7A7aAzbM79
	 QObeaPTXWDsU+NKIGcjx0dC3A0D0ftrC0h3Gx2YKSSNlJKEkjWGiFMtEDvNwZkKTS+
	 k5PuIN2/MvCYLDeuxtBKxaB8GgEdjgocIjxUY4VQaq4RFjfTR2QzbY/a7OTDwGWKr+
	 jwDPQU64rCaxw==
Date: Mon, 23 Oct 2023 09:27:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] riscv: dts: thead: convert isa detection to new
 properties
Message-ID: <20231023-factor-unashamed-2fd76c2ad02b@spud>
References: <20231022154135.3746-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uZzXzpTKTGrgzgtU"
Content-Disposition: inline
In-Reply-To: <20231022154135.3746-1-jszhang@kernel.org>


--uZzXzpTKTGrgzgtU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 22, 2023 at 11:41:35PM +0800, Jisheng Zhang wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Convert the th1520 devicetrees to use the new properties
> "riscv,isa-base" & "riscv,isa-extensions".
> For compatibility with other projects, "riscv,isa" remains.
>=20
> Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> Acked-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>=20
> Hi Arnd,
>=20
> This is the only one thead patch for v6.7, could you please apply it
> directly?

FYI, this is missing your signoff, since you are resending my patch.

Cheers,
Conor.

--uZzXzpTKTGrgzgtU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTYuWwAKCRB4tDGHoIJi
0gaxAP4r49NwCNjROW78Q/G+7YoLWCXPATofAPsnsGVWgGdhCwEAirNvgyRE5s5y
xqcf7cE9bbEfurl/6ye2sL0ITB7oKwc=
=Nj8q
-----END PGP SIGNATURE-----

--uZzXzpTKTGrgzgtU--
