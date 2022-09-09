Return-Path: <SRS0=6vKs=ZM=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF15ECAAA1
	for <soc@archiver.kernel.org>; Fri,  9 Sep 2022 15:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 94969C433D6; Fri,  9 Sep 2022 15:30:48 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B11F0C433D7
	for <soc@kernel.org>; Fri,  9 Sep 2022 15:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B11F0C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id z23so2298207ljk.1
        for <soc@kernel.org>; Fri, 09 Sep 2022 08:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=6pvfiV9+INyHP8EaVtPQ3L9iXK4tIAduG9OAalFumKI=;
        b=hwk1svK+XLopgPNDQPvZJKu/HyCXmOIB1A8uXEuCruJEFDkKPfXEfTKn3DrP2Is4eG
         ZlKFNn226WYx/iEBQwxLJvV7/VBZO5lpkxNOMYKaXRYEeAMXR5i18Zs1kEHBcM67gJIr
         u1zuscueTlI1HpWz/ushy+7rUzoOFWprY7sqdfKySHB0bnDvAdRVtf6yNtrNWVQTRc/g
         g0xEE3VPY4fKF0A21tgXgBMwzfsz8t0xYCCZZgpOFbL6nCLY+y/tBrd2mmMR3+2AHrhg
         q3wxi6mRJdLKtbst0PcJTVSMrSJ/J38Dqn0WynOlhEcI8rMyEFG4eBB7ZXcMgCAEPl/z
         rCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=6pvfiV9+INyHP8EaVtPQ3L9iXK4tIAduG9OAalFumKI=;
        b=Mkkg0+jmvsj69/qpp1mfyuVgvse8aOF2PLO+a5azn9WQgek73ZhIxnfntN7b6LJCw9
         GxMttURui+LzZsO3XEw+7kx4gTb/PJlXEZPGjwCg6TNSfCUVV6wWQeVSktWAwvvLGY1g
         rV9JFYi61en0hjsN9NDvweoyshhW/DTxD73/fBQq+H7P3mpdIXtbu24wuiSHa8UHiC8p
         nSHxhg4HJqx8HsaiuqOxmbu+bVK6SoExjXP582g7aD3izU6DTiBlF4zbsUy+lqZOe6lZ
         qo6cuW60gyjvf7v7sTqDmpsOAsWOqHGtk6iV4Ms1+01L01Xl6+y65Rp1X3/wWAJlJ+2w
         lMaA==
X-Gm-Message-State: ACgBeo396NoKR90qWd+AAkaSUbdUBp39s9vCZKcxyMGw3seBSUnNcP4k
	5zx15rfkBvuOoxTQxUjCWWPgKw==
X-Google-Smtp-Source: AA6agR4n5KrMjwQPqMuO3rRwLQzPyLiIDI0c8ve44qmA15f6wlpOq4lsqfMl9r91o5ooRpyyA4R9nw==
X-Received: by 2002:a2e:8344:0:b0:263:8194:9a83 with SMTP id l4-20020a2e8344000000b0026381949a83mr4287428ljh.368.1662737444747;
        Fri, 09 Sep 2022 08:30:44 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 6-20020a05651c00c600b0026ac3fedd20sm117314ljr.86.2022.09.09.08.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 08:30:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH PULL fixes 1/4] dt-bindings: memory-controllers: fsl,imx8m-ddrc: drop Leonard Crestez
Date: Fri,  9 Sep 2022 17:30:34 +0200
Message-Id: <20220909153037.824092-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Emails to Leonard Crestez bounce ("550 5.4.1 Recipient address rejected:
Access denied:), so change maintainer to Peng Fan from NXP.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://lore.kernel.org/r/20220817065946.24303-2-krzysztof.kozlowski@linaro.org
Acked-by: Peng Fan <peng.fan@nxp.com>
---

Maintainer update for current cycle.
 .../devicetree/bindings/memory-controllers/fsl/imx8m-ddrc.yaml  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/fsl/imx8m-ddrc.yaml b/Documentation/devicetree/bindings/memory-controllers/fsl/imx8m-ddrc.yaml
index 445e46feda69..2b39fce5f650 100644
--- a/Documentation/devicetree/bindings/memory-controllers/fsl/imx8m-ddrc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/fsl/imx8m-ddrc.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: i.MX8M DDR Controller
 
 maintainers:
-  - Leonard Crestez <leonard.crestez@nxp.com>
+  - Peng Fan <peng.fan@nxp.com>
 
 description:
   The DDRC block is integrated in i.MX8M for interfacing with DDR based
-- 
2.34.1

