Return-Path: <SRS0=qcKZ=P5=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1002BCA0FF9
	for <soc@archiver.kernel.org>; Fri, 30 Aug 2024 14:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DFE09C4CECA; Fri, 30 Aug 2024 14:11:54 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C722DC4CED5;
	Fri, 30 Aug 2024 14:10:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C722DC4CED5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42bbdf7f860so4526305e9.3;
        Fri, 30 Aug 2024 07:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725027009; x=1725631809; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IpUz89wv1oXUxzK+wlN2VqpeUK5IuOzqE77lHVyBLk=;
        b=Ew2Bpb3yXG0WCjLALfzIXt6xuAa2l9An/+0D9/UEumbX2y7o2Nky6HX2vQjVd7nVW+
         gjselblLGVKf8hk7q/w2TFglf/0mzRu21ulPmobpXIJx5bfGHiKa2nHOK7WHy91RQuQ/
         /Ojlc+cZR9vSHAYQ4P+G3YVsne96W1UR1OKMtpG/6U3aYqTPQxEDh9KdDJqJrRzkmdhC
         DRlFYtFWSA1lKeQWLItSAeflMRU0KiekhlFle/rOa7PHwMEfqZFdZh5cRK5jJkPs1i8i
         rMKIJkZsReDOnQT63yy/fC8N2qh9Q6woL9jNuaXOO15Z41amD11BRbswTo6fvlkK4gKt
         Wtpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725027009; x=1725631809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IpUz89wv1oXUxzK+wlN2VqpeUK5IuOzqE77lHVyBLk=;
        b=bNWunFxt3RikmohTZzqz2i+64LQvU9i31OB0gMxuZBHjfTtF18iWHeVKhLHEtkUYTD
         Qlw7Y8hvCB7JKQ+O/rXuN8HXCQSmZy00IIVistplAmTIMyJgInmS4Pus4iM66oM+fO/h
         J1TDvRmMt6plk+An2sAlqsI0G+74HktoJt44FiDH+ZBV8sGZLjbNBn4MKsSrhylwHYYp
         LWisLq5yOI7Q12QkOM4uA2IRVWlZx4PQ8UVhV3aM5LzVMcFSI3YrVNrFp6P4mwo9z73k
         lyQMWSC56e9g596xLmzsLafObKfwOe165qVgxu78siBKvuuuNnVMp8DBY2xKdOTnc793
         mt/A==
X-Forwarded-Encrypted: i=1; AJvYcCVMKEU5cjsivYcxLpf3d4YtgNpGvm/V1zlemQixpbvyz3sY2G7SCzieVBqS7pVzEddta7c=@kernel.org
X-Gm-Message-State: AOJu0YwZzAY9wjakKW3LcBjp4Lts2JEbsFrzsMs8hCyxh2C0XZoonAPx
	lUVHbBt50z6KBbyWkPLlwhBSQjcJ/5OhylS10XKIv0USpZjoO8t/V0WBKyPK
X-Google-Smtp-Source: AGHT+IFl6onhWS8VB5pArczv3c7KEFizVXpaE6FuWLa/7QdAa0shwOoEwtlZdYuI62q/whTy6AQA/g==
X-Received: by 2002:a05:600c:4f42:b0:426:5269:9827 with SMTP id 5b1f17b1804b1-42bb01363ecmr52815835e9.0.1725027009166;
        Fri, 30 Aug 2024 07:10:09 -0700 (PDT)
Received: from localhost (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e27467sm47422765e9.38.2024.08.30.07.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:10:08 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] arm64: tegra: Device tree changes for v6.12-rc1
Date: Fri, 30 Aug 2024 16:10:02 +0200
Message-ID: <20240830141004.3195210-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830141004.3195210-1-thierry.reding@gmail.com>
References: <20240830141004.3195210-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.12-arm64-dt

for you to fetch changes up to 93ff9686228aa705714c3fe0706ed9ce9410037a:

  arm64: tegra: Add thermal nodes to AGX Orin SKU8 (2024-08-29 17:40:35 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.12-rc1

This contains a slew of cleanups and consolidation changes for several
Orin boards and also fix some minor issues and enable more features on
the Jetson TX1.

----------------------------------------------------------------
Dara Stotland (7):
      arm64: tegra: Add common nodes to AGX Orin module
      arm64: tegra: Combine AGX Orin board files
      arm64: tegra: Combine IGX Orin board files
      arm64: tegra: Move AGX Orin nodes to correct location
      arm64: tegra: Move padctl supply nodes to AGX Orin module
      arm64: tegra: Move BPMP nodes to AGX Orin module
      arm64: tegra: Add thermal nodes to AGX Orin SKU8

Diogo Ivo (2):
      arm64: tegra: Fix gpio for P2597 vmmc regulator
      arm64: tegra: Add wp-gpio for P2597's external card slot

Jon Hunter (1):
      arm64: tegra: Correct location of power-sensors for IGX Orin

Tomasz Maciej Nowak (3):
      arm64: tegra: Wire up power sensors on Jetson TX1 DevKit
      arm64: tegra: Wire up Bluetooth on Jetson TX1 module
      arm64: tegra: Wire up WiFi on Jetson TX1 module

Vedant Deshpande (4):
      arm64: tegra: Add DMA properties for Tegra234 UARTA
      arm64: tegra: enable same UARTs for Orin NX/Nano
      arm64: tegra: Add Tegra234 PCIe C4 EP definition
      arm64: tegra: Add p3767 PCIe C4 EP details

 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |  64 ++++++
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |  53 ++++-
 .../arm64/boot/dts/nvidia/tegra234-p3701-0000.dtsi | 135 ------------
 .../arm64/boot/dts/nvidia/tegra234-p3701-0008.dtsi | 142 ++-----------
 arch/arm64/boot/dts/nvidia/tegra234-p3701.dtsi     | 125 +++++++++++
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  | 108 +++++++++-
 .../arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi |  90 --------
 .../dts/nvidia/tegra234-p3740-0002+p3701-0008.dts  | 230 ++++++++++++++++++++-
 .../arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi | 215 -------------------
 .../dts/nvidia/tegra234-p3768-0000+p3767-0000.dts  |  17 --
 .../boot/dts/nvidia/tegra234-p3768-0000+p3767.dtsi |  26 +++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |  33 +++
 12 files changed, 648 insertions(+), 590 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000.dtsi
 delete mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3740-0002.dtsi
