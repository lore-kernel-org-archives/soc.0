Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B7BC3DA6E
	for <soc@archiver.kernel.org>; Sun, 31 Dec 2023 03:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A16A7C433CA; Sun, 31 Dec 2023 03:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5613C433C8;
	Sun, 31 Dec 2023 03:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703994163;
	bh=k16z8NhMWoR8zexqYjVSe/mqReISHeOyU7vDvoR+52Y=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=orhQV+MhHRidMSo3MNGEDVomG0YCfomHl+f7qj2fXmVF6u8t+o44022DD1mikPKCi
	 Vpwu3nPcwmKfIY8zHhWDIw83ZF11QMAUlwQO4+YMTtaKqy3VAMIQfAV83IoslD3vQt
	 Aexh+BSvaXwptegt4Z8XlZTPiK2lyoOTuSWujvm4FaOEl81LrQWiJuPCfL0XfqbzRR
	 mxTsU93T515uPHhZ+EjzD4NJUuDaOV5L6jNWvdu2GeGCmIqhjOA652gGquMd6jzSOv
	 1p1r34/zfDJBwuEneaq57VjIcRVg/EDrjKdgbRgpsouI5VXTxukJoTN3PEJSMC/wS4
	 UeBriFZCAH/vQ==
From: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: [GIT PULL] A few more Qualcomm Arm64 defconfig updates for v6.8
Date: Sat, 30 Dec 2023 19:46:47 -0800
Message-ID: <20231231034648.3262882-1-andersson@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 48a9ba5eb4d720c6e21c6e4d2a6fb6e1a97f5f2a:

  arm64: defconfig: enable Qualcomm WSA884x driver (2023-12-17 15:03:06 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.8-2

for you to fetch changes up to 191fcf77e304392cc330fc19595cb90fd52d595f:

  arm64: defconfig: Enable Qualcomm SC8280XP camera clock controller (2023-12-22 21:22:17 -0600)

----------------------------------------------------------------
A few more Qualcomm Arm64 defconfig updates for v6.8

This enables the base drivers necessary to boot devices on the X1E
platform.
The GPU clock controller for SM8450/SM8550 is enabled and the SC8280XP
camera clock controller is enabled, to enable respective functionality
on these platforms.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: defconfig: Enable Qualcomm SC8280XP camera clock controller

Neil Armstrong (1):
      arm64: defconfig: enable GPU clock controller for SM8[45]50

Rajendra Nayak (1):
      arm64: defconfig: Enable X1E80100 SoC base configs

 arch/arm64/configs/defconfig | 6 ++++++
 1 file changed, 6 insertions(+)
