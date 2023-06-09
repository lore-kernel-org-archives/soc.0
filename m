Return-Path: <SRS0=ktnR=B5=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D2AC7EE45
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 19:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3848FC4339B; Fri,  9 Jun 2023 19:36:32 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43CB1C433D2;
	Fri,  9 Jun 2023 19:36:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 43CB1C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-970056276acso320994466b.2;
        Fri, 09 Jun 2023 12:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686339389; x=1688931389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAtEPr9Ys387Pe4RYRZ8iJILAuFrQDNs1SzA9w6+Yyo=;
        b=k0cWRvpS5kSr8RZZFS5wFtvbidYOlyxT5MYwlyuryj1ZrDd8GlXKfHUluc8uOlxdXK
         gdwk9sBN0+Y6hHVLyeDBEP+LIyCmFPNFL9hVLiRihJzWvkDSJ2/RiXbrFA/r6KUky/8D
         QeyrDh5PvyMwhAzcuJt6tAz3snwokLlDyKOqLlAvDLYJiUNbo4Pj3GaDSivW7+Aqcl2R
         Xk69O8QopgncPqWq4uUujWjsIu8s4mgmRuHRYSBU1L/osCKA/pi+WMIMnI/3jyII6eBj
         V/YY6QnLIU2/d5YNtRj1AUH4/gEYJWe4axexIvCtMq6brC4fgKL4JIljqPBa1t3VxFY4
         odGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686339389; x=1688931389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAtEPr9Ys387Pe4RYRZ8iJILAuFrQDNs1SzA9w6+Yyo=;
        b=I4Djbwb3p1YyhtHtJs9UXqWN2FbXFpOXDPVkuYyFDESN1HGkMsQ+mee8wLhsyrMgco
         MC6XGCHzeICft3LoI6ylwBU+Zu6L9E/So/w8jtc9+D/4T/w9xrpLWTZp+lKCua76DZTt
         DJ+Za1Lho3o60vhcRgcl3ePQ1NqMMcOb9bkTu2YyTV4S+GDc+VxRmvgboVaGRtAlk9ai
         lVlJd3ssPtkA7VwU7IUo+K6SBb3xpekh0GOZdDXylMr/eygRITefUpePMa2iTRfAroGX
         5BC0Bv97jNmyIcQmgKcLZi6h7qlhpUzcmMpcvsASCpzTAXvA956rRSJrf0AEvpVxfeR/
         CoZg==
X-Gm-Message-State: AC+VfDzGDZJ7zfODdz+2V366k4tGB2U5qBdwWeD5rFMPkecZCP9bf+q8
	2UMj/CKO2/jrVJV46OSJWW+SM0oKMmI=
X-Google-Smtp-Source: ACHHUZ7oOKplEQYw+eKt0I0zfBetbQxm7g/GHSDvca+tryCErcp39fy8REsaGXCCcnn9tHBYL7moWA==
X-Received: by 2002:a17:907:7e99:b0:967:5c5f:e45c with SMTP id qb25-20020a1709077e9900b009675c5fe45cmr2296589ejc.0.1686339388963;
        Fri, 09 Jun 2023 12:36:28 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id o20-20020a170906601400b00977d3fb2a7dsm1637378ejj.76.2023.06.09.12.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 12:36:28 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] dt-bindings: Changes for v6.5-rc1
Date: Fri,  9 Jun 2023 21:36:17 +0200
Message-Id: <20230609193620.2275240-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230609193620.2275240-1-thierry.reding@gmail.com>
References: <20230609193620.2275240-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.5-dt-bindings

for you to fetch changes up to 5f027147e4796e9fc11083b2ad50a91c1ac36ede:

  dt-bindings: tegra: Document Jetson Orin Nano Developer Kit (2023-06-06 14:39:20 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.5-rc1

Several new modules and devices are documented and fixes incorporated
for the Tegra234 GPIO controller pin mappings as well as the possible
Tegra XUDC PHY connections.

----------------------------------------------------------------
Prathamesh Shete (1):
      dt-bindings: gpio: Remove FSI domain ports on Tegra234

Shubhi Garg (1):
      dt-bindings: tegra: Document compatible for IGX

Sumit Gupta (1):
      dt-bindings: tegra: Add ICC IDs for dummy memory clients

Thierry Reding (3):
      dt-bindings: usb: tegra-xudc: Remove extraneous PHYs
      dt-bindings: tegra: Document Jetson Orin Nano
      dt-bindings: tegra: Document Jetson Orin Nano Developer Kit

 Documentation/devicetree/bindings/arm/tegra.yaml     | 14 ++++++++++++++
 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml   |  7 +------
 include/dt-bindings/gpio/tegra234-gpio.h             | 20 ++++++++------------
 include/dt-bindings/memory/tegra234-mc.h             |  5 +++++
 4 files changed, 28 insertions(+), 18 deletions(-)
