Return-Path: <SRS0=cQz6=H7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB12C433E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Mar 2021 12:37:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E12664E75
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Mar 2021 12:37:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E12664E75
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fm7lEs8YQuvlWPQKILsEoTH7IQxlaM4WuRqFCB2oE3Q=; b=HQ3kDWN9JoemjjGX48hF1jvae
	WLfrgM3JXxl4UQAnn3a5x6Ih4mOwteVgmzv1WfH0b6n+IZICN9vO2F83ettKDDlc9qCMKjto6TGBo
	V98rrMm12mLtq/46QgWnq3rJxCtL9FP1b2iy7ueg6jsdnKFX2H1jgvs4A00ZoH6BYRxKBq4LsNn/R
	3tlkFmJYxT9VopiBpqD1JO5udW5+8DLkXKtlpZ7YL/mhUFnqw4eXv2kJqqGCgBnsCH6mwQpDuQvmC
	n6hPj2s5d5L4Ra91fxtuKR08H0FOBWJCglneJ4OBAATXxZYIoisOxkkw4buxMTaEYpEQ1kdYzqbTe
	H6ZdTjlWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGhmm-0004Ls-DL; Mon, 01 Mar 2021 12:36:28 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGhmi-0004Kh-JG
 for linux-arm-kernel@lists.infradead.org; Mon, 01 Mar 2021 12:36:25 +0000
Received: by mail-pl1-x62b.google.com with SMTP id z11so2084520plg.10
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 01 Mar 2021 04:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=536xRWNL7jknD9IRPbTVC2QcHZZ+m5eHrkYF4PRPpVs=;
 b=S8bV2V8DbZz51yB79NHw1Qy5wgklnsXO4bpxwk/7Yo8G5e9J+77QaPbiJbTcvc+dlt
 PMWdcbW2I+A1CUoKWv94xaPmPurGfHghp37tKPxyWJYu2jiT1maVOJXVjuit63g2TnO1
 jcPvcbMs/uP1VXjWXhM7ZU/wuUToOBgqCOeM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=536xRWNL7jknD9IRPbTVC2QcHZZ+m5eHrkYF4PRPpVs=;
 b=AYzf+O6UqBlF8toQsYc9Io3ZLIJ+9G7lEXKrSHstv2AfVNH7ognNcSADIMaYna8Kat
 HbaGxsNeiN//Q7Ie/Yd1i52DCgoHjUSMc01ziOnU+zSMLTkHKzJbzjyQUOn70HM6Afox
 f+LvgWgOLbpCbJE3Zk978Nu9QSBOtHI/EAnGgiqH/TsK5sbVexEH2Faby76K+GJlwsZJ
 1pAVVUQFJrwatPgTXQuxhabW579wZon4RbY0/eDdilxcs6kf0VTNmuVkMzdpbKip0D/V
 pMJbItZDpUNW1epyUNdStJL3CAgz7LBmv35t1QALSTc/Npjd51oHCkMZOn2NnMZ77NS1
 h+pA==
X-Gm-Message-State: AOAM530ghscbqovvVMYjXYYcfLcb9GWOd4z/wFukQHNH27huf3rVr+6c
 JvR/z3sg4QHSAfzYTLEmB23QOQ==
X-Google-Smtp-Source: ABdhPJxmG3O7GKhc9qGTw5SpHoWvJ1q6BkDMP4KXQkRz8Z1MS08I62eDj0MAiABHUQcXvEmu/Q8wlQ==
X-Received: by 2002:a17:90a:6c22:: with SMTP id
 x31mr17844508pjj.213.1614602182273; 
 Mon, 01 Mar 2021 04:36:22 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp.
 [124.98.97.188])
 by smtp.googlemail.com with ESMTPSA id 8sm18130928pfp.171.2021.03.01.04.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 04:36:22 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [PATCH 3/3] ARM: mstar: Add mpll to base dtsi
Date: Mon,  1 Mar 2021 21:35:42 +0900
Message-ID: <20210301123542.2800643-4-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210301123542.2800643-1-daniel@0x0f.com>
References: <20210301123542.2800643-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_073624_666551_4978DBFE 
X-CRM114-Status: GOOD (  13.04  )
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
Message-ID: <20210301123542.ajYd008w26CQ2hTbklQC8gfZ6EvlD2LriJq3ZQ50PMM@z>

All of the currently known MStar/SigmaStar ARMv7 SoCs have at least
one MPLL and it seems to always be at the same place so add it to
the base dtsi.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 arch/arm/boot/dts/mstar-v7.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-v7.dtsi b/arch/arm/boot/dts/mstar-v7.dtsi
index 889c3804c251..075d583d6f40 100644
--- a/arch/arm/boot/dts/mstar-v7.dtsi
+++ b/arch/arm/boot/dts/mstar-v7.dtsi
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/mstar-msc313-mpll.h>
 
 / {
 	#address-cells = <1>;
@@ -124,6 +125,13 @@ l3bridge: l3bridge@204400 {
 				reg = <0x204400 0x200>;
 			};
 
+			mpll: mpll@206000 {
+				compatible = "mstar,msc313-mpll";
+				#clock-cells = <1>;
+				reg = <0x206000 0x200>;
+				clocks = <&xtal>;
+			};
+
 			gpio: gpio@207800 {
 				#gpio-cells = <2>;
 				reg = <0x207800 0x200>;
-- 
2.30.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
