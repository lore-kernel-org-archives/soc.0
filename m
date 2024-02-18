Return-Path: <SRS0=D6Du=J3=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD24EC48BC4
	for <soc@archiver.kernel.org>; Sun, 18 Feb 2024 18:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ABD44C433C7; Sun, 18 Feb 2024 18:21:52 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A55E2C43330
	for <soc@kernel.org>; Sun, 18 Feb 2024 18:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A55E2C43330
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33d509ab80eso49472f8f.3
        for <soc@kernel.org>; Sun, 18 Feb 2024 10:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708280510; x=1708885310; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJeQ4s/dF1xmsrXWqyzJPeUB9FNDeuqtjlU/RMGfQnM=;
        b=H+KWU0U4SPx6UzBmh7UGP+l1gPJVSfIehJnO88tE5hiWtpwHZOabnLBW63JT+MQsVK
         0L9xpXku+ynf1nVIa2BxaXyr8Zkj+Zp8fJR6EYXE9I0uHqN4vsuyaOXbGOBsgFKvUtRb
         28EFPNayAfgO3oKyCEqQoBQFqCNnl+ntEX2adPz8zUhtbmFVOpNpuZQjW5H/rAbRDVUX
         is/Hh46X/RPGkQ9hcO3ZRrb6M60Hz1lbKBGFTu1LWPD/SJpQMaAEPGzGPf9r+VClGe5Z
         WBOtekcdaEXWpBqYI5gMJrUNSFdEqLYriGD/ELsZuH/UQRMJrUBO8w99xyQsbntYxWF2
         1zNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708280510; x=1708885310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NJeQ4s/dF1xmsrXWqyzJPeUB9FNDeuqtjlU/RMGfQnM=;
        b=iZb7p1I87p3xrs5Eir+MsQcWdq6ui1GJE4gCnRzo0LV1xoiIMwmbMMDpVOC+wDTED8
         lziXIwuMV/Fq6NrF6h5+bSvwDlFpvZKaILMdtwSP5+FikG86xGrHIaOQ/wReiM4QyTjN
         ni1AU0Dnuq4Wq8xFQVuzYs/fz1F9FgUXitySHZowDCxJ6a/1uJmPpxy3iVy0U368v84J
         EUo0Aud6ClTF4sXNtIhwWHTX5peRgX5Hftz5Vkq/uSZ0mQGHwhh/VpKIxweqw4kaTCqv
         jR2UApJMfvwXjE45YE5R9UQqrSsS1bSvFFoDXj/j/gkt31t+3M/AM6F9D3E8jTYDq92W
         x5Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUeswrr0ebeiKl1zGilkCG1Hh6gokTS775/hhdMDZL3BPUsJLSXTimZoTIFd9i56ss3tH48F5tkZrsTDU0wnw==
X-Gm-Message-State: AOJu0Yz6KXNkGJbP9UwI6fvT6q6brGRAk7BOAcivztzWiHH7efPQTm3H
	cF8aLwA36QixwdgfgIGSrCZHBowk63tc7Qyujf4B0zNZR9N7L+DHimhATTQOxje1K8wcAUVclz6
	mJ/Y=
X-Google-Smtp-Source: AGHT+IFGBwlBDblusdfCCYJ6QOIzpX9Y/EbyxKJg0nx5peFXbTPuSanMLt+OiKKeIiEY8GGMt5q+Zw==
X-Received: by 2002:a5d:430d:0:b0:33b:65b3:e51b with SMTP id h13-20020a5d430d000000b0033b65b3e51bmr7725445wrq.48.1708280509886;
        Sun, 18 Feb 2024 10:21:49 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id s3-20020a5d4ec3000000b0033ce06c303csm7867116wrv.40.2024.02.18.10.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 10:21:49 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/4] ARM: dts: samsung: for v6.9
Date: Sun, 18 Feb 2024 19:21:40 +0100
Message-Id: <20240218182141.31213-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240218182141.31213-1-krzysztof.kozlowski@linaro.org>
References: <20240218182141.31213-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.9

for you to fetch changes up to 60f1164e21cc04666d23b63e1153af74e7a5650d:

  ARM: dts: samsung: exynos5420-galaxy-tab-common: add wifi node (2024-02-07 16:22:01 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v6.9

1. Disable thermal polling by Linux in Eynos5422 Odroid XU3 boards,
   because drivers implement now proper dynamic trip points management.

2. Mark crosc-ec-spi in Peach Pi and Peach Pit as wake-up source, to
   reflect the hardware capabilities.

3. Samsung P4 Note (Exynos4412): add accelerometer.

4. Samsung Galaxy Tab (Exynos5420):
   - Reduce available RAM to avoid conflict with TrustZone.
   - Add WiFi on MMC.

----------------------------------------------------------------
Henrik Grimler (2):
      ARM: dts: samsung: exynos5420-galaxy-tab: decrease available memory
      ARM: dts: samsung: exynos5420-galaxy-tab-common: add wifi node

Mark Hasemeyer (2):
      ARM: dts: samsung: exynos5420-peach: Enable cros-ec-spi as wake source
      ARM: dts: samsung: exynos5800-peach: Enable cros-ec-spi as wake source

Martin Jücker (1):
      ARM: dts: samsung: exynos4412-p4note: add accelerometer and gyro to p4note

Mateusz Majewski (1):
      ARM: dts: samsung: exynos5422-odroidxu3: disable thermal polling

 arch/arm/boot/dts/samsung/exynos4412-p4note.dtsi   | 51 ++++++++++++++++++++++
 .../dts/samsung/exynos5420-galaxy-tab-common.dtsi  | 34 ++++++++++++++-
 arch/arm/boot/dts/samsung/exynos5420-peach-pit.dts |  1 +
 .../dts/samsung/exynos5422-odroidxu3-common.dtsi   | 16 +++----
 arch/arm/boot/dts/samsung/exynos5800-peach-pi.dts  |  1 +
 5 files changed, 91 insertions(+), 12 deletions(-)
