Return-Path: <SRS0=piyp=LE=gmail.com=mnhagan88@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634F7C48BD1
	for <soc@archiver.kernel.org>; Thu, 10 Jun 2021 23:28:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 48200613F5; Thu, 10 Jun 2021 23:28:27 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18870613E1;
	Thu, 10 Jun 2021 23:28:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18870613E1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=mnhagan88@gmail.com
Received: by mail-wr1-f41.google.com with SMTP id e11so4056789wrg.3;
        Thu, 10 Jun 2021 16:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0nt1QAmwrT7KiwVRGBb2sEf7u5dtEbfMgMB1Y3n/d6U=;
        b=Eq89jfHz5HtM/LYs41rCP41gcszr+5aevF46W868z1ggqWA7F2YEIbtWSBnz8t0fOb
         G5WKgiPzhOkWyom+ib0Q48I5t+kZYmWkM01ILBhz5ooilZCDOQ6fDUQI0C/CRGX1Fevt
         WK/MRIQOWUbg4yy1SFOB/Bs2aQwYzsopQ3ULXUwROcnkRK7HCB+JjAry/wYP99GgoyW0
         cwJRLfVel4p5nK31KDMlW2Sh5Qmhag7QVxJ3c3WjnYNI4yvk1PE0SWH39XfgUL+rOTfY
         iWOJlv7ngdCWc80UXbPKAwMAX0s7/Cik774swDTXSOXV5IRmoT/ZQycXo6PYKuWaC53/
         yYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0nt1QAmwrT7KiwVRGBb2sEf7u5dtEbfMgMB1Y3n/d6U=;
        b=r1LWEFIeRein4efULwTNnAlOkTaPA6pnmygj/J8UercnWM1K0BICP3UF6MiSDOw57C
         urf7AnyPqDagHtjjz/bmMncnoHyEkyYMQTC2Q3lKM+UO6Yjx7ClxcYMxMxTr8VZxgtFW
         9bmmp2EZRRetAYhgaKntbd7lrOj5YmrLfcX8K8hV9RtEZi6ONjcg2IgUXlpEqZ9/kiHV
         AFQ62WVzDVOnTVII88tAMCwzcDnKOSgSkKZdzRQwxhx5OnG4OMnqyuQ3EFO6o11Ukiy/
         zjx1t+/CkrzZl20znANTbl/fSKEydgEVDIzPpQhFoLZvHHSdEO0glm52JE/yUcBWjLah
         vMQA==
X-Gm-Message-State: AOAM533hN+9tfeY85ROKtaKOO4suA/O+gzu3TJb1vgCXymc9dyyEw66l
	+vhAg9+j/Hf20/FUuhFdVPE=
X-Google-Smtp-Source: ABdhPJzkq1CzfZQJ8JofM0yC65tXnI8aWTVOPbJZPZymMPGbOqTy3A8A+IWO3hilqAsMDEWhYfPW0Q==
X-Received: by 2002:a05:6000:18f:: with SMTP id p15mr820358wrx.102.1623367705704;
        Thu, 10 Jun 2021 16:28:25 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
        by smtp.gmail.com with ESMTPSA id d13sm3196182wrs.41.2021.06.10.16.28.25
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 10 Jun 2021 16:28:25 -0700 (PDT)
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
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/5] dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65
Date: Fri, 11 Jun 2021 00:27:13 +0100
Message-Id: <20210610232727.1383117-2-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210610232727.1383117-1-mnhagan88@gmail.com>
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
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

