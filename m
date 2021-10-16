Return-Path: <SRS0=Uq4y=PE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422C3C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Oct 2021 14:03:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 078DC61181
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Oct 2021 14:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 078DC61181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GA9Ey9TKOPW5e/O8HmW2cPkEWTTbKDMlFkZtch3gmA4=; b=PfZSJn0ngDThP1
	j/dGmkt6q7Jun7WaFXAeI81/9W79SrpzHfITUKX4rWiEyC83asg6qC35dUnUahvmpEr8wMJQ7clC3
	KEanqt1Lz4uBsUVTVQDjWyKigMe7UJ5+iv33EJnjTgIH1VDX9ZFHrMbiRHa23O+a3nUfT7R0AlfSd
	uk/g2VSNZWIROW0YjbtKbOeA6ZfK0tjM2o8FZEFQfJvq1TW+3PhevwEczwZ/AtxPSh8NHOfOo1lAn
	EyDvHzg9Vonf50zx8H5jIRlSUj6Bv2y8Jph+Lafz/RlZI9OFwqcEHeyKhZH8Hax1z3RyaXnKFg3/R
	xuhuDXdnYSiUxWer3ZxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbkGM-00Aik0-OF; Sat, 16 Oct 2021 14:02:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbkGJ-00AijV-IV
 for linux-arm-kernel@lists.infradead.org; Sat, 16 Oct 2021 14:02:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E1E360FED;
 Sat, 16 Oct 2021 14:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634392931;
 bh=3ZjBBjsmBy/m5I9h0Z86ZlRWbjik6jYcCPlhehrp/E8=;
 h=From:List-Id:To:Cc:Subject:Date:From;
 b=sykHOP4KSvxiDl3OfYqnoz1Xj6V48QrQgRjMhhYAXDpqIJ9tH5ZwxELX1uoZCEzNs
 8xU6/x9eN70OibzWWHSW3K3b+Ecmft3DdlTP7CGOHVVIy2ARlNAuJhzHwngwcBRYbq
 iyL3GnamsIHA+4DEzYJRix7J4xARoVU1H5hEV/UMeF44+YdYlQTdHh8jJPuEadUeHP
 J7NamKcjaZUfjbNSbrX8XeKvEwmkNooPpc+NynLR3tszsm40qxL7bKuRYDfS3PEk+S
 41F3kfOzyqUrqfUrf8EWge+W7KnAWjzzVF9rot3g0QeGbL3M6dKPQarjAWpBsPvFlH
 giDqIgRLEqFtA==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
 kernel@pengutronix.de, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] i.MX DT bindings update for 5.16
Date: Sat, 16 Oct 2021 22:01:33 +0800
Message-ID: <20211016140138.1603-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211016_070211_677446_C45FE6F1 
X-CRM114-Status: UNSURE (   6.37  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211016140133.ujSfyZFOzEDDXZmbqNPFwOTERk0HIW6DjMvi9-VFdJ0@z>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-5.16

for you to fetch changes up to 83ad8d101151a149bfb602a08bf30ac82442f8f9:

  dt-bindings: arm: fsl: add ls1021a-tsn board (2021-10-15 11:13:07 +0800)

----------------------------------------------------------------
i.MX DT bindings update for 5.16:

- Various board compatible addition: NXP S32G2, LS1021A TSN, Toradex
  Colibri i.MX6ULL, LX2160A BlueBox 3 boards.
- Toradex board and module compatibles clean-up.
- Convert fsl-linflexuart bindings to json-schema format and add S32G2
  compatible.
- Add bindings and defines for i.MX8MM VPU and DISP blk-ctrl.

----------------------------------------------------------------
Andreas Kemnade (1):
      dt-bindings: arm: fsl: Add E70K02 based ebook readers

Chester Lin (3):
      dt-bindings: arm: fsl: add NXP S32G2 boards
      dt-bindings: serial: fsl-linflexuart: convert to json-schema format
      dt-bindings: serial: fsl-linflexuart: add compatible for S32G2

Li Yang (1):
      dt-bindings: arm: fsl: add ls1021a-tsn board

Lucas Stach (4):
      dt-bindings: soc: add binding for i.MX8MM VPU blk-ctrl
      dt-bindings: power: imx8mm: add defines for VPU blk-ctrl domains
      dt-bindings: soc: add binding for i.MX8MM DISP blk-ctrl
      dt-bindings: power: imx8mm: add defines for DISP blk-ctrl domains

Marcel Ziswiler (2):
      dt-bindings: arm: fsl: clean-up all toradex boards/modules
      dt-bindings: arm: fsl: add toradex,colibri-imx6ull-emmc

Vladimir Oltean (1):
      dt-bindings: arm: fsl: document the LX2160A BlueBox 3 boards

 Documentation/devicetree/bindings/arm/fsl.yaml     | 99 +++++++++++++---------
 .../bindings/serial/fsl,s32-linflexuart.txt        | 22 -----
 .../bindings/serial/fsl,s32-linflexuart.yaml       | 48 +++++++++++
 .../bindings/soc/imx/fsl,imx8mm-disp-blk-ctrl.yaml | 94 ++++++++++++++++++++
 .../bindings/soc/imx/fsl,imx8mm-vpu-blk-ctrl.yaml  | 76 +++++++++++++++++
 include/dt-bindings/power/imx8mm-power.h           |  9 ++
 6 files changed, 288 insertions(+), 60 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.txt
 create mode 100644 Documentation/devicetree/bindings/serial/fsl,s32-linflexuart.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/imx/fsl,imx8mm-disp-blk-ctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/imx/fsl,imx8mm-vpu-blk-ctrl.yaml

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
