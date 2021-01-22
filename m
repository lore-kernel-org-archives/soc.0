Return-Path: <SRS0=HiIx=GZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF961C433E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 22:22:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A8F223A5B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 22:22:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A8F223A5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pn2Ov/+yhmmie5Qu0cwpF7GXk0XDREaLP8iVUaOEblM=; b=G1g04SlwEp+G7DQNyLJdv9HEhZ
	raB4Iy5IIc7QH1G35dGYs4IK2wPkFUTxCwa+svF5X80YrK5+gn6u8c/3VCQK15kG7J2DtKXJQ9qAA
	wop+DmhOaq98h27QWifK0vJeyfaIsX64OTVJEmocj4+/3eB/8IggY9izvSWJCHBiH4lzNNAbuvAPn
	PXFWOoEftIzQIROaJfxKZYyl4tAmCLtNoSN9x6vQ0/XcpTMW3MfvkzDIkmqSArvPVC4Fah3WI+rWI
	5nbZn0ISsx9wmYfmbFWMgQc0Ad5CtKlQAVogK0VM/Z8WpD9csjW1yp9Wz7pVeD+cfwFInlGObVIdW
	YtqyNC2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l34nQ-0008ME-2x; Fri, 22 Jan 2021 22:20:48 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l34nM-0008Lf-LS
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Jan 2021 22:20:46 +0000
Received: by mail-lf1-x130.google.com with SMTP id q12so9646898lfo.12
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 22 Jan 2021 14:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mzdD2rvgz2rkF7RAoopEQMbI2UQa7wjOviG3Tok8iFw=;
 b=ucYyVyShx/jDx0oPODzuGfbJE59Heh81ezC6UTiLm7572Gcb/q3VFfmtf6oKENjV+N
 PMjgPiFd54auX58vJTfCjy7dHazFOvWTtDDUUwn1WoXfL+taAdI0+/6pOuEecxOKOVbb
 O3lEmZrWAtLIXzP/B+mjNax+MD9xJKy6gdBai1RDldcDbZ3KtWPm1hcMQRdVYNxfIbCB
 C6UFd7lJoAbUFOBsNRGY3+bYT9uwCiIULMonivCwDhY+UlEuDvPbvR10mMWBurZeab4B
 VCWkzqmVIud3U5Hf68ENBh3yir2V6vPHuAALeZ/5sg2U9ObPnpCbJMS4X+SJ+izqQEOg
 YhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mzdD2rvgz2rkF7RAoopEQMbI2UQa7wjOviG3Tok8iFw=;
 b=HO1jn4hD6bNOzT1lx1Iq2qoj8QTic2HE0wxaLKJwoO+b5d6OsuCJQrgbSlsYBfM3v+
 bP/CWXNHXmBDoCCxTxi7Hr6yRppaW0BPmzSqrgiU6quPifYBRVWoz6zSYvSuux9pnIra
 Y1y5dxTLH5uBLmE1TFLrzP0hLE8ohd2Zw2/RkhxghG+jWbZ5mp8rLl5KsrN7sYTt+eX0
 eZpY3Xi3AHdRZFweCytLYLJdFFRiXXT99OtTaYxN78FeSaIIU3UxLyoSJyJM5OaAxccc
 O+A50NBziAgln4YubE+/PSspl31xsphNvbFSwz+6ZHPBnPXG62lxsMf6i5Z83IWR9Jh9
 ePPA==
X-Gm-Message-State: AOAM530rOPgEJCFXvHdEb8MV5gbwCmy0z4kbSROjBUUkzhRubxKilxIz
 N5N53gE+zLYnxP84cwU8l0WE5w==
X-Google-Smtp-Source: ABdhPJyNdNwp0kiIi1D/MNlM5uZx8D3FYTuWntI7AetzYxjuK2ukMyRMt85uhZftvTES56KhFu7oXw==
X-Received: by 2002:ac2:5d6c:: with SMTP id h12mr3086777lft.482.1611354041770; 
 Fri, 22 Jan 2021 14:20:41 -0800 (PST)
Received: from localhost.localdomain
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id m26sm1113118ljj.134.2021.01.22.14.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 14:20:41 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Subject: [PATCH] ARM: dts: nomadik: Fix up MMC node names
Date: Fri, 22 Jan 2021 23:20:38 +0100
Message-ID: <20210122222038.2888747-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_172045_227808_E4333069 
X-CRM114-Status: GOOD (  11.55  )
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
Cc: Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210122222038.YD4vn9tLaIG8Yy1izRPS4KJagAVGuceO43euhUSDnYE@z>

Fix the node names for the MMC/SD card controller to conform
to the standard node name mmc@..

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC maintainers: please apply this patch directly for
kernel v5.12, I have no other Nomadik patches queued.
---
 arch/arm/boot/dts/ste-nomadik-nhk15.dts    | 2 +-
 arch/arm/boot/dts/ste-nomadik-s8815.dts    | 2 +-
 arch/arm/boot/dts/ste-nomadik-stn8815.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/ste-nomadik-nhk15.dts b/arch/arm/boot/dts/ste-nomadik-nhk15.dts
index 41ed21a4fdc1..8142c017882c 100644
--- a/arch/arm/boot/dts/ste-nomadik-nhk15.dts
+++ b/arch/arm/boot/dts/ste-nomadik-nhk15.dts
@@ -195,7 +195,7 @@ uart0: uart@101fd000 {
 			pinctrl-0 = <&uart0_nhk_mode>;
 			status = "okay";
 		};
-		mmcsd: sdi@101f6000 {
+		mmcsd: mmc@101f6000 {
 			cd-gpios = <&stmpe_gpio44 7 GPIO_ACTIVE_LOW>;
 			wp-gpios = <&stmpe_gpio44 18 GPIO_ACTIVE_HIGH>;
 		};
diff --git a/arch/arm/boot/dts/ste-nomadik-s8815.dts b/arch/arm/boot/dts/ste-nomadik-s8815.dts
index 4445446fa828..f16314ffbf4b 100644
--- a/arch/arm/boot/dts/ste-nomadik-s8815.dts
+++ b/arch/arm/boot/dts/ste-nomadik-s8815.dts
@@ -139,7 +139,7 @@ uart0: uart@101fd000 {
 			status = "okay";
 		};
 		/* Configure card detect for the uSD slot */
-		mmcsd: sdi@101f6000 {
+		mmc@101f6000 {
 			cd-gpios = <&gpio3 15 GPIO_ACTIVE_LOW>;
 		};
 	};
diff --git a/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi b/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi
index 4f38aeecadb3..c9b906432341 100644
--- a/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi
+++ b/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi
@@ -825,7 +825,7 @@ rtc: rtc@101e8000 {
 			interrupts = <10>;
 		};
 
-		mmcsd: sdi@101f6000 {
+		mmcsd: mmc@101f6000 {
 			compatible = "arm,pl18x", "arm,primecell";
 			reg = <0x101f6000 0x1000>;
 			clocks = <&sdiclk>, <&pclksdi>;
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
