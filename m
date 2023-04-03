Return-Path: <SRS0=Z6O2=72=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BE0C76196
	for <soc@archiver.kernel.org>; Mon,  3 Apr 2023 07:42:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16D03C433D2; Mon,  3 Apr 2023 07:42:30 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 049FEC433A0
	for <soc@kernel.org>; Mon,  3 Apr 2023 07:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 049FEC433A0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id l27so28264726wrb.2
        for <soc@kernel.org>; Mon, 03 Apr 2023 00:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680507747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nAqvm5zsozuKX98Wuo0u9Kq1oEhbjhsKVQ5yonQAyjM=;
        b=FP9x/tmhDk46p4CDKJ0YJ/jBwiTSwINc+JTp1WfWI4qFoQVV67S55Zrk2ZA70+5kCw
         qafzZoitSidQX3Ltjamyj5jCPNxJZCTvrmO2UvKiD2DuDj4kf8JARnCwZFrlLUM9eg71
         jmV0mVxcgLy7gv5tXH1IpsA8NhIYuY8a4xUk1ugnHwCv/vRVJfMkG57r+73Xwc48hbGd
         ovs713IvgGeOsjV2xGPm1+txak5cfvuHRtDZ/4yz3k+QnMoAnro7jVceOuzyYJKQbfte
         cTzg2lS4oc4V0SoAyTmd8JjVbC68Q9MWvMIFNDIlTsROMeM9nZd4c0YIvXT472IME14y
         ZM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680507747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nAqvm5zsozuKX98Wuo0u9Kq1oEhbjhsKVQ5yonQAyjM=;
        b=7j9CA8IeP69nF8oJh1lOfvPpg2RxTq0wFWf0MmgVYCs1EWcfuHO42nB0PeGoVSZV1E
         jDurTNinYFMqLUNTyGVxVwqn0z+t5cxf2gE5lFx+8E0uTz2KbGsw7ZLHHc8YCPAy2WUo
         4GxX8ZAhkU6x+GG0w+Y1xulMuuXpWgpUpi819i8wKiBmtGSpzgtlQ7G6A/mVmF6icw6K
         eSD0xGMHAgF9R5un2qWvvfdrg0SU4w+LqrPCbCEYpImV6W2gAnOIW0GGjqZ4QaqnZNKH
         zJ9p+ziRYy7tTfNbBVqkFL589ZX2EAJ16/Bd8UaSWrrbgd1cFWcCDDb+HkaxVNkXqi4r
         IgYg==
X-Gm-Message-State: AAQBX9e0JkcAjJCY/xeXDA2sCOySmU/OUgvwDh0/JHYtE01OciR/eED+
	pq2crxc3tmPhHDsDFxt4Z+bvCA==
X-Google-Smtp-Source: AKy350Y5YpMGRudkwfYwF/b6z+JRM70k1GBG0D+lQ+p/MhL0fYtNJwcfD2+Kyjml1kg/BmHt12HCjg==
X-Received: by 2002:a5d:58fb:0:b0:2cf:f0d9:6227 with SMTP id f27-20020a5d58fb000000b002cff0d96227mr23697805wrd.0.1680507746968;
        Mon, 03 Apr 2023 00:42:26 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q14-20020adff94e000000b002e62384d17dsm8180482wrr.21.2023.04.03.00.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 00:42:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 03 Apr 2023 09:42:21 +0200
Subject: [PATCH RFC v2 4/4] dt-bindings: arm: oxnas: remove obsolete
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230331-topic-oxnas-upstream-remove-v2-4-e51078376f08@linaro.org>
References: <20230331-topic-oxnas-upstream-remove-v2-0-e51078376f08@linaro.org>
In-Reply-To: <20230331-topic-oxnas-upstream-remove-v2-0-e51078376f08@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-oxnas@groups.io, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Daniel Golle <daniel@makrotopia.org>
X-Mailer: b4 0.12.1

Due to lack of maintainance and stall of development for a few years now,
and since no new features will ever be added upstream, remove the
OX810 and OX820 SoC and boards bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Daniel Golle <daniel@makrotopia.org>
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

