Return-Path: <SRS0=sZ/2=TJ=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E4DC4332F
	for <soc@archiver.kernel.org>; Sat, 26 Feb 2022 22:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8919DC340F7; Sat, 26 Feb 2022 22:01:32 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD535C340F3
	for <soc@kernel.org>; Sat, 26 Feb 2022 22:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CD535C340F3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D87AF3F1F3
	for <soc@kernel.org>; Sat, 26 Feb 2022 22:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1645912882;
	bh=wEJI0tsPJ58dwyE9Xp27AwQHbd9ZGSbsPqkX6S6UniU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=GCO0jyRrETxi/dCv+z62QIADJXsr9ALhRo6qPp8zSNp1kDlMkYQJdS6siWDRyQqOg
	 PnXn2f0JZioy3OcbtEWThcuhXDEtvJ8hyGSvx6lgqmLCvyo8hE/oz3Xwyrq6ic9VPS
	 Tl+EZpiD4NS89W3PXUQsRYSc+icOK9sy+6h+hKEz/MQdvKxqndvKHbn+R93Jgt2VnK
	 2lmDRr4W/k8XQHTm8WSAU/FzTHzuXn1RNeTe0wk/VAMvw3DknIQ36d3sXbW1fv+DLS
	 gt13333gIEeE8R/GQSGi+DeRLeKFde1uX4T05enDzHuwo+nheoB0Rh91QOI/gtk/4r
	 KrRpgp0rdOqyQ==
Received: by mail-ed1-f71.google.com with SMTP id l24-20020a056402231800b00410f19a3103so3423880eda.5
        for <soc@kernel.org>; Sat, 26 Feb 2022 14:01:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wEJI0tsPJ58dwyE9Xp27AwQHbd9ZGSbsPqkX6S6UniU=;
        b=GIzc3UWda8CXsmOVbhvRCSKPy75P4kx06PDkDZH+9gAenCTfHnaWgTF58sB/UpM1iW
         3h8UF08zJlDjD/f/4SlNouBcegydf1kXqUc4pUhbCaPysX7ks6EyaqijCcu4Kcsju+kW
         GmnTLTJjWmfg5RD9Xoc1SX8o4v21VGIv76wDhFelcBmtIbDgTDT3MUzAbwWWy2j1gjfe
         nfmq/x+t/O09U6AqVh338Agxv3khBSrT/skmty5wGfddNEPl3riTanXz/bze8T6pEY5r
         adRgRkZ1tD4+MfE0AIm0DC07fUNmmDebV1Jh2YVCZ3MlrySFIB5qwRjrgXXZzrnK6mTA
         omCw==
X-Gm-Message-State: AOAM533hS1/aaj4TVZywrQIanmpEa1KV5RmkdUgNa+d+OVbiVs2BPFpd
	REguQhP54ZdLV/ql49BTLhfUnGvbyyTHQmK4wbofOQkrBtYYAvan2HqMekglSFmFy5IUlM4Hxwe
	ZKGrPXMGAKunPZx9B0NcrY38=
X-Received: by 2002:a50:fb89:0:b0:413:94d8:7c56 with SMTP id e9-20020a50fb89000000b0041394d87c56mr3352378edq.143.1645912882515;
        Sat, 26 Feb 2022 14:01:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzEBhuaA6wu2knYliwBM0vfBK3OqsI4wC3+TjCY0HhYvYRPRyZBWMQcEQwW1VhP271dIbvvaw==
X-Received: by 2002:a50:fb89:0:b0:413:94d8:7c56 with SMTP id e9-20020a50fb89000000b0041394d87c56mr3352361edq.143.1645912882295;
        Sat, 26 Feb 2022 14:01:22 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id s2-20020a056402014200b0041285556b7csm3497424edu.72.2022.02.26.14.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 14:01:21 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/3] ARM: dts: samsung: Second round for v5.18
Date: Sat, 26 Feb 2022 23:01:14 +0100
Message-Id: <20220226220116.13452-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit f5b721d2c91144b7c494a05003fc840f1607e876:

  ARM: dts: exynos: use generic node name for LPDDR3 timings in Odroid (2022-02-05 13:04:43 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.18-2

for you to fetch changes up to 7cdfe3b3b60c89f0e12e8ee194a7cfbfd46515dd:

  ARM: dts: exynos: align PPMU event node names with dtschema (2022-02-18 14:17:40 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.18, part two

Various cleanups after introducing DT schema: adding missing HDMI
supplies and aligning PPMU event node names with DT schema.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      ARM: dts: exynos: add missing HDMI supplies on SMDK5250
      ARM: dts: exynos: add missing HDMI supplies on SMDK5420
      ARM: dts: exynos: align PPMU event node names with dtschema

 arch/arm/boot/dts/exynos5250-smdk5250.dts |  3 +++
 arch/arm/boot/dts/exynos5420-smdk5420.dts |  3 +++
 arch/arm/boot/dts/exynos5420.dtsi         | 16 ++++++++--------
 3 files changed, 14 insertions(+), 8 deletions(-)
