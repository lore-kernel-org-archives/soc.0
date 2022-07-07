Return-Path: <SRS0=7j7m=XM=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C61ACCA479
	for <soc@archiver.kernel.org>; Thu,  7 Jul 2022 08:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D34F8C341CA; Thu,  7 Jul 2022 08:04:19 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9394AC341CB
	for <soc@kernel.org>; Thu,  7 Jul 2022 08:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9394AC341CB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id e12so29776416lfr.6
        for <soc@kernel.org>; Thu, 07 Jul 2022 01:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z5ssFYeQl7V2JJ54NmhIzC4kevK2DFEIrlaz+FamJ4o=;
        b=nQyKLogTPnRG/buW57rEKh/p4nVI47DT4almuA9zdgse7ZnePqyIwZragdTmyL5Zkk
         Yp09663+gJTNo6qUACiFo0ItN4bQo+s4TS0rCPM2pDXCJPJX25HqaZZJNmvGB/j31Aq1
         aS3fWZ/H1HJmLrZV6uu9kUzNZlxk3eDVOBZXpwg0A10QMvW12iLmccF1dNE1rlP9sVtl
         Vq+JSBAzqzBEd5oPAnKpx18289Y2MSIz3mUyK+RGsBHrAhfB3FRo+SQj5UXSSaTGKfPM
         04k1TMBLdFVVsLPv9IxxFCW4Wh1/EQOusbiWmRBRv29+eVjtV9XMLbhofx+RqjB9ebGE
         QFsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z5ssFYeQl7V2JJ54NmhIzC4kevK2DFEIrlaz+FamJ4o=;
        b=W1IBLBFRnHaj6IMdYZQE4ATP/5LPJCM5LtBcO6CN5B0IKcmEtZj3FMI8dow0sKDo0Y
         rcahCTPhhS/kDLsm5S/tboIJ356O/MPGSJaA9NqKWXR9UKW1NRKPt5wE4uJUUAQtRbwU
         HQqGAgixRLYTc6zBzCBZVVRUBkd+d519NdSl5EXsof44GNceQ0upedRryIdHr2Xr649V
         klER2in2gMHStlQzn5UhFWO7XwjLv5gskiuYja/ZFFAPhNZj9aDrUaJ0wC/yMrM6389x
         afziqthcFXbAStZ0vW7O6vD0XdiQHeQ3ONFvuhRPYLccJbBvq7D3VpBxxTXBd9OazLuA
         ha6g==
X-Gm-Message-State: AJIora+f+6fu2YbhX2SiT65Bu0JHReZAj+4sywqU6v2+jnxoAxbrJK9s
	2XiUw5OohisD+xW8vWFJWfvblA==
X-Google-Smtp-Source: AGRyM1uBT3p2me4ed88jdqAaeNxgZQVJKSTxRZJFJljooGEjRoS8yamieK3o3TdtSIRerorKAVhrTw==
X-Received: by 2002:a05:6512:3c96:b0:488:c36d:b336 with SMTP id h22-20020a0565123c9600b00488c36db336mr623077lfv.410.1657181056637;
        Thu, 07 Jul 2022 01:04:16 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id u16-20020a05651220d000b00478ea0e4f66sm6702687lfr.169.2022.07.07.01.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 01:04:16 -0700 (PDT)
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
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] arm64: dts: samsung: 2nd round for v5.20
Date: Thu,  7 Jul 2022 10:04:08 +0200
Message-Id: <20220707080408.69251-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220707080408.69251-1-krzysztof.kozlowski@linaro.org>
References: <20220707080408.69251-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit 1a4f20cab6411c6e73dd22d28b6595b728cc2829:

  Merge branch 'for-v5.20/exynos7885-emmc-clk' into next/dt64 (2022-06-24 09:12:47 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.20-2

for you to fetch changes up to 1ba1fd7d775dbccf43951671a7331c561408e72b:

  arm64: dts: exynosautov9: add usi device tree nodes (2022-07-05 12:34:36 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.20, part two

1. Correct SPI11 pin names on ExynosAutov9.
2. Add more USI (I2C/SPI/UART) devices to ExynosAutov9.

----------------------------------------------------------------
Chanho Park (5):
      arm64: dts: exynosautov9: correct spi11 pin names
      dt-bindings: soc: samsung: usi: add exynosautov9-usi compatible
      arm64: dts: exynosautov9: add pdma0 device tree node
      arm64: dts: exynosautov9: prepare usi0 changes
      arm64: dts: exynosautov9: add usi device tree nodes

 .../bindings/soc/samsung/exynos-usi.yaml           |    8 +-
 .../boot/dts/exynos/exynosautov9-pinctrl.dtsi      |    6 +-
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts   |    2 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       | 1087 +++++++++++++++++++-
 4 files changed, 1093 insertions(+), 10 deletions(-)
