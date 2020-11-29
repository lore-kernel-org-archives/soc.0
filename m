Return-Path: <SRS0=TN87=FD=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DA7C71155
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Nov 2020 11:09:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F098C207BC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Nov 2020 11:09:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jbiR5nmA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="ffUK02op"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F098C207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vuiqn2pOQZwgIDVl3wz4eGsTSkqXx/y+jULethS3z/U=; b=jbiR5nmAicNTCoGyIS43mZMis
	ub67wjolRQH1+M++fQhAIZR1F41YuxnEIfehAWcx32DJqkDsNyna+t2dWRXms/xy7jA4Hbbe+0XiN
	iJ3LUqfzb5vLlQHMBuzAw2IteE80cTVlk0UlbWBS9ynHrYdvThkb9DttLRSU672AMPhsIJvFI0l9U
	utf8cKLhiPVGP16iygDaooFr4TjzJCJT7KsP/uRAGAQtIm6PrNRmUQc/diSn2AsynlSppuKrlLWgs
	MkrnMaU1C9okUN+SstHAEL5FlLAOtbNFvpf3OFk6XuqFGh9RxOSLXOHXAHGlMBciyID9Q3O8oDHyx
	ekm6Ye68Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjKZU-0006Iw-Ih; Sun, 29 Nov 2020 11:08:48 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjKZB-0006Eo-CQ
 for linux-arm-kernel@lists.infradead.org; Sun, 29 Nov 2020 11:08:30 +0000
Received: by mail-pl1-x643.google.com with SMTP id b23so4880666pls.11
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 29 Nov 2020 03:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sSxJk69Cd2LemrQN9ehPZlO0F43/6TrspTvKZvZYbs0=;
 b=ffUK02opWwOFvHW21tRs0l4+Mo38eIrN56iqqYVXgFwGevSQSh8qK2fv8dEfQTxpvJ
 mpiJo9gnnIfv/ntuqs6s0NG0qUrvjYXlDFghdoqhaG3hqTkM8uFe2cLgJnABDDQbqk+b
 JqmG4htvg0K3vSGvdkAruDhmMg4CU4VXpXRUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sSxJk69Cd2LemrQN9ehPZlO0F43/6TrspTvKZvZYbs0=;
 b=aI/TBfwbkHa6TxquDle0xcdMTvEUB2/A/yE/QVAsdaRGqFbO6+jrPr8pk/4HOYrY+a
 ZQsInstB5dXGerrzi6DLAezmzTRiPdKiA3wCpKRkzcS49Q4nm39G1H8U9S0NP7W2Ucid
 0Yh5pRePZIyoNnPsFlmb+bIPF51xH5/aKAB38D0KXEQVJW/7Xgg3LPrHrekFqb7FymMV
 AVziUMsTNXtSayQq/A1ziKUh4EIMKlzJTpJZr4ekmIJMyrbB83C2+/FZSHX85wMHRac/
 Vi2AJRYyLuaYOsnPbntaJlAJ/1jW3FLzEnW3jHwJhKRiqYJugppdIP/VxQlVMhK1lHYg
 03Lw==
X-Gm-Message-State: AOAM530Vfp0d7h7tEAYheE3JjuK5oytkNcmIYrRo1T32VSbtjE3A/5q5
 IrfgGj5TOl/hkqv/nuE2xqLU8Q==
X-Google-Smtp-Source: ABdhPJzib+nYFpwBxldfEI+z6vafVcrbaAPzvzvDZh07vXmrjbJ1TdqRII3WABzDnjub/RJWE7p+rA==
X-Received: by 2002:a17:902:8691:b029:d7:e0f9:b1b with SMTP id
 g17-20020a1709028691b02900d7e0f90b1bmr14505268plo.37.1606648107325; 
 Sun, 29 Nov 2020 03:08:27 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp.
 [118.13.124.123])
 by smtp.googlemail.com with ESMTPSA id 21sm13095653pfw.105.2020.11.29.03.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 03:08:26 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 5/5] ARM: mstar: Fill in GPIO controller properties for
 infinity
Date: Sun, 29 Nov 2020 20:08:02 +0900
Message-ID: <20201129110803.2461700-6-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201129110803.2461700-1-daniel@0x0f.com>
References: <20201129110803.2461700-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201129_060829_536387_D85A8731 
X-CRM114-Status: GOOD (  11.95  )
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
Message-ID: <20201129110802.NnaLbsQzt3Dbrna_jIGhuCxpW16dN0LmvvBxnp3G47E@z>

Fill in the properties needed to use the GPIO controller
in the infinity and infinity3 chips.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/mstar-infinity.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/mstar-infinity.dtsi b/arch/arm/boot/dts/mstar-infinity.dtsi
index cd911adef014..0bee517797f4 100644
--- a/arch/arm/boot/dts/mstar-infinity.dtsi
+++ b/arch/arm/boot/dts/mstar-infinity.dtsi
@@ -6,6 +6,13 @@
 
 #include "mstar-v7.dtsi"
 
+#include <dt-bindings/gpio/msc313-gpio.h>
+
 &imi {
 	reg = <0xa0000000 0x16000>;
 };
+
+&gpio {
+	compatible = "mstar,msc313-gpio";
+	status = "okay";
+};
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
