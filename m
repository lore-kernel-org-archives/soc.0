Return-Path: <SRS0=gyVr=75=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ECB8C7618D
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 12:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 26274C433D2; Thu,  6 Apr 2023 12:48:13 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4C592C433EF;
	Thu,  6 Apr 2023 12:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4C592C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id sg7so1095294ejc.9;
        Thu, 06 Apr 2023 05:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680785290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/+RpHErjTdXdB93GeqLCx48JgLw2erKdymhSD8OmlI=;
        b=E3nzhPppOYHrnXBPABAcaFviLzZ4mFUxS4xyJi36KQHl/YECBXUJn2pAKvnIAw2C/I
         4IBqv2NVbw6fDt3pSEBnqaXBUppfbF6jzjDCQPGB1OLUr7tR3nkdkwVINnbbw+SHLvFH
         dyJMRKHR+2TotbD0uxeol0jiK89PEU951hakclU2TOdE8FnJRWh6EPUAaMLF2vIcgHXw
         s2lk2TYB5p+cJCwkFuS+D523vj0ac1Oxgv/KRFqSCfxirq6UTa3tBki3l+MZLBuCAJKf
         CIpQ6/zHN3tYlZUiX8+85rogorNNjyykgTxmtdVJGgPcCwhYLx2EW+t5r7nv4BmLUuix
         5u9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680785290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/+RpHErjTdXdB93GeqLCx48JgLw2erKdymhSD8OmlI=;
        b=2/iW3K3L5rvdG7e8UeztVgIUvlJuRfeFEAUi3b8LwDqE4VF7++z9o3fmUnY+XTMdH9
         gbdsTOzFiW9pEvA20eHq7KJCJzXbFQvwHeMXwUY7UdPOowVVVxRaJSRzqZBsnCFRAqrb
         y9rF4i4DOCFgCv2MT9ZF88s533CHf2nYf3Do4seVBBVanYB3R98R4cu4YYWnoXN/0P4I
         fsLCOCsrkDRbtTHFomBR6Sx1FKcHk3CbD3iOa1a7GzWrUxgToQ2dFAYfnTl374VSteCp
         EbPmaDebfmGYqVk1FqtirG+VCuseLWUkxtiaoTiHaXRkOQ6obOEeoqiRJbwBKUSUYA4b
         l2bA==
X-Gm-Message-State: AAQBX9eid6UMM1ix8/0r0KTvIz9uljXXfcTcAIjT5zqMD3cw5fXUQijv
	fJE9MjGM0nZZwfNoGeDcDcnj1Uq7kGI=
X-Google-Smtp-Source: AKy350Z2fNOnYmEnQMcJr35AUuVbNBeo6+AT0dqlj9zdpYMkpTK+Vvy20f9Y1w+mWoMJLYEHgo/VBQ==
X-Received: by 2002:a17:907:6b0c:b0:8fd:2f01:86c0 with SMTP id rm12-20020a1709076b0c00b008fd2f0186c0mr6644977ejc.2.1680785290348;
        Thu, 06 Apr 2023 05:48:10 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id m8-20020a50d7c8000000b004fe924d16cfsm716320edj.31.2023.04.06.05.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 05:48:10 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 7/7] arm64: tegra: Default configuration changes for v6.4-rc1
Date: Thu,  6 Apr 2023 14:48:04 +0200
Message-Id: <20230406124804.970394-7-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.4-arm64-defconfig

for you to fetch changes up to f462eb1d0df39499eff2407b2581ddf2fe89e744:

  arm64: defconfig: Enable ARM CoreSight PMU driver (2023-04-05 15:08:34 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration changes for v6.4-rc1

Contains a single patch to enable the Coresight System PMU driver.

----------------------------------------------------------------
Besar Wicaksono (1):
      arm64: defconfig: Enable ARM CoreSight PMU driver

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
