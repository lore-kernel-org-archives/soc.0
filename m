Return-Path: <SRS0=NGH2=F3=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226CACDB485
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 15:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08336C433CB; Fri, 13 Oct 2023 15:37:34 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 17FBCC433C8;
	Fri, 13 Oct 2023 15:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 17FBCC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-53da72739c3so3914191a12.3;
        Fri, 13 Oct 2023 08:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697211451; x=1697816251; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNAgka3FvOAsw8o3RYXySdSDUfmIIBBX4anYSnIwdp0=;
        b=G50tJwOdKjhsYrbSu2ZcPlxU3O8aDXvYi+1QNE1jSB5u3M7jz2gB5mthVaqSjkAikd
         KvGRDqqZwkPDMBNzqcLc0ZcQTpVoIPpDMvmLm/o9umZBxuu5WI1wEB2IGxzIEgCyTl7U
         Hhn0/fOSbhH0KzkhPr6PpWJPdNbX9vwc8HJogrdcDlHAzADKJKPLYp9dPdQvCEeU68v6
         ktXZlCbt9uDzoVb1+kQ37qIuQJOxO6XFiB55O2UEJ9KQEz0ONcZ9ErZTwdf6di9NU82q
         crx4WKPGpU4yvnFdCL8igzXQP5aXjZRu7hJidaDcpT2yZzqehkAEwfqexQDTLLEzh7oY
         AneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697211451; x=1697816251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNAgka3FvOAsw8o3RYXySdSDUfmIIBBX4anYSnIwdp0=;
        b=gggJwRwfJqpRaPgYreHud5FEvENDFUjVo4M3/aCdfrieMD7/ueYWf6WNtfcXvm6r0a
         u604gWO605vowZ09klYFRlBS+1ZdI6xp/y5IKQUSE6ofVJkG0mlLMcuj015vZaNoj0kp
         x3Q5JjmVGja4uCL9pPBexezE8NHrP4So2ccW/PubuhI/XcPPZh9cpic6e+VX+ReoGr2D
         5zYIanU2UJXEVUdZDXZH+Y1LAnj0GN5mN40mdmlInPnplKoD4w49qVUrIUdSThJTsc2i
         fd/g4EIs/wMPAYN6RovfDqQPKUoNVBOCITVc/6NGz6h7HmpRqgfL+Bc43qNAZoOjH17n
         Pt4Q==
X-Gm-Message-State: AOJu0YzZcXF9mjo4DedOsl0Kh/YP9nWIA/oyE3uNJjPRR2sHid+QQ1PN
	s7UrD54a8z69Z1792U7YtkZFmhL0KNg=
X-Google-Smtp-Source: AGHT+IH8I+K28mrFHIIHCAnqmELBv3ZkkWnfIipzfeY38HXq0bgTnkvoJtmdtdo2llbVApAGXvhvqQ==
X-Received: by 2002:a05:6402:b58:b0:53d:d4a0:3154 with SMTP id bx24-20020a0564020b5800b0053dd4a03154mr6293896edb.31.1697211451101;
        Fri, 13 Oct 2023 08:37:31 -0700 (PDT)
Received: from localhost (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id s9-20020a05640217c900b0053d9a862e2csm4809094edy.56.2023.10.13.08.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 08:37:30 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] arm64: tegra: Device tree changes for v6.7-rc1
Date: Fri, 13 Oct 2023 17:37:22 +0200
Message-ID: <20231013153723.1729109-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231013153723.1729109-1-thierry.reding@gmail.com>
References: <20231013153723.1729109-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.7-arm64-dt

for you to fetch changes up to c0b80988eb78d6423249ab530bfbc6b238790a26:

  arm64: tegra: Use correct interrupts for Tegra234 TKE (2023-10-13 14:43:05 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.7-rc1

This contains some fixes for Tegra234 boards as well as some cleanups
that will help with json-schema validation.

For older devices, there's now support for display on Smaug (a.k.a.
Pixel C) and the IOMMU for host1x is enabled on Tegra132, which should
help with large memory allocations for display and multimedia.

----------------------------------------------------------------
Brad Griffis (2):
      arm64: tegra: Fix P3767 card detect polarity
      arm64: tegra: Fix P3767 QSPI speed

Diogo Ivo (3):
      arm64: tegra: Add DSI/CSI regulator on Smaug
      arm64: tegra: Add backlight node on Smaug
      arm64: tegra: Add display panel node on Smaug

Jon Hunter (1):
      arm64: tegra: Add power-sensors for Tegra234 boards

Rayyan Ansari (1):
      arm64: tegra: Enable IOMMU for host1x on Tegra132

Thierry Reding (6):
      arm64: tegra: Add missing current-speed for SBSA UART
      arm64: tegra: Remove duplicate nodes on Jetson Orin NX
      arm64: tegra: Use correct format for clocks property
      arm64: tegra: Add dmas and dma-names for Tegra234 UARTE
      arm64: tegra: Mark Tegra234 SPI as compatible with Tegra114
      arm64: tegra: Use correct interrupts for Tegra234 TKE

 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |  2 +
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      | 66 ++++++++++++++++++++++
 .../arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi | 33 +++++++++++
 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi     | 53 +++++++++++++++++
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  |  1 +
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi     | 33 ++++++++++-
 .../dts/nvidia/tegra234-p3768-0000+p3767-0000.dts  | 13 -----
 .../arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi |  1 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           | 52 +++++++++--------
 9 files changed, 214 insertions(+), 40 deletions(-)
