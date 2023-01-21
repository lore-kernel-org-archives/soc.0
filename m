Return-Path: <SRS0=smpC=5S=gmail.com=markuss.broks@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B95EC54E94
	for <soc@archiver.kernel.org>; Sat, 21 Jan 2023 20:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 54F20C433EF; Sat, 21 Jan 2023 20:19:36 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 807AEC433D2;
	Sat, 21 Jan 2023 20:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 807AEC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id rl14so18465942ejb.2;
        Sat, 21 Jan 2023 12:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+5bO+lWD89GR1evsBX1z7xFkVso1S4GR3FB8mwTo4k=;
        b=UvacWkQUJbN2AMrJiOhXwm5hxGTxm5q6Npdftn5HBVNPm4BesOmUz1SRBfHjWSz+L6
         9K4ozdXVlSO4Q2PEyOMLpJx64HDKMyz79r1suUS5IvHb8rvLHKVXbiy85to6YLMEZGP6
         SG+CDZdbIDS66NJ0wQy/gzfXXjfCZyG43gDK0Hu325wEgt3EJ2Gij5f1AIpGSiDg77IX
         b7R/JQHn7tcyATYESBCG32WVe/pLko9e4NLXthgFVOYiTg96LiOCXmZcfsawUASlgFwx
         CgJUOLjXRGJVlcI6V6kJZF9td3z5mEw3B5Uj8KfAK3p9W8lxCRGCBVlKaevHp4zoBo+u
         +wGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+5bO+lWD89GR1evsBX1z7xFkVso1S4GR3FB8mwTo4k=;
        b=pe///x7MhzoZPCCOen8GtfwTsYKC6f/C38DlXucHjp5TISv41JF5VWQSpFnA2ymy/4
         h973iEpHKFC5yQZVSzMZhodmQqB0+by4quZhsqDw7PWP3hNgxmdt1uQp2JufFVHD21sg
         s/DjTAYudiBTVPshq8sC7juwy6etgAyQea8/547jshSykvZkHh0N2SsZenyk7MuXThSk
         5gWkZY2qThjsIcVq2ZSwFuQqlJM57XOx4BTgS4jkuIo7kM1n+jEdjPYrbL7bX0Au+901
         Ycor8HYgMfAWnZ/uEEvn7591NdWljN9am4toFnwAY+sc+4FOwOaVmJncBkzgd1U4zhbO
         2esQ==
X-Gm-Message-State: AFqh2kqJazMpYtTx/bI+wVkIOo3wpC+2hmIVohKcfK36UtEicCHkWPLN
	GAGPrwm2/5Q2+tMLoSYgOnJzPXFWbXOl7g==
X-Google-Smtp-Source: AMrXdXuEbRplbXq4PXvSYwkmr8kg+SO70STMTLF33Tn2LBsFAAtbIe9aoX54BzstM/Fw4XTB2utv9w==
X-Received: by 2002:a17:906:9f1c:b0:870:3c70:8c8d with SMTP id fy28-20020a1709069f1c00b008703c708c8dmr16008074ejc.17.1674332373917;
        Sat, 21 Jan 2023 12:19:33 -0800 (PST)
Received: from localhost.localdomain ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id ku26-20020a170907789a00b0084d46461852sm17462057ejc.126.2023.01.21.12.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 12:19:33 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
To: linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Markuss Broks <markuss.broks@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: samsung: Add compatible for Samsung Galaxy S5 (SM-G900H)
Date: Sat, 21 Jan 2023 22:19:24 +0200
Message-Id: <20230121201926.46990-2-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230121201926.46990-1-markuss.broks@gmail.com>
References: <20230121201926.46990-1-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the compatible for k3g in the Samsung Exynos5800 boards section.

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index faea33e4f731..deb2cf971871 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -171,6 +171,7 @@ properties:
               - hardkernel,odroid-xu3-lite      # Hardkernel Odroid XU3 Lite
               - hardkernel,odroid-xu4           # Hardkernel Odroid XU4
               - hardkernel,odroid-hc1           # Hardkernel Odroid HC1
+              - samsung,k3g                     # Samsung Galaxy S5 (SM-G900H)
           - const: samsung,exynos5800
           - const: samsung,exynos5
 
-- 
2.39.0

