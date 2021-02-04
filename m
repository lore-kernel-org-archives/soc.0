Return-Path: <SRS0=IECD=HG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A631FC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:50:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 263FC64F7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Feb 2021 20:50:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 263FC64F7C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gyist2TH0tvzj+E+IUjh7ivryO5z6ezTaUWAE9pFQIo=; b=tc8Ctb7CEDHHHg3MLaWT4ToVi
	yUNT4xm0l8TfAiAooUxu/HFYUi7VnP+5/oa1oSSVEs0tKIV0KHb/eht7YEpkWfIXcbC4/Olq3P9Hq
	33/uuRXYsijSAgivDRqQPYAF3SABa0q+aKaMnXgGQF6Kw3cPBG0K8/gjpOv1GeC5yr5nOR3NsJwsw
	+DZTYeurt0IvZJCWUkEHlC+V5u3HC7sEP0BUG5rvMF/jH90f/VBxVqcXhnOxoI0YNd2G48uyhRf0e
	YCdtfzw+9AI2FoeofCAWzenhNQevlhiGg3iFwym1p6yL8G6KMqi1Oe+RzBpYDJ155mt+JkKaLWPWB
	fCPGHbjiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7lZT-00033Z-CR; Thu, 04 Feb 2021 20:49:47 +0000
Received: from marcansoft.com ([2a01:298:fe:f::2] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7lZQ-000337-Iz
 for linux-arm-kernel@lists.infradead.org; Thu, 04 Feb 2021 20:49:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: hector@marcansoft.com)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 0C97D42852;
 Thu,  4 Feb 2021 20:40:35 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
To: Hector Martin <marcan@marcan.st>,
	soc@kernel.org
Subject: [PATCH 09/18] arm64: cputype: Add CPU types for the Apple M1
 big/little cores
Date: Fri,  5 Feb 2021 05:39:42 +0900
Message-ID: <20210204203951.52105-10-marcan@marcan.st>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204203951.52105-1-marcan@marcan.st>
References: <20210204203951.52105-1-marcan@marcan.st>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_154944_753554_F5955A9A 
X-CRM114-Status: GOOD (  10.15  )
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
Message-ID: <20210204203942.6hE8_WdXWwjSjqrnpw7DFgPyED5Xs1JrWEBJw3uRklE@z>

These are not used at the moment, but let's add them for documentation
purposes.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 arch/arm64/include/asm/cputype.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 2084a0340d16..6231e1f0abe7 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -100,6 +100,9 @@
 
 #define HISI_CPU_PART_TSV110		0xD01
 
+#define APPLE_CPU_PART_M1_ICESTORM	0x022
+#define APPLE_CPU_PART_M1_FIRESTORM	0x023
+
 #define MIDR_CORTEX_A53 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A53)
 #define MIDR_CORTEX_A57 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A57)
 #define MIDR_CORTEX_A72 MIDR_CPU_MODEL(ARM_CPU_IMP_ARM, ARM_CPU_PART_CORTEX_A72)
@@ -128,6 +131,8 @@
 #define MIDR_NVIDIA_CARMEL MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_CARMEL)
 #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
 #define MIDR_HISI_TSV110 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_TSV110)
+#define MIDR_APPLE_M1_ICESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_ICESTORM)
+#define MIDR_APPLE_M1_FIRESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_FIRESTORM)
 
 /* Fujitsu Erratum 010001 affects A64FX 1.0 and 1.1, (v0r0 and v1r0) */
 #define MIDR_FUJITSU_ERRATUM_010001		MIDR_FUJITSU_A64FX
-- 
2.30.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
