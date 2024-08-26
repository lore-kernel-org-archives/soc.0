Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848C5C5321E
	for <soc@archiver.kernel.org>; Mon, 26 Aug 2024 14:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 534A1C4FDFB; Mon, 26 Aug 2024 14:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C58C4FDF9;
	Mon, 26 Aug 2024 14:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724684258;
	bh=mxzbLBLfrCKHNcUODkdKoQOSZxSuYGygrrQtLf1yX7g=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=hce+FPtI5D8F46KyKXYB69y4UHK6veMV4CdNyINiTZuBAAl9FU9l7+mOTkCmsJywD
	 ZVg/cCxZXnK7G1bmMPR7gLUTSxrcMwA7FxjcLIFZFquHxBRecK/Ql4Xpp2Is0vPby3
	 0fg0Db28Cb54U6Ksdbf6JzZ6JdqHN5U7jebaXz1CcrC69I84v5ivIGMtadqb+8oZJk
	 C+z7DrwZ1Du86oiLW+KbhH6XIuHq4slhPyBSm6Ib/ykph+6lP3FE7E6oiX6fRkSypG
	 f6B0v639TR2XxJ9BZDXf6k4WBtw+LJ77vwAUnRd8sDlOFv4W2WPv666CfRcG7sr2Xh
	 SbPUgN9c73wpg==
From: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [GIT PULL] Qualcomm Arm64 defconfig fix for 6.11
Date: Mon, 26 Aug 2024 09:57:35 -0500
Message-ID: <20240826145736.1646729-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-fixes-for-6.11

for you to fetch changes up to 10f98bb9d98137b544b00abb4f9df45e9be7878d:

  arm64: defconfig: Add CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20 (2024-07-28 21:46:07 -0500)

----------------------------------------------------------------
Qualcomm Arm64 defconfig fix for 6.11

Enable the Samsung ATNA33XC20 display panel driver, as we switched from
the generic EDP panel for some of the X1E devices in v6.11.

----------------------------------------------------------------
Stephan Gerhold (1):
      arm64: defconfig: Add CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
