Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72BBFC64E90
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 13:45:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E953620770
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 13:45:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZKb0VOJK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="mrbeoE9E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E953620770
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=86eU8EAAR4W8YBkmQuY1FCIrPooL7Nnk7+5NENM5vKI=; b=ZKb0VOJK9PIeqe8gwxwQwvcHn
	rY9TLlH2ayJwLv6PXAdxzYD1aFfam5LEh0WakWLbfP7fsrwqLk7C5nkTHtsZVQO3s9l9T8alc9/0H
	tZVjdcNcHmizgFb7ODmtRcp6NVmJxwstT+BQKm0DZxtsx8UxlsJ7Mr4i2VRm6G9jy+L3bzf12XsJV
	rFxAFdeGYFgQjDVZOvg0PcMNMNA9qXjnQI1SICdtmv3E773MHLpwHdoJ2xPRJmoPuNcm7efz9uLU8
	i+on51gwupcyTAjHF8QNAECjyysQrTzkuXFW1JdwSKyvl5iKGaFE2xoXOjaRVyYzOwC5mSPQD+d/m
	/b6sHikMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk5wd-0006y9-Cs; Tue, 01 Dec 2020 13:43:51 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk5wZ-0006w1-Fq
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 13:43:49 +0000
Received: by mail-pg1-x532.google.com with SMTP id t37so1213829pga.7
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 01 Dec 2020 05:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=plvQeaUD9wIIwbJapMgxHoz9Nu1G0OxoMzRow/yYT1o=;
 b=mrbeoE9Eh+XfdYw5G5mGNFmFb6DualPxipg3j34VULsY5vvlx0f86/9u7So6M5fPcK
 Ah0c4EN/OHfQqaHSrJ+93s7QOmADJNuZX4X5XDU18uSXKQBf7AmCsaQNx4C3d519+0MB
 Ybu/T+58N1UvvhXJ6BdtanFw3QUy4wJSvIlFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=plvQeaUD9wIIwbJapMgxHoz9Nu1G0OxoMzRow/yYT1o=;
 b=F+8zfh4U9pGnfLZRR24JJSFsbzJUN8Ki2uq+RoniBOqahX16cSn6IDr24t9Q3CDP5k
 vBePK7g2H983jtd0FRBYahVL1/s9f01+g0VazTI/FS0XYpj3j0//ylqxLlTp+TabVbuS
 QlhiWdiGEnql3EcdN66xT6NeODWlu+qJWNjpIhuOB8SKWltvu0yEhTeuBwFPM101D5hq
 SJnPqmrISqcpdo4g8Z2MKC2Twy2MLcVrDC+40qEeqO5AR22aasUirQuNemB32uUW1RbU
 HdH5/hOsWsBZ5bwXiWOvHLg8xzl4zY4yO/rrkhxAUDQxL54cOadoEr9rC/bvDE2oUAnP
 99Mw==
X-Gm-Message-State: AOAM5332ood8cJChWBdDd2dhPRVbMov1as+QdwhbG9N+EFWnyRgShUkG
 /+ktf4/4PpEJ6J6QSZXWpjkC8w==
X-Google-Smtp-Source: ABdhPJzxeEuwbvL+1kRV6+uUT7mx09UASek8f5bclJNvTywXMbmSqEQERWDw7AskMIvw+oaxcr+v9g==
X-Received: by 2002:aa7:96ca:0:b029:19a:8ccd:895 with SMTP id
 h10-20020aa796ca0000b029019a8ccd0895mr2498359pfq.61.1606830220296; 
 Tue, 01 Dec 2020 05:43:40 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp.
 [118.13.124.123])
 by smtp.googlemail.com with ESMTPSA id g14sm2839248pji.32.2020.12.01.05.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 05:43:39 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 01/10] dt-bindings: mstar: Add binding details for mstar,
 smpctrl
Date: Tue,  1 Dec 2020 22:43:21 +0900
Message-ID: <20201201134330.3037007-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201134330.3037007-1-daniel@0x0f.com>
References: <20201201134330.3037007-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_084347_555521_EBE55228 
X-CRM114-Status: GOOD (  15.43  )
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
Cc: robh@kernel.org, arnd@arndb.de, daniel@0x0f.com,
 linux-kernel@vger.kernel.org, olof@lixom.net, w@1wt.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201201134321.Pa9mvBNDQ2b3i8B33NU0uUajeMhTITEDCGcd78dWcMc@z>

This adds a YAML description of the smpctrl node needed by the
platform code for the MStar/SigmaStar Armv7 SoCs to boot secondary cpus.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../bindings/arm/mstar/mstar,smpctrl.yaml     | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mstar/mstar,smpctrl.yaml

diff --git a/Documentation/devicetree/bindings/arm/mstar/mstar,smpctrl.yaml b/Documentation/devicetree/bindings/arm/mstar/mstar,smpctrl.yaml
new file mode 100644
index 000000000000..599c65980f5d
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/mstar/mstar,smpctrl.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2020 thingy.jp.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/arm/mstar/mstar,smpctrl.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: MStar/SigmaStar Armv7 SoC SMP control registers
+
+maintainers:
+  - Daniel Palmer <daniel@thingy.jp>
+
+description: |
+  MStar/SigmaStar's Armv7 SoCs that have more than one processor
+  have a region of registers that allow setting the boot address
+  and a magic number that allows secondary processors to leave
+  the loop they are parked in by the boot ROM.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - sstar,ssd201-smpctrl # SSD201/SSD202D
+      - const: mstar,smpctrl
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    smpctrl@204000 {
+        compatible = "sstar,ssd201-smpctrl", "mstar,smpctrl";
+        reg = <0x204000 0x200>;
+    };
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
