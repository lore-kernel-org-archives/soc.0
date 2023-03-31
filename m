Return-Path: <SRS0=bmCH=7X=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2B0C77B71
	for <soc@archiver.kernel.org>; Fri, 31 Mar 2023 08:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 018B5C433A1; Fri, 31 Mar 2023 08:34:55 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 33140C433D2
	for <soc@kernel.org>; Fri, 31 Mar 2023 08:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 33140C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id j24so21631046wrd.0
        for <soc@kernel.org>; Fri, 31 Mar 2023 01:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680251689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vqQMlPFjpwyJDFMp/Q+5qT+SRMNMN9WWVCzGVB/CCjE=;
        b=Z8O/YlVKluZ3frIjBWHinHyf35Hl9tXFgyrb2DvpZeBIUlCdj7trg1eKmtw4ORy470
         mjOyF9tBJQi2Ey8HheeRE65rpBTqzTq9i3mTVsYp3fwCYypvkM8U5gPx6qo1NyW4w1AT
         RfYhDtpld7nV252R85LScU8iMrj1F28/lGNNhzXDXFzbXr5XuNt/qTx3rFv33Dysc9qj
         ng2S0S7/e4gg8Qc0+fK2hotP9nkIwGeMnI0zHMmxfcMcDiw6soURCd1MEiMLog9EoaiT
         Chmx1245yKaUYuvICD7WIsPKuFiAmHnlmK5dBY5gRvaOBgG75ZXytjZ5wMeIuLRKYD2k
         uZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680251689;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vqQMlPFjpwyJDFMp/Q+5qT+SRMNMN9WWVCzGVB/CCjE=;
        b=12+YipeJOqfegjsPtHcBJvmvlrGH3WAyRlvze1v9FFCu8VeEvHiJY20zxmHLVHt4pb
         oIgPoFJEEQa3fF+u0bfKj/DmXP8KTNUDOX8y/HK6v36LKXo0845epXamMcdV6KNlVmsw
         0qZ3ZkjrNvThJlcvwE/gCm9YYF4Hmtd1AAeNDSamphPpgYGVPPQGnXPQ3Y59GqWAwnBn
         EemB+Aebxv4nGduvqrHfec1SWXXip1fcQdOa6HXmkb51In9hSwAjN5awW7ukBVAdLoaU
         v/yRHH0278uL1go6+E9v+FA98FBEL3AE2Mdv8qIWyrh0HXFlL7OkgXDdqJxJ9XB99gnY
         lKzA==
X-Gm-Message-State: AAQBX9eqx/DWEMaWFiwPTjfZ5wqndLtFptfhIK6cikEje+ZS0ajiRLAF
	dfH6QKk/llTt6UBGLLgAW83IWQ==
X-Google-Smtp-Source: AKy350aYMRhuGCU7lgJkqotrX72DL9blN95WJq8/pg0rFFj2/jBzU25Plf3PTEmdwgAKOY8ASbmEgw==
X-Received: by 2002:a5d:5742:0:b0:2d0:c37a:5ebd with SMTP id q2-20020a5d5742000000b002d0c37a5ebdmr19721443wrw.64.1680251689686;
        Fri, 31 Mar 2023 01:34:49 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d4e8b000000b002cde626cd96sm1563153wru.65.2023.03.31.01.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 01:34:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Mar 2023 10:34:42 +0200
Subject: [PATCH RFC 04/20] dt-bindings: arm: oxnas: remove obsolete
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230331-topic-oxnas-upstream-remove-v1-4-5bd58fd1dd1f@linaro.org>
References: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v1-0-5bd58fd1dd1f@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Russell King <linux@armlinux.org.uk>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Sebastian Reichel <sre@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-gpio@vger.kernel.org, 
 linux-pm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1

Due to lack of maintainance and stall of development for a few years now,
and since no new features will ever be added upstream, remove the
OX810 and OX820 SoC and boards bindings.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/oxnas.txt | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/oxnas.txt b/Documentation/devicetree/bindings/arm/oxnas.txt
deleted file mode 100644
index ac64e60f99f1..000000000000
--- a/Documentation/devicetree/bindings/arm/oxnas.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-Oxford Semiconductor OXNAS SoCs Family device tree bindings
--------------------------------------------
-
-Boards with the OX810SE SoC shall have the following properties:
-  Required root node property:
-    compatible: "oxsemi,ox810se"
-
-Boards with the OX820 SoC shall have the following properties:
-  Required root node property:
-    compatible: "oxsemi,ox820"
-
-Board compatible values:
-  - "wd,mbwe" (OX810SE)
-  - "cloudengines,pogoplugv3" (OX820)

-- 
2.34.1

