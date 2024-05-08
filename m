Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2A0C25B4F
	for <soc@archiver.kernel.org>; Wed,  8 May 2024 02:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2BDA4C4AF67; Wed,  8 May 2024 02:09:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CFFDC2BBFC;
	Wed,  8 May 2024 02:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715134142;
	bh=Kc6whfBxP4QiNRCIjCOwqK5YyznnggssJmlM1+bJBWw=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=U7nQme2yc/yKYS/AMxYvAamotCx2ZYQeKmNjcfYGJyKfZhYPRFymws3Rm3eEZpYK+
	 KTcsdF6tba0B/qUJ+yPSZGiBmuyNwu4xqYLuXGyOxbw1UbU3d0m2q28B9hqelpRE0O
	 Z3Ot+L2E37Xjz66+AUXv/hzjCXrcP3grTkLiarU3zzrhhdZGn9prF8JqqgiVnKofku
	 nyMUUmNmryLIxd4xijCseaZMH1QZpxENWsuh+GbCE82FR0JbzuJs5H3hLFitPwd8sl
	 SWVb8phJbVEVt1nF4KA9mtq/gZdDYhahL2cuTpeOO/7q5DkMhCgBa9CL/FvMPfXp8W
	 gBIIQPHhOrX7Q==
From: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [GIT PULL] A few more Qualcomm driver updates for v6.10
Date: Tue,  7 May 2024 21:08:59 -0500
Message-ID: <20240508020900.204413-1-andersson@kernel.org>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 166db01007ea802ff9933ac73ec8f140ca0cf5d5:

  soc: qcom: cmd-db: replace deprecated strncpy with strtomem (2024-04-21 12:26:47 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.10-2

for you to fetch changes up to 4b34d4c25da289712d9a5bd5bac5888f099cbc5c:

  firmware: qcom: uefisecapp: Allow on sc8180x Primus and Flex 5G (2024-05-01 13:39:57 -0500)

----------------------------------------------------------------
A few more Qualcomm driver updates for v6.10

This fixes a sleep-while-atomic issue in pmic_glink, stemming from the
fact that the GLINK callback comes from interrupt context.

It fixes the Bluetooth address in the example of qcom,wcnss, and it
enables UEFI variables on SC8180X devices (Primus and Flex 5G).

----------------------------------------------------------------
Bjorn Andersson (2):
      soc: qcom: pmic_glink: Make client-lock non-sleeping
      firmware: qcom: uefisecapp: Allow on sc8180x Primus and Flex 5G

Johan Hovold (1):
      dt-bindings: soc: qcom,wcnss: fix bluetooth address example

 .../devicetree/bindings/soc/qcom/qcom,wcnss.yaml   |  4 ++--
 drivers/firmware/qcom/qcom_scm.c                   |  2 ++
 drivers/soc/qcom/pmic_glink.c                      | 25 +++++++++++++---------
 3 files changed, 19 insertions(+), 12 deletions(-)
