Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFECDC6FD1C
	for <soc@archiver.kernel.org>; Thu, 23 Mar 2023 14:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 76455C4339C; Thu, 23 Mar 2023 14:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9003DC433D2;
	Thu, 23 Mar 2023 14:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679581314;
	bh=GM3Rs+gV67cRwARmmI5meAjQV6fjsBa536bYbtHtBEg=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=CfZjLnBppIYbMBbU0XLnoN4tGZpuysPe4Ui3DJBX6qh8DXvaZRsr6QXhZZygZIc9C
	 otiSuhK1P/mukT5DzXmGsaCzMw22swR2Kyf4HMbFVT9db1KBjveG7EyUx7Ns8XPeFB
	 Mtm8CqjhPLEcWaDJgJWsTENC3PCM5Ax0FyeztALx21MtVzPZYYwpJgvLzIjlFyLC/0
	 rm/FTG6SVsALzirdfDI6n14hrpX6RmwGgbTfM80vw9uFuetHl4kkbM7slIwmOkUDxi
	 O4EXdui0EXZaui8fxOrMk4VQ2M6g8lbBh1Qukjo2QLhosSmaM4WB+P7/9pWn34/6zi
	 CkY2jC8iL/5VQ==
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
	Luca Weiss <luca@z3ntu.xyz>,
	Abel Vesa <abel.vesa@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [GIT PULL] Qualcomm driver fixes for v6.3
Date: Thu, 23 Mar 2023 07:25:05 -0700
Message-Id: <20230323142505.1086072-1-andersson@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-driver-fixes-for-6.3

for you to fetch changes up to f3d0fbad6765da25de7ecf6481af9b6ddb0b3793:

  firmware: qcom: scm: fix bogus irq error at probe (2023-03-09 13:58:22 -0800)

----------------------------------------------------------------
Qualcomm driver fixes for v6.3

Support for the secure world interrupting the SCM driver drive the wait
queue mechanism was recently introduced, but most platforms doesn't have
this mechanism and an error should not be printed in the log.

The rmtfs_mem driver recently gained support for assigning the region to
multiple VMIDs, but accidentally removed the support for running without
assignment. A couple of changes are introducd to correct this.

The SC8280XP LLCC slice configuration is wrong, reslting in incorrect
configuration of the hardware. The table is corrected, based on the
datasheet.

----------------------------------------------------------------
Abel Vesa (1):
      soc: qcom: llcc: Fix slice configuration values for SC8280XP

Johan Hovold (1):
      firmware: qcom: scm: fix bogus irq error at probe

Luca Weiss (2):
      soc: qcom: rmtfs: fix error handling reading qcom,vmid
      soc: qcom: rmtfs: handle optional qcom,vmid correctly

 drivers/firmware/qcom_scm.c  |  2 +-
 drivers/soc/qcom/llcc-qcom.c |  6 +++---
 drivers/soc/qcom/rmtfs_mem.c | 10 +++++++---
 3 files changed, 11 insertions(+), 7 deletions(-)
