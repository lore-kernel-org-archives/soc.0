Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C830CC43381
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:42:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EC1B64F48
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EC1B64F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A7pED6ZhwR6mvA7bxoDhdyPu01IfIID8ZXhbUytrom8=; b=wJCU9CyNLQ1WJXn2ko7eVcDYv
	63n41NLltG3dqNk5/iB651KzIls/vDpevzo2W6EBFvZYPMw6ds7DfV9ziOwExEgg6p1U3AE5HtfT2
	DVVUSnAwaS9d/nhUfB4mLBkm7arFW1sP+ma+AElu18mkBzFje8DNtQo/wMd5hP0IGr/3gzM4v5Ly+
	NMjfupiXSvaQ3LSockdPdkLB2je+1kTwE+CYM4AJsPv3E61vd66jnRHHLPqLjernvJMMQ/RPyJyZi
	GoY4stalg3FFDVylHGxvYTtEbptb8GFd7eQRO5P0F5VJVASn4iB3Ua0/ATATXSNnNlIm4yJ9xMCxR
	Qfy8YP5FQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7lQo-0007yq-Tk; Thu, 04 Feb 2021 20:40:51 +0000
Received: from marcansoft.com ([2a01:298:fe:f::2] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7lQa-0007un-H6
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 20:40:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: hector@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id CD1D542848;
 Thu,  4 Feb 2021 20:40:32 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
To: Hector Martin <marcan@marcan.st>,
	soc@kernel.org
Subject: [PATCH 08/18] arm64: cpufeature: Add a feature for FIQ support
Date: Fri,  5 Feb 2021 05:39:41 +0900
Message-Id: <20210204203951.52105-9-marcan@marcan.st>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204203951.52105-1-marcan@marcan.st>
References: <20210204203951.52105-1-marcan@marcan.st>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_154037_523186_A62E0168 
X-CRM114-Status: GOOD (  18.18  )
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

Apple ARM SoCs (A11 and newer) have some interrupt sources hard-wired to
the FIQ line. Introduce a cpufeature that can be used to enable FIQ
unmasking and handling via alternatives.

This is currently enabled for all Apple CPUs. If/when support is
implemented for older (pre-A11) iPhone/iPad SoCs which do not need FIQs,
or if newer SoCs are released without the FIQ requirement, we can
revisit the condition.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 arch/arm64/Kconfig                  | 10 +++++++++
 arch/arm64/include/asm/cpucaps.h    |  3 ++-
 arch/arm64/include/asm/cpufeature.h |  6 ++++++
 arch/arm64/include/asm/cputype.h    |  1 +
 arch/arm64/kernel/cpufeature.c      | 32 +++++++++++++++++++++++++++++
 5 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index f39568b28ec1..11cfdc07404f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1756,6 +1756,16 @@ config ARM64_DEBUG_PRIORITY_MASKING
 	  If unsure, say N
 endif
 
+config ARM64_FIQ_SUPPORT
+	bool "Support for FIQ interrupts"
+	help
+	  Adds support for handling FIQ interrupts as normal IRQs.
+	  This is required on Apple platforms where some IRQ sources are
+	  hardwired to the FIQ interrupt line.
+
+	  FIQs are only enabled at runtime on platforms that require them
+	  via the CPU feature framework.
+
 config RELOCATABLE
 	bool "Build a relocatable kernel image" if EXPERT
 	select ARCH_HAS_RELR
diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index b77d997b173b..c36d926ad801 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -66,7 +66,8 @@
 #define ARM64_WORKAROUND_1508412		58
 #define ARM64_HAS_LDAPR				59
 #define ARM64_KVM_PROTECTED_MODE		60
+#define ARM64_NEEDS_FIQ				61
 
-#define ARM64_NCAPS				61
+#define ARM64_NCAPS				62
 
 #endif /* __ASM_CPUCAPS_H */
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 9a555809b89c..3a00cfb347c9 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -716,6 +716,12 @@ static __always_inline bool system_uses_irq_prio_masking(void)
 	       cpus_have_const_cap(ARM64_HAS_IRQ_PRIO_MASKING);
 }
 
+static __always_inline bool system_uses_fiqs(void)
+{
+	return IS_ENABLED(CONFIG_ARM64_FIQ_SUPPORT) &&
+	       cpus_have_const_cap(ARM64_NEEDS_FIQ);
+}
+
 static inline bool system_supports_mte(void)
 {
 	return IS_ENABLED(CONFIG_ARM64_MTE) &&
diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index ef5b040dee44..2084a0340d16 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -59,6 +59,7 @@
 #define ARM_CPU_IMP_NVIDIA		0x4E
 #define ARM_CPU_IMP_FUJITSU		0x46
 #define ARM_CPU_IMP_HISI		0x48
+#define ARM_CPU_IMP_APPLE		0x61
 
 #define ARM_CPU_PART_AEM_V8		0xD0F
 #define ARM_CPU_PART_FOUNDATION		0xD00
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index e99eddec0a46..0863cf7cf807 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1237,6 +1237,29 @@ static bool has_cache_idc(const struct arm64_cpu_capabilities *entry,
 	return ctr & BIT(CTR_IDC_SHIFT);
 }
 
+static void cpu_sync_irq_to_fiq(struct arm64_cpu_capabilities const *cap)
+{
+	u64 daif = read_sysreg(daif);
+
+	/*
+	 * By this point in the boot process IRQs are likely masked and FIOs
+	 * aren't, so we need to sync things to avoid spurious early FIQs.
+	 */
+
+	if (daif & PSR_I_BIT)
+		daif |= PSR_F_BIT;
+	else
+		daif &= ~PSR_F_BIT;
+
+	write_sysreg(daif, daif);
+}
+
+static bool needs_fiq(const struct arm64_cpu_capabilities *entry, int __unused)
+{
+	/* All supported Apple cores need this */
+	return read_cpuid_implementor() == ARM_CPU_IMP_APPLE;
+}
+
 static void cpu_emulate_effective_ctr(const struct arm64_cpu_capabilities *__unused)
 {
 	/*
@@ -2154,6 +2177,15 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.matches = has_cpuid_feature,
 		.min_field_value = 1,
 	},
+#ifdef CONFIG_ARM64_FIQ_SUPPORT
+	{
+		.desc = "FIQs",
+		.capability = ARM64_NEEDS_FIQ,
+		.type = ARM64_CPUCAP_BOOT_CPU_FEATURE,
+		.matches = needs_fiq,
+		.cpu_enable = cpu_sync_irq_to_fiq,
+	},
+#endif
 	{},
 };
 
-- 
2.30.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
