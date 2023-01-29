Return-Path: <SRS0=k7H9=52=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78700C636CC
	for <soc@archiver.kernel.org>; Sun, 29 Jan 2023 14:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 54671C433EF; Sun, 29 Jan 2023 14:45:32 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53C75C433D2
	for <soc@kernel.org>; Sun, 29 Jan 2023 14:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 53C75C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso1549873wms.5
        for <soc@kernel.org>; Sun, 29 Jan 2023 06:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYZkdrMXMeEPg3GRieLPg0wSSepZGYYAWur6SgaAHH0=;
        b=f/xa2DykNqZe9VBEt7kH6rje8ZlM1nq6aMa+BXbH1FRXonPH83eswZNQZiR0X9sI27
         oVVJpIfpxQrnIWl5qLewh2d2A4p6/HrqzziPJXn0EWtUitke8qm1Y24JpsTFTyWHPwKW
         R4v+uRMp/rZDSvQgw0mNm9frFii5skBtTyylrdSE3arfyZpOwynVqN2GmHow62e8GvNv
         OeoZUt6c+7RlJuroikcW1dO76u49I9lyYhHLgvaHQ1Fh5zEsVXNfMnCWHGtYjCCoEexL
         FVMsp9owevieL1ZNKr3Mmu1H06EonAaOw53+NWBELFf95J+JgvYNf5mhc91FHo+RO9KC
         ZtZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYZkdrMXMeEPg3GRieLPg0wSSepZGYYAWur6SgaAHH0=;
        b=btmSeUX8UGkJtahUZ4K3jqxWz9Qq2eEEmAQ3KW8bE+m+Lk7pZFB2BIQYR2S8Vb1nXX
         S+0oquuiAkBwxlQGINx9M+E56GJLzDOBin+oR1SXUuAxcZI0dZcnQopyeNsHK0JUAP6n
         tsi618qnuSiJLOxnPr8a4yQbroIeiCcdiOZ68v//rZr8rtr+k0H6YL3H8s+NCVMadNB9
         Rx5AR1YXbIutTVlojW/4LX9crASt+DpzgwHgPNSewDpyszEPC81XTtT5/Y2Vf15yFsti
         rtqRFsQvV/oFd4rLjYclZ9bbH8awYPOYFAQWGRWongAXnHIQuLAUy1AmnBG8n/6hgkYg
         RZ2g==
X-Gm-Message-State: AFqh2kqLfNG0cTYObTPcj8VnjNqJHvzOsd3zxOllOu/RFBLzLzn1Mrjm
	udDWBk5ryHJacNyM2o9+WDNPhA==
X-Google-Smtp-Source: AMrXdXue3XS92JSUvV0ZZZSgiZgiNQr2+KdurebgIrezvPcNpy5XTgtz5zRTNAYrFb+/sLmbcnTswA==
X-Received: by 2002:a05:600c:348f:b0:3db:742:cfe9 with SMTP id a15-20020a05600c348f00b003db0742cfe9mr46866684wmq.34.1675003529545;
        Sun, 29 Jan 2023 06:45:29 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m14-20020a05600c4f4e00b003a3442f1229sm14950038wmq.29.2023.01.29.06.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 06:45:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] ARM: dts: cleanup for v6.3, part two
Date: Sun, 29 Jan 2023 15:45:25 +0100
Message-Id: <20230129144525.5802-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230129144525.5802-1-krzysztof.kozlowski@linaro.org>
References: <20230129144525.5802-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Cleanup of several platforms, not picked up by maintainers. On top of previous
pull request.

Best regards,
Krzysztof


The following changes since commit 3a48b303d44a19d335910f825f9a8473c5ff35e0:

  ARM: dts: at91: align LED node names with dtschema (2023-01-13 11:38:33 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-6.3-2

for you to fetch changes up to 2ba4ff82f9dd312fb9f77168f159698c93f4841b:

  ARM: dts: berlin: align UART node name with bindings (2023-01-27 10:44:58 +0100)

----------------------------------------------------------------
Minor improvements in ARM DTS for v6.3, part two

Align UART node names and OPP table names with bindings (alpine, arm
boards, axm55xx, berlin, cx92755, dm814x, moxart, mstar, stih418).

----------------------------------------------------------------
Krzysztof Kozlowski (9):
      ARM: dts: mstar: align UART node name with bindings
      ARM: dts: cx92755: align UART node name with bindings
      ARM: dts: arm: align UART node name with bindings
      ARM: dts: alpine: align UART node name with bindings
      ARM: dts: axm55xx: align UART node name with bindings
      ARM: dts: moxart: align UART node name with bindings
      ARM: dts: dm814x: align UART node name with bindings
      ARM: dts: stih418: align OPP table names with DT schema
      ARM: dts: berlin: align UART node name with bindings

 arch/arm/boot/dts/alpine.dtsi             | 4 ++--
 arch/arm/boot/dts/axm55xx.dtsi            | 8 ++++----
 arch/arm/boot/dts/berlin2q.dtsi           | 4 ++--
 arch/arm/boot/dts/cx92755.dtsi            | 6 +++---
 arch/arm/boot/dts/dm814x.dtsi             | 6 +++---
 arch/arm/boot/dts/dm816x.dtsi             | 6 +++---
 arch/arm/boot/dts/integrator.dtsi         | 4 ++--
 arch/arm/boot/dts/integratorap-im-pd1.dts | 4 ++--
 arch/arm/boot/dts/integratorap.dts        | 4 ++--
 arch/arm/boot/dts/integratorcp.dts        | 4 ++--
 arch/arm/boot/dts/moxart.dtsi             | 2 +-
 arch/arm/boot/dts/mstar-v7.dtsi           | 2 +-
 arch/arm/boot/dts/stih418-b2264.dts       | 2 +-
 arch/arm/boot/dts/versatile-ab.dts        | 6 +++---
 arch/arm/boot/dts/versatile-pb.dts        | 2 +-
 arch/arm/boot/dts/vexpress-v2m.dtsi       | 8 ++++----
 16 files changed, 36 insertions(+), 36 deletions(-)
