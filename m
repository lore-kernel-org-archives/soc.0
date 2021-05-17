Return-Path: <SRS0=iJAY=KM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B63DC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 May 2021 19:34:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CB1361263
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 May 2021 19:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CB1361263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/pb90EmV2iMNIYI6W1BVfQSXI3qBr+w4ZozsMHP0jn0=; b=S5aRulbO2yu6mSVmYxW8JIrAp
	hQ3uMifrzXbeXOW/fYWkhWjFULBVh66S9q6G0+2qbZ+XRx5uQNeydqapxQNZr2uPVqvZRZXMH2i66
	eS3UzcOHkqfeYbDzGIMSVwQmZOPN4NQBJeOBPhiMszY80NCxUo1p70taFVlqUwHSFNNZpggMgkzKt
	GvzIVqDVWuCTVIF4FZJejrd4bzONcOIVX0BnaXM+H8cFBZtMI20viDr+F3HVJn/lfYitow/25Zxgw
	jkCUyaKkO/ESBq9DFUsMhfZ1QWVZDRQmNKNB7TrH0xOyAsJmFYyKlO4lcDIpHegNDq87IUWPfmSTO
	wtbmsRRDQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liiyj-00Fws2-Sl; Mon, 17 May 2021 19:32:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liiyU-00Fwr6-No
 for linux-arm-kernel@desiato.infradead.org; Mon, 17 May 2021 19:32:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=L8WTjWPmIl+NDRjCmABsKVn9l03ziqgB8V0IbKFuAe8=; b=GMzUNXSJYvIbea+5xGM2u53Nvr
 K1WA1bdKuvRryDgVufon2ALttIdHM8l3iG799P7RzbRfzBGQhBn9ojeh7C70/AHbj5E8W2DZF/0yC
 /m+baHSt25siXasS2MNvvUrf4WpQOmW13f2yxZBO1ftNrmLCWJDOLlY+nZ0QCPeIwhwTa9Orpi9Gz
 3j+Jb88HMncTsb87Iqlk/GLq4B6UauZtiqaN/TVfx+oOjtcLxVv0t4uoVWp1ZqCbAsLmeujDB4x+W
 oDtKJFNNlsdrLlJ18WnjWozb0Gv17G0zvc2FRyk2oMUNAj1inYh21nQNcJFgMfvF81oAUZbURA26x
 u37XdSMQ==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liiyR-00E5mv-R1
 for linux-arm-kernel@lists.infradead.org; Mon, 17 May 2021 19:32:21 +0000
Received: by mail-wr1-x42f.google.com with SMTP id j14so5880129wrq.5
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 17 May 2021 12:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L8WTjWPmIl+NDRjCmABsKVn9l03ziqgB8V0IbKFuAe8=;
 b=aHD6a8IdVjOg0h8WRgNOByK07H0QAQ4/UU76vtJetpUiQI0uTzqBWSA+aUXa8IzbD3
 WVWXUrzA14bH2vQW+g6L7y3wLcY8BJwcnXStZbNfB8b3xGLAKXRFwMEcbHO7OKP6CRAp
 /XX2p4EC1cl1uZWnF/nmJKrmDaJDpiRYslPZ0PObUl53wQPmh1GLaK6wxVaFX/+3H1a7
 sPcwGqYazDaXq7Shh7WFdm94Me8lThY8yPoTRqgN6J7WTz6B73Vdz1cDyOBeW+po/JeP
 Tp7o1M1FmC+jGt0qRNgRok1ollox6tQZL7zsY3V7p2u8eOQ5jN4OinfScYXD5eHP1fiF
 MEug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L8WTjWPmIl+NDRjCmABsKVn9l03ziqgB8V0IbKFuAe8=;
 b=q9a7pKkNO17M05U9NO9Lb5xsIJJxhJ+yyOyzynSQZN+iIgtsTPlKkEjC0Z/2xSYUmh
 L+DddvlLEjBXiGSb6Au64H9IdeOWwZ2S7NGbI7q2hxm6qBu944+AtSLalkwHYEsqGt7z
 Zv8obzdJsUANWnMcDDvD0uPGYVDfMgGvXHHHFTXD4WJjD4tGKQOqjRKoMNxAjKLaQFZD
 56NoEbdYGFvsyNWRvVMrzNYpiyAc+A0Nk0FSr6CW4DCDkf2A69qt/6y/BGb9yQCBqv6Z
 v9SFH47p2BhlqTjqRoSfkuC3XVWrPo0hiMHw5+3WhiYW0f//qc4ANnukrOT4yRLXtpTf
 S+2w==
X-Gm-Message-State: AOAM532LPAgXBry8Bp9vMB4dSG/0E451Mpmj30ryt+ZyUIiq0dDkAMA6
 FmPIbarpdfMlVHtoRBPI2m6Qtw==
X-Google-Smtp-Source: ABdhPJw3CybUk4/0huZ1HOTg4nECJ87UHqLkIlNugxHB4p9+DNz+ufghReTZPLPr1/GLbP2eVN6sgA==
X-Received: by 2002:adf:f58e:: with SMTP id f14mr1545053wro.258.1621279937843; 
 Mon, 17 May 2021 12:32:17 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id e10sm18928907wrw.20.2021.05.17.12.32.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 12:32:17 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, linus.walleij@linaro.org, olof@lixom.net,
 robh+dt@kernel.org, soc@kernel.org, ulli.kroll@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 1/5] ARM: dts: gemini: add labels for USB, IDE,
 flash and ethernet
Date: Mon, 17 May 2021 19:32:01 +0000
Message-ID: <20210517193205.691147-2-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517193205.691147-1-clabbe@baylibre.com>
References: <20210517193205.691147-1-clabbe@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_123219_892783_9CD2FDCC 
X-CRM114-Status: GOOD (  11.84  )
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
Message-ID: <20210517193201.J7N2s-NsrhH-cVeE5VyT6ni-J-i8few8JEC918c6bRg@z>

Adding label will help simplify boards's dts.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm/boot/dts/gemini.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/gemini.dtsi b/arch/arm/boot/dts/gemini.dtsi
index 065ed10a79fa..6e043869d495 100644
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
@@ -321,7 +321,7 @@ pci_intc: interrupt-controller {
 			};
 		};
 
-		ethernet@60000000 {
+		ethernet: ethernet@60000000 {
 			compatible = "cortina,gemini-ethernet";
 			reg = <0x60000000 0x4000>, /* Global registers, queue */
 			      <0x60004000 0x2000>, /* V-bit */
@@ -356,7 +356,7 @@ gmac1: ethernet-port@1 {
 			};
 		};
 
-		ide@63000000 {
+		ide0: ide@63000000 {
 			compatible = "cortina,gemini-pata", "faraday,ftide010";
 			reg = <0x63000000 0x1000>;
 			interrupts = <4 IRQ_TYPE_EDGE_RISING>;
@@ -369,7 +369,7 @@ ide@63000000 {
 			#size-cells = <0>;
 		};
 
-		ide@63400000 {
+		ide1: ide@63400000 {
 			compatible = "cortina,gemini-pata", "faraday,ftide010";
 			reg = <0x63400000 0x1000>;
 			interrupts = <5 IRQ_TYPE_EDGE_RISING>;
@@ -414,7 +414,7 @@ display-controller@6a000000 {
 			status = "disabled";
 		};
 
-		usb@68000000 {
+		usb0: usb@68000000 {
 			compatible = "cortina,gemini-usb", "faraday,fotg210";
 			reg = <0x68000000 0x1000>;
 			interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
@@ -435,7 +435,7 @@ usb@68000000 {
 			status = "disabled";
 		};
 
-		usb@69000000 {
+		usb1: usb@69000000 {
 			compatible = "cortina,gemini-usb", "faraday,fotg210";
 			reg = <0x69000000 0x1000>;
 			interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.26.3


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
