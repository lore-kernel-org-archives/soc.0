Return-Path: <linux-kernel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B30C433E0
	for <linux-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:44:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4A6E64F44
	for <linux-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:44:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbhBDUn6 (ORCPT <rfc822;linux-kernel@archiver.kernel.org>);
        Thu, 4 Feb 2021 15:43:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbhBDUly (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Thu, 4 Feb 2021 15:41:54 -0500
Received: from mail.marcansoft.com (marcansoft.com [IPv6:2a01:298:fe:f::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A468C06178B
        for <linux-kernel@vger.kernel.org>; Thu,  4 Feb 2021 12:41:09 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: hector@marcansoft.com)
        by mail.marcansoft.com (Postfix) with ESMTPSA id E83B34285D;
        Thu,  4 Feb 2021 20:40:48 +0000 (UTC)
From:   Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
To:     Hector Martin <marcan@marcan.st>, soc@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Marc Zyngier <maz@kernel.org>, robh+dt@kernel.org,
        Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>
Subject: [PATCH 13/18] arm64: ioremap: use nGnRnE mappings on platforms that require it
Date:   Fri,  5 Feb 2021 05:39:46 +0900
Message-ID: <20210204203951.52105-14-marcan@marcan.st>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204203951.52105-1-marcan@marcan.st>
References: <20210204203951.52105-1-marcan@marcan.st>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
Message-ID: <20210204203946.XfUf2yCPg_Aj9wFyklx-gfVv6La_LKg3RrFFcCMAQcw@z>

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

