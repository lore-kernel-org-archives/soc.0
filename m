Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C44C4345F
	for <soc@archiver.kernel.org>; Sat, 27 Apr 2024 15:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1FAFDC32781; Sat, 27 Apr 2024 15:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63CDBC113CE;
	Sat, 27 Apr 2024 15:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714232299;
	bh=xYHFz5PHb+gJPbbg4YbjtDLs7Ib7KvY4tHDLECwPqQg=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=kyVaS4fCLch3ZjaIjmXHr1bxuIUeesKlceXCYwkqQes7S6zM0Qxb8r2drayXWUwkQ
	 8T2CUXFoMjDhUDF86y7XCGbf2g8/cEZj1cT4mPqimkI09k5sjBvAXM4nVPJX2Z4jA1
	 H8NqkYh/bcX2Rm4KHXEiX4h5kw2+nJ0XFh8IEwoGUHKxqbkXyMthtSEP4yl/U9mkcV
	 zOwpw68Nro8lazWtHJ2bEU0C6FzB3rgmchGpH4LQj4RPcVJakw6BWGUVakGkbP9jXx
	 AX24T14+PrTgmGexxm9aCHTwyRm3G8Tp+8Zz3j6gx6D4B7dqU7wD0LDjjPRb4MX9Lt
	 jl6WAAjiUVJ8g==
From: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [GIT PULL] One more Qualcomm Arm64 DeviceTree fix for v6.9
Date: Sat, 27 Apr 2024 10:38:16 -0500
Message-ID: <20240427153817.1430382-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit ecda8309098402f878c96184f29a1b7ec682d772:

  arm64: dts: qcom: sc8180x: Fix ss_phy_irq for secondary USB controller (2024-04-12 12:21:47 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.9-2

for you to fetch changes up to 819fe8c96a5172dfd960e5945e8f00f8fed32953:

  arm64: dts: qcom: sa8155p-adp: fix SDHC2 CD pin configuration (2024-04-20 12:58:33 -0500)

----------------------------------------------------------------
One more Qualcomm Arm64 DeviceTree fix for v6.9

On ths SA8155P automotive platform, the wrong gpio controller is defined
for the SD-card detect pin, which depending on probe ordering of things
cause ethernet to be broken. The card detect pin reference is corrected
to solve this problem.

----------------------------------------------------------------
Volodymyr Babchuk (1):
      arm64: dts: qcom: sa8155p-adp: fix SDHC2 CD pin configuration

 arch/arm64/boot/dts/qcom/sa8155p-adp.dts | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)
