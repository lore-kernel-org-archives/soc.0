Return-Path: <SRS0=xZhg=LH=gmail.com=mnhagan88@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F22FC48BCF
	for <soc@archiver.kernel.org>; Sun, 13 Jun 2021 10:18:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7829661261; Sun, 13 Jun 2021 10:18:33 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D0F2611C0;
	Sun, 13 Jun 2021 10:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D0F2611C0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=mnhagan88@gmail.com
Received: by mail-wr1-f43.google.com with SMTP id o3so11008254wri.8;
        Sun, 13 Jun 2021 03:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0nt1QAmwrT7KiwVRGBb2sEf7u5dtEbfMgMB1Y3n/d6U=;
        b=n3+XLPkg+KhWbd+RoKG12JNHlGBEkSKis+yiNnsXLa75ONbsZC4RmEa9GVGL6z27Oz
         PwQvsvdp+Be0MxVAlCmKyiAFZcsJXFoVJXhykN1+PFFcwooDNsCn/mao0zxQkKcGjy8+
         4F+XX9BsdT8jGZtwOQxbLKFUZBzdPHij9KwCfdjk3i1Cfq+vfBPdQMTpR2rR0oALM1c5
         XyPk8BQBALaDRvrgiUNlQIA2/7TT74Cfsiw6cHcrHKBQ0PKtWP+93eYfgKysmH4kmg9f
         y80nkJlR8XrzsLfQ4rlK/I4w7o+a/AiiqDfMxLNXUVoQJd1bJYaC5TwNk/tQywtviNVe
         HM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0nt1QAmwrT7KiwVRGBb2sEf7u5dtEbfMgMB1Y3n/d6U=;
        b=nwtIvTOMuiz+YhJYHEA2RKsuymslDVJv2FMvUKKs1wYDg0b8UVMsHCXERq5xcmbKRz
         nZ3qTjltSUl7pgiqoPy6kD2qLxxq56q1B1jWmxwcKum23zbh4I+NAkdsYy9xRFNK3lXx
         9ItNysGNP/wG/UmNC4hfGPiT2UnBxwAGKZrnWuw7C1xNFAEj1IwnxHxk47uyg2lndD8d
         gJ2pbD/ftWYYYGEkCMdk+hYK+c7dJiWcsVSGf/GTrPusqCAjs07c5aDXuzm2osYoc2pQ
         IzmTQfvranEFjuJGejCFH/dntP2Iqm+sm0RtUeZ3VIWbtcao1JBP3SwU2+tLEb+H6kGc
         A8jw==
X-Gm-Message-State: AOAM531L5yyBdLd26Fi92TcxfrNF8sWF+51Ne7sjKiVoOAALT9KsOxW8
	jvbCsCDVdoDDZWRBOOcwbF4=
X-Google-Smtp-Source: ABdhPJz85dTGbSbzKImxg9MRP4VAM0osivUkyy5dKD+XDrJQFIu8xwXCu3eBbwz6xVLOzo1XcqoatA==
X-Received: by 2002:a5d:4f05:: with SMTP id c5mr13123620wru.341.1623579512058;
        Sun, 13 Jun 2021 03:18:32 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
        by smtp.gmail.com with ESMTPSA id f12sm15723042wru.81.2021.06.13.03.18.31
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Sun, 13 Jun 2021 03:18:31 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Matthew Hagan <mnhagan88@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/4] dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65
Date: Sun, 13 Jun 2021 11:16:48 +0100
Message-Id: <20210613101658.3242777-5-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210613101658.3242777-1-mnhagan88@gmail.com>
References: <20210613101658.3242777-1-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for the Meraki MX64/MX65 series. Note this patch should be
applied on top of "dt-bindings: arm: bcm: add NSP devices to SoCs".

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
---
 Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
index 78dfa315f3d0..7d184ba7d180 100644
--- a/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
+++ b/Documentation/devicetree/bindings/arm/bcm/brcm,nsp.yaml
@@ -62,6 +62,12 @@ properties:
           - enum:
               - brcm,bcm958625hr
               - brcm,bcm958625k
+              - meraki,mx64
+              - meraki,mx64-a0
+              - meraki,mx64w
+              - meraki,mx64w-a0
+              - meraki,mx65
+              - meraki,mx65w
           - const: brcm,bcm58625
           - const: brcm,nsp
 
-- 
2.26.3

