Return-Path: <SRS0=Sd91=LF=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFCEC48BE0
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 16:43:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 41E92613BC; Fri, 11 Jun 2021 16:43:14 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 192EE6100A;
	Fri, 11 Jun 2021 16:43:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 192EE6100A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=thierry.reding@gmail.com
Received: by mail-wr1-f47.google.com with SMTP id z8so6751216wrp.12;
        Fri, 11 Jun 2021 09:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V5XYrnY/xVnCPcibAwboKgHCmrwG1kEd9Tte7IqhonY=;
        b=AT2W/U1lava1Ca/zNFJ6uPGusersVIS6uHclYO2H/J6Qp1tt86eedRIFMioYpe8fqs
         yrD74cQCB7gTkJ/kRf4Fa2ZDARKHtlWEHK8gvqQBojB2HoPIRlTiyqeoAzLb31bjDOwU
         2fOqkJjuIv2s32Ktao44dlmqzx8n0MqHplzQKIo52w2TgS1YTFBc7LTxsz44LekNZlk4
         +/JNa06aUjBU2QjmyFo0UWIdMu4V0iRUcJJZY/duMgkHzvhbWsV1XwULSqhLiHm75T3K
         cG6DWTBPdfFjw8a2Jkvt7WvEfdmK4GqT3hWfjSP5PZJH7CTxPDGg2tMwz70xIRtgVOGt
         hLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V5XYrnY/xVnCPcibAwboKgHCmrwG1kEd9Tte7IqhonY=;
        b=Fu+x8V4xqk6yghleTks2Jy/UAmpJCuaOHvqZphG9mt7Jg0I74pggm/tszUgd1XPyic
         kMz3k03q21GnerL9EYu4tiTeeneXbxjb83Tjz+IH3BHdq2H1+/GeLqtJTHSVzDxUjua9
         yqTQ+aFKVjohSTkOYm4ksg5tdFL6DP/O60gBfO5GsHulQeaQFUZW3/DNYwKUnRnXYqB6
         fRhQlnuv2xkd+HKZZQonXifg5qebd/Y6q2e6VWU4KQkg1rTD8wfDhqAWloe8mMmzDKMH
         2jZp/b3MTHUq//ahSazgT6UTMgtak9jvo5LQ3uPHv0IBLLbpZn8b8FBnLnsKqi8knWPB
         +U/w==
X-Gm-Message-State: AOAM532fnEKklyqaCpEtGr+WN9vN1gr8fekSCoyw0cZSU+QBVDh2KYw0
	fApVf1UD19D7dFyy2glNq9h7/nsLQOM=
X-Google-Smtp-Source: ABdhPJxlsbAOLOU1i27Ibi/lz52sIQVKiBthECxJn+E7iF+bsBneHJrvzhZpxGhPpbWTOw5uSu00yw==
X-Received: by 2002:a5d:64c7:: with SMTP id f7mr5073620wri.36.1623429792242;
        Fri, 11 Jun 2021 09:43:12 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p5sm8063831wrd.25.2021.06.11.09.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 09:43:11 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] ARM: tegra: Default configuration changes for v5.14-rc1
Date: Fri, 11 Jun 2021 18:44:36 +0200
Message-Id: <20210611164437.3568059-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210611164437.3568059-1-thierry.reding@gmail.com>
References: <20210611164437.3568059-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-arm-defconfig

for you to fetch changes up to 4302331fdf4440b96dba583384a0e2b759cb13bd:

  ARM: tegra_defconfig: Enable CONFIG_DEVFREQ_THERMAL (2021-05-31 11:43:11 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration changes for v5.14-rc1

Enables the devfreq thermal support to allow using the devfreq device as
cooling device for the system.

----------------------------------------------------------------
Dmitry Osipenko (1):
      ARM: tegra_defconfig: Enable CONFIG_DEVFREQ_THERMAL

 arch/arm/configs/tegra_defconfig | 1 +
 1 file changed, 1 insertion(+)
