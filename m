Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94520CD484A
	for <soc@archiver.kernel.org>; Wed,  4 Sep 2024 14:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 82975C4CECB; Wed,  4 Sep 2024 14:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C123EC4CEC3;
	Wed,  4 Sep 2024 14:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725461536;
	bh=xVR+mPcyEgGmpXVWMWXMbgCvErzCkqJ+KiBfrn+9naw=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=LPuhZIDZ95cRViyQcuF0UoUPlqZfr6jUEHkAlRhRKH0p1S597SYhgXNBD9EqOYAOX
	 iwbCwDnvfYsOoQTIw4Yj5m4dL/kVoveEkxOD9bo+lq6edL7Y1GSkiwGZp4kXrlWeL5
	 T9eNsrOWK14iII+FCjuNkTV47UUySkz3K94yUvFBNfyn8a00MW2KK9CGu6xYIOzGD+
	 6YvnGZKx5tDe+DKWpbakSmwFGOZzaeaUfS9+rQTBP6ME8zSIrEhAr/V2g7QCM5Vl0W
	 yQp5VGEuk22IYjmSC0PXIW9TA/DY6h4gzU0fO7y1Gp712lqSfanSJMxRKCWixgSlmN
	 vLIEoz9eC5fNA==
From: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [GIT PULL] One more Qualcomm driver fix for v6.11
Date: Wed,  4 Sep 2024 09:52:13 -0500
Message-ID: <20240904145214.4089-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit c158ceb826068a8bbe3c9e78df420f47ba53c8a8:

  soc: qcom: pd-mapper: Fix singleton refcount (2024-08-21 09:50:48 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.11-2

for you to fetch changes up to db213b0cfe3268d8b1d382b3bcc999c687a2567f:

  firmware: qcom: uefisecapp: Fix deadlock in qcuefi_acquire() (2024-08-30 22:17:50 -0500)

----------------------------------------------------------------
One more Qualcomm driver fix for v6.11

This resolves a deadlock in the Qualcomm uefisecapp driver following the
attempt to acquire global context is acquired in the case the device
isn't probed.

----------------------------------------------------------------
Dan Carpenter (1):
      firmware: qcom: uefisecapp: Fix deadlock in qcuefi_acquire()

 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 4 ++++
 1 file changed, 4 insertions(+)
