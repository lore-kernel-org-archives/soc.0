Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE08C54EBC
	for <soc@archiver.kernel.org>; Tue, 10 Jan 2023 21:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AAA73C433F1; Tue, 10 Jan 2023 21:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBDE4C433D2;
	Tue, 10 Jan 2023 21:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673386071;
	bh=rXYmSTe/HOIqUYqbrWG7lmivG1oGFddGtFTCzzOGTbg=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=nqg8jbSW26cve4iTLljjuMRtSw7KHWDEs5ZDK2xN9s5wKkDrdi9MZhzfeAcrKXiVL
	 K9CygdEexeQW9TPO7gDJq9QUdR48e9iz96JmBe6nljjehuwtu725of/pgbqesfSTw6
	 0Jw6Noow1icPuubumj8vOSBWYr6Vb9TMIcqCqcZT5N/28Ny8kaT8REzXJ6IKMI9/ye
	 xbPmkTkPDw6fwmbcBcAvqD6ykhyUZs5puGVuFEBERO5+bBQ08mJChzCJDQzvxK4k6T
	 QJcQwThp0AuvDu6q+hlLa+8peiOSeCA5U2mdBEvnpw3fDLT6Y7Nuvx3a8wbOH5TeZr
	 gL3z4p/Py9Xow==
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
Subject: [GIT PULL] Qualcomm ARM32 DTS fix for 6.2
Date: Tue, 10 Jan 2023 15:27:50 -0600
Message-Id: <20230110212750.2182904-1-andersson@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-fixes-for-6.2

for you to fetch changes up to 0154252a3b87f77db1e44516d1ed2e82e2d29c30:

  ARM: dts: qcom: apq8084-ifc6540: fix overriding SDHCI (2022-12-28 10:46:34 -0600)

----------------------------------------------------------------
Qualcomm ARM32 DTS fix for 6.2

This fixes a regression on Inforce 6540, as the sdhci nodes no longer
overrides the platform's mmc nodes.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: qcom: apq8084-ifc6540: fix overriding SDHCI

 arch/arm/boot/dts/qcom-apq8084-ifc6540.dts | 20 ++++++++++----------
 arch/arm/boot/dts/qcom-apq8084.dtsi        |  4 ++--
 2 files changed, 12 insertions(+), 12 deletions(-)
