Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB0DC47DD9
	for <soc@archiver.kernel.org>; Sun, 25 Feb 2024 03:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A7D00C43390; Sun, 25 Feb 2024 03:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94121C433C7;
	Sun, 25 Feb 2024 03:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708831498;
	bh=RaK3e/anGk1htM0EY0CUUPhnTrhudutwaDYAOaD8hLo=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=m8wnoc7qkYlBi5K9v4OW4u7zDXxWmMCFggKrrk1bqnl/ppNvEbbqEmPQ6gymbjFww
	 B0lo4fQliMIlIq6vx/03MQDIFYjgNI354lcEuD5oSH6s+JDSrb5ZnBhCuWQp/Ibple
	 QeGKQZF1JM21SrseDWl/e6z6kM1cSzLv0Yl6j5pLuHARKzGYpg3V93a/xux6ecMoMq
	 kfYxEfaklhz5qgxz2/6l+7bVQpgdMQ86ZO0Wq22cQseMcPoGNoJ0JDvFqM+S0y5QgW
	 gUrGAy5IWkGtG56hoSdCQF+JLucc5FCH7OhL+rwo5rWXVHSeMlxYEnU+Enks46V+jT
	 XV1Y91hmOg5zA==
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
	Neil Armstrong <neil.armstrong@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Komal Bajaj <quic_kbajaj@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for v6.9
Date: Sat, 24 Feb 2024 21:24:53 -0600
Message-ID: <20240225032456.481112-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.9

for you to fetch changes up to 9c5c14c066f353ac1f4e3b4dd6e19451eac61e0c:

  arm64: defconfig: Enable QCOM PBS (2024-02-16 14:32:49 -0600)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for v6.9

Enable the Qualcomm PBS driver to resolve the dependency from the Light
Pulse Generator (LED-driver) on modern Qualcomm platforms. Enable the
X1E multimedia clock controllers, to provide clocks for the various
multimedia blocks. Enable Global clock controller and interconnect
drivers for the QDU1000/QRU1000 platforms.

Enable the audio drivers and the Goodi Berlin touchscreen driver, used
on SM8650 QRD.

Enable the MAX20411 regulator driver drive the GPU rail on SA8295P.

Lastly mark the Qualcomm interconnect providers that feeds UART
instances as builtin, to ensure the console exists when userspace is
launched.

----------------------------------------------------------------
Abel Vesa (1):
      arm64: defconfig: Enable X1E80100 multimedia clock controllers configs

Bjorn Andersson (2):
      arm64: defconfig: Enable MAX20411 regulator driver
      arm64: defconfig: Enable Qualcomm interconnect providers

Komal Bajaj (1):
      arm64: defconfig: Enable GCC and interconnect for QDU1000/QRU1000

Luca Weiss (1):
      arm64: defconfig: Enable QCOM PBS

Neil Armstrong (3):
      arm64: defconfig: enable audio drivers for SM8650 QRD board
      arm64: defconfig: enable WCD939x USBSS driver as module
      arm64: deconfig: enable Goodix Berlin SPI touchscreen driver as module

 arch/arm64/configs/defconfig | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)
