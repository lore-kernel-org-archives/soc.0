Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004D7C636CD
	for <soc@archiver.kernel.org>; Fri, 10 Feb 2023 18:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AE80EC4339C; Fri, 10 Feb 2023 18:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9FE7C433EF;
	Fri, 10 Feb 2023 18:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676052786;
	bh=VJGdCQ1XrohX8h/ojyNM35NEe2rPOMZ5aIx6rGxz9go=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=H8Sr8eJBg5SdKI//P/DaUZ1zp4D21dhsrqDW4Y/IR9IQKaUDpWhBRPPpdbj1M9p0m
	 SS5oKW1JOTgSuZY8IfH6BdK2UA/QV9QyZTRg0gJvz3rvI8MgQn100d+rEFRmTrwI9N
	 Ps2MHrT7n7E5SIY6+6yzyvV5PaeiKMtHkZznLYYymKJ9uyeply68Z+9mfDTb5/y2IY
	 5jOMHVVOOrKbX3NBd2NYVm54IxiqS4fAjz1Fh3nav895thP4IxZ4k4HITWqZ7hGZhI
	 tgNjTXIzWxuFPWds/ZB6tdyXkuPo+xD6ojLkToPZCxGvgqUK0ZtiL4lsbPJN2hyrBo
	 DFqYwoJm8Hopg==
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
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] More ARM64 defconfig updates for v6.3
Date: Fri, 10 Feb 2023 10:15:16 -0800
Message-Id: <20230210181516.2021902-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 1a87f7e5fa10b23633da03aed6b7c7e716457304:

  arm64: defconfig: enable the clock driver for Qualcomm SA8775P platforms (2023-01-18 18:14:33 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.3-2

for you to fetch changes up to 480ba14b9a95641647a6561d5b246de661589514:

  arm64: defconfig: enable Qualcomm SDAM nvmem driver (2023-02-08 19:05:49 -0800)

----------------------------------------------------------------
More ARM64 defconfig updates for v6.3

Here are two more defconfig updates for 6.3, enabling the SM8450 Display
clock controller driver, as well as the SDAM driver, a driver exposing
SRAM on newer Qualcomm PMICs to other devices.

----------------------------------------------------------------
Johan Hovold (1):
      arm64: defconfig: enable Qualcomm SDAM nvmem driver

Neil Armstrong (1):
      arm64: defconfig: enable SM8450 DISPCC clock driver

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
