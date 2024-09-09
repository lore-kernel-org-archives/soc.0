Return-Path: <conor@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A84ECE579
	for <soc@archiver.kernel.org>; Mon,  9 Sep 2024 14:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0CE7CC4CEC7; Mon,  9 Sep 2024 14:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB7FC4CEC6;
	Mon,  9 Sep 2024 14:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725892418;
	bh=HoCKrL7+5o82WW7cJRSMroomYm7G44fMgjAi70lKcwg=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=uUtot74PDbTTEDHNCVDjPS8xw9VwYCby15yy1/mFNXku5ivfgfBdCVM0zlY2p5D3F
	 MHkYA2Dhk22bSkT9+eXACNrIChwYzX3SjLFBjn//Adr2ki6GlBjQPK6fdyDoVC/aGS
	 lA4QFBBEj7wBN9kNTFOWps3qsYw9ud3dhptjMeA5JK2eINIWS2R3+8gMOrlIMi0ifY
	 lF3bsZMS3N0EjcRaL5v8sp4iFbpWxMsvL1OeJACJ8eFb5oua+kes1OhBvHOAczmmHV
	 yNEGUjVYkAPINjBflwZdMyb8OMKHp9fOvUJ+i6q5S1WJvZ+GmjPLig57sAuSL85TmV
	 zbh6CONEFTzGw==
Date: Mon, 9 Sep 2024 15:33:36 +0100
From: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V soc fixes for v6.11-final
Message-ID: <20240909-hybrid-groovy-601a33b5b309@spud>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X44/jGdhTNky87+X"
Content-Disposition: inline


--X44/jGdhTNky87+X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Here's the fix that was being discussed on IRC over the weekend.

Cheers,
conor.

The following changes since commit 591940e22e287fb64ac07be275e343d860cb72d6:

  firmware: microchip: fix incorrect error report of programming:timeout on success (2024-08-22 20:47:16 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-soc-fixes-for-v6.11-final

for you to fetch changes up to 61f2e8a3a94175dbbaad6a54f381b2a505324610:

  riscv: dts: starfive: jh7110-common: Fix lower rate of CPUfreq by setting PLL0 rate to 1.5GHz (2024-09-08 23:20:19 +0100)

----------------------------------------------------------------
RISC-V soc fixes for v6.11-final

StarFive:
A fix to return one of the clocks on the JH7110 from 1 GHz to 1.5 GHz

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Xingyu Wu (1):
      riscv: dts: starfive: jh7110-common: Fix lower rate of CPUfreq by setting PLL0 rate to 1.5GHz

 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

--X44/jGdhTNky87+X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZt8HPwAKCRB4tDGHoIJi
0mq3AP9LdV4YzjeqnoHO1l4BBy42JMwqs9F3y6OSFv25I6GKwwD/ThjaBiaAPDIY
M2Eqznog6Y5SphlJ4JiMzLyeGpx+YQA=
=aYLb
-----END PGP SIGNATURE-----

--X44/jGdhTNky87+X--
