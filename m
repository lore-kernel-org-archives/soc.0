Return-Path: <SRS0=smpC=5S=gmail.com=markuss.broks@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D48C38142
	for <soc@archiver.kernel.org>; Sat, 21 Jan 2023 20:17:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 42DF7C433D2; Sat, 21 Jan 2023 20:17:31 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 69A5AC433EF;
	Sat, 21 Jan 2023 20:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 69A5AC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id v6so21808049ejg.6;
        Sat, 21 Jan 2023 12:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+5bO+lWD89GR1evsBX1z7xFkVso1S4GR3FB8mwTo4k=;
        b=kYJDFo0cXdVHqzzZoGnC0BoLwbh2tQcScjIRh2HB9SS7igVrkOe/Pq262tcFZINKgN
         9mPs6cXkhMkMGQ1v5cjmzOmcyOAB4nN6Ye1gBQlwxYYr/DEhvOGxVkqrQ2Y6WlwsIUwH
         uho6W1+zDU1Ttx/wRaR9X9o9vlSLbs7FYane2M9d3jTR+kn2pzZeXM2LHwcy85+3D5Xh
         Hs1QloP/Uu7RQhRHWfnyUu+DsVCCAIT+Ybais8rSTJcu1ZreHodwjCBDvStC4XXgkP0e
         9tHTd6kwX2ZyPdGZOfVxfWGi8UsHtgcjyhxZlkJ1LfqnliQdKOQFk4FOgDprguCu3Qw8
         j3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+5bO+lWD89GR1evsBX1z7xFkVso1S4GR3FB8mwTo4k=;
        b=3EO9fsUAhqMAO1yJNCdELTuts3AeRhpV25QGKkJ5hcy/c7sBI9/thBw26X0KZ8FZFT
         7rYnDB9/m9KgwUYtzivdZ2zrKZjVKB7eZPL6Pu0orgUbXc2SQqqUQwAG6mqhfMy00BuF
         H0ak6FXcvtO6DUnDOqD/LQZ6eVNGH70GOo08sbMcfCsqCgc73vJaHIaHy8dglo4vGk9t
         uOUJsnyRtyn85rw4oynJkC2R1E21CYppEQ21WXrvTeQDlnFkcjbkpY0bltkRQgwRJgOS
         qLH0CO4pQ/FnRSesN0612M5eJtkHH/K7QliRi7SliwaHs/AH3SwlPFUbSCmXxcHw+sw0
         kXyQ==
X-Gm-Message-State: AFqh2kpCSqeopIlROvT9mOVcwGs9T0rrVscqAR70IrvJzoxa2F2CW2xP
	XUVBGgFiBR505r7CD7/k/qQ=
X-Google-Smtp-Source: AMrXdXuVinXxRzJD+kAu5PdzPPK+NSGlS1nS0Xhb5JPeJW7Y7+FP4XK6HYu0k7IOFsNsuzFpguJL/A==
X-Received: by 2002:a17:907:8b8a:b0:82e:a57b:cc9b with SMTP id tb10-20020a1709078b8a00b0082ea57bcc9bmr37867425ejc.24.1674332248621;
        Sat, 21 Jan 2023 12:17:28 -0800 (PST)
Received: from localhost.localdomain ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id p4-20020a170906614400b008512e1379dbsm16599493ejl.171.2023.01.21.12.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 12:17:28 -0800 (PST)
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
Subject: [PATCH 1/2] dt-bindings: arm: samsung: Add compatible for Samsung Galaxy S5 (SM-G900H)
Date: Sat, 21 Jan 2023 22:17:20 +0200
Message-Id: <20230121201722.46636-2-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230121201722.46636-1-markuss.broks@gmail.com>
References: <20230121201722.46636-1-markuss.broks@gmail.com>
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

