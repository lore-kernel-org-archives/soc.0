Return-Path: <SRS0=EM81=5U=gmail.com=markuss.broks@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562CDC54EB4
	for <soc@archiver.kernel.org>; Mon, 23 Jan 2023 22:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0DE06C4339C; Mon, 23 Jan 2023 22:23:48 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2D781C433D2;
	Mon, 23 Jan 2023 22:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2D781C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id v30so16369192edb.9;
        Mon, 23 Jan 2023 14:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+5bO+lWD89GR1evsBX1z7xFkVso1S4GR3FB8mwTo4k=;
        b=q3R3mveKXdn4uJ64cZusX7blrGYp2dJl7R11YiLUuMc0+huoKvlPghpaXoPbx7LOD5
         f7tjPx7gvRvz3VaoyNWtcLEWUYK/fjsUace9cPfvIWKQOzG0IAObGTGwhtgGTeSfq8bz
         L8saLKtPuDIGp4gyvk9nBimsMoomMWodQDYDBxVvN/AXLajfXHc+Hw+ESjjqY5bojlL4
         j9GUcmROnpQ63VMuOJ6LjcmvS20PusonM57bvS7jY9/Fh3zDhj46YaFQlqBK2acX16JI
         BSJeHG1k/JLlQI5Wvx3YFMvklsoSSYfaT/8RkEJfYTrxSqtRetiBxyvh1Gt3xcCw36xe
         Ynag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+5bO+lWD89GR1evsBX1z7xFkVso1S4GR3FB8mwTo4k=;
        b=qM2W8uMZB0sh12XygFUYRpCkdPaSJuSVVNTLl08vi/eaXks6iSqvWsmEg2LoYx6R9M
         UOeze0uDNjzGho6iweZ+m+hkcIXZ9+oYTZwe8KVhpRb7cVEeMecanCzTceCZ5e5YFNx/
         v+baZFM+hni62HqEnXzZ04tfD6kjpOpxyDolYy7TpFhyTKSYvk02psuLZb0x4dLa0K0A
         H1EruEhlzdQK3BbsANe/5NFuDG7BfHax4fX0/j+CLoaLondy6TO5XB41HcerVTD+RzIu
         BCDQjsbnjpjeEA8vAA0VNLQUK91eE9QlkKci2QY/9JrX/5n95oUS7jJjUkY0jY7G1THS
         3vwA==
X-Gm-Message-State: AFqh2kpzwgFPYsMilKl6MVLN2rjV1jh/ipjMNdMAcVN8uKdw37YCGvC5
	6jOiOhX/idrKUbwdnyJkNnA=
X-Google-Smtp-Source: AMrXdXvSO0IyLPNMJR3iiw3rnDchFPgagImVepzeQIww70ZaipEBQXOolz5KRnekx/P97rYwpbk/UA==
X-Received: by 2002:a05:6402:401b:b0:46f:d386:117d with SMTP id d27-20020a056402401b00b0046fd386117dmr31299696eda.33.1674512625322;
        Mon, 23 Jan 2023 14:23:45 -0800 (PST)
Received: from localhost.localdomain ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id l19-20020a056402345300b0049f5ab4fa97sm256928edc.86.2023.01.23.14.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 14:23:44 -0800 (PST)
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
Subject: [PATCH v3 1/2] dt-bindings: arm: samsung: Add compatible for Samsung Galaxy S5 (SM-G900H)
Date: Tue, 24 Jan 2023 00:23:27 +0200
Message-Id: <20230123222329.13994-2-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230123222329.13994-1-markuss.broks@gmail.com>
References: <20230123222329.13994-1-markuss.broks@gmail.com>
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

