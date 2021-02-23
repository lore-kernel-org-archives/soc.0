Return-Path: <SRS0=smCM=HZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF663C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Feb 2021 06:20:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 359F564E6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Feb 2021 06:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 359F564E6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uKGAD9anlzx/5KjOtUKznptLp3w5Gi0zTwSofhsnQXc=; b=phEudfeZfctB+2/oA0HQ0pZ0k
	zjOF/yAvPOAdX3e8fSWGmkqqkYzLQg10dA9uX2Y7qf23gbeLYxY4PJwQyOnOYrnMyYCeUczUAC6Oj
	nFed492IlFgF41ymLTbtONQClMASe1+3UBLz4v4bgd1kUGFJsT73WuKkvEw+ykI7d0wCbIOl4KZYx
	OvlHV4aeNRLvPsytyxT3NJYkZIH5mIbnCu/sNTJIEVANsDrlZJLDhaxGZaigY9eCS/NDxm8ohZUw+
	IcJxMFmoN468X6Rj94I9fddeGZ6Ucc/rKhaVt5Nq+IxrC2jiHOrAljxgN49wDo/mDAx7PUb4wHdre
	zLCIsY9YQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lER2b-0006mb-5J; Tue, 23 Feb 2021 06:19:25 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lER2T-0006kC-Qn
 for linux-arm-kernel@lists.infradead.org; Tue, 23 Feb 2021 06:19:18 +0000
Received: by mail-pj1-x1031.google.com with SMTP id cx11so1124238pjb.4
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 22 Feb 2021 22:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OhVat5LrE1fhESIUjnpbwIUbs1+uHdZHHpdx8ggYgCw=;
 b=jjuchHLCWGF1ErNoEErzLFpwqBimzUP/Th11yILb0nPHSuvnP8OMSacbRaJ7LcuyMd
 uRdAZQZT4Sa2ZlaMZCbiyXINMezClHcLza61IqCWH0t6QXJ+rxQc5rvgjfEp9blQrG6Q
 PPq5+dXItdUiZKqUniyqJABdhNqTf6cAr/Oc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OhVat5LrE1fhESIUjnpbwIUbs1+uHdZHHpdx8ggYgCw=;
 b=eoqAXxtWaFeJSY4fVgVsHj4JNsvikCDAPy+amBy9gDmBfzYex9oGpEw7lq7c9SSErS
 ej/5KhrDdLBADYODUf6m1Xx/Bx9sahIl1+18xJQwc1deQJMwAkP8neFzgAhqQL/rfxxP
 zCI7I21HTZVVDbQxHPJ1NTgBaTmXfoigPQoBdUOho4YWwDPSAkY6/St4kz0zZJ7LwN73
 l4V/Kjtb409y8MzSxWUaszR+5GSMCQbEhNFefFVSt9bX+a+xIa3H1lr4eeLMUkDKBLBR
 4HwIG2yl1vKYxS3vb59WZf4zSLaKYLckNw0Ri6AeEZAjqjMLc2NCll5yEooWEltCI9nX
 +JzA==
X-Gm-Message-State: AOAM531Qri4/a+IDoIuE28KRUNC0UVIwR2SxXO5t/0E39jyHQb3CnTjJ
 D6CK95UImgP5BU14BJ9Ik8A5oA==
X-Google-Smtp-Source: ABdhPJyXXR+t7UNc7M5JbvOoe9YC9FsdP2ZLpFwkfCS9cnni/x9cZLknpqKBKyk/9ba9udsHt8d96g==
X-Received: by 2002:a17:90a:ca11:: with SMTP id
 x17mr26126122pjt.201.1614061155775; 
 Mon, 22 Feb 2021 22:19:15 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp.
 [124.98.97.188])
 by smtp.googlemail.com with ESMTPSA id n10sm20135169pgk.91.2021.02.22.22.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 22:19:15 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, soc@kernel.org,
 sboyd@kernel.org
Subject: [PATCH 1/8] dt-bindings: clk: mstar msc313 cpupll binding description
Date: Tue, 23 Feb 2021 15:18:23 +0900
Message-ID: <20210223061830.1913700-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
In-Reply-To: <20210223061830.1913700-1-daniel@0x0f.com>
References: <20210223061830.1913700-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210223_011917_903449_E1AB1861 
X-CRM114-Status: GOOD (  14.07  )
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
Cc: Daniel Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, w@1wt.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210223061823.wtwdlnbXztRHdX73LtKZWKy569VuxaA0WnEeZ7gkW-c@z>

Add a binding description for the MStar/SigmaStar CPU PLL block.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 .../bindings/clock/mstar,msc313-cpupll.yaml   | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.yaml

diff --git a/Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.yaml b/Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.yaml
new file mode 100644
index 000000000000..a9ad7ab5230c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/mstar,msc313-cpupll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MStar/Sigmastar MSC313 CPU PLL
+
+maintainers:
+  - Daniel Palmer <daniel@thingy.jp>
+
+description: |
+  The MStar/SigmaStar MSC313 and later ARMv7 chips have a scalable
+  PLL that can be used as the clock source for the CPU(s).
+
+properties:
+  compatible:
+    const: mstar,msc313-cpupll
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mstar-msc313-mpll.h>
+    cpupll: cpupll@206400 {
+        compatible = "mstar,msc313-cpupll";
+        reg = <0x206400 0x200>;
+        #clock-cells = <1>;
+        clocks = <&mpll MSTAR_MSC313_MPLL_DIV2>;
+    };
-- 
2.30.0.rc2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
