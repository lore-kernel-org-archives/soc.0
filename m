Return-Path: <SRS0=to4Y=IC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FDFC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Mar 2021 14:45:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6235964F41
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Mar 2021 14:45:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6235964F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VG6iFJVNm1/m3M0Hb5p3yXTOjbrn7E29uB/EajJiBuY=; b=ho5kKiLp4O+ieH9+ffzr07AiaQ
	Dj0ZVoYgfldZfnXlG9CGfFrdUnzA0bb53afMklFLLq2NvDeJlIDNKlZOciR4ryfZ7dpK3xXad8tYz
	5FagEQ+tOZtrOsFIq1qYjNYCmwdJG2VUTOuOCK64oVV5Kn4C9pgLfMcWeQBnD1jiNlONMLOlkH7zU
	WjFqekB51Ws5RsyVPHfkN/4tTieOvn5LTX35xS+ti3TwQ8nL26ZkaMdIG/mVWxy6n7vpOLBc+Rl8x
	PBrHMAZJoTVBnhVk3ETGzP+LbUAUVW2BGNWVrheVVEEDFGqvZk+a4PahNt/Q5g9NrzLUkW+Jw87UP
	5pcZFggw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHpCu-008w7k-P5; Thu, 04 Mar 2021 14:44:05 +0000
Received: from muru.com ([72.249.23.125])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lHpCo-008w6R-8u
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Mar 2021 14:44:01 +0000
Received: from hillo.muru.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTP id 0838980A3;
 Thu,  4 Mar 2021 14:38:00 +0000 (UTC)
From: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arm@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] Fixes for omaps for v5.12-rc cycle
Date: Thu,  4 Mar 2021 16:37:18 +0200
Message-ID: <pull-1614868603-800959@atomide.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
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
Message-ID: <20210304143718.bv0vqdhHtg3-2sQ1s398ZKu7sq6mQOZ8OgmgLafP7MA@z>

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit f40ddce88593482919761f74910f42f4b84c004b:

  Linux 5.11 (2021-02-14 14:32:24 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.12/fixes-rc1-signed

for you to fetch changes up to effe89e40037038db7711bdab5d3401fe297d72c:

  soc: ti: omap-prm: Fix occasional abort on reset deassert for dra7 iva (2021-02-18 14:07:29 +0200)

----------------------------------------------------------------
Fixes for omaps for v5.12-rc cycle

Regression fixes for multiple issues found mostly caused by recent changes
to drop legacy platform data and and starting to use the new prm driver
reset controller:

- Fix ocp interconnect bus access error reporting for omap_l3_noc by
  setting IRQF_NO_THREAD

- Fix changed mmc slot order regression by adding mmc aliases for am335x

- Fix dra7 reboot regression caused by invalid pcie reset map

- Fix smartreflex init regression caused by dropped legacy data

- Fix ti-sysc driver warning on unbind if reset is not deasserted

- Fix flakey reset deassert for dra7 iva

----------------------------------------------------------------
Grygorii Strashko (1):
      bus: omap_l3_noc: mark l3 irqs as IRQF_NO_THREAD

Mans Rullgard (1):
      ARM: dts: am33xx: add aliases for mmc interfaces

Tony Lindgren (5):
      soc: ti: omap-prm: Fix reboot issue with invalid pcie reset map for dra7
      ARM: OMAP2+: Fix smartreflex init regression after dropping legacy data
      Merge branch 'fixes-v5.11' into fixes
      bus: ti-sysc: Fix warning on unbind if reset is not deasserted
      soc: ti: omap-prm: Fix occasional abort on reset deassert for dra7 iva

 arch/arm/boot/dts/am33xx.dtsi   |  3 ++
 arch/arm/mach-omap2/sr_device.c | 75 +++++++++++++++++++++++++++++++----------
 drivers/bus/omap_l3_noc.c       |  4 +--
 drivers/bus/ti-sysc.c           |  4 ++-
 drivers/soc/ti/omap_prm.c       |  8 +++--
 5 files changed, 72 insertions(+), 22 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
