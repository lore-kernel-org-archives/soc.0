Return-Path: <andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DCBC54EBC
	for <soc@archiver.kernel.org>; Tue, 10 Jan 2023 21:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D55AEC433F1; Tue, 10 Jan 2023 21:39:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CBDAC433EF;
	Tue, 10 Jan 2023 21:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673386787;
	bh=vLSTqwIE+LZpMo5sVhNt42+kHa6GJE+ygmD3RefstUk=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=V1nmSvifMlFftfjpyzTEjgfNLOvMiRXD/9yGRkpC/T84/f0TQH55RQt1vuzTYLfzl
	 dScigZQsIb1w+xj/qtP8z1dIY9l+R+vf3h5Dn7vDKa1vh4Tk49u89NFCE595fpZUDe
	 gHkRjmSG0f18OzfbGNyxcnlotjgg5eEx7EQhjviwtKnv+j0XFB3cnavTJ+rIbLNBxy
	 xJT2sGUT+96NyB25gwHZi49oDrb/P8U5LjwCm7+r6NiZ67gTuHgn5UTY1RDjGcv2If
	 EeSHP7mq/uPEHSogJUEQ2hEmw3kJHHx9UJht1g8X1h07X9tQJbKdBR3AEVqb2M+400
	 RYQfwzxelJHOQ==
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
	Stephan Gerhold <stephan@gerhold.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [GIT PULL] Qualcomm driver fixes for v6.2
Date: Tue, 10 Jan 2023 15:39:46 -0600
Message-Id: <20230110213946.2183982-1-andersson@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-driver-fixes-for-6.2

for you to fetch changes up to 6049aae52392539e505bfb8ccbcff3c26f1d2f0b:

  PM: AVS: qcom-cpr: Fix an error handling path in cpr_probe() (2023-01-10 09:48:13 -0600)

----------------------------------------------------------------
Qualcomm driver fixes for v6.2

Updated error handling in the async packer router driver made an
optional property required, fix this. Also improve error handling in the
probe function of the CPR driver.

----------------------------------------------------------------
Christophe JAILLET (1):
      PM: AVS: qcom-cpr: Fix an error handling path in cpr_probe()

Stephan Gerhold (2):
      dt-bindings: soc: qcom: apr: Make qcom,protection-domain optional again
      soc: qcom: apr: Make qcom,protection-domain optional again

 Documentation/devicetree/bindings/soc/qcom/qcom,apr-services.yaml | 5 ++---
 drivers/soc/qcom/apr.c                                            | 3 ++-
 drivers/soc/qcom/cpr.c                                            | 6 +++++-
 3 files changed, 9 insertions(+), 5 deletions(-)
