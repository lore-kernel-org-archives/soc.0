Return-Path: <SRS0=Z36m=FB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35009C63798
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 13:24:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA9752224D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2020 13:24:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oeTYvvly"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA9752224D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h9O1le6fMRomYfrekfm9sQ4YWaU2D88lKnjgUR99hVI=; b=oeTYvvlymD97lysnYf0dvPH6A
	FhAEk34WLanM78bVvTDIEe74vWmtcniKolSC99wRzRrcI4xMPnC+q7qNNMVKkFj/0NdiR65GNsp3T
	UJf67ba0RyJI50Lyuphvb0wUXk7XM7R0gV7FBvdeME//1kPag6IFrFZ2EjGilT/MCT0dvd9Vkzz7G
	2jZNqSY2wk0mBjO5tgLlh6ebVjtGlvgJSvdIexqwuSXFeKla5CjduOD+i83FUcYQaXJ9ncc5O49z/
	CXRcdswnEMqwxLaLzOGTgKewAEzVz4lFWQrdPauZ+ZzkSaFvJjMNz2lRGfqovs9hK+4xv0QICzWLw
	gxH9ouHiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kidiL-0002QU-Hv; Fri, 27 Nov 2020 13:23:05 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kidhT-00020J-FI
 for linux-arm-kernel@lists.infradead.org; Fri, 27 Nov 2020 13:22:17 +0000
Received: from ramsan.of.borg ([84.195.186.194])
 by andre.telenet-ops.be with bizsmtp
 id xRN32300Y4C55Sk01RN3ik; Fri, 27 Nov 2020 14:22:04 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1kidhL-0065FP-Ll; Fri, 27 Nov 2020 14:22:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1kidhL-000K9p-1i; Fri, 27 Nov 2020 14:22:03 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	arm-soc <soc@kernel.org>
Subject: [GIT PULL 2/3] Renesas ARM SoC updates for v5.11
Date: Fri, 27 Nov 2020 14:21:54 +0100
Message-ID: <20201127132155.77418-3-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201127132155.77418-1-geert@linux-m68k.org>
References: <20201127132155.77418-1-geert@linux-m68k.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_082212_330906_D6B6AD1D 
X-CRM114-Status: UNSURE (   7.60  )
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, Magnus Damm <magnus.damm@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201127132154.d5VXrDDrtzFpTmJ-RBtdD7r9BmkqApVURNmmcnuAbgc@z>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-soc-for-v5.11-tag1

for you to fetch changes up to d4a617c9bbef94e4a776901cf12c95eafd54504a:

  ARM: shmobile: Stop using __raw_*() I/O accessors (2020-11-23 09:54:59 +0100)

----------------------------------------------------------------
Renesas ARM SoC updates for v5.11

  - Stop using static I/O mappings and __raw_*() I/O accessors.

----------------------------------------------------------------
Geert Uytterhoeven (8):
      ARM: shmobile: r8a7778: Introduce HPBREG_BASE
      ARM: shmobile: r8a7779: Use ioremap() to map INTC2 registers
      ARM: shmobile: r8a7779: Use ioremap() to map SMP registers
      ARM: shmobile: r8a7779: Remove obsolete static mappings
      ARM: shmobile: sh73a0: Use ioremap() to map L2C registers
      ARM: shmobile: sh73a0: Use ioremap() to map SMP registers
      ARM: shmobile: sh73a0: Remove obsolete static mapping
      ARM: shmobile: Stop using __raw_*() I/O accessors

 arch/arm/mach-shmobile/platsmp-scu.c   |  2 +-
 arch/arm/mach-shmobile/setup-r8a7778.c | 12 +++++---
 arch/arm/mach-shmobile/setup-r8a7779.c | 56 ++++++++++++----------------------
 arch/arm/mach-shmobile/setup-sh73a0.c  | 21 +------------
 arch/arm/mach-shmobile/smp-r8a7779.c   | 12 ++++++--
 arch/arm/mach-shmobile/smp-sh73a0.c    | 33 +++++++++++++-------
 6 files changed, 59 insertions(+), 77 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
