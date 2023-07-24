Return-Path: <dinguyen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A553C001B0
	for <soc@archiver.kernel.org>; Mon, 24 Jul 2023 14:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1481DC433CA; Mon, 24 Jul 2023 14:56:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8550CC433C8;
	Mon, 24 Jul 2023 14:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690210580;
	bh=FDIdDonfArv71fnnE8bQrYLKjDf8gkDRgvRZl7jpfeI=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=ILrwZsOLDD0o7z3LKqPN1XV2mN12Vvh50j8x/ojiSZhnX+YNgQ4Ht2XRcq6B+9aHp
	 QESH+Pj0OZFphd5wYV/yNmIONfYH4KWzB4hq+b9NtoqV5pt+Dit9Ipvbh/CUHN7M9R
	 2krVLfn8TVl8tv9TYRaArSOkhHgcyz0MuxELwPssC5WeqjVUKWT0+dnHXPnQqxjySY
	 CJIWYU+nMYovJaUg4E2sKGJkCtniWn7TayJep/FxkTik07372Ia3QcNUIPeO1+J9IG
	 YrG84WtbZfUW4wpb1wFi4rS/a1g/pBC7j9KOc93Rrx2a02iEGEHS0mLUd9GQDcjr7Z
	 nyHK1yhGCXyDw==
From: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: dinguyen@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: dts: socfpga: fix i2c signal property for v6.5
Date: Mon, 24 Jul 2023 09:56:17 -0500
Message-Id: <20230724145617.887443-1-dinguyen@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git tags/socfpga_dts_fix_for_v6.5

for you to fetch changes up to db66795f61354c373ecdadbdae1ed253a96c47cb:

  arm64: dts: stratix10: fix incorrect I2C property for SCL signal (2023-07-11 15:48:41 -0500)

----------------------------------------------------------------
SoCFPGA dts fix for v6.5
- Fix incorrect I2C property for SCL signal

----------------------------------------------------------------
Dinh Nguyen (1):
      arm64: dts: stratix10: fix incorrect I2C property for SCL signal

 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk.dts      | 2 +-
 arch/arm64/boot/dts/altera/socfpga_stratix10_socdk_nand.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
