Return-Path: <SRS0=cQz6=H7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB82C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Mar 2021 12:37:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9491364E5C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Mar 2021 12:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9491364E5C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AytUgY6TUni4kS37KtaqGFGIdSo6LrmVxSQxPiXnv88=; b=lEMPkMpOFr1FBRDkQ9pY9cdbM
	2OdGdUpfRdCYAKSz8hQKVXvWiBzlJ1N4VCyp8O4vuB8gueMx8p56TcdMhIf5Uqn1NKaIcNgC/qlI3
	saU0ss4FJMSzK2fW429mdQ6eICaAvLdM1r9R31AsZ1b7lzVkRQbgApG2QBbGvZmtYipgE2hCVShvo
	AQW1Pc784qOjLJfNTGNBSgzow7flwJKxxUPMiafprXjQqiNv7vWD3eCYtcci6hFSuIDy065+qoFSS
	1UVECOBkACG9unA0KDW5cr/Q8+11EDrhxl6YB5Gd5qevWxb7K9rZaPWQq4of4fZRr24e7V4B8Nau8
	2xjCjZ32Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGhmk-0004Lg-LM; Mon, 01 Mar 2021 12:36:26 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGhmg-0004K4-NV
 for linux-arm-kernel@lists.infradead.org; Mon, 01 Mar 2021 12:36:23 +0000
Received: by mail-pf1-x42e.google.com with SMTP id 192so4407467pfv.0
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 01 Mar 2021 04:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+k4h3DmLpBdKDskL9GZ/5TFWOILyp4Yu88KprHaLQKE=;
 b=LXsgkHRudMusscZhb8tcXfF/UOSbdaiDWcQYPsD1X4Wq3fGQFyFSTcgYFNAa8NLPNq
 tTbnNz9qHrGUsGM9wVQ39viWKoq/ILyVTBh1LVGv/DhNUk/eOQCioNlhOHSm5JbM0DYN
 eANJzwaDFbvAKU1QILsouWS76VWxkq1hclLwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+k4h3DmLpBdKDskL9GZ/5TFWOILyp4Yu88KprHaLQKE=;
 b=MIVZNnE5/QiP6/Khdxp42ts9SM5twuxj7kesWnizVf2R5omnnHaEy9q5C9A/GlW/ta
 bROJuZHMzldy88tkKcVib08w5IVQmb+R4k+4eXeU+xubDBJmVHF8rmJ9yX2AIrbQxKPE
 ZighTEdCD8K4qUqubdrvPPZA6xjvZOaQOLB8L6fLB0WaXJPQJMUcQpSad0pk9dViisNP
 4hOydsPsqFx0kVSZ6vwBy7ilVHPuKm/Lb5CHGGnBIWPgX4VmhAjrByHH+h86Fxc+43W/
 ixYsYGY+y6Sl0bcqeKL12ieRONxdS+vzNAyBPAq8cLZlcr6//sXlfFJ++bl4fs1AgUC5
 1b9g==
X-Gm-Message-State: AOAM531+5eUPomxhwtLEPxFTH4Mlwz0fkvEMcj7tCdf9ltvCxPfTn1p6
 T8Yqbzxci1f9shUe53GZieagBQ==
X-Google-Smtp-Source: ABdhPJwTEPhmbXdM73IRV4qErcw1tHV6jN+BJBRpELMoKnNa4BLKg/pydkhpYosYCFC+tEFU67mx0g==
X-Received: by 2002:a63:c1d:: with SMTP id b29mr13749890pgl.9.1614602180117;
 Mon, 01 Mar 2021 04:36:20 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp.
 [124.98.97.188])
 by smtp.googlemail.com with ESMTPSA id 8sm18130928pfp.171.2021.03.01.04.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 04:36:19 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [PATCH 2/3] ARM: mstar: Add the external clocks to the base dsti
Date: Mon,  1 Mar 2021 21:35:41 +0900
Message-ID: <20210301123542.2800643-3-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210301123542.2800643-1-daniel@0x0f.com>
References: <20210301123542.2800643-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_073622_807724_108A4E10 
X-CRM114-Status: GOOD (  14.44  )
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
Cc: arnd@kernel.org, Daniel Palmer <daniel@0x0f.com>,
 linux-kernel@vger.kernel.org, olof@lixom.net, w@1wt.eu,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210301123541.bD15ViqRttxXQllkJn_FowiQStvQjciZgA0bmRAbY9g@z>

All of the currently known MStar/SigmaStar ARMv7 SoCs have an "xtal"
clock input that is usually 24MHz and an "RTC xtal" that is usually 32KHz.

The xtal input has to be connected to something so it's enabled by default.

The MSC313 and MSC313E do not bring the RTC clock input out to the pins
so it's impossible to connect it. The SSC8336 does bring the input
out to the pins but it's not always actually connected to something.

The RTC node needs to always be present because in the future the nodes
for the clock muxes will refer to it even if it's not usable.

The RTC node is disabled by default and should be enabled at the board
level if the RTC input is wired up.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-v7.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index b0a21b0b731f..889c3804c251 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -46,6 +46,21 @@ pmu: pmu {
 		interrupt-affinity = <&cpu0>;
 	};
 
+	clocks: clocks {
+		xtal: xtal {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <24000000>;
+		};
+
+		rtc_xtal: rtc_xtal {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <32768>;
+			status = "disabled";
+		};
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.30.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
