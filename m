Return-Path: <SRS0=dTNu=TL=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DA1C433F5
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 16:43:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C0A1C340F1; Mon, 28 Feb 2022 16:43:56 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 95FA6C340E7
	for <soc@kernel.org>; Mon, 28 Feb 2022 16:43:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 95FA6C340E7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 34E5C3F32C
	for <soc@kernel.org>; Mon, 28 Feb 2022 16:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1646066632;
	bh=PoF7elbTeQtgqDFeGhaJqHwYRICrtlMa3jaB+3i7AgQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Z4TYlNswxNMUHzoYBQIyaPxe0cT1AFXysV2Nbhnsp8bp1aeuvYjSDsH5edclN2YdL
	 gpc3zW7zaUQz7MnOR8l5Pq3tUdD5lgDp4utg5Npiv+vqVUYKjw/aOaoO2ieZWWKXtQ
	 wLCtnjdE0fKLkDqDvzZ3jt0ENC7wiBSO65ClOL/GAx9FHdJuFF0zVrt35F1F/ViEKT
	 UCjggPejfpJQ4F55/n4H+ovpT5FTdkZRSbeGeRmDXnsuK9hkZcOwogqXrG1kAYHOux
	 cRYuFbAyI64u5+jOg5q083c82ezpurglaQABtHTTq5lQnS+MLayHTPCz4X2XirslcM
	 PlQ+87bC/6vqg==
Received: by mail-ej1-f69.google.com with SMTP id la22-20020a170907781600b006a7884de505so5456878ejc.7
        for <soc@kernel.org>; Mon, 28 Feb 2022 08:43:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PoF7elbTeQtgqDFeGhaJqHwYRICrtlMa3jaB+3i7AgQ=;
        b=q04Hv+fuGyUVBLOJXV9EnwkUZe8PQBJcloZdEjVfgCfsQL+iEi5IMJqpiQbitWuEug
         JBnOPqLcxP+kci+PmhsEFaoITtviRRx3E0m1zga3wi+zXC4uUeSMsF8mz07dtcbe0VkI
         zERmcvI1xfCECZstKrB8E+i3iTIs75QfQ0A7XoA61ZwQk6ngJIuPp+YzR28GYafo6aKH
         Nc+YRuaY5TG/kQu6piulVOl7qUC+Zr44jGNKWTkxNwfaiOEjzwQzAcKlgWlkJNwG2phA
         KtmwOuEyUKnfKfn9CQBWXe+m/MjKZPpTh/z7S5jW3wgA+G9heaEJykaod0DAkVCWyBoJ
         WoOQ==
X-Gm-Message-State: AOAM532vixmjWq3bqtu7WgGw10rOKBVlcW0dK7aMqsMT43qqkLgS/bgv
	5nqXasIbR70vI0mMSldBFCYMEbrmlZucgQQtk7Fy4vI4zMJRhSe+U3wMV/dOnj8TdW5X5kwQz3b
	l+FKswVo4LxqYlEFROHYHrV4=
X-Received: by 2002:a17:906:c04d:b0:6b9:252:c51c with SMTP id bm13-20020a170906c04d00b006b90252c51cmr15364168ejb.470.1646066631924;
        Mon, 28 Feb 2022 08:43:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOi/bdof4uy0KEGbVp5rydze7BHQMHnskiHw6541xXjs05x74RpvOkmh39MSRPcmAqLBZlgA==
X-Received: by 2002:a17:906:c04d:b0:6b9:252:c51c with SMTP id bm13-20020a170906c04d00b006b90252c51cmr15364150ejb.470.1646066631726;
        Mon, 28 Feb 2022 08:43:51 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id p18-20020a17090635d200b006cdeef01456sm4498443ejb.163.2022.02.28.08.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 08:43:50 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/3] memory: tegra drivers for v5.18
Date: Mon, 28 Feb 2022 17:43:13 +0100
Message-Id: <20220228164313.52931-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220228164313.52931-1-krzysztof.kozlowski@canonical.com>
References: <20220228164313.52931-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Tegra specific branch.

Best regards,
Krzysztof


The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-tegra-5.18

for you to fetch changes up to 0123af535b9c090cf05dcf500f9303bae5849691:

  memory: tegra: Constify struct thermal_cooling_device_ops (2022-01-27 10:41:54 +0100)

----------------------------------------------------------------
Memory controller drivers for v5.18 - Tegra SoC

1. Correct Tegra20 EMC memory device mask.
2. Minor improvements.

----------------------------------------------------------------
Dmitry Osipenko (2):
      memory: tegra30-emc: Print additional memory info
      memory: tegra20-emc: Correct memory device mask

Rikard Falkeborn (1):
      memory: tegra: Constify struct thermal_cooling_device_ops

 drivers/memory/tegra/Kconfig             |   1 +
 drivers/memory/tegra/tegra20-emc.c       |   2 +-
 drivers/memory/tegra/tegra210-emc-core.c |   2 +-
 drivers/memory/tegra/tegra30-emc.c       | 131 ++++++++++++++++++++++++++++---
 4 files changed, 124 insertions(+), 12 deletions(-)
