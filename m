Return-Path: <SRS0=GM+A=OC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A67C3064D
	for <soc@archiver.kernel.org>; Tue,  2 Jul 2024 06:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55567C4AF0D; Tue,  2 Jul 2024 06:54:09 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51E87C4AF0A
	for <soc@kernel.org>; Tue,  2 Jul 2024 06:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51E87C4AF0A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52cdd03d6aaso4332463e87.0
        for <soc@kernel.org>; Mon, 01 Jul 2024 23:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719903246; x=1720508046; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aPayim47aM+LtqGl1M3szBrZKoorTqLov3sXX96ze58=;
        b=Y28qbPhjEZlEjci8uAtZVBO3gnVaCUCTeOx5QZdPRztB312J2XBSPEPKmFVZ2b6Kwb
         8tT1IWQWHQhIrENKw1EzRkqb9fLOeLTX3CDvxlWsVASKTFhgxcQlbJE3Nr2UF+RzVj7Z
         y1Vwt/xHLKRQoz5HDFXjLtibMz1IBlnwGwbymnP4tTleF/V2cfa1YE/NH0EqWTPpyLSZ
         6Jjg0EdF+jHDw+qZjP9KfjMQwaIedQvlSR7+SU8UNfQxe1+vLGFPNel4TXhOHKqppKCI
         WpXmqwZqNitNkEA5VaOvlnt3jqlZZievM8hLT3lUgQeN4H8l2gXVTA4Dg/4uibabiWyu
         2vwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719903246; x=1720508046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aPayim47aM+LtqGl1M3szBrZKoorTqLov3sXX96ze58=;
        b=mhuTzr5d3jQDOdK/0351but7HEyT5hfQHU5YC4bXq1GvQTmB8PQdRnDjb85J94i7MK
         Z9EkOqFWzQVIAlpHtJ2QEK8sJFYY7v9NSapJXYy3aPrJhMIG4w5zpnd99/oZg8jh5gAY
         xgXYOXnWT/hN41wCOX+VEuYSy8tRDTPYEqWpz+9z6OwmP5+uynxr5aAmtW6o1lorWxP1
         K61HDJH28PPIeBlByP8TE5ejoPJd92cqw3tQafFZvFSO8RMC/Q0rLFXekNkt+PyUlPyi
         MRo0b7jDmMzbmtstU/uo1aaf7XGzCSlHf7Q8OveK9BS6cc0+eCzKUJhXvvCCK5UIVuHA
         +UJg==
X-Forwarded-Encrypted: i=1; AJvYcCUrM/u8TSoM1x5OnK5o4l+2tWVpRtzvRPuXaaqADoNweUeUyl06j306YZhN+dW/yvyABdY+d2wj2EyXc0YY9A==
X-Gm-Message-State: AOJu0YyqrURndQZ1P7bQrGu2EALySQJFBANeV+5NCjuPwYMAIKT0+j0G
	s6SNH8TiH9mDOENDxLQ4t8DMpl+546jaFfhI5GTEQsiI21mj3DibGI3dwlNVJec=
X-Google-Smtp-Source: AGHT+IES6oCV7lFa55TfIKn3mKOEnUfl5v56L8EsOq8L/09ycBBlDNrajlhl0366aBH2Ud/+5atJSg==
X-Received: by 2002:a05:6512:282c:b0:52c:e01f:3665 with SMTP id 2adb3069b0e04-52e8266ef2bmr6073735e87.25.1719903245463;
        Mon, 01 Jul 2024 23:54:05 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af55aeasm181446185e9.17.2024.07.01.23.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 23:54:05 -0700 (PDT)
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
Subject: [GIT PULL 1/2] arm64: dts: various cleanup for v6.11
Date: Tue,  2 Jul 2024 08:53:57 +0200
Message-ID: <20240702065359.7378-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.11

for you to fetch changes up to c0304446611536a771462f27d98db6775d222b38:

  arm64: dts: apm: Add dedicated syscon poweroff compatibles (2024-07-01 10:33:07 +0200)

----------------------------------------------------------------
Minor improvements in ARM64 DTS for v6.11

Few cleanups and improvements which were missed by their maintainers:
1. Spreadtrum: correct PMU nodes - split per clusters.
2. HiSilicon: add dedicated compatible to syscon node ("syscon" alone is
   not allowed).
3. APM: add dedicated compatible to syscon node (binding applied to MFD
   tree).

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      dt-bindings: soc: hisilicon: document hi3660-usb3-otg-bc
      arm64: dts: hisilicon: hi3660: add dedicated hi3660-usb3-otg-bc compatible
      arm64: dts: apm: Add dedicated syscon poweroff compatibles

Rob Herring (1):
      arm64: dts: sprd: Split PMU nodes for heterogeneous CPUs

 .../hisilicon/hisilicon,hi3660-usb3-otg-bc.yaml    | 46 ++++++++++++++++++++++
 arch/arm64/boot/dts/apm/apm-merlin.dts             |  2 +-
 arch/arm64/boot/dts/apm/apm-mustang.dts            |  2 +-
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi          |  2 +-
 arch/arm64/boot/dts/sprd/ums512.dtsi               | 14 +++++--
 arch/arm64/boot/dts/sprd/ums9620.dtsi              | 14 +++++--
 6 files changed, 69 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hi3660-usb3-otg-bc.yaml
