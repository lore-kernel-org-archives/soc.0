Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CD2143895
	for <soc@lists.linux.dev>; Fri, 16 May 2025 10:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747391817; cv=none; b=E3WF423/w4hcgzMgRoSVg8dlJV+yKk4nsRBvoD0P06p7OvvVFeFGnxCb6d054itytHC+1S/Y2CDaoJucWLL94NuFWWJp9qhxL4YMuAs1Hbhddik4pASoYLVqje0TB5HhwLiAW3lwPTSYT2wN7GjO1kbFuvjKVy/NWIuwCbrLfeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747391817; c=relaxed/simple;
	bh=HltEfTftL2xmSQf6cEPZGKcTWSbGLTtasoaj6OzZffg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F40j9/K10ZButtqjGImh7+DWw5oeqlPlqZTNpBgBH8UbnsnVob8DN2Jkdfy19wm+SArCVW1M+LQ9u2xrjS6Ph8mzAKbj9IqPV2Aa1EkpwiySL5RV4RZaLQkp+etDGRHqmNNg3VbAgZ+IGsKVAcQ7pT8ci7SVql8e0BlE9Eh9vW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+wmBdf3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+wmBdf3"
Received: by smtp.kernel.org (Postfix)
	id 0BC20C4CEEB; Fri, 16 May 2025 10:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2952FC4CEE4;
	Fri, 16 May 2025 10:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747391817;
	bh=HltEfTftL2xmSQf6cEPZGKcTWSbGLTtasoaj6OzZffg=;
	h=Date:From:To:Cc:Subject:From;
	b=C+wmBdf3O3vZIZ6A7mng9r2updPeR/PtZZPf7Lnb/Xud1AMFGi6bliStPnZOeeNwb
	 c2TibglEbqn3cjxlzwbv+708sCJ9NjvtKv58RZunyb/k6SVAOUkVfuUCBdssnsi5o3
	 q2XU+V3dmnMubyOGcbJ8sFqKSv20Vbn/dNC44xRZKwiFg9wAi01NlrFSotz3pf8kEG
	 74kwoyMI5i/3gMgR/LvAfoRn78G8l0z1GzA62vaTJ844HxzKOaTEAJNgVm+oLjiK0A
	 inZg0ECQ+JsFXnpzymz8DuTuse6TMY18U84Q7muDBYGA0R/CKq4bcs2afVP94y4BU6
	 g79IHNJMRcimA==
Date: Fri, 16 May 2025 11:36:53 +0100
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL 1/3] RISC-V config for v6.16
Message-ID: <20250516-joystick-mortified-385820b1ad0b@spud>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9NQ8v+7/FrZL5T5K"
Content-Disposition: inline


--9NQ8v+7/FrZL5T5K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Arnd,

These are a bit late, but I was waiting for some acks on patches that
were outstanding for a while dts wise.

Cheers,
Conor.

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ riscv-config-for-v6.16

for you to fetch changes up to 60c6d3797239d087cc6eb82971988893a8ba2a88:

  riscv: defconfig: spacemit: enable clock controller driver for SpacemiT K1 (2025-04-26 00:41:03 +0100)

----------------------------------------------------------------
RISC-V config for v6.16

PM_GENERIC_DOMAINS is enabled because T-Head SoCs need to use it and
spacemit's gpio and clock controller are enabled for more obvious
reasons.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

----------------------------------------------------------------
Haylen Chu (1):
      riscv: defconfig: spacemit: enable clock controller driver for SpacemiT K1

Michal Wilczynski (1):
      riscv: Enable PM_GENERIC_DOMAINS for T-Head SoCs

Yixun Lan (1):
      riscv: defconfig: spacemit: enable gpio support for K1 SoC

 arch/riscv/Kconfig.socs      | 1 +
 arch/riscv/configs/defconfig | 3 +++
 2 files changed, 4 insertions(+)

--9NQ8v+7/FrZL5T5K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCcVRQAKCRB4tDGHoIJi
0oeyAQD6njgKhyDmYcYhP328COpY96L/pYEzbB2hXkcQVzrb4gEA9OKsdhoFP863
tv+idNspjDD1fsjvcHzbzwNUkyzT3gY=
=ZMm9
-----END PGP SIGNATURE-----

--9NQ8v+7/FrZL5T5K--
