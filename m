Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2909C433EF
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 16:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BE95CC36AE5; Wed, 15 Dec 2021 16:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230F7C36AE2;
	Wed, 15 Dec 2021 16:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639586747;
	bh=0xYKmCynnJWhkvJIKsSUkkOBjNS7xFzGBntUhwPkYng=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=fhrDKWeiifZ5+JL69AmHEqBx3iZM+1/rkckXty+z4Av+C8j1U2vjiHwmI6GNq5FOy
	 Hx5/gAbCC3q+3v9z35CnW+8n9wjhyRW/O0cam9aX5hFxn5yXtqH0R4gjGGhvIt7OOT
	 uIvFm8vBpNnAfQ0TjvmV0y2TGagGZxxMwp0nB11TFt5PI/Ck+0zIAIkVHsTAOQ77Eu
	 Ipw9P+KCH8WPMdC1nNwF2SbwwEm4v0e1beN1vxyQcRGh75DIvTaOCclBa4pfaM/G/+
	 B63CbYB3kEpWOkhNIJ2p/aF5jUCHbAPIhN4Zvk4LqPtJYeqj725f9eF0pr2CzQNB/C
	 CD3n5B/m0g3lA==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org
Subject: [GIT PULL] arm64: dts: socfpga: dts updates for v5.17
Date: Wed, 15 Dec 2021 10:45:45 -0600
Message-Id: <20211215164545.300273-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_update_for_v5.17

for you to fetch changes up to 8dce88fe80a858f34bb5b46470218fe478d251ee:

  arm64: dts: Update NAND MTD partition for Agilex and Stratix 10 (2021-12-01 08:07:41 -0600)

----------------------------------------------------------------
SoCFPGA dts updates for v5.17
- Update N5X to include qspi, usb and ethernet
- Adjust NAND partition size for Agilex and Stratix10

----------------------------------------------------------------
Dinh Nguyen (1):
      arm64: dts: n5x: add qspi, usb, and ethernet support

Sin Hui Kho (1):
      arm64: dts: Update NAND MTD partition for Agilex and Stratix 10

 .../dts/altera/socfpga_stratix10_socdk_nand.dts    | 24 +-------
 .../boot/dts/intel/socfpga_agilex_socdk_nand.dts   | 20 +-----
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts    | 71 ++++++++++++++++++++++
 3 files changed, 75 insertions(+), 40 deletions(-)
