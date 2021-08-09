Return-Path: <SRS0=5t0o=NA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7886EC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Aug 2021 07:20:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DB6260F4B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Aug 2021 07:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DB6260F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=URqaMahPCbSPKE7iwOUC2MQvsf7UOLDrLAda0N+ayM4=; b=Fi4HyjVzGqnpu0
	+PyL2ho9xqZYvuekG1kDwRkqRTXFuXv3ipaHkCs4cNqsr4pyvQUcXlsbICH1w1h7IYsy3oiyF90SX
	nvaQ2GFbGClL1EnB62gqczFyFXI1OzSZT5q0ReyyxVHNo15QggOf2H2yrBgkI7ZJYz7ZQ1zpVA2Dj
	m++4Iy71edG1+St82gm4JqXB88bHpSJOyo3+vuulV6J6Y8b1AaCRZY04HVSgm7QWooYDbHGgM5nW0
	rEAkMG5PeAJCj8+iwyLdMJVE9I2u4A4SEfnmhqlBb5m6bGYT54yELlgnWD+0gGz9ug6P7BsGI2yJW
	deyFDObiJfORt1auZO7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCzYf-00HLP1-O5; Mon, 09 Aug 2021 07:18:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCzYc-00HLOa-37
 for linux-arm-kernel@lists.infradead.org; Mon, 09 Aug 2021 07:18:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5827D60F11;
 Mon,  9 Aug 2021 07:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628493525;
 bh=4CsALJqWTqRKUJgbpQqD09QUd6h5Q9m+xOpFrkVwZt8=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=uBq2CIVXp7XByudQ4IH6kpQb5dCwf3R0y1FjmFlM2VtjQF/nyuyrHqdb+rW+SPdaY
 iw2EKslcwvx5QgDETlxGkaA+8i0SkEECtBHpylgrdpcMAJFO8rHhLB2kEj2ov8IkTv
 D+T4Ux0Ss58PSVQ0AuSO/l2nhoThiAZRXvEUgXqqPzX6cpK6xz6LR0dT+8u8jAKxfn
 kq0k7UesTzZ1PZruTzetpjNP5cxmkX9rIp1hOv2huHemtf7Eeifz7K7i0Fu4/3oNvB
 FIeg9/uJOaklOr3iZKU1iZNegSSQH5twRhZXijJtfkIYtQf6bGjUqJvXt53O7BOYVy
 Igo52edU67CNQ==
Date: Mon, 9 Aug 2021 15:18:39 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>, Robin Gong <yibin.gong@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, kernel@pengutronix.de,
 linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX eCSPI errata handling for 5.15
Message-ID: <20210809071838.GF30984@dragon>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_001846_197706_28387529 
X-CRM114-Status: UNSURE (   7.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210809071839.Q1-gqvQTPDYmqZfQUHJOaE1bKR9KREakNZHq0HTuMMw@z>

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-ecspi-5.15

for you to fetch changes up to 4e2b10be1f4fe06c9deaaf2c03a05abcff191791:

  dmaengine: imx-sdma: add terminated list for freed descriptor in worker (2021-07-23 11:20:06 +0800)

----------------------------------------------------------------
i.MX eCSPI errata handling for 5.15:

It includes all required changes for handling i.MX6/7 eCSPI errata
ERR009165, which causes FIFO transfer to be sent twice in DMA mode.
Both SPI and DMA maintainers agree to merge it through arm-soc tree.

----------------------------------------------------------------
Robin Gong (12):
      Revert "ARM: dts: imx6q: Use correct SDMA script for SPI5 core"
      Revert "ARM: dts: imx6: Use correct SDMA script for SPI cores"
      Revert "dmaengine: imx-sdma: refine to load context only once"
      dmaengine: imx-sdma: remove duplicated sdma_load_context
      dmaengine: dma: imx-sdma: add fw_loaded and is_ram_script
      dmaengine: imx-sdma: add mcu_2_ecspi script
      spi: imx: fix ERR009165
      spi: imx: remove ERR009165 workaround on i.mx6ul
      dmaengine: imx-sdma: remove ERR009165 on i.mx6ul
      dma: imx-sdma: add i.mx6ul compatible name
      dmaengine: imx-sdma: add uart rom script
      dmaengine: imx-sdma: add terminated list for freed descriptor in worker

 .../devicetree/bindings/dma/fsl-imx-sdma.txt       |  1 +
 arch/arm/boot/dts/imx6q.dtsi                       |  2 +-
 arch/arm/boot/dts/imx6qdl.dtsi                     |  8 +-
 drivers/dma/imx-sdma.c                             | 93 ++++++++++++++++------
 drivers/spi/spi-imx.c                              | 41 ++++++++--
 5 files changed, 111 insertions(+), 34 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
