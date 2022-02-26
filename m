Return-Path: <SRS0=sZ/2=TJ=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA10C433F5
	for <soc@archiver.kernel.org>; Sat, 26 Feb 2022 22:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7046EC340F0; Sat, 26 Feb 2022 22:01:32 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 080A2C340F1
	for <soc@kernel.org>; Sat, 26 Feb 2022 22:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 080A2C340F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 254E440303
	for <soc@kernel.org>; Sat, 26 Feb 2022 22:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1645912889;
	bh=FAnUY3DfJ5M1qZcbwfAjnLrPQZIrehzFU3WzcGW4NPY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=oOFCQeOITodljrMYe4Lu/7CNyrJ+Mz4LEe3n4+/B7X2FPTT0gGje0+UDBUfSsb9w+
	 o2nh4VeXXawB6PbhbOLI/I1Ai6KDHEwOyAtP7O1qWAylcTkLPk3yGYKp3XgQ5CWoj4
	 02UNytQXZNOypKz0ujTey53w2VlZzHh2OiOz2dtV9+vbXYVE4BtZI+X95/54OZ53rz
	 HBduVxO3P+P3oWFE2sr8GireUe6KTXtxWzKkQ9ze4alV3YQTTPjK3CZYuZBOYZrfi1
	 WCjWncdOayf6KWE096/n90YxSWkldv5ITyEOjGF1OLO+Guk9joASuaaH5XIsNC48iq
	 yzgOxNXNlla/Q==
Received: by mail-ed1-f72.google.com with SMTP id h17-20020a05640250d100b004133863d836so3436460edb.0
        for <soc@kernel.org>; Sat, 26 Feb 2022 14:01:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FAnUY3DfJ5M1qZcbwfAjnLrPQZIrehzFU3WzcGW4NPY=;
        b=piWcRd8adPUoMYz9U+CnOw/MjwNWIzvZfeTykAeU15SFIcw5zks0l1tqYnBD6AML8U
         iTEMXP+Ym2humQkHTjn71OjKTLHBbNiPNjbNSMdk2F5EaV5/G27jQlNieXpWHsNI/4Zf
         iTL4c1A3/5coOaTUJKZuvUiNdbYgiIbu5iYxXRWiXNURK5LOod5odwGYMNMK+48+dKda
         veJCloRXWFzKuyffigfqL4RPZRub+dDzmEyCm2P3XEOruMpHIhsFf31u6VyhFNNTnP0c
         nN6gHwDsdws4UdRAfeOxfgUG+59pw3naygy7u6O3/A6nISLhlIbCCeASntexFolwNrOM
         hwHQ==
X-Gm-Message-State: AOAM530iIxR41hoNWO7FrVrgSN2AT6L+I2y7hQKw8JafbBp0Fo2DUW8v
	C+CoqzTNbLL4oQlMYlPp9YESyOG7quTX5n3fj0XeiyXgFPxOKVz7lIqoe/yLfugBjxk3uCBnCOt
	h0ihRbLaR2C23/gbnGCRCZvI=
X-Received: by 2002:aa7:d415:0:b0:410:a0fa:dc40 with SMTP id z21-20020aa7d415000000b00410a0fadc40mr12768949edq.46.1645912885060;
        Sat, 26 Feb 2022 14:01:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywqQ9pXRrzKzKSQQBjqQxtTf/L4gU2wppPf0iq4G4eucek0Gvb/L4v1UJzCEwf47xTWZi0Ig==
X-Received: by 2002:aa7:d415:0:b0:410:a0fa:dc40 with SMTP id z21-20020aa7d415000000b00410a0fadc40mr12768937edq.46.1645912884877;
        Sat, 26 Feb 2022 14:01:24 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id s2-20020a056402014200b0041285556b7csm3497424edu.72.2022.02.26.14.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 14:01:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/3] ARM: samsung: mach/soc for v5.18
Date: Sat, 26 Feb 2022 23:01:16 +0100
Message-Id: <20220226220116.13452-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220226220116.13452-1-krzysztof.kozlowski@canonical.com>
References: <20220226220116.13452-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

There was no mach/soc pull before, so on top of master.

Best regards,
Krzysztof


The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.18

for you to fetch changes up to e465ea5cc05d1d0b45c315fca0254bd2ee04b661:

  dt-bindings: soc: samsung: usi: refer to dtschema for children (2022-02-12 17:34:48 +0100)

----------------------------------------------------------------
Samsung mach/soc changes for v5.18

1. Fix hang of secondary CPU bring-up on some of Exynos5420-based
   devices (Secure Monitor Call SMC_CMD_CPU1BOOT should be skipped for
   all Exynos5 devices).
2. Extend Universal Serial Interface DT schema to precisely describe
   children nodes.

----------------------------------------------------------------
Henrik Grimler (1):
      ARM: exynos: only do SMC_CMD_CPU1BOOT call on Exynos4

Krzysztof Kozlowski (1):
      dt-bindings: soc: samsung: usi: refer to dtschema for children

 .../devicetree/bindings/soc/samsung/exynos-usi.yaml  | 20 ++++++++++----------
 arch/arm/mach-exynos/firmware.c                      |  4 +++-
 2 files changed, 13 insertions(+), 11 deletions(-)
