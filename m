Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3D0C46467
	for <soc@archiver.kernel.org>; Tue, 10 Jan 2023 21:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B8578C433F1; Tue, 10 Jan 2023 21:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B185BC433D2;
	Tue, 10 Jan 2023 21:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673386646;
	bh=JMam+n+3Trnfc8kB9JkfG21ybszeDwsJHOWttlDemhM=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=oTqnP0V4QF8fJgXFIRIDCz83hycaTgBrcCWh9lk4V0AGiALwVNhsPWlIVQUmmzxDM
	 8PRJdj2ELqR5BpdCYkZe4e9h1Tp82+0adjeERykNz6S8i/GtWwUrmbsCBdLj4psqsn
	 7E0zqQ9kgSrycNnifaFrt2FOVIz+6Son4s/MaiMptk2NZkyj57eVSzAtUEcD4bMZbe
	 mwbHvShkxNCtJ3LKQqHbnVo5YTVfeVx12XG+9Czs19bun0KTHS48Ge2DvnoWpzRCAp
	 5xLem0amUyZJDkG6Joo60QEUqKMZ2m57Rg5n7Wu0VnTMrmZMZWJxzpnnyoK72eZJYj
	 9+0EiV8pkChkA==
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
	Dominik Kobinski <dominikkobinski314@gmail.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 DTS fixes for 6.2
Date: Tue, 10 Jan 2023 15:37:24 -0600
Message-Id: <20230110213724.2183668-1-andersson@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.2

for you to fetch changes up to 69876bc6fd4de3ad2dc7826fe269e91fa2c1807f:

  arm64: dts: qcom: msm8992-libra: Fix the memory map (2023-01-10 09:49:03 -0600)

----------------------------------------------------------------
Qualcomm ARM64 DTS fixes for 6.2

The cluster idle issue was resolved on SM8250, so the change disabling
the cluster state is being reverted.

Issues where identified with the QMP PHY binding, that would prevent
enablement of Displayport and it was decided not to support the old
binding for the recently introduced SC8280XP, which broke USB. This
adjusts the USB PHY nodes to the new binding. The reset signal for the
first QMP PHY is corrected as well.

The reserved memory map is updated on Xiaomi Mi 4C and Huawei Nexus 6P,
to avoid instabilities caused by use of protected memory regions.
The compatible for the MSM8992 TCSR mutex is corrected as well.

Lastly SDHCI interconnects on SM8350 are corrected to match the
providers #interconnect-cells.

----------------------------------------------------------------
Dominik Kobinski (2):
      arm64: dts: msm8992-bullhead: add memory hole region
      arm64: dts: msm8994-angler: fix the memory map

Johan Hovold (2):
      arm64: dts: qcom: sc8280xp: fix primary USB-DP PHY reset
      arm64: dts: qcom: sc8280xp: fix USB-DP PHY nodes

Konrad Dybcio (2):
      arm64: dts: qcom: msm8992: Don't use sfpb mutex
      arm64: dts: qcom: msm8992-libra: Fix the memory map

Krzysztof Kozlowski (1):
      arm64: dts: qcom: sm8350: correct SDHCI interconnect arguments

Ulf Hansson (1):
      Revert "arm64: dts: qcom: sm8250: Disable the not yet supported cluster idle state"

 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi  |  6 ++
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts  | 77 ++++++++++++++++-----
 arch/arm64/boot/dts/qcom/msm8992.dtsi              |  4 --
 .../dts/qcom/msm8994-huawei-angler-rev-101.dts     | 19 +++++-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 79 +++++++---------------
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  1 -
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  4 +-
 7 files changed, 108 insertions(+), 82 deletions(-)
