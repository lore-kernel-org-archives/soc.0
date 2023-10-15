Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1855ACDB47E
	for <soc@archiver.kernel.org>; Sun, 15 Oct 2023 17:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE47EC433CA; Sun, 15 Oct 2023 17:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164AFC433C7;
	Sun, 15 Oct 2023 17:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697392642;
	bh=gQBz/tywLI6khoYjXkhndlRjY2WPkIkOHJnm5mSqvoQ=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=HnjTiS0rYToXY/MroH9bOXX2Oje6kjpUfIAtcNriw01FtdpKEiNnwg2Jqs0KMRrrM
	 O71NNQo3VJGw3B0RS+JoR/t9lExeTSdPA83h61Q0L6S2a8jBYPtB12Jyj5xaN3Z2sq
	 ChscWyMWLiU0PFyJm3IKrRmYPLoZniAGQktWqw5xDmutiVRKxPWqsyfowb6rEm6dCr
	 9lO2kKiepgs2TIurt/dNhixj4Hz2DELLa5TThug158JZEpxkWX4oRnnGKfPiIpUzcO
	 izpdzpWcuI6+mXrscuBGkhd2UkBMwtOGYB8UrxYqCRURARQzWVfqFvJD79CToSgmOQ
	 aomufAGwPz33A==
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 DeviceTree fixes for v6.6
Date: Sun, 15 Oct 2023 11:01:10 -0700
Message-ID: <20231015180112.853805-1-andersson@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-arm64-fixes-for-6.6

for you to fetch changes up to 725f593692ceedeab639b661298955b6f9ba8ec3:

  arm64: dts: qcom: msm8996-xiaomi: fix missing clock populate (2023-09-19 20:05:57 -0700)

----------------------------------------------------------------
Qualcomm ARM64 DeviceTree fixes for v6.6

This fixes an error with an incorrect gpio-ranges preventing the PMIC
GPIO instances from being registered on SA877P, and fixes a regression
from a refactoring of the top-level clocks node that caused divclocks to
no longer probe on a few of the MSM8996 devices.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      arm64: dts: qcom: sa8775p: correct PMIC GPIO label in gpio-ranges
      arm64: dts: qcom: apq8096-db820c: fix missing clock populate
      arm64: dts: qcom: msm8996-xiaomi: fix missing clock populate

 arch/arm64/boot/dts/qcom/apq8096-db820c.dts        | 32 ++++++++++------------
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi | 32 ++++++++++------------
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts | 18 ++++++------
 arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi        |  2 +-
 4 files changed, 39 insertions(+), 45 deletions(-)
