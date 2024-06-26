Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1764C27C4F
	for <soc@archiver.kernel.org>; Wed, 26 Jun 2024 21:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B81E4C4AF09; Wed, 26 Jun 2024 21:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34322C32789;
	Wed, 26 Jun 2024 21:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719436050;
	bh=ig5gUISYzD4pN/eJBUxvNXxSLorRoBtGXLDpHdc2NEM=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=fEqMHy9rJRvmI5/PTZ0oMUiH302+bkldwnxmKYL0Xv79RsNYIb+dWNgIkPADIpG6Z
	 oMBobZGfFOvVDTkepjDaJVQTFrYNChM/8k/TbYHQDvPZpD//ZQ5OG6Z0xdivZUtbzk
	 1tjC5rNykSfdlMEH4w2enNG/Pemm2G6N/q+nd2TpRNDSogjVV1VLVBNAbTWCU6Fg8X
	 0yD+n6xxS9p0i0HtdE5Vyb+lcEwCe4THiUwvAJYr0YaDPRFcS4usMB8eDYdJDDnZ7Z
	 Rr+ytB0TUZ2juv+u8iwzqaG6ur0n1DOBOaNSx9hcVZOlyfACwu6DtgeFUzZdH936wu
	 wizEpK9hhX/WA==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL] ARM: socfpga: updates for v6.11
Date: Wed, 26 Jun 2024 16:07:28 -0500
Message-Id: <20240626210728.21295-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_updates_for_v6.11

for you to fetch changes up to 1536dc8edc653e0e4a333035a73ff146d0517749:

  arm64: dts: socfpga: stratix10: add L2 cache info (2024-05-31 17:04:12 -0500)

----------------------------------------------------------------
SoCFPGA DTS updates for v6.11
- Drop unneeded flash address
- Add L2 Cache info for Stratix10

----------------------------------------------------------------
Beniamin Sandu (1):
      arm64: dts: socfpga: stratix10: add L2 cache info

Krzysztof Kozlowski (4):
      arm64: dts: stratix10: socdk: drop unneeded flash address/size-cells
      arm64: dts: stratix10: socdk_nand: drop unneeded flash address/size-cells
      arm64: dts: agilex: socdk: drop unneeded flash address/size-cells
      arm64: dts: n5x: socdk: drop unneeded flash address/size-cells

 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi           | 10 ++++++++++
 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts      |  2 --
 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts |  2 --
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts          |  2 --
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts             |  2 --
 5 files changed, 10 insertions(+), 8 deletions(-)
