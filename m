Return-Path: <SRS0=HLeY=M5=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDD6C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Aug 2021 20:47:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFDE66105A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Aug 2021 20:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EFDE66105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rn6mF2J2O+NruYx6+xj7GfZeiXBR5fR2wull7LXGzBU=; b=gTsUt0qfm2r0la
	k0ZSXGIyS0P1pszGFF9EY6IanjKS+2RgBkPD8t+YsyYWPWVS1EuOYOKePGnMKqR5zNTf3pXTqBb/f
	NB3MIFUEPA1k24re+fgC63FRyEZkyE60PFYgfxhKHlss8kqfJkoJit0caA8zVvg9dINxagh+x9kEC
	mMLve+wdA8/pebVGj5jTq4wMZIfxv2O2+GWfg8/q7hlGd1Uj1HMqLAPEVbh4cY6DuP5lCaCkVIHXo
	AhbCpsssiaMw2aMKJ73GLmcfXmsu+vYUgytl3vdno8BXC2r267mMVsMuLgc7fN8HC5mTEUmFLNhpY
	WCd65FOmY05HZGF2rATg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC6iY-00DWm6-80; Fri, 06 Aug 2021 20:45:22 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC6iS-00DWkP-I5
 for linux-arm-kernel@lists.infradead.org; Fri, 06 Aug 2021 20:45:17 +0000
Received: by mail-wr1-x42d.google.com with SMTP id q11so434642wrr.9
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 06 Aug 2021 13:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
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
 b=b/vu6eyCuyEjYM+eL+qZ3PRRbuDGghLRNQ6bPj5/pWDrL5LmxExpkR4qieJ8SSQtif
 IpubY/kGcvapYkVGcORicvB9BJNC70uh12N4c9CQdYNWvcpUPajqcH6gflYMfUOzu4NZ
 6VQyZpTLO7/r2nE8WDu8AgDBm2UlG9+LfOy15+rqTnh27wu/7eRJqbtjKemjunRvHHRf
 IDepSB9yGUVdfr0usjCNmhsyqhGLOtesoMDAHE7dEH6leI3mJqHIOl1JLrYWEG7I9pTr
 oX94ojodEebaJSTb3iu6s1ulnVaBjFD1mYrp0AQlkiMWr0cAP1Lq4I+47ojohkiqQQY4
 sOYA==
X-Gm-Message-State: AOAM530UenuZXTVBF1wgcPUdc3Jc+K9PjsSIW8HHHkOc+P/Fl6L4flgV
 cwcubeaxP4VgvRO04Tgcu1lQqOgR7Pw=
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
 Matthew Hagan <mnhagan88@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/5] ARM: dts: NSP: Add Ax stepping modifications
Date: Fri,  6 Aug 2021 21:44:33 +0100
Message-ID: <20210806204446.2981299-3-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210806204446.2981299-1-mnhagan88@gmail.com>
References: <20210806204446.2981299-1-mnhagan88@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_134516_647135_EE5B16F7 
X-CRM114-Status: GOOD (  14.48  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210806204433.xxmNZPTm6YHFVmGszUdHRCL7S7L9gzdJFzhmk5mwWi8@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
