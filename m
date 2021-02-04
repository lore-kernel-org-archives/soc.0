Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5547C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 12:03:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3754864F4E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 12:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3754864F4E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NVn7wN9mccuC3XcQ4QjDOUXSs0EkmqJM3ZdyGfUIWmY=; b=Q0QTRbkcyTP36qqkyMtiXoEjw3
	rRyfl/9LjaXCjfK0fJfGbt2zTRmczmmjhF0UU5geH6dgcQ0WBZ13Ln2sHhxR2koL0tX6ulMiFM3OP
	X065a+1MJqvnY/D2e59c12OWuXnsyOxyt0Jk3jJjwJp+yJPsx4+20t0tNBgZsgyr7pKXIQGxXdJVK
	PX/bfuux8Xcm2EaKJ+aVK11LdzNTiEZyZCVBofA+n240uxpE38PsZDsteeqj7MdeTPchG50hPSHXi
	CEtMIIjLdEFeofhiDYFAPw1sJmQib1t3xMLUWb+ZfI4wvlQSdPR7wzILVpkA8XTjab6kTcXe44+0d
	7xmxi9fg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7dKs-00069k-IW; Thu, 04 Feb 2021 12:02:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7dKo-00068j-IL
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 12:02:07 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D6BC64F5C;
 Thu,  4 Feb 2021 12:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612440125;
 bh=TM1KQsbvxtFKjTK7qmaypFlrAbjUrVOdA33g8M9LEz0=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lyFGgCACIXJMprsypM04r7qz1nwlLm3G+WsOOMI+ykR4dqqH1hGDKyklD984aprew
 qB5dMw9ex+KgeEb3+l1xcl9E/b9K1Pu5OLZFcCreP3calrSlVEcRcwW5UH+tSlRgTY
 /kt1innZTuKyhNPKzBw1PW1b+uA5k1+/GyJASQibq01tBzrqjX8Uraxbg7YXmH5WHy
 CfztB1+tJMN8np0BcfaeMSp7vUWpYdboVNZX5zGdJSncWNz3QsugFz6vIMd7nb9q2b
 2LhLQvghEpqHgJ5aQidad0qyXl0MYKpsIIYjoy19w1ssK/W1+/OcH74NLzNw5TCHGu
 BFymJXi7abc1w==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Subject: [GIT PULL 2/6] i.MX SoC update for 5.12
Date: Thu,  4 Feb 2021 20:01:46 +0800
Message-ID: <20210204120150.26186-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204120150.26186-1-shawnguo@kernel.org>
References: <20210204120150.26186-1-shawnguo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_070207_075031_191E30F5 
X-CRM114-Status: UNSURE (   7.13  )
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
Message-ID: <20210204120146.edBPsA6TlYmZA_pEFkDdkoKLsmBooYKARqYHsB-UpYI@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-5.12

for you to fetch changes up to 579c6f925e5ae3a70ec32e936908066707dbfef5:

  ARM: imx: Remove unused IMX_GPIO_NR() macro (2021-01-29 16:47:25 +0800)

----------------------------------------------------------------
i.MX SoC update for 5.12:

- Drop unused IMX_GPIO_NR() macro.
- Remove KSZ8081 PHY fixup from i.MX6UL machine code, because it only
  applies for KSZ8081RNA with 50MHz clock source, but breaks other
  KSZ8081 PHY configurations.
- Add a print of CPU type and SOC revision for i.MX6UL during boot.

----------------------------------------------------------------
Fabio Estevam (1):
      ARM: imx: Remove unused IMX_GPIO_NR() macro

Oleksij Rempel (1):
      ARM: imx: mach-imx6ul: remove 14x14 EVK specific PHY fixup

Stefan Riedmueller (1):
      ARM: mach-imx: imx6ul: Print SOC revision on boot

 arch/arm/mach-imx/hardware.h    |  4 ----
 arch/arm/mach-imx/mach-imx6ul.c | 25 ++++---------------------
 2 files changed, 4 insertions(+), 25 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
