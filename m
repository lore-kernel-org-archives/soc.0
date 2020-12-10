Return-Path: <SRS0=rNyZ=FO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9873C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 09:42:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 596D423B70
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 09:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 596D423B70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ErViAPlPhQeZ8u0z8pn6kGDOhfrPm0qZ8M+lNpsKuq0=; b=tXvYtH/Ungij0gfqARXab9cHGB
	GUHKePrh9+r6+044BSiWvU8ySiAbwfZyW/kIh+GVsceeCmDEm8/CTtOgoak6IeWX+stFV5JkliEVv
	CgeDw9dkngCL1z0Em1rCW9z8D5vJWaXec21xLqcAmT1pKY5xi3u8JNjUajfGI7SQVbO9WJS01BZln
	Ug5VeQFtl59mQ9/OT3KNxntKViZvNlNPYpiHr0ImdRtVzgXjEZh4wYQPwkuI3FfrYFBT1YAtT2EOg
	Jinctsg4Thgt3S2iub9OYkc0HyeoHd9jxl72+M/7pDzEtEsysFcIxjbspXApV/r8awEOIG79RYkI+
	1UGrJu3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knIRy-0008MA-Pu; Thu, 10 Dec 2020 09:41:26 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knIRw-0008L1-AL
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Dec 2020 09:41:25 +0000
Received: by mail-pf1-x442.google.com with SMTP id 131so3510845pfb.9
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Dec 2020 01:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JskjQWgfypeIKGWugK6DSL0/UV0J4tau2NvfoPVqu3U=;
 b=q5fsQlVBZMnUMd0KXKLISBawepzq4H3GJXROCStuwBHbp2w+AZcdpn3sMjkIa1WCoR
 fIiKAvEOxOLL69xaPlsswyd8OHRmGIh/Si/YszNWhc8JlhWN181nufkzKpTSM31SuHUp
 sXntDGCLxKVIqIYGQupjBAUUazIqXFlAEKxLzHBGeF8B3dk9HuOmxCGgWcVSgGBlCSL9
 no1h55rMRO51F/lEyMs6G1S2dPsGdjGZfibdirZO4Lc7m/r51nrBLAyvHKYCgyMP7eQh
 ELWg+Ugvl76s1cn+Fp5VBSvpmiqF+4xfgIjAVtAmhzRads2mxHJzzz9OU969wGl+YaGJ
 NXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JskjQWgfypeIKGWugK6DSL0/UV0J4tau2NvfoPVqu3U=;
 b=ZYrQZHccLmNgmCBxlOR9vAtWr+l0zZUyxTZQ5LwJKuLhCr5CWoNAE8NHf2/gZ2lQk+
 QCPI7FeDITBTYbmnsZHokXHcxYSYXva75dxADcVt6Ucju1BxWlzVUD7XxFr+hjhty/ZD
 nkm+ObLGJ835jZntd6VsyzlgqcPDZjMaoJRByjtpRTTI7t4AFPww0jDBmuOWTdqrjH/a
 R+mRR/SBICvnOhgiSXlGO332ih3pij8WrzCt0gmjKjePL8f9BQP2C65IOE1TWL2A2Ysb
 oE+0AlWkV5ruXaKRiRARMRDXRdpnXRw0fk/5lWvSUuQFx9es/dpmV3ThRBbRo5l42ZNI
 m66A==
X-Gm-Message-State: AOAM533jELb6m1wVMpbGC8FtUco33lfT1VJ39rMWfBksbviv0tAC27cL
 8RTgnsNH2cF5ILB5vXXiSy6x
X-Google-Smtp-Source: ABdhPJzkJzLgnam7UXnQaYh5n7LF0aISWk3YiRx8Yfe/fP4hCprg6QKPCdA7LwpUAu+xUp5SU0o4Vw==
X-Received: by 2002:a17:90b:f16:: with SMTP id
 br22mr4405089pjb.221.1607593281273; 
 Thu, 10 Dec 2020 01:41:21 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
 by smtp.gmail.com with ESMTPSA id i11sm5573957pfo.129.2020.12.10.01.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 01:41:20 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [PATCH] arm64: dts: bitmain: Use generic "ngpios" rather than "snps,
 nr-gpios"
Date: Thu, 10 Dec 2020 15:10:56 +0530
Message-ID: <20201210094056.54553-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_044124_488904_6F466149 
X-CRM114-Status: GOOD (  11.97  )
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
Cc: Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201210094056.lp9Uk2sFby-v6HuaNgStdHjxng0PtoVCwB9oBScgXsc@z>

From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>

This is to remove similar errors as below:

OF: /.../gpio-port@0: could not find phandle

Commit 7569486d79ae ("gpio: dwapb: Add ngpios DT-property support")
explained the reason of above errors well and added the generic
"ngpios" property, let's use it.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Arnd, Olof: I just have this single patch for Bitmain platform this cycle.
So sending it directly.

 arch/arm64/boot/dts/bitmain/bm1880.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/bitmain/bm1880.dtsi b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
index fa6e6905f588..53a9b76057aa 100644
--- a/arch/arm64/boot/dts/bitmain/bm1880.dtsi
+++ b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
@@ -127,7 +127,7 @@ porta: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				snps,nr-gpios = <32>;
+				ngpios = <32>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -145,7 +145,7 @@ portb: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				snps,nr-gpios = <32>;
+				ngpios = <32>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
@@ -163,7 +163,7 @@ portc: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
 				gpio-controller;
 				#gpio-cells = <2>;
-				snps,nr-gpios = <8>;
+				ngpios = <8>;
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
