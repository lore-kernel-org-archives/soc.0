Return-Path: <SRS0=UXL6=TW=gmail.com=singh.kuldeep87k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33EBC433F5
	for <soc@archiver.kernel.org>; Fri, 11 Mar 2022 09:38:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A11B6C340E9; Fri, 11 Mar 2022 09:38:06 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0E7C3C340EC;
	Fri, 11 Mar 2022 09:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0E7C3C340EC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 6so7067537pgg.0;
        Fri, 11 Mar 2022 01:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4UdACirxY0xsWd1veLmX7WNmlz8Y4QUFgsG8QaePNhI=;
        b=agrL8Vmm1KeqiI6nEnTVDa1ZDOK8ULV8iyMijEcu7zlaHK/lViw8aOiuYCHluRe3Qi
         oI2maBBIeOnqNHMah24Rs+m8zgWKzTMpYvDbNT30bnfLtUj8FirJYsb4Odg1qG6Pox7K
         HITnTQoW3KUSvStsl7JahidRqX8hYxPZ2DdoiPtxSAQMtWbPJ3wxFPLjfzLDA/naZp2B
         U+NT8mxtT8Cn0PyuSyh7R+PoimjJHsvqsQv+gGcBk2rZL99FfWbB+HhTDtH0Wl8ocVB3
         n2I9viEraC7mJBkzRsFBEQ0rsBriRXbD406YQvHY/rOc53ejhYsjL7V2p99pkn8/Ghvz
         jenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4UdACirxY0xsWd1veLmX7WNmlz8Y4QUFgsG8QaePNhI=;
        b=1O3GezS84bO/6Wqvg3D57ZNriK/Ij93/0W2ZVZEnd9bc1gZeHJY29sxaoFTBg8X5pZ
         XYU0UrW8ptvW9lhQdsD2skQrU1SQUn1c6DMMC2pDIiZ0/KHtrsxgEpmlf/2FxLRHqu7i
         titlgycJEV3/XjiHBcnILBGuYcDPntw54A5PCBdy880XJtpK9Ng0mi73szxHrfaPt3Fe
         1kLzYvb8n0a9oF3Lsq2PtVR+L+MZP+mlhTqVX4PG/e6FpiNMYFby4sqFcKKEEu9HmIwv
         VWJm3Zi/VDHAxsgJCGKVfCMLuQDubzTfvNY69brOHyJ/F/Xw/DlDe5JF1Jor1GxxV72Y
         vC1g==
X-Gm-Message-State: AOAM530NJIUvAVLqe+/H6JdWRKgHqmOX+OKAgTVEQbkrPcWUvk2n/JAf
	sUG2aKQLokj9FR5mDAnE9w0=
X-Google-Smtp-Source: ABdhPJwi+/lQ+Rkkt9up1U51/sxroO3UN6n1mL7YQhZ1PnzaQEQ/lsj9lpDBsMDW6DVKszVkq0Sl+A==
X-Received: by 2002:a63:d758:0:b0:380:fba9:f6e5 with SMTP id w24-20020a63d758000000b00380fba9f6e5mr4125220pgi.330.1646991485433;
        Fri, 11 Mar 2022 01:38:05 -0800 (PST)
Received: from localhost.localdomain ([122.161.53.68])
        by smtp.gmail.com with ESMTPSA id m11-20020a056a00080b00b004f75d5f9b5csm9011011pfk.26.2022.03.11.01.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 01:38:05 -0800 (PST)
From: Kuldeep Singh <singh.kuldeep87k@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 0/3] PL022 DT fixes for seattle, lg and lpc platform
Date: Fri, 11 Mar 2022 15:07:57 +0530
Message-Id: <20220311093800.18778-1-singh.kuldeep87k@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset is an attempt to fix DTs which are not compliant with
pl022 spi binding. Please note, there are other fixes required also
which are sent from other trees.
As git trees for these platforms are not available, Rob advised me to
seek help from soc tree maintainers.

Arnd and Olof, could you please help in reviewing and merging this
patchset.

These patches are base on
git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git, arm/dt

Link to v1 below:
https://lore.kernel.org/linux-devicetree/20220311025932.GD54098@9a2d8922b8f1/T/#m734e470b3be87b7591b3e6d618e4c777f8e61981

Patch1: Fix spi clock for amd seattle platform
Patch2: Fix spi clock for lg platforms
Patch3: Fix spi clock for lpc platform

Kuldeep Singh (3):
  arm64: dts: seattle: Update spi clock properties
  arm64: dts: lg131x: Update spi clock properties
  ARM: dts: lpc32xx: Update spi clock properties

 arch/arm/boot/dts/lpc32xx.dtsi               | 8 ++++----
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi | 8 ++++----
 arch/arm64/boot/dts/lg/lg1312.dtsi           | 8 ++++----
 arch/arm64/boot/dts/lg/lg1313.dtsi           | 8 ++++----
 4 files changed, 16 insertions(+), 16 deletions(-)

-- 
2.25.1

