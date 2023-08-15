Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C04C0015E
	for <soc@archiver.kernel.org>; Tue, 15 Aug 2023 14:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EF74BC433C9; Tue, 15 Aug 2023 14:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0B2C433C8;
	Tue, 15 Aug 2023 14:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692109076;
	bh=8H+Ix9u6R4jKNhzJV4kCYb04IzeHa0E4rpcSvSDmZjI=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=mnjBZbTRwwUF8K6XAA3wngoSOUDbRt/bvLgxaGATTXZ0crtGz9PaEo8XGlgPMi1mE
	 07QjyafwLIYwUH+rgP+SpPbGL1pyZdds6H2M2+z3amirV4GTgIJHEbAqaVg1k74RUC
	 P75heIF9cqkOXWFILfy3/BNXCKl160jNESrVtR5+nPKe8DaYV1TRlvLXNo/X3Iyng7
	 Yah8JhYwLow3IfA1+2ZQ4NlAPwelmLyBnb+C5DF6dVk605KygVfi/np2kshCoDeEyU
	 n7WQbutn7ztTf8saQ0VjSWh16i9Lpw3zYy76ToQ9JyMoLBjhmCzrOPm9HNjPyQniAy
	 W9jkdTCv8kdIQ==
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
Subject: [GIT PULL] Qualcomm ARM64 fixes for v6.5
Date: Tue, 15 Aug 2023 07:20:41 -0700
Message-ID: <20230815142042.2459048-1-andersson@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.5

for you to fetch changes up to 6d4cc57630a867a944483fdf7f8a060d2bbebdb9:

  arm64: dts: qcom: sc7180: Fix DSI0_PHY reg-names (2023-07-31 09:09:41 -0700)

----------------------------------------------------------------
Qualcomm ARM64 fixes for v6.5

This corrects the invalid path specifier for L3 interconnects in the CPU
nodes of SM8150 and SM8250. It corrects the compatible of the SC8180X L3
node, to pass the binding check.

The crypto core, and its DMA controller, is disabled on SM8350 to avoid
the system from crashing at boot while the issue is diagnosed.

A thermal zone node name conflict is resolved for PM8150L, on the RB5
board.

The UFS vccq voltage is corrected on the SA877P Ride platform, to
address observed stability issues.

The reg-names of the DSI phy on SC7180 are restored after an accidental
search-and-replace update.

----------------------------------------------------------------
Dmitry Baryshkov (1):
      arm64: dts: qcom: qrb5165-rb5: fix thermal zone conflict

Konrad Dybcio (1):
      arm64: dts: qcom: sc7180: Fix DSI0_PHY reg-names

Krzysztof Kozlowski (4):
      arm64: dts: qcom: sm8150: Fix OSM L3 interconnect cells
      arm64: dts: qcom: sm8250: Fix EPSS L3 interconnect cells
      arm64: dts: qcom: sc8180x: Fix OSM L3 compatible
      arm64: dts: qcom: sm8350: fix BAM DMA crash and reboot

Naveen Kumar Goud Arepalli (1):
      arm64: dts: qcom: sa8775p-ride: Update L4C parameters

 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts  |  2 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts |  4 ++--
 arch/arm64/boot/dts/qcom/sc7180.dtsi      |  4 ++--
 arch/arm64/boot/dts/qcom/sc8180x.dtsi     |  2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi      | 18 +++++++++---------
 arch/arm64/boot/dts/qcom/sm8250.dtsi      | 18 +++++++++---------
 arch/arm64/boot/dts/qcom/sm8350.dtsi      |  4 ++++
 7 files changed, 28 insertions(+), 24 deletions(-)
