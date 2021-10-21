Return-Path: <SRS0=B8Jt=PJ=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44BD1C4332F
	for <soc@archiver.kernel.org>; Thu, 21 Oct 2021 09:30:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2225B61205; Thu, 21 Oct 2021 09:30:09 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C56A361004
	for <soc@kernel.org>; Thu, 21 Oct 2021 09:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C56A361004
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E03A73FFF7
	for <soc@kernel.org>; Thu, 21 Oct 2021 09:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1634808606;
	bh=lGRdlVVI98glg7ntrSV8ab4TJAzQBo6Stek2XYxVhxg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=Maz0eBZ/Lb+nRlTVByq4Yqvs4m4MK5mURJBB4OEsoM0Z9KLqGBmmpXJRuYVVjaQo1
	 7EVTDMHVEM6jb3SFrbcOt4nuhrHBLHYf7F7j9IeBm+5ON31wRZZMPyCJBDCxjfaPgs
	 OK94tQeyOmBDCoWsjVNlPaljdmocLeNG2+AJkvoPQhoj/eYt6yGDBzAiwP/CSL2lPQ
	 N6lNYKszNKVqxGveCAOxbRwUgkRjuydX3JYBObo4PtieDnqBlUbvU8mi9MVmfuxaHo
	 QWDkE03gtbmlgK23hHyIzd6O/E3PsOce++MbWtvV2AYE2nPEKev4R2SDwuNU9KHYWA
	 S/pqk8k4O4KCA==
Received: by mail-lf1-f71.google.com with SMTP id k8-20020a0565123d8800b003fd6e160c77so4389091lfv.17
        for <soc@kernel.org>; Thu, 21 Oct 2021 02:30:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lGRdlVVI98glg7ntrSV8ab4TJAzQBo6Stek2XYxVhxg=;
        b=5sBK03YoLtBVpK5nI4wD/BflRUwgLyjWa1spBI5Lvs1/MPeUnI4Yvg90mboJwLN7Zy
         m7RepbG2yseuGOw+y/YK4v8hfuao1xST97hoZJwb7R/e13XuHNVts3Rr8dTWnenp2aVl
         V6B/zOBdDWm3K8n3PCzDdPTSThIY6S3MWFyTRrMH/sB4WmGcK5Febj+UZfb7HaP3QnTg
         /F5AhAo8j167ggdHih8JOeVGPlnnzDDHlcjz5ZzvsSZYfooh+oCoTFPC2EcOeU9L9Nbt
         LpnuWVtkOK9/PjzGxrNzNQ7TuVxpu6yH88vd2Y6QmXeN+WILYi6C/rK4/tUv2QBEzuaO
         77Gw==
X-Gm-Message-State: AOAM532/uUQ69WZEgXhWDg/QTLEmjmeGjhPIT/LHve4qqOusvirgRutZ
	1S/R1W9lP9uldBFGufYXZxyKPC1UkNVO1YfvoGu0CQyT/uZvDlPoD/8dq6ZieFM99ffi5Qh/avo
	rRhV1i10FCqLrPWaost6W92o=
X-Received: by 2002:a05:6512:31b:: with SMTP id t27mr4548371lfp.688.1634808606193;
        Thu, 21 Oct 2021 02:30:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRCWa8XhZR6dH15N8eWqRYbXncemNhMtimPyQuIdMZaYT4R2Z807Gq6JVJCz623+OFDkhPEQ==
X-Received: by 2002:a05:6512:31b:: with SMTP id t27mr4548339lfp.688.1634808605920;
        Thu, 21 Oct 2021 02:30:05 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id c19sm489959ljj.130.2021.10.21.02.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 02:30:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v5.16, part 2
Date: Thu, 21 Oct 2021 11:30:02 +0200
Message-Id: <20211021093002.118192-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Second pull request for memory controller drivers, mostly touching Tegra. On
top of previous tags/memory-controller-drv-5.16.

Best regards,
Krzysztof


The following changes since commit d611d7ea120bbef45e836565dfa2ddc85a168c16:

  Merge branch 'for-v5.16/renesas-rpc' into mem-ctrl-next (2021-10-10 19:45:00 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-5.16-2

for you to fetch changes up to 14b43c20c283de36131da0cb44f3170b9ffa7630:

  memory: tegra20-emc: Add runtime dependency on devfreq governor module (2021-10-21 11:18:08 +0200)

----------------------------------------------------------------
Memory controller drivers for v5.16, part two

1. Convert LPDDR2 bindings to dtschema and extend them with new
   properties.
2. Tegra 20 EMC: support matching timings by LPDDR2 configuration from
   devicetree.

----------------------------------------------------------------
Dmitry Osipenko (9):
      dt-bindings: Relocate DDR bindings
      dt-bindings: memory: lpddr2: Convert to schema
      dt-bindings: memory: lpddr2: Add revision-id properties
      dt-bindings: memory: lpddr2: Document Elpida B8132B2PB-6D-F
      dt-bindings: Add vendor prefix for Elpida Memory
      dt-bindings: memory: tegra20: emc: Document new LPDDR2 sub-node
      memory: Add LPDDR2-info helpers
      memory: tegra20-emc: Support matching timings by LPDDR2 configuration
      memory: tegra20-emc: Add runtime dependency on devfreq governor module

 Documentation/devicetree/bindings/ddr/lpddr2.txt   | 102 ----------
 .../memory-controllers/ddr/jedec,lpddr2.yaml       | 223 +++++++++++++++++++++
 .../ddr/lpddr2-timings.txt                         |   0
 .../ddr/lpddr3-timings.txt                         |   0
 .../{ => memory-controllers}/ddr/lpddr3.txt        |   5 +-
 .../memory-controllers/nvidia,tegra20-emc.yaml     |  23 ++-
 .../memory-controllers/samsung,exynos5422-dmc.yaml |   3 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 drivers/memory/jedec_ddr.h                         |  47 +++++
 drivers/memory/jedec_ddr_data.c                    |  41 ++++
 drivers/memory/of_memory.c                         |  87 ++++++++
 drivers/memory/of_memory.h                         |   9 +
 drivers/memory/tegra/Kconfig                       |   1 +
 drivers/memory/tegra/tegra20-emc.c                 | 200 ++++++++++++++++--
 14 files changed, 622 insertions(+), 121 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/ddr/lpddr2.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
 rename Documentation/devicetree/bindings/{ => memory-controllers}/ddr/lpddr2-timings.txt (100%)
 rename Documentation/devicetree/bindings/{ => memory-controllers}/ddr/lpddr3-timings.txt (100%)
 rename Documentation/devicetree/bindings/{ => memory-controllers}/ddr/lpddr3.txt (94%)
