Return-Path: <SRS0=BwRQ=NE=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2B6C4320A
	for <soc@archiver.kernel.org>; Fri, 13 Aug 2021 16:22:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8506C610EA; Fri, 13 Aug 2021 16:22:09 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A77861042;
	Fri, 13 Aug 2021 16:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A77861042
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id l18so14033332wrv.5;
        Fri, 13 Aug 2021 09:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hL2E+OHMaEPvpW4ofvFox1pZWIDm0uZSMYdfM4ARIh8=;
        b=sZhtKvUnMsvvGQjtf3803c3v8rIIlRbZdxTiwZFpS207ksRQ4dK4EwS/c+XIWwih7E
         PX7cU7ob6GiI+qri200jPcbtzqAYlkNM+trDulTpJw5ck/rweHRdejz9f4vQOMcKLMAJ
         qWeFCO9pQa2+UrPOV3SG+S7puwjC3NJQlOO1/WkhwMbISyzVzaVsaSM/RSlx8jfpM7SR
         jUV1J0cUaP6VMnNzpwwAHz9YDLc1KlnvTOsJFeR0BdO5DBO7/tALZ3BFvLXrylHiU3eQ
         TFFimCWLYGfvrKE5JAmN5v3cWwttQnEhiHGO+eyJEgvUdCh84tXQx+SqrdD8guVWDRr0
         Sxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hL2E+OHMaEPvpW4ofvFox1pZWIDm0uZSMYdfM4ARIh8=;
        b=Sh7ZBlmYPxAj2ANdVGjMalzhYOh/HI0C8Per6xnrYaZCAWpVD3e6c+tbSGoO0Gj5sj
         ZTZAj6dyKoAdU6k6LgM2IqPr1ZxNtO/1Mq2Xn3GIFXa4POvEfVoAnS0oL4GkMR0S5KsT
         AfeeWGxFXU3QOabgg8E0iW3bJkQkBzWvPLEzu3+1yLsewY2Vsi+JSPJ9TnpMLsgN/mX8
         /aItngfQxObJrtZhYY9Nl85TTz85n5Rus4heOT7TYa0pi9wOORDnP2UGu6BkNxPEXBRZ
         2cnTaUyIGBmME9lxFLrDBvlY33F0efk2fZVLpgiBcfwFuVyoKT1cygIG5CltSbT+mwXz
         2isg==
X-Gm-Message-State: AOAM530+7fwD1IuhGov4oObaCEGtxoQjqNRNZX4+nrgJn1G2bhBg5Gm4
	mAcGW78r8L2PizDVGeO6OAo4+Oo5s5s=
X-Google-Smtp-Source: ABdhPJwzR+Uowa5MQLzSxcsOnFulMAAm1lotJXL0blvGBNnYk/iRwy07QQUX8ZBrJwBpuoQ2jds9KQ==
X-Received: by 2002:a5d:4dc3:: with SMTP id f3mr4226800wru.302.1628871727392;
        Fri, 13 Aug 2021 09:22:07 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id g9sm1812124wmk.34.2021.08.13.09.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 09:22:06 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] ARM: tegra: Default configuration changes for v5.15-rc1
Date: Fri, 13 Aug 2021 18:21:56 +0200
Message-Id: <20210813162157.2820913-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813162157.2820913-1-thierry.reding@gmail.com>
References: <20210813162157.2820913-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-arm-defconfig

for you to fetch changes up to 806b99206b840bcf3bfa44227dc978880d13ed1b:

  ARM: multi_v7_defconfig: Enable CONFIG_TEGRA30_TSENSOR (2021-08-11 12:15:48 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Default configuration changes for v5.15-rc1

Enables a couple of drivers by default so that the configuration is
useful on more devices. This also rebuilds the tegra_defconfig, which
hasn't been done in a long time.

----------------------------------------------------------------
Dmitry Osipenko (5):
      ARM: tegra: Enable CONFIG_TEGRA30_TSENSOR
      ARM: tegra: Enable CONFIG_FB
      ARM: tegra: Enable Acer A500 drivers
      ARM: multi_v7_defconfig: Enable Acer A500 drivers
      ARM: multi_v7_defconfig: Enable CONFIG_TEGRA30_TSENSOR

Maxim Schwalm (2):
      ARM: tegra: Enable CONFIG_CROS_EC
      ARM: tegra: Rebuild default configuration

 arch/arm/configs/multi_v7_defconfig |  4 ++++
 arch/arm/configs/tegra_defconfig    | 25 ++++++++-----------------
 2 files changed, 12 insertions(+), 17 deletions(-)
