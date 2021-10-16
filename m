Return-Path: <SRS0=Uq4y=PE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CDFC433FE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Oct 2021 14:03:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1174611AF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Oct 2021 14:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1174611AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5ik8Cbj21SW0sTYnRiSHiA5lKWniiMQhF+/iqGGLpBk=; b=pfzg40PiEi9gbo
	+gsK9oBtzCtBogzF+qKVaiZzR4VNE8ZyycsTJj+j9GC7ID1QD0AARGNpJiwY2h5thCUHqCO1dpP9g
	a9xfXKfuM7I/BDr4DL2kPR9Cck0hpcHv9+aObRAvdzPYkbLoK9+LFdaY4F0/chFDQl5qy1SGK1dRl
	ecF1vROffnHI4GtynYEeQKlDTYoysdvv6qLiAhUZmDRohqPwtg15SO5hm86HZ7qK6qFiQ5yOXPEoo
	kw5ikvenS/k/4SF9CIvnVUPYFgbPrqb2701unmYYyb1eeSswxorLT84i/zUy6SA3JZSAwy2r0kNZe
	Y0rNeWrTN4ViG41SRKsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbkGV-00AimW-Px; Sat, 16 Oct 2021 14:02:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbkGM-00Aik4-3k
 for linux-arm-kernel@lists.infradead.org; Sat, 16 Oct 2021 14:02:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 98F5C610D2;
 Sat, 16 Oct 2021 14:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634392933;
 bh=XJ0Q4Ut+FHYPnSZ/i6TZ0dYQTlCahYfCZPiS055X5sw=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HAen5h6UXx5d/qTixW68KgY9bF14EIakLQrafHJ++mKo5iEu8fD5YOWn2hSakmbL4
 8u8Bl4ngzJXuDuwixaMqyeLHuCuDxMftFVAm38p790K7ZtMEy2CSSwqt/pMQwA17c1
 BmeEt/EACBD0ursI9vRN0PSLJSDbCQFEPwUOU5P9qqD9FD9ApYfQmXGlG0mc6ltojN
 M3JBjXWplYjjVrP7UisZ64NXPcFEVjM+ICX2qsL5NHW4+5su2hWSnFwjwZRTxWoACC
 S9BthugVV9WdosaxNpQuc2VSkcAhAiaLmtXNN610kDb7vZnFnGT7DeLIZlh1NtnKWh
 dcbKM7QM46Rhg==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
 kernel@pengutronix.de, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] i.MX drivers update for 5.16
Date: Sat, 16 Oct 2021 22:01:34 +0800
Message-ID: <20211016140138.1603-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211016140138.1603-1-shawnguo@kernel.org>
References: <20211016140138.1603-1-shawnguo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211016_070214_203579_D7B3713A 
X-CRM114-Status: UNSURE (   7.43  )
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
Message-ID: <20211016140134.MOYosS5zCRpUC4w1yHSSf3txRWp3RhFQIOu3YNYg2Ew@z>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.16

for you to fetch changes up to 72949f76565c9ea9f4231c977774a31d4713c386:

  soc: imx: imx8m-blk-ctrl: off by one in imx8m_blk_ctrl_xlate() (2021-10-15 11:10:05 +0800)

----------------------------------------------------------------
i.MX drivers update for 5.16:

- Select REGMAP_MMIO for i.MX GPCv2 driver to avoid build issue.
- A couple of i.MX GPCv2 driver changes from Marek Vasut to turn
  domain->pgc into bitfield for i.MX8MM GPU domain support.
- A series from Lucas Stach adding support of i.MX8MM nested power
  domains like VPUMIX and DISPMIX which contains the ADB and BLK_CTRL.
- An off-by-one fix on Lucas' i.MX8M blk-ctrl driver code.

----------------------------------------------------------------
Dan Carpenter (1):
      soc: imx: imx8m-blk-ctrl: off by one in imx8m_blk_ctrl_xlate()

Ezequiel Garcia (1):
      imx: soc: Select REGMAP_MMIO

Lucas Stach (8):
      soc: imx: gpcv2: allow to disable individual power domains
      Revert "soc: imx: gpcv2: move reset assert after requesting domain power up"
      soc: imx: gpcv2: add lockdep annotation
      soc: imx: gpcv2: add domain option to keep domain clocks enabled
      soc: imx: gpcv2: keep i.MX8M* bus clocks enabled
      soc: imx: gpcv2: support system suspend/resume
      soc: imx: add i.MX8M blk-ctrl driver
      soc: imx: imx8m-blk-ctrl: add DISP blk-ctrl

Marek Vasut (2):
      soc: imx: gpcv2: Turn domain->pgc into bitfield
      soc: imx: gpcv2: Set both GPC_PGC_nCTRL(GPU_2D|GPU_3D) for MX8MM GPU domain

 drivers/soc/imx/Kconfig          |   1 +
 drivers/soc/imx/Makefile         |   1 +
 drivers/soc/imx/gpcv2.c          | 134 +++++++---
 drivers/soc/imx/imx8m-blk-ctrl.c | 523 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 618 insertions(+), 41 deletions(-)
 create mode 100644 drivers/soc/imx/imx8m-blk-ctrl.c

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
