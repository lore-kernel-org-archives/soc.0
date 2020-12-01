Return-Path: <SRS0=r2Hb=FF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ECABC83013
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 13:45:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96072207FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Dec 2020 13:45:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JK0MvjYM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="RM1NldzB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96072207FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Iv2dFpDgOAl3BTUo6ULyserh49twc+9xcpLAcNK/jo4=; b=JK0MvjYMgXsg8g0J0jJCrIvKW
	m5PW7wp93uVS/qoTYYspGSAFItJ5dBQgyYictit3SrPniKMOzGXcpqwNqjczkLTpf8+dagbw+ScfY
	T1ewOaEPKVvOzoDyIk0B9ZqaHfJEm633fu0T5T5ZJemZhqaW8saJj+GPjaedMfh8uxVvlF2ijvwWB
	sE+m2aCy9Dn/dTExzrC9J9B6O1lvdUz0/eWfSKDNY/8xsEzE6cF2qQl9NPX6gZhC4LfrfSdUUNY32
	eiM3gwRp/vjpd2trzGZvN7z6GvREgornxOHBwWfMSMAukduu9oAU69o4dZ+g5ZKlkJa00yxG4xXce
	JfVkrq5gQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk5wg-0006zf-SG; Tue, 01 Dec 2020 13:43:54 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk5wZ-0006wx-VJ
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Dec 2020 13:43:51 +0000
Received: by mail-pf1-x444.google.com with SMTP id q22so869044pfk.12
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 01 Dec 2020 05:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TdRqXYI9+LXautyFSgQZPVbiKxi/AYNw4/5pXTCk/R4=;
 b=RM1NldzBUV9eilnHZx/H3MAmxMfGI28r9EeIMlH6hqjZCvYEFhQy3qUQw11icYoss1
 FMw9JD/wlHbe5sr6+x8tAyfmla93e6MUxcZLwvjqWsmfCsGIfJ2Ch0E6O+eklS6yZzTR
 4gzxI2q6rs+2PS7LC3nZvBkN/Aa69HTvyKO7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TdRqXYI9+LXautyFSgQZPVbiKxi/AYNw4/5pXTCk/R4=;
 b=UMVKQTydh5aANvHoMAUCpuYq/Y9+mzm1pU0Ne6AhleztuBxaQLCFOqJrBDMEAHWRgP
 KlTNui9jweV+F7iTtGh2242ImdzmPIStdlHEwwTuCU5qG5N5ewXpbXtVK/VUz6cYXz1N
 UMymJQq6K9/JOclUmrnaRJSTYZ3yWjFj8UwdxeQt0b3Hq2RKNsSOAkO1YON8LNn8TBTN
 lWpEDlBUSiRL6/ti0ifdWl0U9/LSWBrGQk+NnkwuJLahjwjv+3mP9AMndZdP1cd18Oby
 LHNryX3R7S63MIHH9vk0KRMSLoAKGvzWBFU3PF7/UY+pfdz1pKLjb0dWcn6z2LkeRL6I
 2y9A==
X-Gm-Message-State: AOAM532/A9gHnotB4eAc+BVBH33G5AWcfaROmYRqIdJ5LRyA3k+O8x9r
 uETJIeJkYslBOvLahofMizkGcg==
X-Google-Smtp-Source: ABdhPJzTIgKg7pAUw9IZNPEUcFY3ziV2gQbl96vChMSNwAgbfi0peMLDJMiAe0RBB4RvEnGDI/f/VQ==
X-Received: by 2002:a63:f20:: with SMTP id e32mr2301093pgl.130.1606830226259; 
 Tue, 01 Dec 2020 05:43:46 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp.
 [118.13.124.123])
 by smtp.googlemail.com with ESMTPSA id g14sm2839248pji.32.2020.12.01.05.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 05:43:45 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 03/10] dt-bindings: mstar: Add Honestar SSD201_HT_V2 to
 mstar boards
Date: Tue,  1 Dec 2020 22:43:23 +0900
Message-ID: <20201201134330.3037007-4-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201134330.3037007-1-daniel@0x0f.com>
References: <20201201134330.3037007-1-daniel@0x0f.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_084348_038415_3A421FB0 
X-CRM114-Status: GOOD (  11.59  )
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
Cc: robh@kernel.org, arnd@arndb.de, daniel@0x0f.com,
 linux-kernel@vger.kernel.org, olof@lixom.net, w@1wt.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201201134323.3-uDUpLnF4x-kPGMyoQsL4WIZacoxyili_ksliIBPJg@z>

The Honestar SSD201_HT_V2 is a full size devkit for the SigmaStar
SSD201 or SSD202D (they are pin compatible).

Currently only the SSD202D version is supported as that's the one
I have.

Link: https://linux-chenxing.org/infinity2/ssd201_ht_v2/
Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 Documentation/devicetree/bindings/arm/mstar/mstar.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mstar/mstar.yaml b/Documentation/devicetree/bindings/arm/mstar/mstar.yaml
index 7c787405bb2f..61d08c473eb8 100644
--- a/Documentation/devicetree/bindings/arm/mstar/mstar.yaml
+++ b/Documentation/devicetree/bindings/arm/mstar/mstar.yaml
@@ -20,6 +20,12 @@ properties:
               - thingyjp,breadbee-crust # thingy.jp BreadBee Crust
           - const: mstar,infinity
 
+      - description: infinity2m boards
+        items:
+          - enum:
+              - honestar,ssd201htv2 # Honestar SSD201_HT_V2 devkit
+          - const: mstar,infinity2m
+
       - description: infinity3 boards
         items:
           - enum:
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
