Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD650CDB47E
	for <soc@archiver.kernel.org>; Sun, 15 Oct 2023 20:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A4934C433C7; Sun, 15 Oct 2023 20:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45F7C433C8;
	Sun, 15 Oct 2023 20:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697400863;
	bh=xlwIpaaXwUz/2xOCtMsyo0jwrkMpig8YZxkdrkw3LZA=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=LPwv4wxpjeqw0uR+J3EHg9FvTIbifkJLU9DVISQ96DN8qwCKJBW3dDQadJNMobOfB
	 qlOFjnvZ4TL4GnYPgJ01edhT3AZ7xsFP0ZKBVd0vIqSnDRoreiDxea9EyW2OH2ai0x
	 tWkGel9SYdYVc0olVKOu1u8dYHA34/1WCHSRQOfxzEDdaheXRo2Wh6R4tSyQd0Jgo0
	 tKM3A/mgkJ4a3JMoKTTr3RTQTT6kihDyo4/6i59T84sl808lLMsjJkr9GwVDYGyQgw
	 SrIFtKVgnSKDJdgjfC4tuQBCVXKU4OrAS00bvQcoJRwKh7g1cPzm0EDKCMnI3vH369
	 J+tHhcB86m7nA==
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
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for v6.7
Date: Sun, 15 Oct 2023 13:18:12 -0700
Message-ID: <20231015201812.855218-1-andersson@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.7

for you to fetch changes up to b46d856cb9b3bd2fef54cc8caec8595a232a23b6:

  arm64: defconfig: Enable M31 USB phy driver (2023-09-19 20:01:52 -0700)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for v6.7

This enables the NB7VPQ904M SuperSpeed redriver driver, used in SM8550,
the LPASS pinctrl driver for SM6115 and SM8350 and the M31 USB phy
driver found in IPQ5332.

----------------------------------------------------------------
Konrad Dybcio (1):
      arm64: defconfig: enable Qualcomm SM6115 LPASS pinctrl

Krzysztof Kozlowski (1):
      arm64: defconfig: enable Qualcomm SM8350 LPASS pinctrl

Neil Armstrong (1):
      arm64: defconfig: enable NB7VPQ904M driver as module

Varadarajan Narayanan (1):
      arm64: defconfig: Enable M31 USB phy driver

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)
