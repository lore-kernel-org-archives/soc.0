Return-Path: <SRS0=bijT=UR=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E094C433F5
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 08:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1472AC385A9; Thu,  7 Apr 2022 08:14:56 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5B078C385A0
	for <soc@kernel.org>; Thu,  7 Apr 2022 08:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5B078C385A0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id d10so5532829edj.0
        for <soc@kernel.org>; Thu, 07 Apr 2022 01:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uuPCrvHDkvmkaWKFBJeZIWghlVm/xXawdQ6pGCSJBsY=;
        b=X76cHWHH+dKO15k7nRs696qFHOComkQcq5VyssHr/p36pNENkVdOithAKx3GTruA4l
         u8wb0yE8g7u/vEm4BZ+ublqst3AvzTGVsyPmFehSAAm+aG5VLzh460t0e5CSLcI2GxNh
         NgHj5lWAjA2kuV9/sY1lhGnzw8B0p/mFK7ddFasN9xIJuLaxhj1XPVMwb0aKLWP7AnyS
         cZLDWhiPZ+3mW7ie8f2UeMtZjCTuj8hDcPdG9RW+aLE5/QRmjyWVx57t6M53EqQ1jJAJ
         zcqqCy8Sqdid/tnG0Qfr/ORHTNN8/H+BBdW+K6TISwmSyPJqLrI8Bl/drRUqMZf0H0iS
         BifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uuPCrvHDkvmkaWKFBJeZIWghlVm/xXawdQ6pGCSJBsY=;
        b=oKYbN6okWa1R/14kbO1OnK3EVZMcenZ5v5pJ/pV5iAD8JZ6/Q0+dUGhWMG82VsgwFD
         ai6d1sqVByLH/IjpINNV2r/568fC9raWPKncpPHmjJbuy3YZ4HRSFFHlVvBhdN53nlyY
         Kujvtjk/+CFElV8XGMVcFfQbyCQdAW7ghF7G9HcPOvbpqQgJrEcd8GG+Pa7SAMwhllWM
         6U+W6yPJkyJHVVPLPwD/zb/y1/e9B0DjTBwKOSR91f5ehhR5YcHizIj+gB9jU9FPEVBo
         0N0L4XjhzYDJ6HsRlNAWS2Vaw60k2VR821wTvk2jTRhUro43nlx0Sy/J61oyy1XFjYPJ
         rGkw==
X-Gm-Message-State: AOAM533DVkwQxopQfsSH16UGe6FAd83xAr5jVbVq1oO98sVj2oecndhc
	OIl1aM5dVKQnsZS8jnr0Di+JI00FtmYiMDHv
X-Google-Smtp-Source: ABdhPJwaxJSzvu7XogoiRn/oibfelC9c2fpnLOfco3bPP29ZKDL2pqIOiV7f5CgICkKrJMwAzRa8Qg==
X-Received: by 2002:aa7:db18:0:b0:41c:e010:a07f with SMTP id t24-20020aa7db18000000b0041ce010a07fmr12822787eds.281.1649319292623;
        Thu, 07 Apr 2022 01:14:52 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id u26-20020a17090626da00b006e7cb663277sm4956566ejc.90.2022.04.07.01.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 01:14:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: Fixes for v5.18 (current cycle)
Date: Thu,  7 Apr 2022 10:14:48 +0200
Message-Id: <20220407081448.113208-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Fixes for v5.18, please. One is recently introduced, others were already
existing.

Best regards,
Krzysztof


The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-fixes-5.18

for you to fetch changes up to dd8adc713b1656ce469702eba8fc1adc4db91dc4:

  memory: fsl_ifc: populate child nodes of buses and mfd devices (2022-04-06 09:39:16 +0200)

----------------------------------------------------------------
Memory controller drivers - fixes for v5.18

Issues in v5.18:
1. Freescale/NXP: fix populating children of Integrated Flash Controller
   DT nodes.

Issues existing before:
1. Renesas: fix platform-device leak in probe's error path.
2. Atmel: fix of_node reference leak in probe's error path.
3. Synopsys: correct the bindings for snps,ddrc-3.80a (interrupts are
   required).

----------------------------------------------------------------
Johan Hovold (1):
      memory: renesas-rpc-if: fix platform-device leak in error path

Li Yang (1):
      memory: fsl_ifc: populate child nodes of buses and mfd devices

Miaoqian Lin (1):
      memory: atmel-ebi: Fix missing of_node_put in atmel_ebi_probe

Sherry Sun (1):
      dt-bindings: memory: snps,ddrc-3.80a compatible also need interrupts

 .../memory-controllers/synopsys,ddrc-ecc.yaml      |  6 ++++--
 drivers/memory/atmel-ebi.c                         | 23 ++++++++++++++++------
 drivers/memory/fsl_ifc.c                           |  3 +--
 drivers/memory/renesas-rpc-if.c                    | 10 +++++++++-
 4 files changed, 31 insertions(+), 11 deletions(-)
