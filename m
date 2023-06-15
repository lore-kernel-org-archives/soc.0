Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31BDEB64DA
	for <soc@archiver.kernel.org>; Thu, 15 Jun 2023 15:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9843CC433CC; Thu, 15 Jun 2023 15:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49BCC433C0;
	Thu, 15 Jun 2023 15:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686843478;
	bh=yxBYLnGlDEzlSsKJ3SiXuWLeoX6g9y0YNGuE+mPnyGo=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=H5RW4agILQBmH12vNgYwFj4hrgJCE95+PwV+2L7AjtsJUeT9BhyvtcERtgQUee6MX
	 1ZFpk0yQI+YIEinWMyt3jNw7gkU5nBwhlUcNCjifgjViLkvir85WAiIxYEssFiKKdI
	 bq8CzpI+RG2g6ClLYK2XBhBbx88IGqd8/wWQWxzZSbPtbTas4h173h1Z9IRp7OevTW
	 GtPF8ZGm4aeTbHuQ7pyvA3tjJGUfTtc8mkjA/Ybzs3q/taO2MsEQEu9P+w5hkNlM6Z
	 O64NseciAtNcni5fInezcZvBNaaQae1PCJ4krSV8Ip3DemSnntMRfBBuDhiIYitkIG
	 km7keJWB+KLJw==
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
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [GIT PULL] More Qualcomm ARM64 defconfig updates for v6.5
Date: Thu, 15 Jun 2023 08:41:19 -0700
Message-Id: <20230615154119.1460952-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 3098f34977480c9aa75cf328501f1b47ec49fec7:

  arm64: defconfig: Enable ipq6018 apss clock and PLL controller (2023-05-26 12:17:08 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.5-2

for you to fetch changes up to a19a3dcb0d190254ded4ac1cabb0f402e4b7c8c4:

  arm64: defconfig: Build SM6115 display and GPU clock controller drivers (2023-06-13 16:15:53 -0700)

----------------------------------------------------------------
More Qualcomm ARM64 defconfig updates for v6.5

This enables various clock drivers for QCM2290, SM6115 and SC8280XP.
Furhter, the interconnect and the MSM power manageer (MPM) drivers are
enabled to allow QCM2290 to boot.

----------------------------------------------------------------
Konrad Dybcio (1):
      arm64: defconfig: Build SM6115 display and GPU clock controller drivers

Srinivas Kandagatla (1):
      arm64: defconfig: Enable sc828x0xp lpasscc clock controller

Vladimir Zapolskiy (4):
      arm64: defconfig: Build MSM power manager driver
      arm64: defconfig: Build Global Clock Controller driver for QCM2290
      arm64: defconfig: Build interconnect driver for QCM2290
      arm64: defconfig: Build display clock controller driver for QCM2290

 arch/arm64/configs/defconfig | 7 +++++++
 1 file changed, 7 insertions(+)
