Return-Path: <SRS0=piaZ=KH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CC9C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 May 2021 13:40:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0B91613DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 May 2021 13:40:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0B91613DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Cc:To:From:Subject:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nKYQ3Vl9Nm+Fp9IH63IbDQgmMulEpKGN2gFqlEFGYyE=; b=GGVWLY/L5dJeYGSPcpzdSKgTh5
	KyXadM/IKouvgdEjoIhjbuP1aYSpw81xvGYiaEfQvrO6jK8Pm3IrdDHbQVi8DqrbM4LgoFon0suuC
	O/ZKoR6Kbhakz+OKTOJUV8B5TDinCR9sdwmunY1YVfCpdu8SfaaCmIuZYch6qfzOVKHo6iS++51wo
	rP2rpGqqL5UIGgVk2RdBZNjl5dreAFBnhIq6zBLUckx3kB33m6DLGXKRMUoH6DN/9XS0UNrhDSMSg
	vYqGATbgtT+iSP/0+xCEKApj3cjRItYCMKtK5uhHeE4VJlR9vKizSAVc9bXBqmtj7CDDjszgfdgUi
	lOYtmb2A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgp52-002vAq-4L; Wed, 12 May 2021 13:39:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgp4W-002v4D-FF
 for linux-arm-kernel@desiato.infradead.org; Wed, 12 May 2021 13:38:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=MIME-Version:
 Content-Transfer-Encoding:Content-Type:Date:Cc:To:From:Subject:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=9D6I+rY14y7s7fLJWOGXTZ1/BjhtF/iO86ZMdjzrSac=; b=udLI+Fh3T8JiNv0yvoVq81pX/S
 w/89kS63RKS0HyluwUmSfs6xJmpLgaxu8kr+eY1TuDsMsBtXd1XZ2snmhc2pjGhgzDq/CtUOUxrtv
 R33S9fge6j0e1Mm0nI0f/f14BE+qAVJTq7+Uxc/fP2RPSBbKzoePyHKfgmnAdZWWAVQJpToP+cTf5
 82Q7Z9toxfcePO0pZbWl8UHSUfMvVhZ7/d1p39V6kwXSbaSB+JyilwmDciHu6roz4UG6WLkm0+hAY
 Sy66JC87wGsX541zJYomQaIl0iMA1EzU7deCJ0B3Vj4GKklusEk87vp0awvq9PqsftCCcddTEH8o6
 0raJz9DA==;
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgp4T-00APdW-QF
 for linux-arm-kernel@lists.infradead.org; Wed, 12 May 2021 13:38:43 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1lgp4S-0008Mu-4e; Wed, 12 May 2021 15:38:40 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1lgp4R-0003X7-Sl; Wed, 12 May 2021 15:38:39 +0200
Message-ID: <418cf3a460cfe1d0f91f87e10baaf478bd41f1d5.camel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v5.14
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Date: Wed, 12 May 2021 15:38:39 +0200
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_063841_867995_406ED923 
X-CRM114-Status: GOOD (  10.23  )
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
Message-ID: <20210512133839.VkyDmuzGnc3-qnEsYmHLbbuMrFfRrScruOnwWlo19pM@z>

Dear SoC maintainers,

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux.git tags/reset-for-v5.14

for you to fetch changes up to e207457f9045343a24d936fbb67eb4b412f1c6ad:

  reset: brcmstb: Add missing MODULE_DEVICE_TABLE (2021-05-12 08:01:26 +0200)

----------------------------------------------------------------
Reset controller updates for v5.14

This tag adds support for the Microchip Sparx5 Switch Reset controller
and contains some small fixes and cleanups in core and various drivers.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      reset: RESET_BRCMSTB_RESCAL should depend on ARCH_BRCMSTB
      reset: RESET_INTEL_GW should depend on X86

Krzysztof Kozlowski (1):
      reset: a10sr: add missing of_match_table reference

Philipp Zabel (8):
      reset: bcm6345: Make reset_control_ops const
      reset: zynqmp: replace spaces with tabs
      reset: oxnas: replace file name with short description
      reset: whitespace fixes
      reset: berlin: replace unsigned with unsigned int
      reset: ti-syscon: fix to_ti_syscon_reset_data macro
      reset: sti/syscfg: replace comma with semicolon
      reset: uniphier: enclose UNIPHIER_RESET_ID_END value in parentheses

Steen Hegelund (2):
      dt-bindings: reset: microchip sparx5 reset driver bindings
      reset: mchp: sparx5: add switch reset driver

Zou Wei (1):
      reset: brcmstb: Add missing MODULE_DEVICE_TABLE

 .../devicetree/bindings/reset/microchip,rst.yaml   |  58 ++++++++
 drivers/reset/Kconfig                              |  12 +-
 drivers/reset/Makefile                             |   1 +
 drivers/reset/core.c                               |  20 +--
 drivers/reset/reset-a10sr.c                        |   1 +
 drivers/reset/reset-bcm6345.c                      |   2 +-
 drivers/reset/reset-berlin.c                       |   2 +-
 drivers/reset/reset-brcmstb.c                      |   1 +
 drivers/reset/reset-microchip-sparx5.c             | 146 +++++++++++++++++++++
 drivers/reset/reset-oxnas.c                        |   2 +-
 drivers/reset/reset-ti-syscon.c                    |   4 +-
 drivers/reset/reset-uniphier.c                     |   2 +-
 drivers/reset/reset-zynqmp.c                       |   4 +-
 drivers/reset/sti/reset-syscfg.c                   |   2 +-
 14 files changed, 237 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/microchip,rst.yaml
 create mode 100644 drivers/reset/reset-microchip-sparx5.c

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
