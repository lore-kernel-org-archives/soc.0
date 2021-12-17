Return-Path: <SRS0=mL40=RC=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B46D0C43219
	for <soc@archiver.kernel.org>; Fri, 17 Dec 2021 16:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8DDECC36AEC; Fri, 17 Dec 2021 16:23:03 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A833CC36AE7;
	Fri, 17 Dec 2021 16:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A833CC36AE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id r17so4720622wrc.3;
        Fri, 17 Dec 2021 08:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=m4GAnLo1+RQlcyAyKDD+jEWbDvgnZd3hCTciQCDtNBw=;
        b=Ar5C99xR/H7SYfzrzU6e/jxv72gQDNDyg0clSCe3Tbo8n93C7YmoDicajyRjy11otv
         YrKzwp1exh2nqeBuSRE5PTi+TJVu2vGiYAYvr89md00ZaG8n1vit2I0OiwAkbOzsPXPz
         /MYQwj+nt5gAzwVbq2ZQL9XZhJZsSZTC53zE+FJ2Ky6S+Hs+3i+CDuYIvs5EWaNUmJtP
         mt9l+m/HsnkdacIB9tp9VL05FXDlHkKgOV0hxVU8nT0IHKEf0xBk+0AF2kjXX4R35sEs
         CyJmgxM5fjGb5PRE1mlsT81olUOAeZhIWfnKH8fOVsTlf/3CN6PpP9uZx/SHPU8h4Y+n
         SDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m4GAnLo1+RQlcyAyKDD+jEWbDvgnZd3hCTciQCDtNBw=;
        b=D9Siun4+yUsFThazy3Nx5hKAUtugzeUial7Q4Fa1LhkKM6DdJrDbsUmHEI8FnTcGfI
         Nz7DloJyYpN7esSbJ7Wh2sDog7dBAtEUPH5RG/+wPHdc89ctPsy/GZRY+EnwMo2zG8DT
         hHUXLYoPea+Q129uGep+YqEtCVoiAI63RNf67qZnegOVdIZFbRKTudDDP2v+njRJCB19
         xDmTr+5IJ6Y35xRq35U3OQnSQ6se+VTbWpygtseJigV0CfKWqwJ5+3P4bH/qQMUQLEqE
         KJR0ywP//m/x7z/PEf72u2OeQDALZQSpJf3fDgOAcIEArqu3QYfEX3qxzvxR2JFcbXuW
         PFzw==
X-Gm-Message-State: AOAM530R58HlkGDR58t6rUu0Ho6rc3KkVXFf8LDZVUvl6zfymMYUZgh9
	heFXOLm5lO2Y3e2cbLVclaVOcuqSyCThEA==
X-Google-Smtp-Source: ABdhPJxardNs1rsi+MQgGCUSM23XRQ9cYjZtSqMQYgYVueaW1DH/eRxQeDG/rC6XCH8Bfa+3z8EkXg==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr3141701wrd.346.1639758180469;
        Fri, 17 Dec 2021 08:23:00 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id d2sm11199026wmb.24.2021.12.17.08.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:22:59 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] dt-bindings: Changes for v5.17-rc1
Date: Fri, 17 Dec 2021 17:22:50 +0100
Message-Id: <20211217162253.1801077-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211217162253.1801077-1-thierry.reding@gmail.com>
References: <20211217162253.1801077-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.17-dt-bindings

for you to fetch changes up to c9059a6bb993db31cd85f3a4081766af9e61be40:

  media: dt: bindings: tegra-vde: Document OPP and power domain (2021-12-17 14:58:06 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.17-rc1

This contains a bunch of json-schema conversions for various Tegra-
related DT bindings and additions for new SoC and board support.

----------------------------------------------------------------
David Heidelberg (1):
      dt-bindings: ARM: tegra: Document Pegatron Chagall

Dmitry Osipenko (5):
      dt-bindings: clock: tegra-car: Document new clock sub-nodes
      dt-bindings: host1x: Document OPP and power domain properties
      dt-bindings: host1x: Document Memory Client resets of Host1x, GR2D and GR3D
      media: dt: bindings: tegra-vde: Convert to schema
      media: dt: bindings: tegra-vde: Document OPP and power domain

Jon Hunter (1):
      dt-bindings: Add YAML bindings for NVENC and NVJPG

Mikko Perttunen (1):
      dt-bindings: Update headers for Tegra234

Svyatoslav Ryhel (1):
      dt-bindings: ARM: tegra: Document ASUS Transformers

Thierry Reding (21):
      dt-bindings: memory: tegra: Update for Tegra194
      dt-bindings: memory: tegra: Add Tegra234 support
      dt-bindings: tegra: Describe recent developer kits consistently
      dt-bindings: tegra: Document Jetson AGX Orin (and devkit)
      dt-bindings: sram: Document NVIDIA Tegra SYSRAM
      dt-bindings: misc: Convert Tegra MISC to json-schema
      dt-bindings: mmc: tegra: Convert to json-schema
      dt-bindings: mailbox: tegra: Convert to json-schema
      dt-bindings: mailbox: tegra: Document Tegra234 HSP
      dt-bindings: rtc: tegra: Convert to json-schema
      dt-bindings: rtc: tegra: Document Tegra234 RTC
      dt-bindings: fuse: tegra: Convert to json-schema
      dt-bindings: fuse: tegra: Document Tegra234 FUSE
      dt-bindings: mmc: tegra: Document Tegra234 SDHCI
      dt-bindings: serial: 8250: Document Tegra234 UART
      dt-bindings: tegra: pmc: Convert to json-schema
      dt-bindings: firmware: tegra: Convert to json-schema
      dt-bindings: thermal: tegra186-bpmp: Convert to json-schema
      dt-bindings: serial: tegra-tcu: Convert to json-schema
      dt-bindings: serial: Document Tegra234 TCU
      dt-bindings: usb: tegra-xudc: Document interconnects and iommus properties

 Documentation/devicetree/bindings/arm/tegra.yaml   |  48 +++-
 .../bindings/arm/tegra/nvidia,tegra186-pmc.txt     | 133 ---------
 .../bindings/arm/tegra/nvidia,tegra186-pmc.yaml    | 198 +++++++++++++
 .../bindings/clock/nvidia,tegra20-car.yaml         |  37 +++
 .../display/tegra/nvidia,tegra20-host1x.txt        |  53 ++++
 .../bindings/firmware/nvidia,tegra186-bpmp.txt     | 107 -------
 .../bindings/firmware/nvidia,tegra186-bpmp.yaml    | 186 ++++++++++++
 .../bindings/fuse/nvidia,tegra20-fuse.txt          |  42 ---
 .../bindings/fuse/nvidia,tegra20-fuse.yaml         |  89 ++++++
 .../bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml | 135 +++++++++
 .../bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml |  94 ++++++
 .../bindings/mailbox/nvidia,tegra186-hsp.txt       |  72 -----
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml      | 114 ++++++++
 .../devicetree/bindings/media/nvidia,tegra-vde.txt |  64 -----
 .../bindings/media/nvidia,tegra-vde.yaml           | 119 ++++++++
 .../memory-controllers/nvidia,tegra186-mc.yaml     |  98 ++++++-
 .../bindings/misc/nvidia,tegra186-misc.txt         |  14 -
 .../bindings/misc/nvidia,tegra186-misc.yaml        |  43 +++
 .../bindings/misc/nvidia,tegra20-apbmisc.txt       |  17 --
 .../bindings/misc/nvidia,tegra20-apbmisc.yaml      |  51 ++++
 .../bindings/mmc/nvidia,tegra20-sdhci.txt          | 143 ----------
 .../bindings/mmc/nvidia,tegra20-sdhci.yaml         | 317 +++++++++++++++++++++
 .../devicetree/bindings/rtc/nvidia,tegra20-rtc.txt |  24 --
 .../bindings/rtc/nvidia,tegra20-rtc.yaml           |  61 ++++
 Documentation/devicetree/bindings/serial/8250.yaml |   3 +-
 .../bindings/serial/nvidia,tegra194-tcu.txt        |  35 ---
 .../bindings/serial/nvidia,tegra194-tcu.yaml       |  61 ++++
 Documentation/devicetree/bindings/sram/sram.yaml   |   3 +
 .../thermal/nvidia,tegra186-bpmp-thermal.txt       |  33 ---
 .../thermal/nvidia,tegra186-bpmp-thermal.yaml      |  42 +++
 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml |  13 +
 include/dt-bindings/clock/tegra234-clock.h         |  26 +-
 include/dt-bindings/memory/tegra234-mc.h           |  32 +++
 include/dt-bindings/reset/tegra234-reset.h         |  12 +-
 34 files changed, 1809 insertions(+), 710 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
 create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
 delete mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
 create mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
 delete mode 100644 Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.txt
 create mode 100644 Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml
 create mode 100644 Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml
 delete mode 100644 Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.txt
 create mode 100644 Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.txt
 create mode 100644 Documentation/devicetree/bindings/media/nvidia,tegra-vde.yaml
 delete mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.txt
 create mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra186-misc.yaml
 delete mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt
 create mode 100644 Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt
 create mode 100644 Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.txt
 create mode 100644 Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml
 delete mode 100644 Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/nvidia,tegra186-bpmp-thermal.yaml
 create mode 100644 include/dt-bindings/memory/tegra234-mc.h
