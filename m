Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2D62046A8
	for <soc@lists.linux.dev>; Wed,  5 Mar 2025 13:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741180636; cv=none; b=H1IsqA39dpxsytJ8Q+X2Lc3UgU4rOzKKQo5HHMlawENrqolL4o0KQBxKK3G2uXB59YCtWICTQAufyBpKSwt3zF8ZUgj25FGlPkEjUCMpktQmkfNQ+uPDYX46pU5M9UOhjupS6873htNVRdknuUp6j4C83Tna6+QiytWEmM2+R6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741180636; c=relaxed/simple;
	bh=AMygIzE1vjRKH3HQ1Hu0QrxXHQmeaOzjU6mxohILknI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zn8WS6XxRLHj5fO+9RZZh3h8RMJMszGbzMk8Nf/LRoUu/1jb2OshbwaeA/fVzMnSyAjVG5W2DRknK6w0LtglnPeC2AVutOhCG3eflVcVlQVdavZ0wEN7NZ8iQE3Adw/tvRDSQ6cuCsQSY4kPD2uQIBGHhrFyg7nuQdhwBwbcoE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gPZDmBOQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gPZDmBOQ"
Received: by smtp.kernel.org (Postfix)
	id 4A57FC4CEEB; Wed,  5 Mar 2025 13:17:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DFC3C4CEE9;
	Wed,  5 Mar 2025 13:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741180636;
	bh=AMygIzE1vjRKH3HQ1Hu0QrxXHQmeaOzjU6mxohILknI=;
	h=Date:From:To:Cc:Subject:From;
	b=gPZDmBOQA9TA7DuaY6VMCs6uQ7xmbXopI04ZVr9UiC6R26+fut/uWPmy//2x8pSEy
	 8GWqRzyETLqG6dYg7VgexsbrO3u/VzGqMwbAIZQjjrEEQIebOlHAU6LNgu9UlID416
	 CYb2DIOomkAvKabpNuSdYWhU4SM7LAm6gEGQga0EqgAHqfccP1QJfxKaiLCMwC7F+X
	 gU1EgjkAvSohONkIlQKk2OQ2tBIXZF93II8Ee9kUHgO38O4jbbcu9/lcKd4gqzDBYz
	 pr4QoR3+dDJdvdXp/wm1j25ajHzSYEzOQhv0LPLDcQOuX5COLoTeTUkmJoZXjlIDoC
	 t2SUnoVs9Fn3Q==
Date: Wed, 5 Mar 2025 13:17:12 +0000
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Devicetree fixes for v6.14-rc6
Message-ID: <20250305-sip-unable-d56ef7dbf86b@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MUTlGABqi+4r+qFP"
Content-Disposition: inline


--MUTlGABqi+4r+qFP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

Please pull a single fix.

Cheers,
Conor.

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-dt-fixes-for-v6.14-rc6

for you to fetch changes up to 1b133129ad6b28186214259af3bd5fc651a85509:

  riscv: dts: starfive: Fix a typo in StarFive JH7110 pin function definitions (2025-02-04 20:31:30 +0000)

----------------------------------------------------------------
RISC-V Devicetree fix for v6.14-rc6

A single fix for an incorrect define in the jh7110 pinctrl header.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
E Shattow (1):
      riscv: dts: starfive: Fix a typo in StarFive JH7110 pin function definitions

 arch/riscv/boot/dts/starfive/jh7110-pinfunc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--MUTlGABqi+4r+qFP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8hO2AAKCRB4tDGHoIJi
0p8MAQDqe9lHDoQy9MPkfxFlf9wZFQikZ4ZvZTub2KZRx8CDRwEAp78AaohE0U5V
cg61m62REvCJ2Y7PZp8VATqDxOeX+w4=
=xqAj
-----END PGP SIGNATURE-----

--MUTlGABqi+4r+qFP--
