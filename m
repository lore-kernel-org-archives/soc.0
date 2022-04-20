Return-Path: <SRS0=wXmp=U6=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5D8C433EF
	for <soc@archiver.kernel.org>; Wed, 20 Apr 2022 07:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9B3AC385A9; Wed, 20 Apr 2022 07:27:17 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7CE5BC385A0
	for <soc@kernel.org>; Wed, 20 Apr 2022 07:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7CE5BC385A0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id t11so1604216eju.13
        for <soc@kernel.org>; Wed, 20 Apr 2022 00:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V012myQFecH4RwOiutDxuAhe7kD3PdUfMSj2lgEMrMA=;
        b=BIguwQ0St1I5BdcJmLLQHXVyqVZkbjRiVuHtC++WSEf8y+nf7rBypBvTYezUVPc44N
         8eq3Dy2HVeCZK4QJsvIJEDWOhttBPSXBBcpIW45Urd19YQeDMi8CRrLGVKsvTOeTTnFw
         0QBlF8U5gPhnHdgdjAqC+MmMc4zFZS+5cknRt2N+76EunwOBmlvYPrjaOxxqI3bwOBVS
         Tz+hBWm2hz9xpi2yDqSVskw8h+2beVoLWrMiFOW1ql4c0EYlTaYhPNAcJfJ4WbofJAIA
         DPSm7gZNoCCb1kqSn0aj1pYGpBKa3SSgclM3Nw8pyhazOGFbn7HSPyS/RJv4u+yFbRGp
         fW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V012myQFecH4RwOiutDxuAhe7kD3PdUfMSj2lgEMrMA=;
        b=dlB6VWgaPCR5uLllxR4WMiYCs6q0M6eZO5SSzG+0MryainbOmHICA75EUuCVahu1lN
         tWead0PeB3bDy6uh/TxPu7t3LSK7BKFYKokqp+ot9cOu73ItdsewGAYrlrzZa1+I4Tnx
         QFCZSqCfmFEW1x7W0w+iy255CoT/Pl0amzIlpKMCTfhgvyscVjO48SBFs1TbmjyPIVa6
         RZRTFgMY44tdOWXeA5oFh9v/4W2sYTH1+NkkgL8PREdr21cyuE5Z+0z0quc7y9UJ3tWq
         +1YGTY/vZdQDno/zVurAK0kQdrm594wucMgsLh9M+5tZmaeZa3y02Qyv4FWhbhOeaF08
         xoww==
X-Gm-Message-State: AOAM530tLx36DXIxeucS7DFkHzThTTyuoZWvRokTT/1oQ+6eBjX17BXE
	pl7uljlybXUeOHBrR56RFw7IaA==
X-Google-Smtp-Source: ABdhPJwt7yUdpklzrHQQHRPhDbadLHRqaTEz8y0KS4pjn8IitxP+QbvgQWdrAiB1aPUVmcgx0aor3w==
X-Received: by 2002:a17:907:7f19:b0:6ef:fe0b:71aa with SMTP id qf25-20020a1709077f1900b006effe0b71aamr1784184ejc.493.1650439634807;
        Wed, 20 Apr 2022 00:27:14 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id lg4-20020a170906f88400b006e869103240sm6366147ejb.131.2022.04.20.00.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 00:27:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v5.19
Date: Wed, 20 Apr 2022 09:27:12 +0200
Message-Id: <20220420072712.12648-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Early pull with few commits.

Best regards,
Krzysztof


The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-5.19

for you to fetch changes up to d37b07897e5024088b2170b8e6e1c68d567b9be6:

  memory: fsl-corenet-cf: Use helper function devm_platform_ioremap_resource() (2022-04-19 16:59:03 +0200)

----------------------------------------------------------------
Memory controller drivers for v5.19

1. Exynos: Reduce memory usage/allocation in Exynos5422 DMC driver.
2. Renesas:
   - Add bindings for R-Car H3/M3/E3.
   - Simplify single/double data register access.
3. Minor cleanups: TI/EMIF and FSL/Corenet.

----------------------------------------------------------------
Christophe JAILLET (1):
      memory: samsung: exynos5422-dmc: Avoid some over memory allocation

Geert Uytterhoeven (2):
      dt-bindings: memory: renesas,rpc-if: Document R-Car H3/M3/E3 support
      memory: renesas-rpc-if: Simplify single/double data register access

Krzysztof Kozlowski (1):
      memory: emif: remove unneeded ENOMEM error messages

Lv Ruyi (1):
      memory: fsl-corenet-cf: Use helper function devm_platform_ioremap_resource()

 .../memory-controllers/renesas,rpc-if.yaml         |  5 ++++
 drivers/memory/emif.c                              | 11 +--------
 drivers/memory/fsl-corenet-cf.c                    |  9 +------
 drivers/memory/renesas-rpc-if.c                    | 28 +++++++---------------
 drivers/memory/samsung/exynos5422-dmc.c            |  5 ++--
 5 files changed, 17 insertions(+), 41 deletions(-)
