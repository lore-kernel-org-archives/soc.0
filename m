Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81086C433F5
	for <soc@archiver.kernel.org>; Sat, 18 Dec 2021 07:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6CD70C36AE8; Sat, 18 Dec 2021 07:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3CD5C36AEB;
	Sat, 18 Dec 2021 07:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639811705;
	bh=tY4ZJUjapV31t9up3Bv8Y9nBK3Wy0wSQRU9kPYSebp4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F2cDoh/WdCMVVz+7NBpAVvfsuG59OpQ/BWMbl3sfmGXPuxTpqU1d0jCYJ9CYnpQef
	 q9TDlN8J0rY4Yr8rCYkDG3uMRqoIPZxRFCxmgz+jtbXS11nIcvH8FzCJGrGM8uec4L
	 2ioF4grbXHZMB5tlRmvA4CvtYnaHnMiVi1UfK0o6XaV8ow/dHdEbLbCCWCXljRti3Z
	 +KE6o7a+TRmomKyL7ofDKmx0HhU+e3iUBP6vtgGoPz2pqAQTFGVYrYFcp/4uZZ9g1m
	 2RIC6So3QCDB/FcXGDeB/QK8oLRcD3rMVJXpd2MXHVf97EegXjgdUiBkGVIkmk2c14
	 m1hMuPq3ExRzA==
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
Subject: [GIT PULL 3/6] i.MX dt-bindings update for 5.17
Date: Sat, 18 Dec 2021 15:14:24 +0800
Message-Id: <20211218071427.26745-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211218071427.26745-1-shawnguo@kernel.org>
References: <20211218071427.26745-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-5.17

for you to fetch changes up to e1e06edd94d5b3171401a1435a17251102cc8494:

  dt-bindings: soc: add binding for i.MX8MN DISP blk-ctrl (2021-12-17 10:54:26 +0800)

----------------------------------------------------------------
i.MX dt-bindings update for 5.17:

- New bindings for i.MX SPBA bus and i.MX8MN DISP blk-ctrl.
- New vendor prefix for BSH Hausgeraete GmbH and JOZ BV.
- New compatibles for various i.MX6 and i.MX8 boards.
- Add optional 'fsl,continuous-burst-clk' property support for imx-weim
  binding.

----------------------------------------------------------------
Adam Ford (2):
      dt-bindings: soc: imx: Add binding doc for spba bus
      dt-bindings: soc: add binding for i.MX8MN DISP blk-ctrl

Alexander Stein (3):
      dt-bindings: arm: fsl: add TQMa8MxML boards
      dt-bindings: arm: fsl: add TQMa8MxNL boards
      dt-bindings: arm: fsl: add TQMa8Mx boards

Ariel D'Alessandro (3):
      dt-bindings: Add vendor prefix for BSH Hausgeraete GmbH
      dt-bindings: arm: fsl: Add iMX8MN BSH SMM S2 boards
      dt-bindings: arm: fsl: Add BSH SMM-M2 IMX6ULZ SystemMaster board

Ivan Bornyakov (1):
      dt-bindings: bus: imx-weim: add words about continuous bclk

Jacky Bai (1):
      dt-bindings: arm: fsl: Add binding for imx8ulp evk

Matthias Schiffer (1):
      dt-bindings: arm: fsl: add TQ-Systems boards based on i.MX6Q/QP/DL

Michal Vokáč (1):
      dt-bindings: arm: fsl: Add Y Soft IOTA Crux/Crux+ boards

Oleksij Rempel (2):
      dt-bindings: vendor-prefixes: Add an entry for JOZ BV
      dt-bindings: arm: fsl: add JOZ Access Point

 Documentation/devicetree/bindings/arm/fsl.yaml     | 78 +++++++++++++++++
 .../devicetree/bindings/bus/fsl,spba-bus.yaml      | 68 +++++++++++++++
 Documentation/devicetree/bindings/bus/imx-weim.txt |  5 ++
 .../bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml | 97 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |  4 +
 5 files changed, 252 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,spba-bus.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml
