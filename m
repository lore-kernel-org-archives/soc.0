Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A78C43334
	for <soc@archiver.kernel.org>; Sat,  9 Jul 2022 08:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7DFACC341CB; Sat,  9 Jul 2022 08:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C227BC341C7;
	Sat,  9 Jul 2022 08:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657355414;
	bh=+vHPPHOF81xWioEbWiN6gM47bS6zVzpWsD9lOZlXafo=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=kxj2upW3bCDoIafFExK+rW/G8FbYjH656fN1AfwSTabOLCT8tU4VRpBMXMx0hycKu
	 qsSIb9nDG+Aywm6u+r/3dCNNXDV3prIOL3y0ZCd9CK3SjrWwUDlNE106sGcDjvTets
	 WDXDdwyyN3Y8d1cWOJAkzYuffu4xjtiFICz2yXyJkJSdrsz7A0f6T278VvzCVcLvGu
	 BPaUElPIrH8wgtHNkHXq/U3TQ52MUZ1CjuVP8XLO9AcO1LbdOpMxKWcTAlRsgKN7+n
	 fBWOjcRjmA7gI7YjdC1SPTdKCK0Jq4AtDC8UZ7DChkE4uLciFGtRUJDCJP6NtWoj37
	 CnQgJC3IxPq1w==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] i.MX drivers change for 5.20
Date: Sat,  9 Jul 2022 16:29:46 +0800
Message-Id: <20220709082951.15123-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.20

for you to fetch changes up to 63f98153075167a6c88d8ac90bfd26f1887c670c:

  soc: fsl: guts: check return value after calling of_iomap() in fsl_guts_get_soc_uid() (2022-07-05 08:41:55 +0800)

----------------------------------------------------------------
i.MX drivers change for 5.20:

- Update imx8m-blk-ctrl driver to print the name of the power domain,
  so that the error message becomes more useful.
- Update the error messages in gpcv2 driver by printing the reason why
  a regulator fails to be enabled or disabled.
- A series from Michael Walle to convert the guts driver from a platform
  driver to an core_initcall for getting rid of all those global static
  variables.
- A couple of follow-up fixes on guts driver series.

----------------------------------------------------------------
Marek Vasut (1):
      soc: imx: imx8m-blk-ctrl: Make error prints useful

Martin Kepplinger (1):
      soc: imx: gpcv2: print errno for regulator errors

Michael Walle (7):
      soc: fsl: guts: machine variable might be unset
      soc: fsl: guts: remove module_exit() and fsl_guts_remove()
      soc: fsl: guts: embed fsl_guts_get_svr() in probe()
      soc: fsl: guts: allocate soc_dev_attr on the heap
      soc: fsl: guts: use of_root instead of own reference
      soc: fsl: guts: drop platform driver
      soc: fsl: guts: add serial_number support

Yang Yingliang (2):
      soc: fsl: guts: fix return value check in fsl_guts_init()
      soc: fsl: guts: check return value after calling of_iomap() in fsl_guts_get_soc_uid()

 drivers/soc/fsl/guts.c           | 221 +++++++++++++++++++++------------------
 drivers/soc/imx/gpcv2.c          |   8 +-
 drivers/soc/imx/imx8m-blk-ctrl.c |   9 +-
 3 files changed, 133 insertions(+), 105 deletions(-)
