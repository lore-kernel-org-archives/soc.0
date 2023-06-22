Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 207CCEB64DD
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 20:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0B2FC433CC; Thu, 22 Jun 2023 20:28:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 107B9C433CA;
	Thu, 22 Jun 2023 20:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687465728;
	bh=nL+vBhI5NdGfoaszuNM1FlPvpBZ/Sd93H0rlUaebd9g=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=JUxo0i3LT3t3Z4Mu/wAkA2sges24LgbZ6uYQ1EAS0LxdKmiYRXjuPLQ8GiYnPRedh
	 ir4EoDJlG+6fxJfPoDEoVTYo6oBoQQwCCLFe9QjZ/tIanKJ/hi/9G/rmdy3Z1UDzpb
	 9VdWY0tGnd+eEIW1VlK3oy0Fg+deF3iiOdIk11XfStvTxp7xIthGRpdRxnxPWx00yL
	 iN+3lX5l8BnhNfgBCiF7d3MhvFUnEwkg0ltspaHxzwx6Tn9rRRgkTmlaiQzxZzRJaD
	 K08V9YqImiE5HC8GSrcnGpalG0koy+kebzOjJGM0ziKd8hlQnd4WbPq+uKfpiLjFFo
	 0GpkO4K+L9fQw==
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
	Douglas Anderson <dianders@chromium.org>
Subject: [GIT PULL] One last Qualcomm ARM64 DeviceTree fix for v6.4
Date: Thu, 22 Jun 2023 13:32:46 -0700
Message-ID: <20230622203248.106422-1-andersson@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry for the last minute pull, if possible to get this into v6.4 it would be
appreciated. If not, please apply this towards v6.5-rc1 and we'll work to get
it into stable.

Regards,
Bjorn

The following changes since commit 661a4f089317c877aecd598fb70cd46510cc8d29:

  arm64: dts: qcom: sm8550: Use the correct LLCC register scheme (2023-05-24 21:11:28 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.4-2

for you to fetch changes up to 7b59e8ae92fe089fed8ff1b23e53442ae5b204c9:

  arm64: dts: qcom: sc7280: Mark SCM as dma-coherent for chrome devices (2023-06-22 12:20:12 -0700)

----------------------------------------------------------------
One last Qualcomm ARM64 DeviceTree fix for v6.4

Changes related to cache management for DMA memory caused WiFi to stop
work on SC7180 and SC7280 based products, using TF-A. These changes
marks the relevant device dma-coherent to correct the behavior.

----------------------------------------------------------------
Douglas Anderson (4):
      dt-bindings: firmware: qcom,scm: Document that SCM can be dma-coherent
      arm64: dts: qcom: sc7180: Mark SCM as dma-coherent for IDP
      arm64: dts: qcom: sc7180: Mark SCM as dma-coherent for trogdor
      arm64: dts: qcom: sc7280: Mark SCM as dma-coherent for chrome devices

 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 arch/arm64/boot/dts/qcom/sc7180-idp.dts                  | 5 +++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi             | 5 +++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi                     | 2 +-
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi       | 5 +++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi                     | 2 +-
 6 files changed, 19 insertions(+), 2 deletions(-)
