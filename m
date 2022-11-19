Return-Path: <SRS0=fmoZ=3T=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA775C43219
	for <soc@archiver.kernel.org>; Sat, 19 Nov 2022 01:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A384BC43470; Sat, 19 Nov 2022 01:20:32 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D9A3C433B5;
	Sat, 19 Nov 2022 01:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5D9A3C433B5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id n20so17145149ejh.0;
        Fri, 18 Nov 2022 17:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yPuTvYxir7Gpj3tCPH6nNq7pM1RmMpnVdBjIK6F1Lbo=;
        b=BYZcsu6AQD01eKt0XezztqxEoTICMByxIhl7ibyhb+J11atX2zp1U6HRnIPP5xdmpk
         MxwvygBdJRYlc9WpCJx073iyIdkcKUvfHDNvpl1WHCQsrqL/0bsbdG7KgWW0xv2IUsc8
         cg3pynjK/jKQK9gewGG5Kn5Xtkh0nA5Dl1gfg7uFcDIpCb69fLoI4T8FhOTQXTc4lC6I
         XbwLknjkn4oyi1VnwlWFe2A/Ei0aqAXJqoLnx+wAArH/LMrK9kI6l8RZSNp2NX0CcXl2
         3XebnUB4HgpThbNbEEhoi03dTvd37+hpcUZWzhL3psAmpWnJFKOI6jLsbOI6GFIU+6Pw
         P+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yPuTvYxir7Gpj3tCPH6nNq7pM1RmMpnVdBjIK6F1Lbo=;
        b=D8U6xcujBEFFzQSlTWN8oo7jOhh85u6t5UWs8ksQ60CRui2g57XaZERkka1ckdhnZQ
         Gzkx/tV9wJe22WHqfNBeEVzg04C8Zi6tTEqwBc9nFQfn616mca+YVj9l00xMtOEnxnha
         vC2X/QtMXDqeGfnCBrvAHnuUSvvcNXsnzcGQdMKRSGVb+0tKH+poEqYVW4Jpd1vFnplv
         Pab0/kiDgzgnUNy/O4BxL9hM8ygRMOXJUlqhkkRaHYPNn3ZQJVIsKYNl8Zs6mHZHZYOO
         e4CZ4tBoc+nRUbJciShAJPbPT4R8B5vMLbB57lTOvYIGCEUtBVJrX5U8jh/J2DvTbYg8
         Q2UQ==
X-Gm-Message-State: ANoB5pkgqvm5lGBS9MQ+ONbenLlaeVMM62Tg031hXAFxZvwawm5UeZX1
	a4onWk3iXZFfTbkruz8psxoEESPlODs=
X-Google-Smtp-Source: AA0mqf4frgqVJaiq5+fp5iHAK69LI0ODiO96wmNOIKDvq65RhMw7ZAU+cQYGUvSDoNjD4RFIGy1fzw==
X-Received: by 2002:a17:906:eb8e:b0:7b2:a2c3:2ff0 with SMTP id mh14-20020a170906eb8e00b007b2a2c32ff0mr7299192ejb.561.1668820829272;
        Fri, 18 Nov 2022 17:20:29 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id i17-20020aa7c9d1000000b004638ba0ea96sm2373011edt.97.2022.11.18.17.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 17:20:28 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/8] dt-bindings: Changes for v6.2-rc1
Date: Sat, 19 Nov 2022 02:20:21 +0100
Message-Id: <20221119012025.3968358-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119012025.3968358-1-thierry.reding@gmail.com>
References: <20221119012025.3968358-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.2-dt-bindings

for you to fetch changes up to 9c812445df0507aa30ddb511a777fc5dd981eb66:

  dt-bindings: usb: tegra-xusb: Convert to json-schema (2022-11-18 23:58:45 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.2-rc1

New memory client IDs and IOMMU stream IDs, as well as new compatible
strings are introduced to support more hardware on Tegra234. Some device
tree bindings are converted to json-schema to allow formal validation.

----------------------------------------------------------------
Jon Hunter (2):
      dt-bindings: tegra: Update headers for Tegra234
      dt-bindings: memory: Fix typos and definitions for Tegra

Mikko Perttunen (2):
      dt-bindings: Add headers for NVDEC on Tegra234
      dt-bindings: Add bindings for Tegra234 NVDEC

Sandipan Patra (1):
      dt-bindings: pwm: tegra: Document Tegra234 PWM

Thierry Reding (4):
      dt-bindings: pinctrl: tegra: Convert to json-schema
      dt-bindings: pinctrl: tegra194: Separate instances
      dt-bindings: pwm: tegra: Convert to json-schema
      dt-bindings: usb: tegra-xusb: Convert to json-schema

Vidya Sagar (1):
      dt-bindings: PCI: tegra234: Add ECAM support

 .../bindings/clock/nvidia,tegra124-dfll.txt        |   2 +-
 .../bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml | 156 +++++
 .../bindings/pci/nvidia,tegra194-pcie.yaml         |  34 +-
 .../devicetree/bindings/pci/snps,dw-pcie.yaml      |   2 +-
 .../pinctrl/nvidia,tegra-pinmux-common.yaml        | 178 ++++++
 .../bindings/pinctrl/nvidia,tegra114-pinmux.txt    | 131 -----
 .../bindings/pinctrl/nvidia,tegra114-pinmux.yaml   | 155 +++++
 .../bindings/pinctrl/nvidia,tegra124-pinmux.txt    | 153 -----
 .../bindings/pinctrl/nvidia,tegra124-pinmux.yaml   | 176 ++++++
 .../bindings/pinctrl/nvidia,tegra194-pinmux.txt    | 107 ----
 .../bindings/pinctrl/nvidia,tegra194-pinmux.yaml   | 284 +++++++++
 .../bindings/pinctrl/nvidia,tegra20-pinmux.txt     | 143 -----
 .../bindings/pinctrl/nvidia,tegra20-pinmux.yaml    | 112 ++++
 .../bindings/pinctrl/nvidia,tegra210-pinmux.txt    | 166 ------
 .../bindings/pinctrl/nvidia,tegra210-pinmux.yaml   | 142 +++++
 .../bindings/pinctrl/nvidia,tegra30-pinmux.txt     | 144 -----
 .../bindings/pinctrl/nvidia,tegra30-pinmux.yaml    | 176 ++++++
 .../devicetree/bindings/pwm/nvidia,tegra20-pwm.txt |  77 ---
 .../bindings/pwm/nvidia,tegra20-pwm.yaml           |  96 ++++
 .../bindings/usb/nvidia,tegra124-xusb.txt          | 132 -----
 .../bindings/usb/nvidia,tegra124-xusb.yaml         | 202 +++++++
 .../bindings/usb/nvidia,tegra186-xusb.yaml         | 173 ++++++
 .../bindings/usb/nvidia,tegra194-xusb.yaml         | 179 ++++++
 .../bindings/usb/nvidia,tegra210-xusb.yaml         | 199 +++++++
 include/dt-bindings/clock/tegra234-clock.h         | 639 ++++++++++++++++++++-
 include/dt-bindings/memory/tegra234-mc.h           | 440 +++++++++++++-
 include/dt-bindings/power/tegra234-powergate.h     |  15 +
 include/dt-bindings/reset/tegra234-reset.h         | 111 +++-
 28 files changed, 3437 insertions(+), 1087 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra-pinmux-common.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra114-pinmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra194-pinmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra20-pinmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra30-pinmux.yaml
 delete mode 100644 Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.yaml
 delete mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.txt
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra194-xusb.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra210-xusb.yaml
