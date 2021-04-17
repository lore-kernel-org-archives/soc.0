Return-Path: <SRS0=AN+G=JO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F27C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Apr 2021 01:13:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03D5C60233
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Apr 2021 01:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03D5C60233
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FaoR8a1Ykh11Gx7ty8v0HFbx1YpYV9ffYYOUh3G+vl4=; b=kpq8sRWmdRmchckcvCG450Kfz
	w+N1orZxDbIKUShau5T006MPMbKkeYQpLKzsau7uieQCDZh3OPdSzzFFxu9b24oycXBWzHEyOYMj4
	SmWFdbtdppGk+eBjsQ1BIFkmyZMm4lXVKwJ4t47qo21kBcX2cvEQpGWE5D4RDZR9oAbO/IETmx5Z0
	VTAsWRbKpz9j/IlBRAbItXEuPjWZYbxXSSAz14YsPBn0CCxdRiS20Vt2aD6qOExPaZ9CDLAvGwgv9
	Njozr65d2UYCDMtYK7tOJ8kkCC1OcKTcfQGJ1q4XAHd/Njd5TBw0yKWlgLYafkjsGnh2++CCsaGvY
	zhmAstuTg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXZV8-003w1y-IX; Sat, 17 Apr 2021 01:11:58 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXZUm-003vws-DU
 for linux-arm-kernel@desiato.infradead.org; Sat, 17 Apr 2021 01:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=IpFNR7GakxyWW4TgxZZHx0a179MD/+kz0HEu0bWO0a8=; b=gDM1GxLLqXOaKtfrh+k7C96o29
 dd2XZu5t+Ec4LVhNVpZEOHOPsBhYWDFBb79IBuCGs1huD+ZZEL0mD/U5lsBzp83zNvR+jFSyLhO1K
 S0Wxmj35djb7kyyysvLQtEW7KyhYeO+kpTdJ9h2uZB1P4JDqEmJs9dasgBBKGM6WLDVnNBmM6uolE
 LLSV1sc48uFIKlRfi5EkJoNGkn6AG+01I64+VGZEd1SHs8UpV55DxXxR9x2XdD58ILMtkFT/bSsv3
 FVqSG34XPmP9rdd5hzV8B6LRzzASU6HrAzEXd8inIVEFPT2fnWE+BfNkqiz4KPYBYzHG5lmyi8e+9
 pjIlgjEQ==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXZUj-009p1D-3A
 for linux-arm-kernel@lists.infradead.org; Sat, 17 Apr 2021 01:11:35 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 b8-20020a17090a5508b029014d0fbe9b64so17295497pji.5
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 16 Apr 2021 18:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IpFNR7GakxyWW4TgxZZHx0a179MD/+kz0HEu0bWO0a8=;
 b=Po04f5sBLq7CyI8NVDbw/oRJPwJrkwmlN5bP8ByR58YDJv+L9Grp4W25XVsVqoX50U
 VAfoQJEiLxxgSS6cIDQv3YuoH2WxogF9nVU7CRgkamzQj1t7F7C1M5UWw+55cn3fLuQT
 BOgHL49GK0Zg7IzYDsct+zh1egbo8TNUa+3Wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IpFNR7GakxyWW4TgxZZHx0a179MD/+kz0HEu0bWO0a8=;
 b=KrnOIgndii/1HLpG3Cst7hanouSG02/r2Y7ha2U6V2v4L5KNHOjSsxzp0A0iKJOpiJ
 a897Yo7wAvc0Dnbw2bvKbXvzR/x8fIMcdN5XclO8QMvjApinB+hC3CtZTmEFnsiplGTE
 T6K9c9D0jo7IEaL1EU3oVqJ3+zRjH4EeKfQUkXNEaroZUnFWQH+2XRZ/qZ+8c1a4LMUc
 jhCL9T9OHia+V9nP+Aq75XfB7H6gIyITjV5H4SfrTAY6j0vRDNfpKnNYyEvQ7S8wnRzN
 TAQhzxvBbZEH3eA4eY7n99AJPdWzlqWu1tpPyJ9wvc5WpAWbQZRRTKsMVS4WMPb522p3
 Ducw==
X-Gm-Message-State: AOAM533UcPt/lauqLpiVcr0AEaqj2sBxHoDtmMHmqwVcnIIljeP+4nO/
 4CUiD7ubOAEt6ZCLs/XDJVeQig==
X-Google-Smtp-Source: ABdhPJzbgyZPwNL7XTnTWHarGeS8Luqog9MeO9ogPU0obIFCDGmVAGgPhcXB6udRhP8Z5OWNJLE7Dg==
X-Received: by 2002:a17:90a:64c9:: with SMTP id
 i9mr12919746pjm.213.1618621892443; 
 Fri, 16 Apr 2021 18:11:32 -0700 (PDT)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp.
 [124.98.97.188])
 by smtp.googlemail.com with ESMTPSA id x17sm2181515pjr.0.2021.04.16.18.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 18:11:32 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, olof@lixom.net, arnd@kernel.org
Cc: w@1wt.eu,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add vendor prefix for
 M5Stack
Date: Sat, 17 Apr 2021 10:10:13 +0900
Message-ID: <20210417011015.2105280-2-daniel@0x0f.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210417011015.2105280-1-daniel@0x0f.com>
References: <20210417011015.2105280-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_181133_151100_CB686A89 
X-CRM114-Status: GOOD (  10.19  )
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
Message-ID: <20210417011013.11gp57b9r3hzgXdNJECqkD61hlUga6eWRvik52P3QFM@z>

M5Stack make various modules for STEM, Makers, IoT.
Their UnitV2 is based on a SigmaStar SSD202D SoC which
we already have some minimal support for so add a
prefix in preparation for UnitV2 board support.

Link: https://m5stack.com/
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index f6064d84a424..7129fe3b9144 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -651,6 +651,8 @@ patternProperties:
     description: Liebherr-Werk Nenzing GmbH
   "^lxa,.*":
     description: Linux Automation GmbH
+  "^m5stack,.*":
+    description: M5Stack
   "^macnica,.*":
     description: Macnica Americas
   "^mantix,.*":
-- 
2.31.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
