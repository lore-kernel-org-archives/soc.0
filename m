Return-Path: <SRS0=9VHM=M5=gmail.com=mnhagan88@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B07CEC4338F
	for <soc@archiver.kernel.org>; Fri,  6 Aug 2021 20:45:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9034961181; Fri,  6 Aug 2021 20:45:50 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B52C61164;
	Fri,  6 Aug 2021 20:45:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B52C61164
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id c16so12559010wrp.13;
        Fri, 06 Aug 2021 13:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3wJQqYROu53OkfXOxiXbXsaK10t0gPF2sKNTrvl8ijI=;
        b=BzHquhrgcHqfReZNU2wYHzGqZKMPL0CTZ2OkJbkm9j88UaZl0n/9hJlScWFv6KpTrt
         xrLl3Rm4a3jimEJsAkyv68TBZYE4pe4si0m6lmObgYnKIcaJqraxpPvbC4/Rgx/q32Eo
         EK1Jeg3O4sAD0XrAqySM0nDVrV4i+55GPNo05aiKWTGhAhj+RzI8PCK+sSV2PKaHyLVl
         HKCPyV+JoV9U8NyumlbBTW/ZvQmiStt+svyBOvhcmWhPk1haS7kcdxnqYGpohgzVNVEO
         nIst7Goz3Y6xcPF4zhsQKfhiLOunISdG2u+O1c+U3Z0AQK2c8/TBkGAwyetmmmchfRo0
         nwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3wJQqYROu53OkfXOxiXbXsaK10t0gPF2sKNTrvl8ijI=;
        b=o6bAY1n0aj1DUvhAICWH2tmsoD9pn+n0iLGwn+QTBlvmNVk9HwRfjsBAkJzrIgSXT9
         ZDiVhVUSqmD7dI67lCJvUrssJjiaEi2pY0RQInADPq0jq4R0j1JHj0zO9tP4N1B8NBFB
         aKsdkgTlfaERuZjkx66SmqjsZvxaqO1oWMlMi/skvCqTHto3zfyO5d9AV+KCSLFnW7OD
         auzia1atQb+jYxORFRyitQc/Vvg5fDjhecrPuCRAq9zcRl/G2m0XcayyObJOPDO3uNvU
         tEV0I12lG+WufuCtezpnumGcbVFEcMayLz67G5I/u98GJm4tD2WVLzpOvbM0RtoRqsQf
         y6Zg==
X-Gm-Message-State: AOAM532MSo5iuI5emEVEsOIwqpvqmKYv0ZkxsKrtu4E9HM9x93N3JGbs
	PzZH2w2cCa7nLCiFQbwhs5I=
X-Google-Smtp-Source: ABdhPJzgkqKvOTrcDSDK0+Ko6rn4b8UY3tvzal+b9Qp58RK6njFRYCHGasTaYuCovTJ4qVEYOG2TaA==
X-Received: by 2002:adf:fc50:: with SMTP id e16mr13123857wrs.382.1628282749109;
        Fri, 06 Aug 2021 13:45:49 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
        by smtp.gmail.com with ESMTPSA id a12sm13029248wmj.22.2021.08.06.13.45.48
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 06 Aug 2021 13:45:48 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Matthew Hagan <mnhagan88@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sam Ravnborg <sam@ravnborg.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 5/5] dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65
Date: Fri,  6 Aug 2021 21:44:36 +0100
Message-Id: <20210806204446.2981299-6-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210806204446.2981299-1-mnhagan88@gmail.com>
References: <20210806204446.2981299-1-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for the Meraki MX64/MX65 series.

Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
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

