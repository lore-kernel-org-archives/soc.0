Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1134C7EE2F
	for <soc@archiver.kernel.org>; Sat, 10 Jun 2023 17:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86C53C4339B; Sat, 10 Jun 2023 17:06:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F726C433EF;
	Sat, 10 Jun 2023 17:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686416787;
	bh=oI8rZ+TH06IPYh4Zqr7iwWYYJo+KqmpF/Rt3torKTDk=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=A6VbFeOEfLv4ACjpFe20SttJnkQQhX0Htqq1DNdv6+YUJq+hbQMMxL7M/g722jFiJ
	 l/cgG0d+PRBJg5F7M9RQ8LK5sOloB+GarFUXxktD+BvOe4CSHfeI0460IghzEi40S6
	 mhGdATma+fugYy6Z2b6Z5etZ+sCeEu/MTWBAn+ZIrmcIe9tMHlEO35zZ5VrwG3ot/a
	 MR+8oaARNfbvcvVBpFgIDv3Q+1xKoFx/1WW3ejoANuYihy5pq/jDVq90nmHmyp8ncX
	 k+z0Uj99PZaDlMTNszlFZJVO4gLTNwWKF05gF9OC2u2vy9nflQjk55sMkFRE6ODS1m
	 CCyJYCDKDE28A==
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Devi Priya <quic_devipriy@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for v6.5
Date: Sat, 10 Jun 2023 10:09:55 -0700
Message-Id: <20230610170955.2478831-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.5

for you to fetch changes up to 3098f34977480c9aa75cf328501f1b47ec49fec7:

  arm64: defconfig: Enable ipq6018 apss clock and PLL controller (2023-05-26 12:17:08 -0700)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for v6.5

Enable the FSA4480 driver to enable USB Type-C altmode on devices such
as SM8350 and SM8450 HDK. Enable the IPQ6018 APSS clock and PLL
controller for CPU scaling, and enable GPU clock river for SA8775P.

----------------------------------------------------------------
Bartosz Golaszewski (1):
      arm64: defconfig: enable the SA8775P GPUCC driver

Devi Priya (1):
      arm64: defconfig: Enable ipq6018 apss clock and PLL controller

Neil Armstrong (1):
      arm64: defconfig: enable FSA4480 driver as module

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)
