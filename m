Return-Path: <SRS0=QZdI=FR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0889BC4361B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Dec 2020 22:57:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF37C22DFA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Dec 2020 22:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF37C22DFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ML40ocBhxmshshmB+zs+ah77FJQZXCJKNBmYrtVGfEo=; b=ckvf+jdUgaEPg2z0H4/qhmte2j
	nArc2Jg4aJs+VglNZFEEGX//gp0Fx93osymhSI5HdM7XFnVw6rkfDYGnqVt+1PaawSrP6yR+MiBma
	Q4HBr6mMo2/wdNqVuaPi8Kb+dMP4Dq1y+jtO1WmxEl7h08dVY5SWIogSZ8blscc+8+DxvIC3hB3Cx
	J5hFAaCLK+018NNQKa/d3sv772nQrlfStIOCfgmwDx79qOe5xM6ZTgyQTKSVir/eQuPrXEOBPvEqB
	+vambJMVUlcbSQvH0l8hhMMX3fRl4Oy6ZvFcyRL93KVoeN3hgnooZdDYKT/sOfnpDadfbZUVaxTm/
	jTuz5fpQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koaH3-0007jN-IG; Sun, 13 Dec 2020 22:55:29 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koaGz-0007ix-PP
 for linux-arm-kernel@lists.infradead.org; Sun, 13 Dec 2020 22:55:27 +0000
Received: by mail-lf1-x141.google.com with SMTP id m12so25585313lfo.7
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 13 Dec 2020 14:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EJzcPpylnKaiFhjUaTGCdHTSB4HDtxk1bXFCHW9lZ18=;
 b=UNjGuQdEso2eA+quGXUi3dqpChaI3xl6pywwJHljSQn4Amqp6x7Sd37UVYaN8iIKK1
 pD6VgfTfObaIg00FmW5G8pIySxGYjW6a/t2vk7fNNY1nPqa99PQpE3bCCuxuUY8gj85b
 +rJuSvTQ2Sd/8mzzPTfzo8iuTokluufuWvYxhx7pUSzIb8zQ7LDLbGQd2OKQXDVsG+fw
 3LG16SSkaIypmOdZN+85m1Zf5MUr2aaAt4cc6y488qm2nHO8rcg4UpgqIPTKMhrBlnDW
 jc4cSg6z1Q3U8MEgNpW0Uzs/UnIj2H6lmjZ4Xh4xMACFP+30ZMUSaxrWK5ROeF6Um7NQ
 doPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EJzcPpylnKaiFhjUaTGCdHTSB4HDtxk1bXFCHW9lZ18=;
 b=QoUs9H4jEpDyzSdeyfmiYZU/On2BEn1kKG8UOzciJW0qtexqSTXXXvx3JZmUAxJxzS
 zD4IM+BzOzPyXnS1QJISC2Zl4NGaRMRaMYSyJD3s8LInLNJpP0iJ1WOUCBH2BR/Q/eKT
 sA/NtwptyLJkRl4a+yyQUU6rfmjgHbVPIi6clkyD+whqncp+Z+nOM+n2kxoo+rQ8rMqD
 IxNVHwWH229KlQepwsH5FnWLqMGZQlz/5AHjIKZmYT/ucDW1dgYTLmkC5C+imbR7a0Rt
 YNXhvbsUCbfgI8nRaQpwgpbS1HKPjrate2zuENn7Mb1BrLtsAWbIkaFhf5lSi0Qb79Jt
 4r0A==
X-Gm-Message-State: AOAM532wR0AUR1A2vXWU+7+LBLc/6KNakxnfiRJTu1ExQUwCaA9q4URi
 sYBUOUMhkYdN8pLaHFokHobhww==
X-Google-Smtp-Source: ABdhPJzIkRam6r3ZhdelkPNNTAZ2SBJCyzMf1RRdtAFLV12V8gU3HTlsHA6xTT5vGOz0RyAzFzXEAw==
X-Received: by 2002:a19:848f:: with SMTP id g137mr3929696lfd.622.1607900121382; 
 Sun, 13 Dec 2020 14:55:21 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id q9sm1074545ljm.113.2020.12.13.14.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Dec 2020 14:55:20 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [PATCH] ARM: dts: ux500: Reserve memory carveouts
Date: Sun, 13 Dec 2020 23:55:17 +0100
Message-ID: <20201213225517.3838501-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_175526_201310_610E369F 
X-CRM114-Status: GOOD (  22.29  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>, stable@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201213225517.fidtKNm9F2nsZCT5HxN0AZZo4lxKC9Az2goC2Kp6w9E@z>

The Ux500 platforms have some memory carveouts set aside for
communicating with the modem and for the initial secure software
(ISSW). These areas are protected by the memory controller
and will result in an external abort if accessed like common
read/write memory.

On the legacy boot loaders, these were set aside by using
cmdline arguments such as this:

  mem=96M@0 mem_mtrace=15M@96M mem_mshared=1M@111M
  mem_modem=16M@112M mali.mali_mem=32M@128M mem=96M@160M
  hwmem=127M@256M mem_issw=1M@383M mem_ram_console=1M@384M
  mem=638M@385M

Reserve the relevant areas in the device tree instead. The
"mali", "hwmem", "mem_ram_console" and the trailing 1MB at the
end of the memory reservations in the list are not relevant for
the upstream kernel as these are nowadays replaced with
upstream technologies such as CMA. The modem and ISSW
reservations are necessary.

This was manifested in a bug that surfaced in response to
commit 7fef431be9c9 ("mm/page_alloc: place pages to tail in __free_pages_core()")
which changes the behaviour of memory allocations
in such a way that the platform will sooner run into these
dangerous areas, with "Unhandled fault: imprecise external
abort (0xc06) at 0xb6fd83dc" or similar: the real reason
turns out to be that the PTE is pointing right into one of
the reserved memory areas. We were just lucky until now.

We need to augment the DB8500 and DB8520 SoCs similarly
and also create a new include for the DB9500 used in the
Snowball since this does not have a modem and thus does
not need the modem memory reservation, albeit it needs
the ISSW reservation.

Cc: stable@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC folks: please apply this directly for fixes.

David: just FYI if you run into more of these type of
regressions. Actually the patch is unintentionally good
at smoking out other bugs :D
---
 arch/arm/boot/dts/ste-db8500.dtsi  | 38 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/ste-db8520.dtsi  | 38 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/ste-db9500.dtsi  | 35 +++++++++++++++++++++++++++
 arch/arm/boot/dts/ste-snowball.dts |  2 +-
 4 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/ste-db9500.dtsi

diff --git a/arch/arm/boot/dts/ste-db8500.dtsi b/arch/arm/boot/dts/ste-db8500.dtsi
index d309fad32229..344d29853bf7 100644
--- a/arch/arm/boot/dts/ste-db8500.dtsi
+++ b/arch/arm/boot/dts/ste-db8500.dtsi
@@ -12,4 +12,42 @@ cpu@300 {
 					    200000 0>;
 		};
 	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		/* Modem trace memory */
+		ram@06000000 {
+			reg = <0x06000000 0x00f00000>;
+			no-map;
+		};
+
+		/* Modem shared memory */
+		ram@06f00000 {
+			reg = <0x06f00000 0x00100000>;
+			no-map;
+		};
+
+		/* Modem private memory */
+		ram@07000000 {
+			reg = <0x07000000 0x01000000>;
+			no-map;
+		};
+
+		/*
+		 * Initial Secure Software ISSW memory
+		 *
+		 * This is probably only used if the kernel tries
+		 * to actually call into trustzone to run secure
+		 * applications, which the mainline kernel probably
+		 * will not do on this old chipset. But you can never
+		 * be too careful, so reserve this memory anyway.
+		 */
+		ram@17f00000 {
+			reg = <0x17f00000 0x00100000>;
+			no-map;
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/ste-db8520.dtsi b/arch/arm/boot/dts/ste-db8520.dtsi
index 48bd8728ae27..287804e9e183 100644
--- a/arch/arm/boot/dts/ste-db8520.dtsi
+++ b/arch/arm/boot/dts/ste-db8520.dtsi
@@ -12,4 +12,42 @@ cpu@300 {
 					    200000 0>;
 		};
 	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		/* Modem trace memory */
+		ram@06000000 {
+			reg = <0x06000000 0x00f00000>;
+			no-map;
+		};
+
+		/* Modem shared memory */
+		ram@06f00000 {
+			reg = <0x06f00000 0x00100000>;
+			no-map;
+		};
+
+		/* Modem private memory */
+		ram@07000000 {
+			reg = <0x07000000 0x01000000>;
+			no-map;
+		};
+
+		/*
+		 * Initial Secure Software ISSW memory
+		 *
+		 * This is probably only used if the kernel tries
+		 * to actually call into trustzone to run secure
+		 * applications, which the mainline kernel probably
+		 * will not do on this old chipset. But you can never
+		 * be too careful, so reserve this memory anyway.
+		 */
+		ram@17f00000 {
+			reg = <0x17f00000 0x00100000>;
+			no-map;
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/ste-db9500.dtsi b/arch/arm/boot/dts/ste-db9500.dtsi
new file mode 100644
index 000000000000..0afff703191c
--- /dev/null
+++ b/arch/arm/boot/dts/ste-db9500.dtsi
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include "ste-dbx5x0.dtsi"
+
+/ {
+	cpus {
+		cpu@300 {
+			/* cpufreq controls */
+			operating-points = <1152000 0
+					    800000 0
+					    400000 0
+					    200000 0>;
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		/*
+		 * Initial Secure Software ISSW memory
+		 *
+		 * This is probably only used if the kernel tries
+		 * to actually call into trustzone to run secure
+		 * applications, which the mainline kernel probably
+		 * will not do on this old chipset. But you can never
+		 * be too careful, so reserve this memory anyway.
+		 */
+		ram@17f00000 {
+			reg = <0x17f00000 0x00100000>;
+			no-map;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/ste-snowball.dts b/arch/arm/boot/dts/ste-snowball.dts
index be90e73c923e..27d8a07718a0 100644
--- a/arch/arm/boot/dts/ste-snowball.dts
+++ b/arch/arm/boot/dts/ste-snowball.dts
@@ -4,7 +4,7 @@
  */
 
 /dts-v1/;
-#include "ste-db8500.dtsi"
+#include "ste-db9500.dtsi"
 #include "ste-href-ab8500.dtsi"
 #include "ste-href-family-pinctrl.dtsi"
 
-- 
2.26.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
