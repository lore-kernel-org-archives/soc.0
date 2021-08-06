Return-Path: <devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E87B5C4338F
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Aug 2021 20:45:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C10CB61181
	for <linux-devicetree@archiver.kernel.org>; Fri,  6 Aug 2021 20:45:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245134AbhHFUpi (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 6 Aug 2021 16:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245103AbhHFUpc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 6 Aug 2021 16:45:32 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C8AEC0613CF;
        Fri,  6 Aug 2021 13:45:16 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id b11so12602887wrx.6;
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
        b=Vhcj859TT6/q35gfuFGnbpsSHWgim8RqCjkuBPyp7XeNsWkYDWEW2o8yxgTbm4JveP
         hkfeHEw4RqIarOGU0PwVGpIWAKLS+22DInusF+/nJDb6+Hr+15jqPz2l+gj95d4P9ELN
         GP+eV+zsboxa9S7W6FX30X4d+6zBciBMQMMpFs7TnotphKBMsSqIZDCbTuu68ZMA3RWO
         zVd7AxexuTtMxHuaOeH9zRkVni9Mk7LnnDSxHvs5fPBzQTds3Ip4d1a2ZiH0XzO7ixgJ
         Kv+mWOmdqEStbsVpY5BpSzQql2TIL6r8y78SYGFIX5DKAmgp56uTz77IFMdgrc8E8dN3
         dUJQ==
X-Gm-Message-State: AOAM531Pg58V4tNN6M2kIrE+cnoyPyq1BO2RhdSI0+TQUl1dwRH2s4di
        MEu9oobqcaJMsGTcMPEe/Io=
X-Google-Smtp-Source: ABdhPJxW1xiYkf/8JnrdaLw6OE+f2420fJdIo6QAZBWmqPXFHAfTrrvcAgQEHgF8qw0sut5BXnl2pw==
X-Received: by 2002:a5d:5750:: with SMTP id q16mr12789808wrw.9.1628282715142;
        Fri, 06 Aug 2021 13:45:15 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
        by smtp.gmail.com with ESMTPSA id p8sm10975815wrn.79.2021.08.06.13.45.14
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 06 Aug 2021 13:45:14 -0700 (PDT)
From:   Matthew Hagan <mnhagan88@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc:     Vladimir Oltean <olteanv@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Matthew Hagan <mnhagan88@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/5] ARM: dts: NSP: Add Ax stepping modifications
Date:   Fri,  6 Aug 2021 21:44:33 +0100
Message-ID: <20210806204446.2981299-3-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210806204446.2981299-1-mnhagan88@gmail.com>
References: <20210806204446.2981299-1-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
Message-ID: <20210806204433.Z9XNeH4crD5Cz33KCwfI48nrf2AkD-NkCtsQPp4-myY@z>

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

