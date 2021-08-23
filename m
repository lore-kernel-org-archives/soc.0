Return-Path: <SRS0=GAqo=NO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949CDC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Aug 2021 16:14:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D25E6124D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Aug 2021 16:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D25E6124D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/dZIW06IvvB3p0MC14dFwEpde9VcOhLyaoQjbR6Vjzw=; b=Qp8X2J70vI1NwZ
	v1xnCCmZZI/kw4RvccH9Yq2b+4sGCEXXpp8cuc4xnZ8GpY1605Csy0E4rsgxVCEeHcZx2V0Uwz9zG
	22+v9lYsAh8qmMEF4nVhq7RMrrrynKzjRhhCwTUuvPQd05RKa/Wat24uXxZhT7cvvIOxuFcOccnRN
	rvg4SoH9AQ8yqt0w6HOs8e0iEqcpCL/B1sDo+0QxKZNAsCJ3G2Cy3jw+90A7Zmn9CXTk54mBXqUDk
	UIpyw3+2Ol0YqP5KuKy7Nudhv9v2FDdKi1hF9wqRTEkUA0TrF9vPv/UNE9+VLyyGf+I/x4+FLt3yA
	tuzbJNN8mLcZKTt+/pyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mICZL-00HY1E-7k; Mon, 23 Aug 2021 16:13:03 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mICZE-00HY0W-Vl
 for linux-arm-kernel@lists.infradead.org; Mon, 23 Aug 2021 16:13:00 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mICZD-0008R2-Lw; Mon, 23 Aug 2021 18:12:55 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mICZD-0002ja-Da; Mon, 23 Aug 2021 18:12:55 +0200
Message-ID: <d42a75fc17ce718ef1b3fa4c5d3f5c7fb0bd2bc2.camel@pengutronix.de>
Subject: [GIT PULL] Reset controller updates for v5.15
From: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Date: Mon, 23 Aug 2021 18:12:55 +0200
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_091257_065087_D27B7866 
X-CRM114-Status: UNSURE (   9.71  )
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
Message-ID: <20210823161255.JZOMJBtO3_hZnDK-h1bTRRiH3oRY0xaX1y-IO_yV7-w@z>

Dear SoC maintainers,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.pengutronix.de/pza/linux tags/reset-for-v5.15

for you to fetch changes up to 09f3824342f665d222fb7ac17c91f8334779630b:

  reset: simple: remove ZTE details in Kconfig help (2021-08-23 12:53:32 +0200)

----------------------------------------------------------------
Reset controller updates for v5.15

Add support for the SC7280 PDC Global and RZ/G2L USB/PHY reset
controllers, convert UniPhier glue device tree bindings to json-schema
and remove a leftover mention of ZTE zx2967 from Kconfig.

----------------------------------------------------------------
Biju Das (2):
      dt-bindings: reset: Document RZ/G2L USBPHY Control bindings
      reset: renesas: Add RZ/G2L usbphy control driver

Kunihiko Hayashi (1):
      dt-bindings: reset: Convert UniPhier glue reset to json-schema

Peter Robinson (1):
      reset: simple: remove ZTE details in Kconfig help

Sibi Sankar (3):
      dt-bindings: reset: aoss: Add AOSS reset controller binding
      dt-bindings: reset: pdc: Add PDC Global bindings
      reset: qcom: Add PDC Global reset signals for WPSS

 .../devicetree/bindings/reset/qcom,aoss-reset.yaml |   5 +
 .../devicetree/bindings/reset/qcom,pdc-global.yaml |   4 +
 .../bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml  |  65 ++++++++
 .../reset/socionext,uniphier-glue-reset.yaml       |  88 +++++++++++
 .../devicetree/bindings/reset/uniphier-reset.txt   |  61 -------
 drivers/reset/Kconfig                              |   8 +-
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-qcom-pdc.c                     |  62 ++++++--
 drivers/reset/reset-rzg2l-usbphy-ctrl.c            | 175 +++++++++++++++++++++
 include/dt-bindings/reset/qcom,sdm845-pdc.h        |   2 +
 10 files changed, 398 insertions(+), 73 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/socionext,uniphier-glue-reset.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/uniphier-reset.txt
 create mode 100644 drivers/reset/reset-rzg2l-usbphy-ctrl.c

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
