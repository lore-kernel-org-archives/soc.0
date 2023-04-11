Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1834C77B6F
	for <soc@archiver.kernel.org>; Tue, 11 Apr 2023 21:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B0C59C4339B; Tue, 11 Apr 2023 21:33:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B08C433EF;
	Tue, 11 Apr 2023 21:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681248793;
	bh=a/Ibkn+oiRDOCtEQMuKBzxAMKNVKsFoB2724VcRyOPk=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=lc9Vd94rlQfsOHp2xlvfcUz3DAiSrthDRZM4fIjiS3zdT/11OiT1I+nh7ry1nrQ6d
	 TPb/MwV8H1juQ00+xmqWedqWgnX5roaFJqglBvHzArn1TK1R7ksWT42HvWx5Ym0+lI
	 ti5wFHmDMoF0OSiX0shrJt+3IHn1lWmejV1+gWDlYfRV8ajCgLGEAFTEi2MUjSRp4A
	 ryM8wa5ucv2ZywyuE2QzWhwuERv8t2LcYbn1horMhDmN1IztrEb/aVKhfOQYvIQYog
	 hvMykkUaOboUA/mlte6MINTIY9ooT2cg0txz7arO5Wbju6wUNl3rixsdF5VfmTWaBz
	 yanOWloU1vPNg==
Date: Tue, 11 Apr 2023 22:33:10 +0100
From: Conor Dooley <conor@kernel.org>
To: arnd@arndb.de
List-Id: <soc.lore.kernel.org>
Cc: palmer@dabbelt.com, linux-riscv@lists.infradead.org, soc@kernel.org
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.4
Message-ID: <20230411-sacrifice-liable-524c033b70a8@spud>
References: <20230406-shank-impromptu-3d483bbc249f@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Aal+fc4OVB1GV+w9"
Content-Disposition: inline
In-Reply-To: <20230406-shank-impromptu-3d483bbc249f@spud>


--Aal+fc4OVB1GV+w9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 06, 2023 at 09:24:40PM +0100, Conor Dooley wrote:

> I may have another
> PR adding some of the peripherals (pmu, mmc) for the StarFive stuff
> that are already reviewed etc, but need a rebase on top of what
> actually got applied. Is that okay, or will the end of next week be
> too late for you?

FWIW, the patches didn't show up yet, and now it is too late for me :)

--Aal+fc4OVB1GV+w9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDXSFgAKCRB4tDGHoIJi
0nGOAQDvZS6TFvs0s6z5xx7uf6KIc6DCnrfDdn1ZEaKSpOnHHAEAzyzP+fPmqrkn
Ao9sgz676dQL5BwAaXTTXJ4CVZ9H+wo=
=/3f6
-----END PGP SIGNATURE-----

--Aal+fc4OVB1GV+w9--
