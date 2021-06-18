Return-Path: <SRS0=1/go=LM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B6E0C49361
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 20:57:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A21E60E09
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jun 2021 20:57:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A21E60E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2UFJMywhT1aTtO0CWqz7z7SOeWuRQD+/HhGM6lNgSRI=; b=dK7ryAXKFT7Gmm
	0c5hs+RuBohTbCZdgpP4Ox83fZnjF/CbTQftAe55YKKkZyuXxPF7VpWK1ewWi5v8sAkeuSWJNWRTo
	0DhwBHZcUuDgWAVCfSjEukpQs8hYqZ14OJfGqT1Vbz+rof3cKEoPXkuR8yibBiiD6dJj2WNzoToJh
	RG84l6MnMD4UjK/O78T3qzC3aaa9ig5bt/Ryz7T8a/XmLW3iz13ESfWf/nyEmLvlI+NUY3mEtP+MZ
	o/1Jcc6MCuXQ3IauWPSlYSo8spt5lU4BNYIhlzDF9GZNq2SQFCLB45FM5qTR1OeqBAvD3Qq9ieabu
	T12XJD1qEa7J9DxkI4sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1luLWv-00FVAF-7v; Fri, 18 Jun 2021 20:55:57 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1luLWg-00FV6s-VW
 for linux-arm-kernel@lists.infradead.org; Fri, 18 Jun 2021 20:55:44 +0000
Received: by mail-wr1-x432.google.com with SMTP id c5so12097023wrq.9
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 18 Jun 2021 13:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sTMrkLH33QcTYAmCmYzm6ZHr2W5AOWeg+lqcFyiCyr0=;
 b=O3dGmcXCtw9lYBqWTYYWBPbQzzstHy0LKNyQBUOmq3wzI5TxW0FvlMhvSWqyn64iCg
 RVLmEil0rlpF411jvMMfrn1ZcScnhIqmBUhszkSy21FREulFqltV0pTgeQ3p9SQvJKmR
 cI6JKwuXDqwfnSkZ/Iy4eFHCmW03phedmjxXAgyV+r7ygBmxpy27cEjA1XdHCzoc5/Fj
 XAjBpOVgoCgwzG4ZDKYS+S/6EyMAfw/jvxJHumD+Hea33wxCjDsCgAupd4sUoKfv8qXE
 BhUXMu1ij9xcaCUmHRk1Ygyqup9LZJV9Uxn9mQQ73nA0yKEPTDCg5m1oEkufuuZwTK3K
 HYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sTMrkLH33QcTYAmCmYzm6ZHr2W5AOWeg+lqcFyiCyr0=;
 b=JQKbLYycc7nEKMdbb22XB7N9TYn7r3/BS+v2Kv6tHAtEVk4knAVaeraayPRvvX9scx
 kBxFstDme3SuOOJJjjA74vR702VwtzYKJzjLBiiUaIpmDbWsStfU3BDFcSfBDh+rwWQv
 XaL89PqY0lWBeZCk8E0GGl5lh0a3+4kgSV3Ekbnju6IQh2kfIjNuxOAUuZ+sKMma3dO1
 HufmE/KML0M2hIILy2horAThOG5qMwVk61QiajuTgyXJhcRGh7GipGnK4naeqyvmscCB
 bseGC8qdDM60rxPA8VZVqbJAF3pVX2ee13MpuXWopxDh+hiF0Qen+5IX8VM/NUsj8boQ
 V/lg==
X-Gm-Message-State: AOAM531Ey5iLaglM6+NIKIz4nAfk5j/XAlgnXZWJ2CZM2vyRkRHfHidC
 p/NUdy/NXLOnB3TLym0xZ/f3BA==
X-Google-Smtp-Source: ABdhPJzecFQwRn7K69AaWw6n1KwseQmQ6firgw6Oi59mrVcis9F+GSZhd+3uZB86CVKZ5AW+ggmAhw==
X-Received: by 2002:a5d:698a:: with SMTP id g10mr13319533wru.129.1624049741534; 
 Fri, 18 Jun 2021 13:55:41 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id j12sm9745476wrt.69.2021.06.18.13.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jun 2021 13:55:41 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, linus.walleij@linaro.org, olof@lixom.net,
 robh+dt@kernel.org, soc@kernel.org, ulli.kroll@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 1/5] ARM: dts: gemini: add labels for USB, IDE,
 flash and ethernet
Date: Fri, 18 Jun 2021 20:55:29 +0000
Message-ID: <20210618205533.1527384-2-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618205533.1527384-1-clabbe@baylibre.com>
References: <20210618205533.1527384-1-clabbe@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210618_135543_052878_DC87F668 
X-CRM114-Status: GOOD (  12.24  )
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
Message-ID: <20210618205529.iSz-2CeePNLCtz9Hw4Sk_Ohfj1cR2rXRNxL6_rsbD4k@z>

Adding label will help simplify boards's dts.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm/boot/dts/gemini.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/gemini.dtsi b/arch/arm/boot/dts/gemini.dtsi
index cc053af3c347..9fe0fd93ac9e 100644
--- a/arch/arm/boot/dts/gemini.dtsi
+++ b/arch/arm/boot/dts/gemini.dtsi
@@ -16,7 +16,7 @@ soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&intcon>;
 
-		flash@30000000 {
+		flash: flash@30000000 {
 			compatible = "cortina,gemini-flash", "cfi-flash";
 			syscon = <&syscon>;
 			pinctrl-names = "default";
@@ -322,7 +322,7 @@ pci_intc: interrupt-controller {
 			};
 		};
 
-		ethernet@60000000 {
+		ethernet: ethernet@60000000 {
 			compatible = "cortina,gemini-ethernet";
 			reg = <0x60000000 0x4000>, /* Global registers, queue */
 			      <0x60004000 0x2000>, /* V-bit */
@@ -365,7 +365,7 @@ crypto: crypto@62000000 {
 			clocks = <&syscon GEMINI_CLK_GATE_SECURITY>;
 		};
 
-		ide@63000000 {
+		ide0: ide@63000000 {
 			compatible = "cortina,gemini-pata", "faraday,ftide010";
 			reg = <0x63000000 0x1000>;
 			interrupts = <4 IRQ_TYPE_EDGE_RISING>;
@@ -378,7 +378,7 @@ ide@63000000 {
 			#size-cells = <0>;
 		};
 
-		ide@63400000 {
+		ide1: ide@63400000 {
 			compatible = "cortina,gemini-pata", "faraday,ftide010";
 			reg = <0x63400000 0x1000>;
 			interrupts = <5 IRQ_TYPE_EDGE_RISING>;
@@ -421,7 +421,7 @@ display-controller@6a000000 {
 			status = "disabled";
 		};
 
-		usb@68000000 {
+		usb0: usb@68000000 {
 			compatible = "cortina,gemini-usb", "faraday,fotg210";
 			reg = <0x68000000 0x1000>;
 			interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
@@ -442,7 +442,7 @@ usb@68000000 {
 			status = "disabled";
 		};
 
-		usb@69000000 {
+		usb1: usb@69000000 {
 			compatible = "cortina,gemini-usb", "faraday,fotg210";
 			reg = <0x69000000 0x1000>;
 			interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.31.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
