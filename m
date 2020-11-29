Return-Path: <SRS0=TN87=FD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89CFAC83012
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Nov 2020 11:09:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A64D2080C
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Nov 2020 11:09:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C57/MB/X";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="Ty9oCilm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A64D2080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=phVrTBY58GoCZVptJ7sDvmnzibFDEiKe3iKCSbzF60I=; b=C57/MB/XmgSDXSuwpoZHNwgr3
	BaHtxap1W0lKtTQqGTH7DfJWdMCt18oOjrusAwT5WlfAUXrezEaUAVWEJ5XnOF8O6s5GmT3euRCp6
	tLlPhuyJ1CP2OC6WIPrOZmaNUVv+Yj3hvFYpRWyaZVz6gKLoblt+6jrCgcodVSdR2aU+vWoTP4Ai9
	KMyUSTTTSv8+Bia6ZivRRkIlY+E7gjCY7qMPuqOigFJzRdsQ1SS+0oWTINdLybh/8iHk5J8HF/omd
	ReUZGrwzJKr+IJIza5mB6aoaeN9o66MUXMo2K39FCZnFuQ0EXfwLLmomusof2Ehjyuk5qjYO/5aSV
	gJTyVjSKg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjKZQ-0006Hj-87; Sun, 29 Nov 2020 11:08:44 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjKZ8-0006E4-Lp
 for linux-arm-kernel@lists.infradead.org; Sun, 29 Nov 2020 11:08:27 +0000
Received: by mail-pg1-x543.google.com with SMTP id l17so8075566pgk.1
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 29 Nov 2020 03:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5Rwi6JrG1Bh8jLLcugHVfWoJr8ivQS6AwCC3H82H1b4=;
 b=Ty9oCilmE8NwmSmLvOfYQILMur+rnE1cbwhvpZ43RjMOm2PVKxqz9NZ3eptAmz+/s/
 e3GHuCGcqQdNlb9W7Y4ecVmWqokECnv9IUh9jzNb2jlh7X8VQj0ecIQOGOWItVqOc5M7
 /WHKM9N59j5iYDpspzSSFeGsgp52DzSz4JO60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5Rwi6JrG1Bh8jLLcugHVfWoJr8ivQS6AwCC3H82H1b4=;
 b=srVmHPzD+G3YpH2Ao3AoMJ4sN4OHfJ4lalEu9f5R4tF4frUcjKXEca6A+i+1o++GOl
 SRgSmtQomPucTEjXbhpwTv7BaaB+G9mCfm9uW6NroemTG+YUDcXI8tAR++fWMCOw3bP/
 tYUBtjAKge0NdZEPL2Clt98dXo/TZy7Cf7rXpjnGkeuMNouhE5eka0hwbeMTU3vP2/Pc
 mo9jocifX3LQ8MjpB1Ka52kYwtEUy8IWSw8zM9eV8zu4/owvxdpBxpSZh2Ci5UbeXGpe
 dn18IMlfKE8XVO0cqJnDWTJ3oDZqPciZs6RZB1rUvoRnVKOPBIzWp057YBI1z36XboPZ
 Bl+Q==
X-Gm-Message-State: AOAM530fty1mTQvnvm1GNNQmeEF0d/wop/3KVBYazZfpMW4OpS7VrXvI
 R2peQBTmKiWSTfb0nqaMj3TU7Q==
X-Google-Smtp-Source: ABdhPJwdh85fkMA5+0fVUf32WCOFflhHqyFVX+Xj2BKoue3xfo/ozmIZwkGeQJHKEgE0r9y5ZYHklQ==
X-Received: by 2002:a17:90b:3591:: with SMTP id
 mm17mr20654240pjb.213.1606648104524; 
 Sun, 29 Nov 2020 03:08:24 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp.
 [118.13.124.123])
 by smtp.googlemail.com with ESMTPSA id 21sm13095653pfw.105.2020.11.29.03.08.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 03:08:24 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 4/5] ARM: mstar: Add gpio controller to MStar base dtsi
Date: Sun, 29 Nov 2020 20:08:01 +0900
Message-ID: <20201129110803.2461700-5-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201129110803.2461700-1-daniel@0x0f.com>
References: <20201129110803.2461700-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_060826_796925_6811AB6E 
X-CRM114-Status: GOOD (  13.95  )
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
Cc: devicetree@vger.kernel.org, robh@kernel.org, linus.walleij@linaro.org,
 daniel@0x0f.com, linux-kernel@vger.kernel.org, w@1wt.eu,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201129110801.Le4YoE0RNoM6aEsQK7VN9NF6DFIfXWRs2Ze0vUHJENk@z>

The GPIO controller is at the same address in all of the
currently known chips so create a node for it in the base
dtsi.

Some extra properties are needed to actually use it so
disable it by default.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/mstar-v7.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index f07880561e11..81369bc07f78 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -109,6 +109,16 @@ l3bridge: l3bridge@204400 {
 				reg = <0x204400 0x200>;
 			};
 
+			gpio: gpio@207800 {
+				#gpio-cells = <2>;
+				reg = <0x207800 0x200>;
+				gpio-controller;
+				#interrupt-cells = <2>;
+				interrupt-controller;
+				interrupt-parent = <&intc_fiq>;
+				status = "disabled";
+			};
+
 			pm_uart: uart@221000 {
 				compatible = "ns16550a";
 				reg = <0x221000 0x100>;
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
