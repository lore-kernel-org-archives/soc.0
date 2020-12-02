Return-Path: <SRS0=P2QD=FG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7067C64E8A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Dec 2020 14:29:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 821DF21D42
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Dec 2020 14:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 821DF21D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZY/6KG5cf5Ekrn6a/VG5WY94gXAteQTir7BBzagBegw=; b=l2LSg7UW8XFqINkKFEUaPbpzcB
	l1c5NKrpAShw/lBQy8OqFb/LcSxIjdqPzOKwJflJkokk3kDfK8oRt2qS61sUIb5aZFerAbNbNQ30X
	72jxrUbIYmM9TzuUQWeF9J5R/sqvMU0O7aCF/rvN27dsIALIz6vcKmCZyUnenNsshrVXB5BUOQN1J
	Xgy8vKeZk8ehJuztJsHxvd5Mrog965Qza5RktC2nkisn15CiBSVntlAjV83AVzsVeVSoKTk5tMkVW
	5T3yvnryYEaGpmSKyOUFJAgspLgHoR46QQcYj9oCXLti+rOvdxNNAlsNZ4V8SWIT9GUY6RM/mMqD9
	AdUtJlHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkT6k-0005LH-H3; Wed, 02 Dec 2020 14:27:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkT6h-0005KF-3h
 for linux-arm-kernel@lists.infradead.org; Wed, 02 Dec 2020 14:27:48 +0000
From: Shawn Guo <shawnguo@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Subject: [GIT PULL 2/6] i.MX SoC update for 5.11
Date: Wed,  2 Dec 2020 22:27:13 +0800
Message-Id: <20201202142717.9262-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201202142717.9262-1-shawnguo@kernel.org>
References: <20201202142717.9262-1-shawnguo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_092747_601505_9B1C334C 
X-CRM114-Status: UNSURE (   8.15  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Shawn Guo <shawnguo@kernel.org>, Stefan Agner <stefan@agner.ch>,
 Li Yang <leoyang.li@nxp.com>, linux-imx@nxp.com, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-5.11

for you to fetch changes up to 4ba79e25d7f1a7394021ba4c215a7ecdcc270fb6:

  ARM: mxs: Add serial number support for i.MX23, i.MX28 SoCs (2020-11-30 17:31:29 +0800)

----------------------------------------------------------------
i.MX SoC update for 5.11:

- Add revision detection support for i.MX7ULP revision 2.2.
- Add a little document for i.MX7ULP B2 silicon version.
- Add serial number support for i.MX23, i.MX28 SoCs through soc_device.
- Improve the identifying of i.MX6QP SoCs.

----------------------------------------------------------------
Anson Huang (1):
      ARM: imx: Add revision support for i.MX7ULP revision 2.2

Fabio Estevam (1):
      ARM: imx: imx7ulp: Add a comment explaining the B2 silicon version

Ivan Zaentsev (1):
      ARM: mxs: Add serial number support for i.MX23, i.MX28 SoCs

Sven Van Asbroeck (1):
      ARM: imx: mach-imx6q: correctly identify i.MX6QP SoCs

 arch/arm/mach-imx/mach-imx6q.c   |  9 +++++++--
 arch/arm/mach-imx/mach-imx7ulp.c |  4 ++++
 arch/arm/mach-mxs/mach-mxs.c     | 19 +++++++++++++++++++
 3 files changed, 30 insertions(+), 2 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
