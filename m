Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E26C433EF
	for <soc@archiver.kernel.org>; Tue, 22 Feb 2022 07:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C5FCAC340E8; Tue, 22 Feb 2022 07:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C54EC340F0;
	Tue, 22 Feb 2022 07:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645516372;
	bh=xn+PpeartlBgjKPIJJmtv7Bv6DNPVShnbqy+QMGgRQk=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MObOhvevbNMxqPyz1Hxju0WmV+PL4s9j2ZVEnoOTapCeDqy5ldT4MRKEEW8rdWsj1
	 zqoZpIQdux7RRm0HfXcRwaNbURzc5EzIDg1QeOPQtH7/wR97m/5kb2N8bDB4ERVWPZ
	 M7FEWIziUb01GpHCzCBqPAnJyMDk0jB4Sf9Ho3JFnc3rHEZd7NqNqkLt8FXV51dYL+
	 Akb2p1PYnCuOc9I2MxbL+kZvyq8woGzC9JNvBydoeuAQg1jUtE/6xh1Qm5guFRj5a6
	 iTYkRToLEWCMzls+COy4dMcGCKzenXQdjZtgfAz/jnMLxZTbfHtmjhJvL4/mR5wFe9
	 6rrQ6bz9loueg==
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
Subject: [GIT PULL 3/6] i.MX dt-bindings change for 5.18
Date: Tue, 22 Feb 2022 15:52:23 +0800
Message-Id: <20220222075226.160187-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222075226.160187-1-shawnguo@kernel.org>
References: <20220222075226.160187-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-5.18

for you to fetch changes up to 039facb4323b9ff22e50c017c60f7020811a7229:

  dt-bindings: arm: imx: add imx8mm gw7903 support (2022-02-21 12:06:37 +0800)

----------------------------------------------------------------
i.MX dt-bindings change for 5.18:

- New board compatible for Protonic PRT8MM, Toradex Verdin-imx8mm,
  emCON-MX8M Mini, i.MX8MM GW7903.
- A series of patches from Lucas Stach adding support for i.MX8M VPU
  and HSIO blk-ctrl power domains.

----------------------------------------------------------------
Lucas Stach (6):
      dt-bindings: power: imx8mq: add defines for VPU blk-ctrl domains
      dt-bindings: soc: add binding for i.MX8MQ VPU blk-ctrl
      dt-bindings: arm: imx: add Protonic PRT8MM board compatible
      dt-bindings: power: add defines for i.MX8MP power domain
      dt-bindings: power: imx8mp: add defines for HSIO blk-ctrl domains
      dt-bindings: soc: add binding for i.MX8MP HSIO blk-ctrl

Marcel Ziswiler (1):
      dt-bindings: arm: fsl: add toradex,verdin-imx8mm et al.

Reinhold Mueller (1):
      dt-bindings: arm: Add emtrion hardware emCON-MX8M Mini

Tim Harvey (1):
      dt-bindings: arm: imx: add imx8mm gw7903 support

 Documentation/devicetree/bindings/arm/fsl.yaml     | 24 +++++++
 .../devicetree/bindings/power/fsl,imx-gpcv2.yaml   |  2 +
 .../bindings/soc/imx/fsl,imx8mp-hsio-blk-ctrl.yaml | 78 ++++++++++++++++++++++
 .../bindings/soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml  | 71 ++++++++++++++++++++
 include/dt-bindings/power/imx8mp-power.h           | 35 ++++++++++
 include/dt-bindings/power/imx8mq-power.h           |  3 +
 6 files changed, 213 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/imx/fsl,imx8mp-hsio-blk-ctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml
 create mode 100644 include/dt-bindings/power/imx8mp-power.h
