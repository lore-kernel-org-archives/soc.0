Return-Path: <SRS0=9VHM=M5=gmail.com=mnhagan88@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDBBC4338F
	for <soc@archiver.kernel.org>; Fri,  6 Aug 2021 20:45:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9E6F161164; Fri,  6 Aug 2021 20:45:16 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7243061181;
	Fri,  6 Aug 2021 20:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7243061181
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id d8so12575859wrm.4;
        Fri, 06 Aug 2021 13:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cwoA/pv3ZUZSHCBa6qfyFr8ICDq30GUiYkbbx1T4wK0=;
        b=daRU8mYgzLPU+f0Hanhym4IViLdED3p+ub6jkJ7JvatPqYjw5h3tl+7GpJPpd2hFuN
         WZqtdTNnqzaGZx0vOxwjIG3H98rEJRTMPsKdbwdKciruk0Qs9ozDa1zY8INaQ0jFgpEC
         ZW6p/gyrajrRV+ELRkJTFjUmoA6+Au8TsHwYtYEe7ZfsOdADgk2itQThgqdk3fEzjpFG
         NwIKWpBBLUQzjAmiUvEaiI2z+uEGk8ucvAIggMQa8unrz5JGB8UE3l6zH5bMgwpWMeDT
         rTnY4sbiFgn2jaOcuZ8ERAXMZTa3CFuQYaD56woNjDIOH4S8RhWkLqfZeaIbrGqmRJ1m
         od7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cwoA/pv3ZUZSHCBa6qfyFr8ICDq30GUiYkbbx1T4wK0=;
        b=MNwMPCccw8fHi1wcFE1M4JwwgMIr11QX/e3drEVjU3Q24UvXWghbTFi2oM91nbs9qg
         mYRTH4WflFnsiJKZDNeH17zyCPLO44+n81uXv57UxE6+iG5bM7RfXo3az3CVjeqf0VA7
         TMPgaGpumt/jSp5mB3zmInra2W+SPPg6eDF2YGj71VzwHnI8JL7O+AO0iah0uLl2ugyb
         MPeNSWwozJuXt214oy1wxKnnUGalKJEjH33Bv2Qp+3Fh2/aduv4+K03zGI1Kx9N8dur6
         Gvg/H9wPp/E3AjeXNk6KMD66HZgpnBtYubm12+Mzey4P4g2jM08SB9/L1Bbhme9GgU4F
         Zntw==
X-Gm-Message-State: AOAM5302AmzUxyDvm3xxI7XN50aLsP7+VmqLwsWvLQa3pQ19/YvOfAo5
	d7Elt7OhHs269vyy4l4+gYkCRuD80fk=
X-Google-Smtp-Source: ABdhPJxW1xiYkf/8JnrdaLw6OE+f2420fJdIo6QAZBWmqPXFHAfTrrvcAgQEHgF8qw0sut5BXnl2pw==
X-Received: by 2002:a5d:5750:: with SMTP id q16mr12789808wrw.9.1628282715142;
        Fri, 06 Aug 2021 13:45:15 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
        by smtp.gmail.com with ESMTPSA id p8sm10975815wrn.79.2021.08.06.13.45.14
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 06 Aug 2021 13:45:14 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Matthew Hagan <mnhagan88@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/5] ARM: dts: NSP: Add Ax stepping modifications
Date: Fri,  6 Aug 2021 21:44:33 +0100
Message-Id: <20210806204446.2981299-3-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210806204446.2981299-1-mnhagan88@gmail.com>
References: <20210806204446.2981299-1-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While uncommon, some Ax NSP SoCs exist in the wild. This stepping
requires a modified secondary CPU boot-reg and removal of DMA coherency
properties. Without these modifications, the secondary CPU will be
inactive and many peripherals will exhibit undefined behaviour.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 arch/arm/boot/dts/bcm-nsp-ax.dtsi | 70 +++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm-nsp-ax.dtsi

diff --git a/arch/arm/boot/dts/bcm-nsp-ax.dtsi b/arch/arm/boot/dts/bcm-nsp-ax.dtsi
new file mode 100644
index 000000000000..a21e275935ce
--- /dev/null
+++ b/arch/arm/boot/dts/bcm-nsp-ax.dtsi
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Broadcom Northstar Plus Ax stepping-specific bindings.
+ * Notable differences from B0+ are the secondary-boot-reg and
+ * lack of DMA coherency.
+ */
+
+&cpu1 {
+	secondary-boot-reg = <0xffff042c>;
+};
+
+&dma {
+	/delete-property/ dma-coherent;
+};
+
+&sdio {
+	/delete-property/ dma-coherent;
+};
+
+&amac0 {
+	/delete-property/ dma-coherent;
+};
+
+&amac1 {
+	/delete-property/ dma-coherent;
+};
+
+&amac2 {
+	/delete-property/ dma-coherent;
+};
+
+&ehci0 {
+	/delete-property/ dma-coherent;
+};
+
+&mailbox {
+	/delete-property/ dma-coherent;
+};
+
+&xhci {
+	/delete-property/ dma-coherent;
+};
+
+&ehci0 {
+	/delete-property/ dma-coherent;
+};
+
+&ohci0 {
+	/delete-property/ dma-coherent;
+};
+
+&i2c0 {
+	/delete-property/ dma-coherent;
+};
+
+&sata {
+	/delete-property/ dma-coherent;
+};
+
+&pcie0 {
+	/delete-property/ dma-coherent;
+};
+
+&pcie1 {
+	/delete-property/ dma-coherent;
+};
+
+&pcie2 {
+	/delete-property/ dma-coherent;
+};
-- 
2.26.3

