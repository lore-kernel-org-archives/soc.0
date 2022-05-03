Return-Path: <SRS0=Fita=VL=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E533FC433F5
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 07:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6612C385A9; Tue,  3 May 2022 07:06:59 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 763D5C385B1
	for <soc@kernel.org>; Tue,  3 May 2022 07:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 763D5C385B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id z19so18827392edx.9
        for <soc@kernel.org>; Tue, 03 May 2022 00:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kc27XkBGcgpvj03uAIYtN/02TiD3/pa2n1+ce6OYwxU=;
        b=oiujbke1mRaMlkrcvlJUsyRrSeYQQfI74Nfjm3EQNjNj1vJPnauGqf8I9d/0ottIAO
         9blvr38o8Rx9hytaNwfDaQsSyqkgbczUToEqrMYzmV0IHAsfmBj0QSXXAGsx7WFNyTxy
         435x0+jDlBxN0vM9vG3RcXG4spjyxafTf2YUHIRJ4zBYN6e/LnFpdxUNvo5QsYxpjQBO
         6qeXC1TJYSr8NUBIAfIcmDZwu0/6StMwPGQdzfcBGX4JrmN8AIsVffC8MCECL7PFGQeh
         gDwdI4BEFBo0albVdfwjVn+rJM9UpO/hdMWSnCxWr2jSaIYyOv5RBqGgz99p8Uh2m1xG
         nBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kc27XkBGcgpvj03uAIYtN/02TiD3/pa2n1+ce6OYwxU=;
        b=p13XIGZVf25kEFNw+wyiQmh7VWGh4rCWiMqXaoFY7PjqJ2XH5vlFhJU0aIf9fA0Hv4
         z6bU8olWLE2Kxn2q0ZXyjq+YLLx1IpMa8FqVw6z69wGBWUaXQScHzMRrcA27vXuKa816
         sfxBhIUh/eFrPehOdyDrdymdpxKv/OpnZFr4aQggLpbxdqH7tLtX9fHh7oNtxFPD++j7
         hUFdw9+6aUJSFF4YVgZb351J24d6mBqSOYGHdvfrAGcZQ7JeBor1a06ScAeyxBJmSSgH
         AkDXN3xXGrgdG7+2saL9hg/OXbvAWK6rU5h0LYNLeHUjUFtKZdIedIUOaCCJLC259d4+
         MMag==
X-Gm-Message-State: AOAM531gF7ThO9Mfz2kUzBAKiUjZvS2lR1x37NtuK72t6hhvOxECjwYk
	Mgg4VMUqgZFolp82fHX+w9xFjA==
X-Google-Smtp-Source: ABdhPJx6otopPtL/mDsEY9EYB6OU78ELkUNRo7Bc1zygiqHJ0krCRFZejUlcSAKWtlvTUFjS9GkqFA==
X-Received: by 2002:aa7:d407:0:b0:425:f57e:7ae5 with SMTP id z7-20020aa7d407000000b00425f57e7ae5mr16536588edq.393.1651561616510;
        Tue, 03 May 2022 00:06:56 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id ze16-20020a170906ef9000b006f3ef214e37sm4300593ejb.157.2022.05.03.00.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 00:06:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: drivers for v5.19, part two
Date: Tue,  3 May 2022 09:06:52 +0200
Message-Id: <20220503070652.54091-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

On top of previous pull (tags/memory-controller-drv-5.19).

Best regards,
Krzysztof


The following changes since commit d37b07897e5024088b2170b8e6e1c68d567b9be6:

  memory: fsl-corenet-cf: Use helper function devm_platform_ioremap_resource() (2022-04-19 16:59:03 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-5.19-2

for you to fetch changes up to 854fd9209b20837ab48c2e6714e5e44dd8ea33a2:

  memory: omap-gpmc: Allow building as a module (2022-04-29 08:57:36 +0200)

----------------------------------------------------------------
Memory controller drivers for v5.19, part two

1. Cleanup: simplify platform_get_resource() calls by using
   devm_platform_get_and_ioremap_resource() helper.
2. OMAP: allow building omap-gpmc as module and make it visible (it is
   not selected by platform anymore).

----------------------------------------------------------------
Krzysztof Kozlowski (7):
      memory: da8xx-ddrctl: simplify platform_get_resource()
      memory: emif: simplify platform_get_resource()
      memory: ti-emif: simplify platform_get_resource()
      memory: ti-emif-pm: simplify platform_get_resource()
      memory: tegra: mc: simplify platform_get_resource()
      memory: brcmstb_dpfe: simplify platform_get_resource_byname()
      memory: renesas-rpc-if: simplify platform_get_resource_byname()

Roger Quadros (2):
      memory: omap-gpmc: Make OMAP_GPMC config visible and selectable
      memory: omap-gpmc: Allow building as a module

 drivers/memory/Kconfig          |  2 +-
 drivers/memory/brcmstb_dpfe.c   | 10 +++-------
 drivers/memory/da8xx-ddrctl.c   |  3 +--
 drivers/memory/emif.c           |  4 +---
 drivers/memory/omap-gpmc.c      | 43 ++++++++++++++++++++++-------------------
 drivers/memory/renesas-rpc-if.c |  3 +--
 drivers/memory/tegra/mc.c       |  4 +---
 drivers/memory/ti-aemif.c       |  4 +---
 drivers/memory/ti-emif-pm.c     |  6 +++---
 9 files changed, 35 insertions(+), 44 deletions(-)
