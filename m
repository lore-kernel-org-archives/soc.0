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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B2B1C433E0
	for <soc@archiver.kernel.org>; Fri, 29 Jan 2021 19:33:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E6FE164E09; Fri, 29 Jan 2021 19:33:03 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 877DE64DE3;
	Fri, 29 Jan 2021 19:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 877DE64DE3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=thierry.reding@gmail.com
Received: by mail-qv1-f42.google.com with SMTP id u20so973258qvx.7;
        Fri, 29 Jan 2021 11:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mwt6PYt422RZr5pAeACM9vyiMCyLXs8GJeF9XZ1Ku/4=;
        b=XvEoFspRjc44ZPN01jRZgrDB0RcoMQx30OGPldUb0GekBNzzbbWHmmokWKb1QpDcY0
         zT8sD6jjRTNCsPDMtwG13pdDrr+UsKufx70NWQhm4z0PZxMWhsUxu64Pil/833RPbD4w
         moUi/1sJbECYY9mXtGpFubfV4066tSJKNGKRWmTCj3uOr1+p16awkyTBKK7HD/Woz1HT
         vVAK0mNtCgAzuQqSh8EXnkGt/bS0QMEesvVIN56zlBp3xGVLvvoINi8JRieE+x/R5+6Q
         3ctFEHB8o2/qAzYwfHbAKspZnEicA0Zr5ed5yWApu6wZMBPCi3W2sFnfpIx53UbJQIsz
         BqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mwt6PYt422RZr5pAeACM9vyiMCyLXs8GJeF9XZ1Ku/4=;
        b=hWxLGP0ozsYvuVEkgIPSEW8/Zt4zX/8bqQhhXEG4rqokeg4LMxv9GAFt0kYHtfQDih
         6xNsCQq/Blf2k4dMJMzdG1yX8Id5oiU/BmmMuOG5+jJFOcTSAIbUqB5SvMniifDxnX4+
         3/DieCeseyW7bZL7+geSezxKNFpDgNGH3mlv7Vq+/XmXKLFP5XYOLF19xC7vtCpuZXuP
         h9/4ZVFPdDPURkt4ZJUXJkrN0y3Sh+Bcak5Gx1U/KuCFNbEUG4YGiZzSwLdhRX6qMRUE
         w6ev+vFKPc1u4hqzI3e6jLRIbK+IGt7kj5F3DJG8mHHUDus5YY4iBXI6w+115LQjim+I
         Ap6A==
X-Gm-Message-State: AOAM5320CxJxt+l2wr3VSQvW4jKbhk6uGJ1mYhH5VQk1tiBY4B+JfE89
	k3JatJtGmRh5VBVZQQyCQjoLO58rTlY=
X-Google-Smtp-Source: ABdhPJz6//JxPflubp5RhH+Qrff2wJYD+9lPMkoqu3M/SZu9QEK9EVrKezOiEwB1HQiXJU1P+wJCkQ==
X-Received: by 2002:a05:6214:7aa:: with SMTP id v10mr5405656qvz.2.1611948781910;
        Fri, 29 Jan 2021 11:33:01 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id m10sm2615314qtp.72.2021.01.29.11.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 11:33:01 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] dt-bindings: tegra: Changes for v5.12-rc1
Date: Fri, 29 Jan 2021 20:32:50 +0100
Message-Id: <20210129193254.3610492-2-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.12-dt-bindings

for you to fetch changes up to 6c50321fd65135a28450f16b5745b72368d61006:

  dt-bindings: arm: tegra: Document Jetson Xavier NX eMMC SKU (2021-01-29 16:56:47 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: tegra: Changes for v5.12-rc1

Exposed a new QSPI clock to DT on Tegra210 and documents the eMMC SKU of
the Jetson Xavier NX board.

----------------------------------------------------------------
Sowjanya Komatineni (1):
      dt-bindings: clock: tegra: Add clock ID TEGRA210_CLK_QSPI_PM

Thierry Reding (1):
      dt-bindings: arm: tegra: Document Jetson Xavier NX eMMC SKU

 Documentation/devicetree/bindings/arm/tegra.yaml | 8 ++++++++
 include/dt-bindings/clock/tegra210-car.h         | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)
