Return-Path: <SRS0=Gxsf=LU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E532C2B9F4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jun 2021 00:04:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D96161419
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Jun 2021 00:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D96161419
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xy8G2xk3+A2zLEZofevRbGSIfuBQ4ulAJYVMgF4xeO0=; b=n+/jMt26le5wfJ
	Ks7XDwqVIbBfj6xgvI1tLp7DVMadd3i9KIoCbq3JbrxKOfmlgnx/R1iRDbwUlQKPne1fgUv2KUpM4
	A1bZoEmmqvvek19l/AiKz/jQtOqIwAl1MkHbD0msfaFs1gKFLB/vCKrM6m8ppGb/mtC8GxdDBGLyl
	Ua13fkUWfR3q1zBTdCZgI11TVWHDWUgIlCG1zJRUOVGsPwDsVAWdsatbJuIlbbEvKsGRIhtNn8hX8
	xPqPGCRzxPpqxRR+dP3vdIW6f7tRNgKD1CDHvEZ3Fv1/zzqSE9epfhcA4A9gUTOPMCQ1DjAPYjD2q
	VL55HlH6STYsUc1Bx+Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwvmy-00367V-Im; Sat, 26 Jun 2021 00:03:12 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwvmu-00366z-NJ
 for linux-arm-kernel@lists.infradead.org; Sat, 26 Jun 2021 00:03:10 +0000
Received: by mail-lj1-x233.google.com with SMTP id a16so14840341ljq.3
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 25 Jun 2021 17:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C8VCDOCsJp5v3WN/LczjJScbfeU3b8TszUN1GnD1HtY=;
 b=Px74mKweRheGBA71uxntsZCq97iWLryT3coXwH3dglUKvsTRWz3LeRTSXf6W6JrMNb
 sMB4xTtk2P9bB6pbLej3SU8mZQKzitaWSJT5VVH/0zVeqNai9Q6S6TvhaDDUOfdSBFOD
 DW9JecD9dnRh1fjHxm1ze0lZEmifQ2ZmmoweHYqE+VQaoc1LNG8UORcL5+FdQBr9NKTa
 4xaOHYGuIP6u2x98yRtDuEInEMA94I83++gwHaG/IfOcyzWGQYs8WGwuU6BINI8jSjj4
 YvUWiA7R/yA5Dd6H+gpE/t+ebK0M0NdT0Sv4OAXoPGMT1VKC586hTAhSGUzP4YVfDCbg
 JPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C8VCDOCsJp5v3WN/LczjJScbfeU3b8TszUN1GnD1HtY=;
 b=A0Ii4NOObV9iZTsPzk+CuVNXr+8ebpnzX9lPkkNo/FurZzLGLS9MGVOzr5OEz7HZ5k
 eMqVSuMKVZOdsIjV26yMb6lj7DloKeULiWljogUVNflY9kcd2Var/HPcxgBotL74HfnO
 dNk6vEayQS6KP2j79PfgNCITEoEnt4PMVyh8MSLdOaR+ClLFSQ1NPSj39jq5Pb5IclRg
 wDGrn+paHpbLJwvRxhdHDE7sjoVj2x8zNqSL2gA9uf1aRN0EZTSkxYY2Zd4Y+Az0c8hY
 r68m1F0hP8FifuQp1+0JI2hK+7/bVrQqGqYWbOUyecaoHRWZNiU3l/OKQgjWd/+J30an
 Kp0w==
X-Gm-Message-State: AOAM533ilBMtijdUIJQ+m+PUmqusXLxSNa4Sr/X8zEKtD17U8XS8bknu
 Fz7N78y7yO7t6u6bN9FW374a6w==
X-Google-Smtp-Source: ABdhPJxwaX78Q1dhz57xYl1fh9eay+XLIGFG2USM9MniTT4k98meA/cmjrAxyjseWpVvSNYRiztlsA==
X-Received: by 2002:a05:651c:1ab:: with SMTP id
 c11mr9942848ljn.396.1624665787114; 
 Fri, 25 Jun 2021 17:03:07 -0700 (PDT)
Received: from localhost.localdomain
 (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
 by smtp.gmail.com with ESMTPSA id w17sm634325lft.285.2021.06.25.17.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 17:03:06 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Sudeep Holla <sudeep.holla@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: dts: nomadik: Fix up interrupt controller node names
Date: Sat, 26 Jun 2021 02:01:03 +0200
Message-ID: <20210626000103.830184-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_170308_812487_FEDA3C09 
X-CRM114-Status: GOOD (  11.14  )
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
Message-ID: <20210626000103.NaCXcT2CDcl9QPVgOHaJki5hNf6CAGVQIE69cyWPRvU@z>

From: Sudeep Holla <sudeep.holla@arm.com>

Once the new schema interrupt-controller/arm,vic.yaml is added, we get
the below warnings:

	arch/arm/boot/dts/ste-nomadik-nhk15.dt.yaml:
	intc@10140000: $nodename:0: 'intc@10140000' does not match
	'^interrupt-controller(@[0-9a-f,]+)*$'

Fix the node names for the interrupt controller to conform
to the standard node name interrupt-controller@..

Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
Link: https://lore.kernel.org/r/20210617210825.3064367-2-sudeep.holla@arm.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Hi SoC people, please apply this directly for DTS fixes, I have
no other Nomadik DTS changes queued right now.
---
 arch/arm/boot/dts/ste-nomadik-stn8815.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi b/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi
index c9b906432341..1815361fe73c 100644
--- a/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi
+++ b/arch/arm/boot/dts/ste-nomadik-stn8815.dtsi
@@ -755,14 +755,14 @@ clcd@10120000 {
 			status = "disabled";
 		};
 
-		vica: intc@10140000 {
+		vica: interrupt-controller@10140000 {
 			compatible = "arm,versatile-vic";
 			interrupt-controller;
 			#interrupt-cells = <1>;
 			reg = <0x10140000 0x20>;
 		};
 
-		vicb: intc@10140020 {
+		vicb: interrupt-controller@10140020 {
 			compatible = "arm,versatile-vic";
 			interrupt-controller;
 			#interrupt-cells = <1>;
-- 
2.31.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
