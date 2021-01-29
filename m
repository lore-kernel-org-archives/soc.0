Return-Path: <SRS0=/U+x=HA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7671C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 09:51:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9749764E2B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Jan 2021 09:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9749764E2B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vJHWtjsphi8016zLeLm/31/0eAlEmdEkg8swYmA+YEA=; b=DBlL4dwsTp05S++KDO2Zoew+c
	03MpJoJE6O6k03DeLUJw8sYnqS4rWJYo9jmTXZHmqthIaeQ67fkV84zK6wmfpvnJFncpEJKRPZRSI
	FEcLt4bWkqlDTcvf1CtsicMInlKYyc+F1JM/3u3sqOZZQ3IzKZv3K/JAwSXKAUaESXRJLXo7sXM9l
	99dtp1Fw9mZuRgjLoHSZnxvLDj1dBDCxuQfM8IpAV/9a3cUoQwemSaND8ElN1ONWBCnu/RCf2EKb4
	qQMq/54rkekEESp55bjRoCNuSraTCxCo+5KeXHuNCnnvWvgvVYifT5PEhG8sjCMf3FmbDCHh+/4pM
	vSFyAS5+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5QQT-0003Kf-Bk; Fri, 29 Jan 2021 09:50:49 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5QQN-0003Hg-0U
 for linux-arm-kernel@lists.infradead.org; Fri, 29 Jan 2021 09:50:44 +0000
Received: from ramsan.of.borg ([84.195.186.194])
 by andre.telenet-ops.be with bizsmtp
 id NZqf240074C55Sk01ZqfVy; Fri, 29 Jan 2021 10:50:39 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1l5QQI-001YQP-Ky; Fri, 29 Jan 2021 10:50:38 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1l5PlQ-00Ai16-SD; Fri, 29 Jan 2021 10:08:24 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Subject: [GIT PULL 2/2] Renesas driver updates for v5.12
Date: Fri, 29 Jan 2021 10:08:15 +0100
Message-ID: <20210129090815.2552425-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210129090815.2552425-1-geert+renesas@glider.be>
References: <20210129090815.2552425-1-geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_045043_189383_BCDEEE3C 
X-CRM114-Status: UNSURE (   6.16  )
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
Message-ID: <20210129090815.IL29eR3RUNrF0Ktt9qpIsxYq-ljcIrEgVMpuvAQ9C7k@z>

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-drivers-for-v5.12-tag1

for you to fetch changes up to 2dfc564bda4a31bc4439315448bd4da5182cb397:

  soc: renesas: rcar-sysc: Mark device node OF_POPULATED after init (2021-01-29 09:10:25 +0100)

----------------------------------------------------------------
Renesas driver updates for v5.12

  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      soc: renesas: rcar-sysc: Use readl_poll_timeout_atomic()
      soc: renesas: rcar-sysc: Mark device node OF_POPULATED after init

 drivers/soc/renesas/rcar-sysc.c | 37 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 20 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
