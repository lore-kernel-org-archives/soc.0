Return-Path: <SRS0=1+dv=OA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED3A3C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Sep 2021 19:07:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFEA0611CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Sep 2021 19:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFEA0611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QT895hYBVtCG+MOuqiXLl8kxftkK1poin9KkwbMV3Ns=; b=FJA0LAumTX+gyZ
	3ZKTL4wEdb2Q2V5DW97g7dg21u56GlefXxG7nTN8deiArisWPX5iKykqQVZzQTxoc/F8vSqFNuYgV
	hfuBQtuAgq+ldR1Hc+DzhaGPpCYL2Ce0CvvRrsM0FooHJL9wRC+bDDhvZ/0GIRuMuGpAoP7DziXe3
	VM5VUrLN/Rilb8+w/X7z12X/vIqbOFmKAJ3WMIv1m11X1vd9/ifCALz0WI6mKe6MTIiZWoGaGH2XF
	tAf/qKDnb90NLni9TR7r5HSwIgT8x9b0krFAld1VA+NuOWXrYruTPCELgR/TiDMnKM3SwxiOvyU2j
	nwU47MgMnVHyh9tJVcYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOlp7-00DVfN-OI; Fri, 10 Sep 2021 19:04:29 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOloS-00DVPD-9L
 for linux-arm-kernel@lists.infradead.org; Fri, 10 Sep 2021 19:03:49 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 n14-20020a05600c3b8e00b002f8bd2f8ab6so2153167wms.5
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 10 Sep 2021 12:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RGYm0fS3PLkHIJJr2lxucQs1ZqvDikYcAAG+vIZ2nzM=;
 b=WAGSmaaF5taUZLYkumxO+QBdUAszUeWCrGZREDQ0bwsTTg3bNeoLFDAyewofnHKrhi
 Y4iyGQs7uosEZWdV2FCQ1dUwkrx3VE+SK6b6uGMSOEJvIScooOdrluTES/N8OJBcnCdp
 2PfgyQvrw4CeHwarl23eTam5kcPABDkCTy0Z0LSdj6pNmvGbuZpNoO3C7nCRFKI09Mf6
 Wa6uQnnmGazgihsgdUZuu2ktR4nxNWPrn4x4kaN/RWXM8utfts21dsDfFc1D4uOKQhip
 xa94S1ejdSGEh+ysMJSwO6Eo8n70PdQ6BB6hOHHWwqMzOy78WmnpxLAoADPrEzXPaEMR
 4EtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RGYm0fS3PLkHIJJr2lxucQs1ZqvDikYcAAG+vIZ2nzM=;
 b=J4K+Lk3stmPvVX77j41gfBd8JOGoyMObDXKPCitAVktw67d6ZSzVnUTgglDr4SamgS
 OUsV6ZY+RECIxalKJo64sWUrg556jcCYkBn4TQuZhHx6WufGoQUOCk7Tet2cMH3oLSVa
 dBsevgk0W3kyRLwGai/CQO9/d5/8+fmUjUk2fiSrR+ZN2l0/D1XgUSSP0nrnUJKvEm3T
 vkcg7ne2wDfQWwaLj70Il0vZIUbeDUYHEJ8mljKX1tsPykCdARQseEG34QgZFaQpYNTG
 f0WtOZq0vonOyY9yS/3Fc7SIjT+acI5H8wu68U9EJvJTze6rMccmwyB6N9G6dM5zEEUe
 Lg5w==
X-Gm-Message-State: AOAM532vkZeT34bHZM9JxaUJzf60CmkqD21dBmTUluZUn0z3lhT9NZC/
 8/Xg4XcGQgc69sB2IlnORbk=
X-Google-Smtp-Source: ABdhPJz8wEhimQ2HLHy2Evfr6g3vWa1/iO0LQdxwW/4nAF4WvKdf2FrFoNcd2vyO+oEYqvzGtF1lFQ==
X-Received: by 2002:a05:600c:a05:: with SMTP id
 z5mr9708351wmp.73.1631300626293; 
 Fri, 10 Sep 2021 12:03:46 -0700 (PDT)
Received: from debby ([2a01:e0a:a6d:a8d0:7ff4:8f61:5574:9f95])
 by smtp.gmail.com with ESMTPSA id v28sm5487641wrv.93.2021.09.10.12.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 12:03:45 -0700 (PDT)
From: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Daniel Palmer <daniel@0x0f.com>, Romain Perier <romain.perier@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: add vendor prefix for Wireless Tag
Date: Fri, 10 Sep 2021 21:03:21 +0200
Message-ID: <20210910190322.27058-4-romain.perier@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210910190322.27058-1-romain.perier@gmail.com>
References: <20210910190322.27058-1-romain.perier@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_120348_347014_989C6E32 
X-CRM114-Status: GOOD (  11.21  )
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
Message-ID: <20210910190321.VxpWTm8epkxLaAggLaakGNK5-Y-sx7hgd4Ljxr_UrA0@z>

This adds a vendor prefix for wireless tag boards and SOMs.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a867f7102c35..b50d62dde7c5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -517,6 +517,8 @@ patternProperties:
     description: International Business Machines (IBM)
   "^icplus,.*":
     description: IC Plus Corp.
+  "^wirelesstag,.*":
+    description: Wireless Tag (qiming yunduan)
   "^idt,.*":
     description: Integrated Device Technologies, Inc.
   "^ifi,.*":
-- 
2.33.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
