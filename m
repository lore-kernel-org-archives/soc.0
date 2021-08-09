Return-Path: <SRS0=/1P4=NA=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8632C4338F
	for <soc@archiver.kernel.org>; Mon,  9 Aug 2021 15:26:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7B78060F8F; Mon,  9 Aug 2021 15:26:54 +0000 (UTC)
Received: from smtp-relay-canonical-1.canonical.com (smtp-relay-canonical-1.canonical.com [185.125.188.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F015F6101D
	for <soc@kernel.org>; Mon,  9 Aug 2021 15:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F015F6101D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id C7C563F358
	for <soc@kernel.org>; Mon,  9 Aug 2021 15:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1628522811;
	bh=bKc2q2GsSAUcXGWOiwttCYEPNo65JA70tLWaCsvxMvg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=VeRlSovdf6IGA5+6lM9BMIf6qV0TP24VsWpUTbm81qbeYPD+XwGcWMKPmepnJEljE
	 7rOygxMybq+8ZPfJvYk5RaT2yIvhY1ud1aOsHV2kQyca0QzhjL5/BKymgls9i7tbeZ
	 jb8Y2e5LZG68upJH+SEcG2BXH0hXovRerdw+9olA4fzp7iNcHlCW4r2Q6aCMTdm7gR
	 TxmQDpkB/Jm8ba39Hd4pDgDWB60ReqCKec5fKnPw+V2lRoruoLrx4E8/txeIurn96y
	 dRy5RaDNMC5Ig+e+1rUS6nHi8qYbbk+gQGVAjCSvhJlG5P2ImSw/3jD3VJHIWbdmrU
	 4og+8yu6c1yng==
Received: by mail-ed1-f69.google.com with SMTP id c16-20020aa7d6100000b02903bc4c2a387bso4587683edr.21
        for <soc@kernel.org>; Mon, 09 Aug 2021 08:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bKc2q2GsSAUcXGWOiwttCYEPNo65JA70tLWaCsvxMvg=;
        b=FyGPrTV9GRKDnhxRGUfjm/M10yi0WiNuD4dpuvIwEkv/zjprnZy4qwVVDTyedxZGf7
         p+WsPl2xIiPqmx46kdvY7YfHV0KwGLrkSc4ID36LMSXI7bKOIQy0YkAMgaR8Bd0MqO5D
         HLz3YTXvmh0k/9ac4fcCG54I4z2LZvSJd94SiEk2uWNjm1gIGu1SrSaUJPDdOVrwFArf
         m2YDhMAYXnn+RGb4iVWA2Xj71Y4eRay74W07KbNJ2Vqr/yUhXd+fkSJ4XwGRR9MCu4Ps
         FCahOrQSnrkrIcxacC7VDXwDMlh+Ejbju3gLdCJzHm9UwVvt/x5jT0mY3chHdnuDdkRj
         mn8g==
X-Gm-Message-State: AOAM532W3uQUePIPZTsTzP7gY2s3QUumOQFYNPTxgso+9BnsbdKclo9z
	aMtiYNz3Vn7hxfOAjbBjfaQi36x4C21zk8efzhCqAcWxvGOaPrey1Hr0X+MB3njFhDq40CgE6t/
	lankR6B6iWJU6xGzTnVgOEy8=
X-Received: by 2002:a17:906:d147:: with SMTP id br7mr23527593ejb.126.1628522810897;
        Mon, 09 Aug 2021 08:26:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9H/dobnWwRqC8K7RHya8QBOc6Stqn0f87KhEofscI7OHEFlLrwSuPyBlXqQQYdXGLWouyyQ==
X-Received: by 2002:a17:906:d147:: with SMTP id br7mr23527569ejb.126.1628522810704;
        Mon, 09 Aug 2021 08:26:50 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id fp5sm2604577ejc.6.2021.08.09.08.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 08:26:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: changes for v5.14
Date: Mon,  9 Aug 2021 17:26:39 +0200
Message-Id: <20210809152639.110576-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I organized changes on separate topic branches just in case I need to share
them with SoC maintainers.  They are all merged back to main branch.

Best regards,
Krzysztof


The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-5.15

for you to fetch changes up to c28b584deb1bc81f8a2454b43c82cdda17ed29f6:

  Merge branch 'for-v5.15/omap-gpmc' into for-next (2021-07-29 09:03:32 +0200)

----------------------------------------------------------------
Memory controller drivers for v5.15

Few minor fixes: maintainer pattern, unused-function warning in
Tegra186 and suspend/resume in OMAP GPMC.

----------------------------------------------------------------
Arnd Bergmann (1):
      memory: tegra: fix unused-function warning

Krzysztof Kozlowski (2):
      Merge branch 'for-v5.15/tegra-mc' into for-next
      Merge branch 'for-v5.15/omap-gpmc' into for-next

Mauro Carvalho Chehab (1):
      MAINTAINERS: update arm,pl353-smc.yaml reference

Tony Lindgren (2):
      memory: omap-gpmc: Clear GPMC_CS_CONFIG7 register on restore if unused
      memory: omap-gpmc: Drop custom PM calls with cpu_pm notifier

 MAINTAINERS                     |   2 +-
 arch/arm/mach-omap2/pm34xx.c    |   5 --
 drivers/memory/omap-gpmc.c      | 191 +++++++++++++++++++++++++---------------
 drivers/memory/tegra/tegra186.c |   2 +
 include/linux/omap-gpmc.h       |   3 -
 5 files changed, 121 insertions(+), 82 deletions(-)
