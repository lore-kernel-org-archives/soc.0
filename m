Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3674C10F1A
	for <soc@archiver.kernel.org>; Wed,  8 May 2024 02:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9FA59C4AF63; Wed,  8 May 2024 02:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E047DC2BBFC;
	Wed,  8 May 2024 02:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715134393;
	bh=+KmuidCa3RZuP20dNHil6I4AyYy6j5ze6v4PfqQ4hjY=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=gA0D6i4AI0gdyVVuNtAkIuaPWKYCvLMWAONhMDxdCWHbxjDihCPvthUhQc+g5xCEb
	 SVaH/l9Ro9S9JblLisH2+Wy0TcSNwNCX59Y83Zpw+9uyqyR1x11dcvvzFDeBh66FFx
	 HIJ3fRX7BivfrFY+XUNTPIq+kv8BKdf3JPiOMqm9n5CY0F8ADbfMtaD2fbSxYwM0xq
	 MnBlPOHAlIU+arMoAzAmGx7m55ExrYtRH0vMKJgOe3jQalyTlhyCtq2rKx3pXsuGMz
	 KfmeLt5+uU5bnJBaGu80nfuHT4ez6OiRHp6tqaekTWzjAlzg7C9pk2s6l5OUjBWvYd
	 jL3VzmDbG24wg==
From: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [GIT PULL] One more Qualcomm Arm64 defconfig update for v6.10
Date: Tue,  7 May 2024 21:13:11 -0500
Message-ID: <20240508021312.206121-1-andersson@kernel.org>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit fefda685ec0846a1f1c2b13af2cce4cea580a768:

  arm64: defconfig: enable REGULATOR_QCOM_USB_VBUS (2024-04-23 14:09:14 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.10-2

for you to fetch changes up to b052c7fe3cb787282ab7e1fa088c794a1eb7fdb0:

  arm64: defconfig: select INTERCONNECT_QCOM_SM6115 as built-in (2024-04-29 21:40:33 -0500)

----------------------------------------------------------------
One more Qualcomm Arm64 defconfig update for v6.10

This enables the SM6115 interconnect provider, to make it possible to
boot boards on this SoC.

----------------------------------------------------------------
Dmitry Baryshkov (1):
      arm64: defconfig: select INTERCONNECT_QCOM_SM6115 as built-in

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
