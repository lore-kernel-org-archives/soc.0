Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58DBC54798
	for <soc@archiver.kernel.org>; Wed,  6 Mar 2024 03:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6520DC43390; Wed,  6 Mar 2024 03:21:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96D22C433C7;
	Wed,  6 Mar 2024 03:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709695282;
	bh=E5zxXMhNbVOuKkoMUrPi24dzKJhgYiBdLiPwr2w2eZg=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=CrQrIftFP2vfxDzbe83FigYnsWdtsFLK0teNGYDP75eLLHcBvY83PPrggWXiynPgW
	 4Vw7xJnxC9+lps5zII09BB6wTUDJNRkS1i7he7tBgYhnrWxFTieLJZLjN1Qu/rOOrg
	 DPfI4420rulajTSvAHGUmKWqnZ7ygLml2JsksGcAC0sH6dIzOdUXQ77sIuWJO3PeGX
	 SupB+Yv23QSWOxFXnISxITTw7A0XqNf4SaKBx+1qz5NL4z9rS3EC6PBwxc8H2mAylP
	 ODyFuTWiwzs4bgkI3HV8XDosu/22amiunXIQJBtw5kni71W1CztJRz9Oo1iqHlOfmY
	 xPegK06aFA00A==
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
Subject: [GIT PULL] A few Qualcomm driver fixes for v6.9
Date: Tue,  5 Mar 2024 21:21:19 -0600
Message-ID: <20240306032120.5036-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit aa05f47474c02d38d88c32c633a551911c6fdc40:

  dt-bindings: soc: qcom: qcom,saw2: add msm8226 l2 compatible (2024-02-18 22:52:55 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.9-2

for you to fetch changes up to 9f378a62164cfe218b5a355696464d93b132edfb:

  soc: qcom: aoss: add missing kerneldoc for qmp members (2024-03-03 20:01:51 -0800)

----------------------------------------------------------------
A few Qualcomm driver fixes for v6.9

This fixes a "defined but not used"-warning in SPM driver when kernel is
built without regulator support, and corrects a couple of kernel-doc
issues in aoss and geni-se drivers.

----------------------------------------------------------------
Arnd Bergmann (1):
      soc: qcom: spm: fix building with CONFIG_REGULATOR=n

Krzysztof Kozlowski (2):
      soc: qcom: geni-se: drop unused kerneldoc struct geni_wrapper param
      soc: qcom: aoss: add missing kerneldoc for qmp members

 drivers/soc/qcom/qcom-geni-se.c |  1 -
 drivers/soc/qcom/qcom_aoss.c    |  2 ++
 drivers/soc/qcom/spm.c          | 12 ++++--------
 3 files changed, 6 insertions(+), 9 deletions(-)
