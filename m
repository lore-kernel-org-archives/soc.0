Return-Path: <SRS0=fmoZ=3T=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45666C43217
	for <soc@archiver.kernel.org>; Sat, 19 Nov 2022 01:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D80FC433C1; Sat, 19 Nov 2022 01:20:36 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 49FB2C433B5;
	Sat, 19 Nov 2022 01:20:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 49FB2C433B5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id ud5so16999214ejc.4;
        Fri, 18 Nov 2022 17:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbfoB6c/UjNlcqISExBxrNR+Gfa67oAo9Qlc4W4UOAg=;
        b=KSLhX264k+IOo0mAuAPfLH/1foRxs+K6tkJuDT098hpRXMY4tGQvh9KdYdkZX4Wmm9
         bcEUkdVEylkFyGgFfgLeKv/0S4FquJnVjFKWjqv6njGuAqcSIOj1kBRa1r9I/cWmCWtx
         eNPg+S2yvMemxZe112isBa0CO9cr+pM4DL6tTP4al38Ga4NKCx/OTKGYfqFOJ0WGdmVu
         RXs5iPEZDOwIHtGR5YrhdP1P0Z3khSnDnwQVo2Iv7hnHKTDUzOlDGW+75G5+hAbftQa1
         QnCKFkXvzCB6dVYnzpPbC5L09F2CVV5/PuAwhUm80cj8tTyDjaQhxdn8oGybznJKJ8ks
         5/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbfoB6c/UjNlcqISExBxrNR+Gfa67oAo9Qlc4W4UOAg=;
        b=DCYtH4UmYOtQfJxbNL6YJnWppIMAjhym+gwh4J52bdBlUnzgdV8Mix1OnN/LH/Na0g
         kTu35Nm/Rw3YPEuRZhrcgHb4qtIGya2IkaiHNM/z/T1aFY62PhKcTB7w9qInpHkMp3iW
         dO2YWF1y/Y9vUqtX1gUGHl0ixE3gm8o4u4TjZobnrcP5GnoawusxYLKs8fjwQZRaGyDB
         EhWbyWLoS5IQQSCoc4Zyg2otJBJD3alOrTG+W4pJMNxuTY0BnBpm+2Wnm563en4Z/lNq
         2tP04Tk439npMUu+9wXy3Iv/X1CdDKG/yptLsYr8iVkrJqecu+ejiU5QVQPimgRLIJG2
         oiGA==
X-Gm-Message-State: ANoB5pkUe/xcvmL2VUHuJNUwcS4k36YwRWhFFfMPmUpEvQZAMg1ssDZ7
	1eP0V41t5f/mCKQA629iU5DzIp+Ze9w=
X-Google-Smtp-Source: AA0mqf4ZhE+3dLywNGW4ArFee0NvtkX1VLVd3EKlZD8se5YYnR49unxuUUs1Y+nI1choMdLaYRel1A==
X-Received: by 2002:a17:906:1641:b0:7ae:7d78:9fa1 with SMTP id n1-20020a170906164100b007ae7d789fa1mr7868452ejd.98.1668820833213;
        Fri, 18 Nov 2022 17:20:33 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id d10-20020a170906344a00b0077b523d309asm2294476ejb.185.2022.11.18.17.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 17:20:32 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 8/8] arm64: tegra: Default configuration updates for v6.2-rc1
Date: Sat, 19 Nov 2022 02:20:25 +0100
Message-Id: <20221119012025.3968358-8-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.2-arm64-defconfig

for you to fetch changes up to b4c8adc40f4918d77ab851fbc06415fb313d6c7f:

  arm64: defconfig: Enable HTE config (2022-11-11 15:51:29 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration updates for v6.2-rc1

This enables several audio-related options, as well as the Tegra186
timer and hardware timestamping engine drivers.

----------------------------------------------------------------
Dipen Patel (1):
      arm64: defconfig: Enable HTE config

Jon Hunter (1):
      arm64: defconfig: Enable Tegra186 timer support

Sameer Pujar (2):
      arm64: defconfig: Enable couple of audio codecs
      arm64: defconfig: Enable SND_ALOOP

 arch/arm64/configs/defconfig | 7 +++++++
 1 file changed, 7 insertions(+)
