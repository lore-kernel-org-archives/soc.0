Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D420AC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:43:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B07064F45
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B07064F45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wvf8cfVCiahhrKjCKiFnZsnlJNfAnN2FeaCZ5fvVboI=; b=NE2Q/knJWZYP9NutRpa6Bclm2
	OHN/X3xZxtHNvMAI577WeWaCbpFRKBuMm6pR5T/0Hie6YMQ9aJ50AL0csbs/vlb/ezfOJkolTnbsH
	CLEroG0MMzxu587TKRdnSpiEflrW5jf2CnzQibRPBI1+3MTQpNNsugPfLYrlda1bOujtT6ceG8lQy
	hEyc4fjChrQ9CV8Lsxq3X4mxMolNPTccQJm1Ne13g3n31HxR1eE2ThFhukY4LuW6WUGV+e/fHw3rl
	rHbjD0x56ISoKFOknYzaXvWu5hvVTJ93IURlVKg3Jv3h01Bl+bq8yHkMJgZ5nFYDFH4hX02m11hF8
	cDQxAFR/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7lRS-0008Gr-VE; Thu, 04 Feb 2021 20:41:32 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7lQq-0007zm-Rv
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 20:40:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: hector@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id E83B34285D;
 Thu,  4 Feb 2021 20:40:48 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
To: Hector Martin <marcan@marcan.st>,
	soc@kernel.org
Subject: [PATCH 13/18] arm64: ioremap: use nGnRnE mappings on platforms that
 require it
Date: Fri,  5 Feb 2021 05:39:46 +0900
Message-Id: <20210204203951.52105-14-marcan@marcan.st>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204203951.52105-1-marcan@marcan.st>
References: <20210204203951.52105-1-marcan@marcan.st>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_154053_081157_06F428FA 
X-CRM114-Status: GOOD (  19.42  )
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

This follows from the fixmap patch, but relates to the general case.
This is a hack, and incomplete. Read on for discussion.

The problem: on Apple ARM platforms, SoC MMIO needs to use nGnRnE
mappings: writes using nGnRE are blackholed. This seems to be by design,
and there doesn't seem to be any fabric configuration or other bit we
can flip to make the problem go away.

As an additional confounding factor, reportedly PCIe MMIO BAR mappings
conversely *do* need to use nGnRE to work properly. So we can't even get
away with a single ioremap setting, but need to discriminate based on
what bus the device is in. Since these devices have Thunderbolt, all PCI
devices in the tree are potentially in scope. Ugh.

Ideas:

(1) Set up some devicetree property to default to nGnRnE at the platform
    level, and then make PCI drivers use nGnRE.

    This will require changing the PCI code to make pci_ioremap_bar do
    something other than a plain ioremap().

    Unfortunately, of the ~630 PCI drivers in the tree, only ~90 use
    pci_ioremap_bar(). This would require a tree-wide cleanup to
    introduce something akin to pci_ioremap(), and make all PCI
    drivers use it instead of naked ioremap().

    Currently there are three ioremap variants:

    ioremap()
    ioremap_wc()
    ioremap_uc() (not normally used on arm64)

    None of these really capture the nGnRE vs nGnRnE distinction. If
    a new variant is introduced in common code, we'd have to provide
    a default implementation that falls back to regular ioremap() on
    other arches. Something like ioremap() vs. ioremap_np() (nonposted)?

(2) The converse of (1): keep the nGnRE default, but introduce special
    casing to the OF binding code to use nGnRnE when instructed to do so
    on these platforms. This means of_iomap() needs changing.

    The advantage of this approach is that the set of possible non-PCI
    drivers that are useful on these SoCs is bounded, so not all drivers
    that don't go through that path need to be fixed.

    Additionally, this could take advantage of the OF address
    translation stuff to be smarter about deciding to use nGnRnE, e.g.
    doing it based on a property of the parent bus node.

    Of note, some devices (like samsung_tty) go through the platform
    device framework, which eventually goes into devm code. So
    of_address_to_resource would need to set some flag on the struct
    resource, that can then be used by both of_iomap() and
    devm_ioremap_resource() and friends to eventually call the right
    ioremap variant.

    The ioremap considerations from (1) apply here too.

(3) Do it at a lower level, in ioremap() itself. This requires that
    ioremap() somehow discriminates based on address range to pick what
    kind of mapping to make.

    Declaring these address ranges would be an issue. Options:

    a) An out of band list in a DT node, a la /reserved-memory

    b) Something based on the existing DT hierarchy, where we can scan
       bus ranges and locate buses with a property that says "nGnRnE" or
       "nGnRE" and dynamically build the list based on that.

    The advantage of this option is that it doesn't touch non-arch code.
    The disadvantage is that it adds a complete new bespoke mechanism to
    the DT, and that it does not let device drivers actually select the
    IO mode, which might be desirable in the future anyway for some
    devices.

All discussion and additional ideas welcome.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 arch/arm64/include/asm/io.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/io.h b/arch/arm64/include/asm/io.h
index 5ea8656a2030..f2609a4f5019 100644
--- a/arch/arm64/include/asm/io.h
+++ b/arch/arm64/include/asm/io.h
@@ -167,7 +167,14 @@ extern void __iomem *__ioremap(phys_addr_t phys_addr, size_t size, pgprot_t prot
 extern void iounmap(volatile void __iomem *addr);
 extern void __iomem *ioremap_cache(phys_addr_t phys_addr, size_t size);
 
-#define ioremap(addr, size)		__ioremap((addr), (size), __pgprot(PROT_DEVICE_nGnRE))
+/*
+ * Some platforms require nGnRnE for MMIO.
+ */
+extern bool arm64_use_ne_io;
+
+#define ioremap(addr, size)		__ioremap((addr), (size), \
+						  arm64_use_ne_io ? __pgprot(PROT_DEVICE_nGnRnE) \
+								  : __pgprot(PROT_DEVICE_nGnRE))
 #define ioremap_wc(addr, size)		__ioremap((addr), (size), __pgprot(PROT_NORMAL_NC))
 
 /*
-- 
2.30.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
