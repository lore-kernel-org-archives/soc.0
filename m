Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BF2C433E0
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Feb 2021 20:42:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6C1D64F48
	for <linux-devicetree@archiver.kernel.org>; Thu,  4 Feb 2021 20:42:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbhBDUmQ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 4 Feb 2021 15:42:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbhBDUmK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 4 Feb 2021 15:42:10 -0500
Received: from mail.marcansoft.com (marcansoft.com [IPv6:2a01:298:fe:f::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 772CFC061786
        for <devicetree@vger.kernel.org>; Thu,  4 Feb 2021 12:41:55 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: hector@marcansoft.com)
        by mail.marcansoft.com (Postfix) with ESMTPSA id CD1D542848;
        Thu,  4 Feb 2021 20:40:32 +0000 (UTC)
From:   Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
To:     Hector Martin <marcan@marcan.st>, soc@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Marc Zyngier <maz@kernel.org>, robh+dt@kernel.org,
        Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>
Subject: [PATCH 08/18] arm64: cpufeature: Add a feature for FIQ support
Date:   Fri,  5 Feb 2021 05:39:41 +0900
Message-ID: <20210204203951.52105-9-marcan@marcan.st>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204203951.52105-1-marcan@marcan.st>
References: <20210204203951.52105-1-marcan@marcan.st>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Message-ID: <20210204203941.BRAxtrDO4tcdm8OKyub1oxnPbtklFY46uwNRAq8tSjw@z>

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

