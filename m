Return-Path: <SRS0=r8q2=LT=gmail.com=mnhagan88@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D12BAC49EA7
	for <soc@archiver.kernel.org>; Fri, 25 Jun 2021 09:51:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B86376141A; Fri, 25 Jun 2021 09:51:05 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A9C96142B;
	Fri, 25 Jun 2021 09:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A9C96142B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=mnhagan88@gmail.com
Received: by mail-wr1-f50.google.com with SMTP id h11so9888993wrx.5;
        Fri, 25 Jun 2021 02:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i3RskP7ABczDPV/xayjgJz+jTz8nS+XbtsVOlwA5TU0=;
        b=OcddEErbfOY6ExeISiSk7YFKrdvt8iiNzITQZIQpXEkMFnsJBVqW6omdPQrj+MI4t+
         RQxMHVEsgRlByVTOZLNnx8ReJ5cL6+GL4mfOd29Q6fKLvHTOoJGy/JtTc+kjoUaErCMY
         MbpC6MfUnN93kmPSghr5n0mdemefm14+Hke2HLaB5JxDQSO9JVYY1SD3M792mgnld594
         /oR2Wxdaq2z2oRKgO5NCU08fOKj5PIjCwFb/a8SX0aeOH8dr2VoNRXbUvdaspjq93OFt
         Gs7R5u9rjXb1Yjvs8rUHbtg6qvYUaTD8GqGlbB9g2wpu8fjfIXCjju4FMm+HT8HZEMNy
         oLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i3RskP7ABczDPV/xayjgJz+jTz8nS+XbtsVOlwA5TU0=;
        b=p+4OJ24lzhsoNhQByUVQ2gN1LNwmVQ8O/GEJNzHezYi+hh71BmeuZ+UOGk2ki+W6GS
         WRNrJ5tdwY3TuJ1XJVkQ/RUn4ixJWrTSj6thZaHoT8/Y82GdzJ3z97WLuzWruIkuUeAn
         Oqi6R/JYSVFS/u5e6Hd6qFcR9cULrdn4U7BkR072rfnIEGXti3+B4pXPgr+xr8ZzKRS/
         EN47Z9ZGB09r6S/FMejzg6t+q1YqrT5++WfQDl40gAG0wMAAwzBYtVyTHv3BOW3WY9yz
         /ZXVPaT+3mrFGMmF7I029OMLRXpks2bZhtqkFXHF/0ZoKRVIgtQarbSK1+34eKuHk4WV
         GtEw==
X-Gm-Message-State: AOAM533vqR9t2rD38KlDYTSb3weRHPTef3/ZreJok/+79rBMBWO9tv/H
	TEmFbQYVopF8dqz9RUW1LZE=
X-Google-Smtp-Source: ABdhPJyS2uk3MmSY2uN1krFSfu+xoBlyO0DZF7uSh/HopQ+aQVgpEfA/mvIw5qtHdIqKnhxkRiipWw==
X-Received: by 2002:a5d:638b:: with SMTP id p11mr10104727wru.380.1624614664376;
        Fri, 25 Jun 2021 02:51:04 -0700 (PDT)
Received: from cluster5 ([80.76.206.81])
        by smtp.gmail.com with ESMTPSA id t11sm5628277wrz.7.2021.06.25.02.51.03
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 25 Jun 2021 02:51:03 -0700 (PDT)
From: Matthew Hagan <mnhagan88@gmail.com>
To: 
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
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
	Viresh Kumar <viresh.kumar@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 4/4] dt-bindings: arm: bcm: NSP: add Meraki MX64/MX65
Date: Fri, 25 Jun 2021 10:49:51 +0100
Message-Id: <20210625095000.3358973-5-mnhagan88@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210625095000.3358973-1-mnhagan88@gmail.com>
References: <20210625095000.3358973-1-mnhagan88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for the Meraki MX64/MX65 series.

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

