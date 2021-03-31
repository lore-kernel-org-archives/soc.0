Return-Path: <SRS0=X/nU=I5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB598C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 04:12:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69B0A619E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Mar 2021 04:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69B0A619E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hfiQen949fMiSE0BnJfFhM0AkZ+X8ER28eFbCg+BV+o=; b=L8lVyocAozb5EgizF7VO5fV2I0
	t+zOOguue12duybNVhPnl9nY7JyXGDu5Sm7B60gGPjCQTlj3wur0RX0aNbS9mJP0uklXRLIthecs3
	glTFcGseFwhNhT+by4Y7Ra0P//BGvNfnsexzHFgZ5hSVi72AcIWLGRiCjVd4ibzaXa0tp8TXYxoC6
	uTTfgTZkuZ0T9H4a5D8tn7JRE1P/k5+1bWU9YV05fphT4Ctc9Om/XFqqi7FoCTASUcR+lRptqNHtT
	SNZaUDe7p90t88aoI3G1TyCm2SnF6NLZl63Mb7RhyRSo8jLLJMgKcXB7RvqgNAwEM1eRwkVJ2d3Nt
	uk3nilWw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRSBr-005R18-F3; Wed, 31 Mar 2021 04:10:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRSBm-005R0J-8X
 for linux-arm-kernel@lists.infradead.org; Wed, 31 Mar 2021 04:10:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 15FF0619DB;
 Wed, 31 Mar 2021 04:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617163838;
 bh=xVGwmuuaspcOA67NhO43yvUoxEK7fy/AwoBkld2KwUI=;
 h=From:List-Id:To:Cc:Subject:Date:From;
 b=HZRf5KA5CO3T+jfxWwjCAbeqVMDnQsUytVDbeivzMCaXpSE99PQsHW9AFLdlHeLge
 RJUh5Vmz4XJ4+hQjG7X0oMeQVRo05EmNLJk42ci1vwv1yBK2D7qG9uJA0graST7TZs
 jYXWVLbYz2qJctW0uMTeT361YQ3kGNwwvmnUpxv82LMOmJKfvhcPt25Et5wY91VzCP
 xaUkOj8FPPaOYBmfzI7XhYlFx6N8sqp2zT2LX0p1lFFtqAxKFieR2dYOCvOaJlKzyH
 9+71KDMwPeUM776rBhgVGYXrP1LrtyNnDqszs4uiX81ps5Cz1IhrDUrZsHWBKXwAjv
 9yfAP+SQcJ2FA==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
 kernel@pengutronix.de, linux-imx@nxp.com,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] i.MX drivers change for 5.13
Date: Wed, 31 Mar 2021 12:10:14 +0800
Message-ID: <20210331041019.31345-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_051042_610277_91F1B604 
X-CRM114-Status: UNSURE (   5.15  )
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
Message-ID: <20210331041014.e01ze0Vu2A3mJkuwrFmk-kZj3jctHdAB_l8759HJdAs@z>

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.13

for you to fetch changes up to f63af5f3b8e2cba1b0b19b5cc4aa00d152f84599:

  firmware: imx: scu-pd: add missed ADC1 pd (2021-03-29 09:34:37 +0800)

----------------------------------------------------------------
i.MX drivers change for 5.13:

- Update SCU power domain driver to keep console domain power on.
- Add missing ADC1 power domain to SCU power domain driver.
- Update comments for single global power domain in SCU power domain
  driver.
- Add i.MX51/i.MX53 unique id support to i.MX SoC driver.

----------------------------------------------------------------
Dong Aisheng (1):
      firmware: imx: scu-pd: do not power off console domain

Frank Li (1):
      firmware: imx: scu-pd: add missed ADC1 pd

Sebastian Reichel (1):
      soc: imx: add i.MX51/i.MX53 unique id support

Ulf Hansson (1):
      firmware: imx: scu-pd: Update comments for single global power domain

 drivers/firmware/imx/scu-pd.c | 41 +++++++++++++++++++++++++++++++++++++----
 drivers/soc/imx/soc-imx.c     | 12 ++++++++++++
 2 files changed, 49 insertions(+), 4 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
