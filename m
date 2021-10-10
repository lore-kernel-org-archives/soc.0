Return-Path: <SRS0=ZoBd=O6=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EAE0C433FE
	for <soc@archiver.kernel.org>; Sun, 10 Oct 2021 17:58:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 56BC860F43; Sun, 10 Oct 2021 17:58:45 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08B8261054
	for <soc@kernel.org>; Sun, 10 Oct 2021 17:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 08B8261054
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DD1E140016
	for <soc@kernel.org>; Sun, 10 Oct 2021 17:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633888722;
	bh=88UqIy9mwzkWtlrhM9oP3Aj9E83Jl4ATz7t0s5yWwqE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=XKJ4OuAHHpPPZXcJAEJwrD3TXL/ju1Tcj8sOLR7Xi5FWHslrWg8AF/Eg+/fBw0ACe
	 h27ummSJrVtjDMQR0YHm3w63yE28C30PNJycNpzMf5w5MTB+IQlTmcHIQtiTe6Vvr+
	 6sqoFFJ6vq2V3YUda5NPvobrM0AW3ozO8aAJIttGffYoFdRl8hJuqVzRaaT1VLYZa7
	 D3+hFEHdNWv6A9ZHg4Mgs8I9hKIcYV8qveUyMUL3QnxBloUZogbhVPTWQahoe2pWHR
	 dhVwtfv+ShATG6vzB10BG3F4tYMpV014GrS74ASLHHLVkivAh+IFdGYr+jS9RW/2Og
	 aCvwSF+s6mLxg==
Received: by mail-ed1-f69.google.com with SMTP id h19-20020aa7de13000000b003db6ad5245bso5113559edv.9
        for <soc@kernel.org>; Sun, 10 Oct 2021 10:58:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=88UqIy9mwzkWtlrhM9oP3Aj9E83Jl4ATz7t0s5yWwqE=;
        b=wrPjF1O0nxMoNl9GCL4k5ATAMApc8FfQMGf6SDDkee/m00EE9ynvNSHvFVd5Hd49z3
         1CyAyf3J+8akvOFWvET4LxYKHizo/Ek4Dyi7EWEBwkNF2dXoUhgd7RMHv9Lzf47v41LY
         rwzTTnpcpqCmAQb563U/HlfafwEnYMY/ByoLHYwFkBfBSuBLJa3alyIJdE1Mv0pNLaes
         1NhS05IrrOuKrT9FdWXtONEWcLAp7a+n3Awqlyj0rCn4p/EWRH4ZBXf0vCJOPJDzglVR
         EkmLaO+ASZ1YF8InKsPHxrLzxQg/eS5ObB9JAHREiJ0GCYCMJSpPENtgOmX03Xm/WWke
         UI/g==
X-Gm-Message-State: AOAM53213jdF6kGvpE3G3CgA8GHil9g4GBRur+YRCumL7gTmaf+kg+wq
	dqvtyjH0FHmAqfB65Lp3Tjlw04Xm8qs8Ah4UmOG+Gmx1NwtHmLCtDYSZ27cRL4lCD51Dqnbx6vB
	n8xmvRZagx8ofmXiLdf8Eubo=
X-Received: by 2002:a50:e141:: with SMTP id i1mr34582893edl.157.1633888722548;
        Sun, 10 Oct 2021 10:58:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3AK4hp7TVCpa0+xVG9MP6rRwFiy7pmtaN7TMdn7+eU2k3Cv/acIFnEkH3HPjZ1RBFGW9zbA==
X-Received: by 2002:a50:e141:: with SMTP id i1mr34582857edl.157.1633888722325;
        Sun, 10 Oct 2021 10:58:42 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id au26sm2347948ejc.53.2021.10.10.10.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 10:58:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/3] memory: tegra for v5.16
Date: Sun, 10 Oct 2021 19:58:36 +0200
Message-Id: <20211010175836.13302-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211010175836.13302-1-krzysztof.kozlowski@canonical.com>
References: <20211010175836.13302-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

A topic branch specific to Tegra.

Best regards,
Krzysztof


The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-tegra-5.16

for you to fetch changes up to 31b88d85f0432e1c0738fe0714191e8504f505c3:

  memory: tegra210-emc: replace DEFINE_SIMPLE_ATTRIBUTE with (2021-10-07 20:37:33 +0200)

----------------------------------------------------------------
Memory controller drivers for v5.16 - Tegra SoC

1. Several minor improvements.
2. Handle errors in BPMP response of Tegra186 EMC.

----------------------------------------------------------------
Cai Huoqing (1):
      memory: tegra: Make use of the helper function devm_add_action_or_reset()

Colin Ian King (1):
      memory: tegra: make the array list static const, makes object smaller

Dmitry Osipenko (1):
      memory: tegra: Remove interconnect state syncing hack

Jing Yangyang (1):
      memory: tegra210-emc: replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE

Kai Song (1):
      memory: tegra210-emc: replace DEFINE_SIMPLE_ATTRIBUTE with

Mikko Perttunen (1):
      memory: tegra186-emc: Handle errors in BPMP response

Yang Yingliang (1):
      memory: tegra186-emc: Fix error return code in tegra186_emc_probe()

jing yangyang (1):
      memory: tegra30-emc: replace DEFINE_SIMPLE_ATTRIBUTE with DEFINE_DEBUGFS_ATTRIBUTE

 drivers/memory/tegra/mc.c                     | 25 ++++++++++++-------------
 drivers/memory/tegra/tegra186-emc.c           |  5 +++++
 drivers/memory/tegra/tegra210-emc-cc-r21021.c |  2 +-
 drivers/memory/tegra/tegra210-emc-core.c      |  6 +++---
 drivers/memory/tegra/tegra30-emc.c            |  4 ++--
 5 files changed, 23 insertions(+), 19 deletions(-)
