Return-Path: <SRS0=5Ucw=2E=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40367C433FE
	for <soc@archiver.kernel.org>; Mon,  3 Oct 2022 07:32:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 07835C433D7; Mon,  3 Oct 2022 07:32:45 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E056C433B5
	for <soc@kernel.org>; Mon,  3 Oct 2022 07:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5E056C433B5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id x40so141686ljq.9
        for <soc@kernel.org>; Mon, 03 Oct 2022 00:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=77DQW3lsofQQZnwFkOSE0jlhaIOSR4ZhDsIQytSJOII=;
        b=m49J/G2VqOQiRmROweFuYDGFPT7u+OwT6ePg4e+sgGCz81USX+C/ryBf3dTanLStbb
         MuBqBxrPV1ZrETAq+9zYJMw6aCXO/o5idY9nE0Bz7uo5jm/YiNONNcW4zAEi3awBf+K4
         K54ql3FylCtnoMTp98BSkpMU3czLkraNBot3doE71ARS16lRKxq6WxUqvPtnS1jAVXoZ
         HfdmPfYc+6mprt5inhAjGoRaowd/C6z1Qp2h/1DMYKT6Kb8dSyqFxxgYkU5Qa/hv1bv7
         uwZcwLXttWWMr3tsGwcIogLfIi6sAQTS8JV/2+tQmaY/FMa+4Mo+ByCfzDyLdEv03GZ8
         a6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=77DQW3lsofQQZnwFkOSE0jlhaIOSR4ZhDsIQytSJOII=;
        b=b6ZhJO9KJJsMNPPJ0Ke2ddCNXOaXaJJks5cq9JuAfDNXYn/z5daYnGwllXesprZdFt
         R7BGGZsOhmuJHKIfzYRtoltIyJ9i58iILsCZQEK/BOsT4xCoCUDFGPQzVbjWyP7uuFKu
         Y8ZrOo+svMqVyGXnyL//fIvZ5btfiGXG6goD8cGO1XLFduTcgyb7TVxuIzv2nKtNZ5H9
         aBKDR4wmPyzWa5SROVZepZ51mU+MPzKbKSMk3Eh9jaC5jPA1Vq5CSFhV0LiawOA++RGN
         XJuaTXODgVKASII7nSIrA2Fb2Yxb3ZP3Cb2XVmPP4gG/TTg0+UBT26b4dUUyb+VzAWUX
         KxxA==
X-Gm-Message-State: ACrzQf0u+65YFpc49LtpZo5spuAedlwHsD1BH9GVvBi2+biBfPQob7vN
	eRLfkcimppJmkxdepBWvvPnTcQ==
X-Google-Smtp-Source: AMsMyM6qceEYubm9CXUHhRWKO97jTt1fHDzHiVVhvvvXLjxHA5bZC4Jiy7begCXZ60W2LAc8Rfi0lA==
X-Received: by 2002:a2e:a9a9:0:b0:261:bf5a:8ff3 with SMTP id x41-20020a2ea9a9000000b00261bf5a8ff3mr5926333ljq.252.1664782361354;
        Mon, 03 Oct 2022 00:32:41 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id bi39-20020a0565120ea700b0048b26d4bb64sm1357833lfb.40.2022.10.03.00.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 00:32:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: late (3rd) for v6.1
Date: Mon,  3 Oct 2022 09:32:37 +0200
Message-Id: <20221003073237.11488-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Late pull for v6.1 with minor stuff - cleanups and bindings fix.

Best regards,
Krzysztof


The following changes since commit 5514acb0dd030356e628cdd88b266efaa0a22315:

  dt-bindings: memory: snps,dw-umctl2-ddrc: Extend schema with IRQs/resets/clocks props (2022-09-21 20:34:58 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.1-3

for you to fetch changes up to 56efd6435c6890a3a38a33d192a0f9d5c835a24b:

  memory: tegra186-emc: use DEFINE_SHOW_ATTRIBUTE to simplify code (2022-09-28 09:30:23 +0200)

----------------------------------------------------------------
Memory controller drivers for v6.1, part 3

1. STM32 FMC2: correct in bindings the name of property for address
   setup duration. The DTS and driver were already using proper name,
   so it is only alignment of bindings with real usage.
2. Tegra MC: simplify with DEFINE_SHOW_ATTRIBUTE.

----------------------------------------------------------------
Liu Shixin (4):
      memory: tegra20-emc: use DEFINE_SHOW_ATTRIBUTE to simplify code
      memory: tegra30-emc: use DEFINE_SHOW_ATTRIBUTE to simplify code
      memory: tegra210-emc: use DEFINE_SHOW_ATTRIBUTE to simplify code
      memory: tegra186-emc: use DEFINE_SHOW_ATTRIBUTE to simplify code

Marek Vasut (1):
      dt-bindings: memory-controller: st,stm32: Fix st,fmc2_ebi-cs-write-address-setup-ns

 .../bindings/memory-controllers/st,stm32-fmc2-ebi.yaml    |  2 +-
 drivers/memory/tegra/tegra186-emc.c                       | 15 +--------------
 drivers/memory/tegra/tegra20-emc.c                        | 15 +--------------
 drivers/memory/tegra/tegra210-emc-core.c                  | 15 +--------------
 drivers/memory/tegra/tegra30-emc.c                        | 15 +--------------
 5 files changed, 5 insertions(+), 57 deletions(-)
