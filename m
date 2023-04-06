Return-Path: <SRS0=gyVr=75=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F19AC761A6
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 12:48:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86862C433D2; Thu,  6 Apr 2023 12:48:12 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9650BC4339C;
	Thu,  6 Apr 2023 12:48:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9650BC4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id g18so1092815ejx.7;
        Thu, 06 Apr 2023 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680785289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxq0QVszcWzQGr+mlJGzrQK87kAzN66KkM34tspS03A=;
        b=i2LrRVcr304+limMVbLFtRzB4FuzIscIKPjGTrbc1DUP0m4Cy7DOwmoIJiVL/qi9Pz
         uooDXycGUQ9n006IIbtxF6nDSKcgamHByxTHUxvqzBUozS2w5GyaeQS6WZc+NNwUuXYT
         Jb7bHDxnJOW2CeGPtBBdnTD3dulzrZ1UGrG+9u0WuT8XBHBGiJK32x1ds0TP+lXdhGPx
         zDHkDA1zBCsRCWZWkT5zldzn9ERljhhxp9es/6qL4tkTcujIhiu/wZFbS/D/B0+NXnP2
         oUxU6F+YhfoECO0YAHXSxutQ5nmzX04m3xZHVtqrFLB/+IG3olxXP0XlwwucRpLeFDvd
         U7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680785289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vxq0QVszcWzQGr+mlJGzrQK87kAzN66KkM34tspS03A=;
        b=gZ8ejPO4YzYual3AWmfGhns5oqBO5bAPG4G2XtrTWYeMlTMgRYYqAWHAfmkrW/8Bcj
         8mN4t/RwHYuqlCyMUpKmeWCCTKQIAmY5exIOfyQBtcEZvT3jrqZz5A3aU0aESpp3Tn1z
         G8yQIHJNiRxOt/QqxPlrIX44e4qBdf9fV+B6PEWGFbe8M5NPmlJzk0NH3d4UGhjvTf/A
         dgyrEqYBNX0EZh9wlt2glRQUvFaWBFTVUPkbomYTxHyFcIv+dUbJ011LkB7+lSsV2yzc
         f2/mO1fe1B7aMACqo4PUplTBHaFXdl4GyHzDfnUD9ldk2na/R951G5616smfLJq193bK
         c83Q==
X-Gm-Message-State: AAQBX9d31a5LHykW9ZS5P96pbxogw68GH+nM1ipHrkArY2iNK5IX3Wjx
	ZURr23Bis1tzcc/Zi68GSLUd26hEe78=
X-Google-Smtp-Source: AKy350b3+pwRy5SLkcdE6g4Fvlt1JesJ3pso+DCq1u2N7jCJR0h6/HCqjLoZHfO+G1myZxIUGWRrTA==
X-Received: by 2002:a17:906:d152:b0:930:27c2:6d8d with SMTP id br18-20020a170906d15200b0093027c26d8dmr7254615ejb.61.1680785289434;
        Thu, 06 Apr 2023 05:48:09 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id j6-20020a170906278600b0093e39b921c8sm758717ejc.164.2023.04.06.05.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 05:48:09 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/7] arm64: tegra: Device tree changes for v6.4-rc1
Date: Thu,  6 Apr 2023 14:48:03 +0200
Message-Id: <20230406124804.970394-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406124804.970394-1-thierry.reding@gmail.com>
References: <20230406124804.970394-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.4-arm64-dt

for you to fetch changes up to 5c0ddb4e715d89e4ea94821cd85bcac220bd7ea4:

  arm64: tegra: Add vccmq on Jetson TX2 (2023-04-05 14:44:46 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v6.4-rc1

This adds support for the Jetson Orin NX and includes updates for Jetson
AGX Orin (audio codec, USB Type-C support).

----------------------------------------------------------------
Ben Dooks (1):
      arm64: tegra: Add vccmq on Jetson TX2

Jon Hunter (2):
      arm64: tegra: Add DSU PMUs for Tegra234
      arm64: tegra: Populate USB Type-C Controller for Jetson AGX Orin

Krzysztof Kozlowski (1):
      arm64: tegra: Drop serial clock-names and reset-names

Sameer Pujar (1):
      arm64: tegra: Audio codec support on Jetson AGX Orin

Thierry Reding (4):
      dt-bindings: tegra: Document Jetson Orin NX
      dt-bindings: tegra: Document Jetson Orin NX reference platform
      arm64: tegra: Support Jetson Orin NX
      arm64: tegra: Support Jetson Orin NX reference platform

 Documentation/devicetree/bindings/arm/tegra.yaml   |   9 +
 arch/arm64/boot/dts/nvidia/Makefile                |   2 +
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   8 -
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |   1 +
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   2 -
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           |   4 -
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |   8 -
 .../dts/nvidia/tegra234-p3737-0000+p3701-0000.dts  | 123 ++++++++++-
 .../arm64/boot/dts/nvidia/tegra234-p3767-0000.dtsi |  14 ++
 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi     | 172 +++++++++++++++
 .../dts/nvidia/tegra234-p3768-0000+p3767-0000.dts  | 134 +++++++++++
 .../arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi | 245 +++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra234.dtsi           |  20 +-
 13 files changed, 717 insertions(+), 25 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3767-0000.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi
