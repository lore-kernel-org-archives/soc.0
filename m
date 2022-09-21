Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F5AECAAD8
	for <soc@archiver.kernel.org>; Wed, 21 Sep 2022 14:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0852C4347C; Wed, 21 Sep 2022 14:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6B2C433D7;
	Wed, 21 Sep 2022 14:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663770581;
	bh=vGFmc1YPHv93ayS0CSr1AwDLiFUxSK9BiLFgc56L7os=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=k02Rusz6SmknICu+LZdWlSbx/IdcWZD/jsOfZ95dJpEJhWAw7chi3cLzu5henLx/V
	 g0S6mjnG4bxDTtDWKfo2cnq0QBzG1ffyg4Dt9QmeOGub0DEze1v0fSnyKmjBEM4Flh
	 Wsgd2F3/iqYGLoCKEAAMU0+X+dWWeWFTnnlhnOtR8XN8u5oVCQ9WO5txck7tkoWphH
	 Smevun0spl98TV0RkLjuYm6o8f7iOfjWStdjCDiHCHUF70YLO/IdCfEggpAUeT4ZEg
	 vVIbk1L/a1gGB6KhRO8ISyr1FeE2HTSnsiro0yb8xgHf0kDYGn+L8s620xn8g42fG+
	 u6SJ0b454jmLA==
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
	Johan Hovold <johan+linaro@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Steev Klimaszewski <steev@kali.org>
Subject: [GIT PULL] Qualcomm ARM64 DTS fixes for 6.0
Date: Wed, 21 Sep 2022 09:29:39 -0500
Message-Id: <20220921142939.1310163-1-andersson@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.0

for you to fetch changes up to 40e9541959100e017533e18e44d07eed44f91dc5:

  arm64: dts: qcom: sm8350: fix UFS PHY serdes size (2022-09-16 13:55:36 -0500)

----------------------------------------------------------------
Qualcomm ARM64 DTS fixes for 6.0

This corrects invalid IOMMU streams for the SM8150 CDSP FastRPC, moves
the wakeup-source of SC7280 USB nodes to the correct place, fixes the
SM8350 UFS PHY serdes size to not overlap with the other subnodes and
updates the firmware location for the Lenovo ThinkPad X13s to match the
movement in linux-firmware.

It also updates MAINTAINERS and .mailmap to reflect the changes in my
email address.

----------------------------------------------------------------
Bhupesh Sharma (1):
      arm64: dts: qcom: sm8150: Fix fastrpc iommu values

Bjorn Andersson (1):
      MAINTAINERS: Update Bjorn's email address

Johan Hovold (2):
      arm64: dts: qcom: sc7280: move USB wakeup-source property
      arm64: dts: qcom: sm8350: fix UFS PHY serdes size

Manivannan Sadhasivam (1):
      arm64: dts: qcom: sc8280xp-x13s: Update firmware location

Steev Klimaszewski (1):
      arm64: dts: qcom: thinkpad-x13s: Fix firmware location

 .mailmap                                           |  3 +++
 MAINTAINERS                                        | 12 +++++------
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  3 ++-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  4 ++--
 arch/arm64/boot/dts/qcom/sm8150.dtsi               | 24 ++++++++--------------
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  2 +-
 6 files changed, 22 insertions(+), 26 deletions(-)
