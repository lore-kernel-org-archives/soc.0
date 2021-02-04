Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C214C433E9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:43:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D46B264F59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:43:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D46B264F59
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bsQn+8xM1zra7AXsATvKPwWCCXQUQGiDifQIH6ihUC0=; b=dwRKPSJXYzbBZTnL6deJ8RRoP
	2sGm+N4C7whBkmV0QRUj3/xWuwBCCpX5aLj+FCsIX9KIuD9DY8FiPiiGfGPOkYDaH7qEfLHruPHS1
	5oZJXHUjDo16hgd3PmtpASHI5ZYDBurO3srWbjx3kMZbvNF+2sJ1qqe7m1qNcL06dxg+NEkBP+8QF
	FcodtW2fufNyYzq0LQ1tXlHUkYSODpH9dPCfpxEk9SVmB6bgdYJ8iaGPTOPM5K+sRYRl9jiZxi2go
	C4Yto4Ot1sOqxYzJdasNH4ARrhoP6ygDlJBdrtbgyuDuR8R7D/JRMD3pygp0Y+dYS6ps6vUwpR7fB
	Eqozvh2hw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7lRK-0008Cq-W7; Thu, 04 Feb 2021 20:41:24 +0000
Received: from marcansoft.com ([2a01:298:fe:f::2] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7lQn-0007yk-ND
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 20:40:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: hector@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id F27E54285A;
 Thu,  4 Feb 2021 20:40:45 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
To: Hector Martin <marcan@marcan.st>,
	soc@kernel.org
Subject: [PATCH 12/18] arm64: setup: Use nGnRnE IO mappings for fixmap on
 Apple platforms
Date: Fri,  5 Feb 2021 05:39:45 +0900
Message-ID: <20210204203951.52105-13-marcan@marcan.st>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204203951.52105-1-marcan@marcan.st>
References: <20210204203951.52105-1-marcan@marcan.st>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_154049_972166_B845AA12 
X-CRM114-Status: GOOD (  16.06  )
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
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210204203945.lVYNqwPRBNKS6eZ3zs05ZoNmYiXWkw62xLPi4JZUMw4@z>

This is a hack. I do not expect this to be merged as-is.

The problem: on Apple ARM platforms, SoC MMIO needs to use nGnRnE
mappings: writes using nGnRE are blackholed. This seems to be by design,
and there doesn't seem to be any fabric configuration or other bit we
can flip to make the problem go away.

Particularly tricky is that this affects earlycon, which uses fixmap,
which all gets initialized before any of the usual cpufeatures /
alternatives stuff. So we need to take care of fixmap very early.

Options I can think of:

(1) Unconditionally use nGnRnE on all platforms for fixmap IO. Maybe
    this is actually fine? I suspect it might break some PCI-based
    earlycons?

(2) Deal with this special case in the earlycon code, since that seems
    to be the only user that matters on these platforms. Since the
    IO mapping is done in earlycon.c, this will require some cooperation
    with samsung_tty.c so earlycon knows when it needs to do this. Note
    that doing it with DT properties will break cmdline-only earlycon
    config (which otherwise works fine on this driver).

(3) This patch, but do something saner, like use a specific DT flag to
    trigger this mode instead of a platform match.

Any other ideas?

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 arch/arm64/include/asm/fixmap.h | 10 +++++++++-
 arch/arm64/kernel/setup.c       | 12 ++++++++++++
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/fixmap.h b/arch/arm64/include/asm/fixmap.h
index 4335800201c9..999351ce84df 100644
--- a/arch/arm64/include/asm/fixmap.h
+++ b/arch/arm64/include/asm/fixmap.h
@@ -94,7 +94,15 @@ enum fixed_addresses {
 #define FIXADDR_SIZE	(__end_of_permanent_fixed_addresses << PAGE_SHIFT)
 #define FIXADDR_START	(FIXADDR_TOP - FIXADDR_SIZE)
 
-#define FIXMAP_PAGE_IO     __pgprot(PROT_DEVICE_nGnRE)
+/*
+ * We use nGnRE by default, but some platforms require nGnRnE for MMIO.
+ */
+extern bool arm64_use_ne_io;
+
+#define FIXMAP_PAGE_IO_DEFAULT	__pgprot(PROT_DEVICE_nGnRE)
+#define FIXMAP_PAGE_IO_STRICT	__pgprot(PROT_DEVICE_nGnRnE)
+#define FIXMAP_PAGE_IO		(arm64_use_ne_io ? FIXMAP_PAGE_IO_STRICT \
+						 : FIXMAP_PAGE_IO_DEFAULT)
 
 void __init early_fixmap_init(void);
 
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index c18aacde8bb0..cd2dc3bdbae4 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -56,6 +56,8 @@ static struct resource *standard_resources;
 
 phys_addr_t __fdt_pointer __initdata;
 
+bool arm64_use_ne_io;
+
 /*
  * Standard memory resources
  */
@@ -197,6 +199,16 @@ static void __init setup_machine_fdt(phys_addr_t dt_phys)
 
 	pr_info("Machine model: %s\n", name);
 	dump_stack_set_arch_desc("%s (DT)", name);
+
+#ifdef CONFIG_ARCH_APPLE
+	/*
+	 * Apple SoCs need to use nGnRnE mappings for MMIO, and this needs
+	 * to be detected before earlycon is initialized.
+	 */
+	if (of_flat_dt_is_compatible(of_get_flat_dt_root(),
+				     "AAPL,arm-platform"))
+		arm64_use_ne_io = true;
+#endif
 }
 
 static void __init request_standard_resources(void)
-- 
2.30.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
