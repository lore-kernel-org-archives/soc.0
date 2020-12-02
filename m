Return-Path: <SRS0=P2QD=FG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F235C64E7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Dec 2020 14:29:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15A4221D7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Dec 2020 14:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15A4221D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qAZQtaFHCk2YbwHH3RW4dX+jkljego6JsjoiVg9TTxM=; b=3XL9hjJEryvgIFWslBFyB2Uza/
	/kZdIvC1ya4gZZmrKeHC+CKE9fXB6E4sdQXBhaC3OeVgQ2QZit/k5wm8UFdjMPHQJ4a4I/zUqpcwh
	u2ocmafIz8JZi6pTWCUa47u/VYT13TTWQ5nzDUVcO9XaOjemXcx+Xj9R1hivuZCAr/2ZhqIZ1Eh1c
	0adPz/Ffot8/s/93dUa0P01pWmw6iKReQslIbonKcbpQQbkXG36jFmNKZ5HQ7WUyTuJY3pH03YuEy
	1XtTrWQLkBCuZ4fqj78/XI9+QKhMIaoAscsfCIwvTKrkgjTh7mQdoiopd9X2r3YhKf3KAT+5WSlbc
	ZgjSpq9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkT6i-0005KK-3N; Wed, 02 Dec 2020 14:27:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkT6e-0005J7-GD
 for linux-arm-kernel@lists.infradead.org; Wed, 02 Dec 2020 14:27:45 +0000
From: Shawn Guo <shawnguo@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Subject: [GIT PULL 1/6] i.MX drivers change for 5.11
Date: Wed,  2 Dec 2020 22:27:12 +0800
Message-Id: <20201202142717.9262-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_092744_623411_01C16804 
X-CRM114-Status: UNSURE (   7.51  )
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

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.11

for you to fetch changes up to e00e70a4dae4cae026d43f2f05ba46a19c4ef22d:

  firmware: imx: scu-pd: Add some power domains support for i.MX8qxp MIPI1 subsystem (2020-11-30 17:47:18 +0800)

----------------------------------------------------------------
i.MX drivers change for 5.11:

- A series from Daniel Baluta to update imx-dsp driver and export
  functions for on demand channel request/free.
- A number of patches to add power domains for i.MX8qxp DC0, LVDS1,
  MIPI1 and JPEG subsystems.
- Add dummy functions for i.MX firmware drivers to avoid build failure
  seen with COMPILE_TEST.

----------------------------------------------------------------
Daniel Baluta (3):
      firmware: imx: Introduce imx_dsp_setup_channels
      firmware: imx: Save channel name for further use
      firmware: imx-dsp: Export functions to request/free channels

Liu Ying (3):
      firmware: imx: scu-pd: Add video0/1 power domains support for i.MX8qxp DC0 subsystem
      firmware: imx: scu-pd: Add main power domain support for i.MX8qxp LVDS1 subsystem
      firmware: imx: scu-pd: Add some power domains support for i.MX8qxp MIPI1 subsystem

Mirela Rabulea (1):
      firmware: imx: scu-pd: Add power domains for imx-jpeg

Peng Fan (1):
      firmware: imx: add dummy functions

 drivers/firmware/imx/imx-dsp.c        | 72 ++++++++++++++++++++++++++---------
 drivers/firmware/imx/scu-pd.c         | 12 ++++++
 include/linux/firmware/imx/dsp.h      | 10 +++++
 include/linux/firmware/imx/ipc.h      | 13 +++++++
 include/linux/firmware/imx/sci.h      | 27 +++++++++++++
 include/linux/firmware/imx/svc/misc.h | 19 +++++++++
 6 files changed, 135 insertions(+), 18 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
