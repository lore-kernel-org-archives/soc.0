Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC8B1B042E
	for <soc@lists.linux.dev>; Tue, 15 Jul 2025 01:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752543742; cv=none; b=hsLvHY8FAltDSjv8ZI/twLRfYCUDkdeWAIsTUbhZwRq5m4wM+Bx4MXKe/ZdPqu74MC8SlvSVhcJTjSOb1aUgRYREnWJ2PRXPROD+x6OByKcB1zLPyAKyvC2Ghpkdg04ueHKI4eWZszz6lj0mLtf1+4mFoH8tNh40EyYTgyLlFzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752543742; c=relaxed/simple;
	bh=BRWhdu9BZAZMFd2tUBpnf/IlIUgJ08AuKoejisfBhqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zbm+gOEj/ZhAxlVOIAbowTKEzAhVgSNa11UWy5OtdGceRd5vxYt8Ebtq5mKvRwEwZcQ6NyLzCFY+sENSkGkJo7l0285ZGQ9JMU8ylEXT/vQS7dLlR2hMZTmEJ/D6HRN2zc1PK7nW5LKIP3mw/EOSOLwSACHboATPXQegjxNEP+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 1C916C4CEF0; Tue, 15 Jul 2025 01:42:22 +0000 (UTC)
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 44307C4CEED
	for <soc@kernel.org>; Tue, 15 Jul 2025 01:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 44307C4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id DEDD1340E65;
	Tue, 15 Jul 2025 01:42:18 +0000 (UTC)
Date: Tue, 15 Jul 2025 01:42:14 +0000
From: Yixun Lan <dlan@gentoo.org>
To: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [GIT PULL RESEND] RISC-V SpacemiT Devicetrees for v6.17
Message-ID: <20250715014214-GYA540030@gentoo>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

  Please pull SpacemiT's device tree changes for v6.17,
Note, I've included an immutable shared tag of reset-binding
in this PR.

  Sorry, I've missed the email title in previous PR, so resend
to fix this ..

  Thanks

Yixun Lan

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://github.com/spacemit-com/linux spacemit-dt-for-6.17-1

for you to fetch changes up to 57fa4ba6d0a4669fd8f2557e760442d684374f3c:

  riscv: dts: spacemit: Move eMMC under storage-bus for K1 (2025-07-09 13:49:27 +0800)

----------------------------------------------------------------
RISC-V SpacemiT DT changes for 6.17

- Add DMA translation buses
- Add PWM support
- Add Reset support
- Add eMMC node

----------------------------------------------------------------
Alex Elder (2):
      dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
      riscv: dts: spacemit: add reset support for the K1 SoC

Guodong Xu (2):
      riscv: dts: spacemit: add PWM support for K1 SoC
      riscv: dts: spacemit: add pwm14_1 pinctrl setting

Vivian Wang (3):
      riscv: dts: spacemit: Add DMA translation buses for K1
      riscv: dts: spacemit: Move UARTs under dma-bus for K1
      riscv: dts: spacemit: Move eMMC under storage-bus for K1

Yixun Lan (2):
      riscv: dts: spacemit: enable eMMC for K1 SoC
      Merge tag 'spacemit-reset-binding-for-6.17-1' of https://github.com/spacemit-com/linux

 .../bindings/soc/spacemit/spacemit,k1-syscon.yaml  |  27 +-
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  10 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |   8 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 485 ++++++++++++++++-----
 include/dt-bindings/clock/spacemit,k1-syscon.h     | 141 ++++++
 5 files changed, 558 insertions(+), 113 deletions(-)
