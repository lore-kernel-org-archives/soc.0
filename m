Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD63C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:42:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A33BE64F44
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:42:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A33BE64F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KgN1UYHki/OCtOk02Oq3XJlBRp+tR+QNwtwXRvM93BY=; b=2QRUuJI0QeqZUvnkvqZhnzY01
	jFwmg443l4QzXtPfkLE/aRd6Da3tH2BLAHKH1WfKcimoGxkn/ng32BHT9O3ivB7o3NebCzH9tayr/
	X9LvBjtJjOq0VGR2cyqGK0ylcKE6E1jKBQSO5rquCy/jiIbjI7Vjc1SIBQHtpt/QsCq7OlGF7OVB9
	yg7Feuqh6dZdg9JLVVaDHxPV0X+OjE8SvTyhu8EYPre9ERt0FptnJJuEJDlxwGE4NJi6lUqYn9GrT
	AADe8ebmocbIr7mAECIHTScenpTH8YwMmJ0NcrNW3+2kVmUvGzIkfmZg6pU83/YyGeGqcloKhRlAf
	BsXtsWttw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7lQx-00081c-Vg; Thu, 04 Feb 2021 20:41:00 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7lQi-0007wv-IZ
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 20:40:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: hector@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 2266A42856;
 Thu,  4 Feb 2021 20:40:38 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
To: Hector Martin <marcan@marcan.st>,
	soc@kernel.org
Subject: [PATCH 10/18] arm64: Introduce FIQ support
Date: Fri,  5 Feb 2021 05:39:43 +0900
Message-Id: <20210204203951.52105-11-marcan@marcan.st>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204203951.52105-1-marcan@marcan.st>
References: <20210204203951.52105-1-marcan@marcan.st>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_154044_993619_E9181FDB 
X-CRM114-Status: GOOD (  17.35  )
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

Apple SoCs (A11 and newer) have some interrupt sources hardwired to the
FIQ line. Implement support for this by simply treating IRQs and FIQs
the same way in the interrupt vectors. This is conditional on the
ARM64_NEEDS_FIQ CPU feature flag, and thus will not affect other
systems.

Root irqchip drivers can discriminate between IRQs and FIQs by checking
the ISR_EL1 system register.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 arch/arm64/include/asm/assembler.h |  4 ++++
 arch/arm64/include/asm/daifflags.h |  7 +++++++
 arch/arm64/include/asm/irqflags.h  | 17 +++++++++++++----
 arch/arm64/kernel/entry.S          | 27 +++++++++++++++++++++++----
 4 files changed, 47 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index bf125c591116..6acfc372dc76 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -42,7 +42,11 @@
 
 	/* IRQ is the lowest priority flag, unconditionally unmask the rest. */
 	.macro enable_da_f
+alternative_if ARM64_NEEDS_FIQ
+	msr	daifclr, #(8 | 4)
+alternative_else
 	msr	daifclr, #(8 | 4 | 1)
+alternative_endif
 	.endm
 
 /*
diff --git a/arch/arm64/include/asm/daifflags.h b/arch/arm64/include/asm/daifflags.h
index 1c26d7baa67f..228a6039c701 100644
--- a/arch/arm64/include/asm/daifflags.h
+++ b/arch/arm64/include/asm/daifflags.h
@@ -112,6 +112,13 @@ static inline void local_daif_restore(unsigned long flags)
 		 * So we don't need additional synchronization here.
 		 */
 		gic_write_pmr(pmr);
+	} else if (system_uses_fiqs()) {
+		/*
+		 * On systems that use FIQs, disable FIQs if IRQs are disabled.
+		 * This can happen if the DAIF_* flags at the top of this file
+		 * are used to set DAIF directly.
+		 */
+		flags |= PSR_F_BIT;
 	}
 
 	write_sysreg(flags, daif);
diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
index ff328e5bbb75..689c573c4b47 100644
--- a/arch/arm64/include/asm/irqflags.h
+++ b/arch/arm64/include/asm/irqflags.h
@@ -19,8 +19,9 @@
  * side effects for other flags. Keeping to this order makes it easier for
  * entry.S to know which exceptions should be unmasked.
  *
- * FIQ is never expected, but we mask it when we disable debug exceptions, and
- * unmask it at all other times.
+ * FIQ is never expected on most platforms, but we mask it when we disable
+ * debug exceptions, and unmask it at all other times. On platforms that
+ * require FIQs, it tracks IRQ masking.
  */
 
 /*
@@ -34,8 +35,14 @@ static inline void arch_local_irq_enable(void)
 		WARN_ON_ONCE(pmr != GIC_PRIO_IRQON && pmr != GIC_PRIO_IRQOFF);
 	}
 
-	asm volatile(ALTERNATIVE(
+	/*
+	 * Yes, ALTERNATIVE() nests properly... only one of these should be
+	 * active on any given platform.
+	 */
+	asm volatile(ALTERNATIVE(ALTERNATIVE(
 		"msr	daifclr, #2		// arch_local_irq_enable",
+		"msr	daifclr, #3		// arch_local_irq_enable",
+		ARM64_NEEDS_FIQ),
 		__msr_s(SYS_ICC_PMR_EL1, "%0"),
 		ARM64_HAS_IRQ_PRIO_MASKING)
 		:
@@ -53,8 +60,10 @@ static inline void arch_local_irq_disable(void)
 		WARN_ON_ONCE(pmr != GIC_PRIO_IRQON && pmr != GIC_PRIO_IRQOFF);
 	}
 
-	asm volatile(ALTERNATIVE(
+	asm volatile(ALTERNATIVE(ALTERNATIVE(
 		"msr	daifset, #2		// arch_local_irq_disable",
+		"msr	daifset, #3		// arch_local_irq_disable",
+		ARM64_NEEDS_FIQ),
 		__msr_s(SYS_ICC_PMR_EL1, "%0"),
 		ARM64_HAS_IRQ_PRIO_MASKING)
 		:
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index c9bae73f2621..81ca04ebe37b 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -60,7 +60,7 @@
 #define BAD_FIQ		2
 #define BAD_ERROR	3
 
-	.macro kernel_ventry, el, label, regsize = 64
+	.macro kernel_ventry, el, label, regsize = 64, altlabel = 0, alt = 0
 	.align 7
 #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
 	.if	\el == 0
@@ -87,7 +87,15 @@ alternative_else_nop_endif
 	tbnz	x0, #THREAD_SHIFT, 0f
 	sub	x0, sp, x0			// x0'' = sp' - x0' = (sp + x0) - sp = x0
 	sub	sp, sp, x0			// sp'' = sp' - x0 = (sp + x0) - x0 = sp
+	.if	\altlabel != 0
+	alternative_if \alt
+	b	el\()\el\()_\altlabel
+	alternative_else
 	b	el\()\el\()_\label
+	alternative_endif
+	.else
+	b	el\()\el\()_\label
+	.endif
 
 0:
 	/*
@@ -119,7 +127,15 @@ alternative_else_nop_endif
 	sub	sp, sp, x0
 	mrs	x0, tpidrro_el0
 #endif
+	.if	\altlabel != 0
+	alternative_if \alt
+	b	el\()\el\()_\altlabel
+	alternative_else
 	b	el\()\el\()_\label
+	alternative_endif
+	.else
+	b	el\()\el\()_\label
+	.endif
 	.endm
 
 	.macro tramp_alias, dst, sym
@@ -547,18 +563,21 @@ SYM_CODE_START(vectors)
 
 	kernel_ventry	1, sync				// Synchronous EL1h
 	kernel_ventry	1, irq				// IRQ EL1h
-	kernel_ventry	1, fiq_invalid			// FIQ EL1h
+							// FIQ EL1h
+	kernel_ventry	1, fiq_invalid, 64, irq, ARM64_NEEDS_FIQ
 	kernel_ventry	1, error			// Error EL1h
 
 	kernel_ventry	0, sync				// Synchronous 64-bit EL0
 	kernel_ventry	0, irq				// IRQ 64-bit EL0
-	kernel_ventry	0, fiq_invalid			// FIQ 64-bit EL0
+							// FIQ 64-bit EL0
+	kernel_ventry	0, fiq_invalid, 64, irq, ARM64_NEEDS_FIQ
 	kernel_ventry	0, error			// Error 64-bit EL0
 
 #ifdef CONFIG_COMPAT
 	kernel_ventry	0, sync_compat, 32		// Synchronous 32-bit EL0
 	kernel_ventry	0, irq_compat, 32		// IRQ 32-bit EL0
-	kernel_ventry	0, fiq_invalid_compat, 32	// FIQ 32-bit EL0
+							// FIQ 32-bit EL0
+	kernel_ventry	0, fiq_invalid_compat, 32, irq_compat, ARM64_NEEDS_FIQ
 	kernel_ventry	0, error_compat, 32		// Error 32-bit EL0
 #else
 	kernel_ventry	0, sync_invalid, 32		// Synchronous 32-bit EL0
-- 
2.30.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
