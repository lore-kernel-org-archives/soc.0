Return-Path: <SRS0=PH9V=HA=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B904C433DB
	for <soc@archiver.kernel.org>; Fri, 29 Jan 2021 19:33:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0C31B61477; Fri, 29 Jan 2021 19:33:14 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9739564DE3;
	Fri, 29 Jan 2021 19:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9739564DE3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=thierry.reding@gmail.com
Received: by mail-qk1-f182.google.com with SMTP id 19so9875115qkh.3;
        Fri, 29 Jan 2021 11:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UjJUcK0eKglR2tl7QF1+vtD7OR9nEVOsWRf/PyeTMJk=;
        b=CHwKYzHK9FxB/mZ0nAGkH39ZGKHXe2WcgZrmYQcnWRKU/0hkZ0bLMJ75HR1sI5PH4F
         kBzvszdHTtt3TeJRVVD9AVS5B6cvasZjfggskuWG+FZm4bcBI8IEUXk2jNWvoMNBpjzL
         3C5Rnhs9+tnPq6E4PuCfCLxwr/AbeVuIlqoNjyMeYiuKwvASuTr9gSZ+vMaGSxSJcaCr
         96gaBmyRYpYPGQuLhFRMJYjChieWlyowiKXzdJxqRDysukPn1r1JCZ3D7vWm5TZ1K/g6
         vKGKpMpsjB5SWK3xc/nEk6nI+OS/TPlQeYB/kXIjP6M7ZhzMCeIQ/RAl4ZLW6+vmHwYC
         r4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UjJUcK0eKglR2tl7QF1+vtD7OR9nEVOsWRf/PyeTMJk=;
        b=HOusIQV+80iTWXXOTO1AalCeJb7YZmtotIsbRTdlOG5hJFNhA0lGBVK0k6skZcVjiU
         LHwxOdM/WCVdDWsVFlEmhb1Wx9lQjOCpIeLmoS6Bmkzd6MOMg4sMroiDQHky9VfgFEd4
         PcOmanqTzCODYBGDzNk2hJSzdB+qi82WBXv1abgXU6Ucyjm3nVC9WRxzOMKSdgi0OnWu
         8vgHr38Gkem8EoI+9E3GrpBvW/JcsKa47YXJuZEQ3/nii5QQFJ6SlMDy6Y0QVA9O2a5L
         nzTdfjQcT2qUZQNd8aK6adCPCjZM7wNdzFV8dmsgyYeYahtIxYgO7or0hjqtlS1c7n6E
         yvXw==
X-Gm-Message-State: AOAM531cYnMGXmXR5e/kuqjyGHDg9EWYGf+rt+Z7H3/tpad5f8Vap+UL
	DVg7MgvMc1ZdsxJT0STZRqVxi7c0oLA=
X-Google-Smtp-Source: ABdhPJyI9vC8rMQ9ccCV59xv3EzDEvfasWpwShDIerPQPWPLCzd+mzLUgTYodzTpmygN4gX4sExDxA==
X-Received: by 2002:a37:a992:: with SMTP id s140mr5742907qke.286.1611948792010;
        Fri, 29 Jan 2021 11:33:12 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id u65sm6774578qkb.58.2021.01.29.11.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 11:33:10 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] arm64: tegra: Device tree changes for v5.12-rc1
Date: Fri, 29 Jan 2021 20:32:53 +0100
Message-Id: <20210129193254.3610492-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210129193254.3610492-1-thierry.reding@gmail.com>
References: <20210129193254.3610492-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-arm64-dt

for you to fetch changes up to 5b4f6323096a05870e557d841b209bf39e719440:

  arm64: tegra: Audio graph sound card for Jetson AGX Xavier (2021-01-29 17:35:37 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.12-rc1

Fixes an issue with HDA codec detection by properly wiring up the
power-domain for the HDA controller. This also fixes one of the USB-C
ports on Jetson AGX Xavier and enables support for audio on various
Tegra210, Tegra186 and Tegra194 boards. The Jetson Nano and Jetson TX1
also gain QSPI support.

----------------------------------------------------------------
JC Kuo (2):
      arm64: tegra: Add XUSB pad controller's "nvidia,pmc" property on Tegra210
      arm64: tegra: Enable Jetson-Xavier J512 USB host

Jon Hunter (2):
      arm64: tegra: Prepare for supporting the Jetson Xavier NX with eMMC
      arm64: tegra: Add support for Jetson Xavier NX with eMMC

Sameer Pujar (7):
      arm64: tegra: Add power-domain for Tegra210 HDA
      arm64: tegra: Audio graph header for Tegra210
      arm64: tegra: Audio graph sound card for Jetson Nano and TX1
      arm64: tegra: Add RT5658 device entry
      Revert "arm64: tegra: Disable the ACONNECT for Jetson TX2"
      arm64: tegra: Audio graph sound card for Jetson TX2
      arm64: tegra: Audio graph sound card for Jetson AGX Xavier

Sowjanya Komatineni (4):
      dt-bindings: clock: tegra: Add clock ID TEGRA210_CLK_QSPI_PM
      arm64: tegra: Enable QSPI on Jetson Nano
      arm64: tegra: Add QSPI nodes on Tegra194
      arm64: tegra: Enable QSPI on Jetson Xavier NX

Thierry Reding (2):
      Merge branch 'for-5.12/dt-bindings' into for-5.12/arm64/dt
      arm64: tegra: Order nodes alphabetically on Tegra210

 arch/arm64/boot/dts/nvidia/Makefile                |   1 +
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 742 +++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  22 +
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |   8 +
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 595 ++++++++++++++++-
 .../dts/nvidia/tegra194-p3509-0000+p3668-0000.dts  | 339 +---------
 .../dts/nvidia/tegra194-p3509-0000+p3668-0001.dts  |  10 +
 .../arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi | 351 ++++++++++
 .../arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi | 282 +-------
 .../arm64/boot/dts/nvidia/tegra194-p3668-0001.dtsi |  19 +
 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi     | 284 ++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  48 ++
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 299 +++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 175 +++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           | 261 ++++++--
 include/dt-bindings/clock/tegra210-car.h           |   2 +-
 16 files changed, 2780 insertions(+), 658 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3668-0001.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
