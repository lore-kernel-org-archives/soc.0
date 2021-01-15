Return-Path: <SRS0=ftTf=GS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54ADBC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 09:47:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D74FE235F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 09:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D74FE235F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CQBj7IYFi5l38piZ22WbEiPcBAKKH7j7dxWho7vgMFU=; b=wJT9XhjICXmUMMzYrpS10SZNMz
	WfyafNvQtZayy80jyzJWe66/WqUSoo0HMK6TTDnPyZHlvUVECUwq3s2iq6o0MLXkRxvvYil5nky8T
	8Wv4adwWehOQ8GhWPZflAuUxJMhpwCqRzc6HR3QLMyPHpafWik7ThHE3yfgt2n9h4Zwu3YNNE2NOI
	ukfuAUDM015CSNrgFnE2wVlAYIJNboKszWEGyFcp7vM3I/NoLNo8NYism0/hQB86w4ZibbKIFG6KS
	iMJbTIgKRnWnQVTtaNMAl8RzH/c9F4AmH79zuhZ3qbv4AEkCSQY7h2Dzud/ZFrotB3b3uhqH9GA8W
	7dxlz/Zw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Lgj-0005wa-5I; Fri, 15 Jan 2021 09:46:37 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0LgY-0005sx-Tc
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Jan 2021 09:46:29 +0000
Received: from ramsan.of.borg ([84.195.186.194])
 by michel.telenet-ops.be with bizsmtp
 id GxmL2400J4C55Sk06xmLMT; Fri, 15 Jan 2021 10:46:21 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1l0LgS-003iyC-Bt; Fri, 15 Jan 2021 10:46:20 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1l0LgR-009nCv-No; Fri, 15 Jan 2021 10:46:19 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Subject: [GIT PULL 0/2] Renesas ARM SoC updates for v5.12
Date: Fri, 15 Jan 2021 10:46:08 +0100
Message-ID: <20210115094610.2334058-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_044627_097380_19234C43 
X-CRM114-Status: UNSURE (   7.33  )
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
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210115094608.y3dngp_9YSo0qSUwyPIiXhUYby_ugYhBQLBJn8TrT9E@z>

	Hi arm-soc folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.12.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas ARM DT updates for v5.12

    - Timer (CMT/TMU) support for R-Car Gen3 SoCs,
    - Watchdog (RWDT), pincontrol (PFC), GPIO, and DMA (SYS-DMAC) support
      for the R-Car V3U SoC,
    - USB2 clock selector and SPI Multi I/O Bus Controller (RPC-IF)
      support for RZ/G2 SoCs,
    - Support for the Beacon EmbeddedWorks RZ/G2H and RZ/G2N kits,
    - Various fixes and improvements.

  [GIT PULL 2/2] Renesas DT binding updates for v5.12

    - Document suport for the Beacon EmbeddedWorks RZ/G2N and RZ/H kits.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
