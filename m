Return-Path: <SRS0=6vKs=ZM=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00C9ECAAD3
	for <soc@archiver.kernel.org>; Fri,  9 Sep 2022 15:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB0BDC433C1; Fri,  9 Sep 2022 15:30:48 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B9FBEC43470
	for <soc@kernel.org>; Fri,  9 Sep 2022 15:30:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B9FBEC43470
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id k10so3322861lfm.4
        for <soc@kernel.org>; Fri, 09 Sep 2022 08:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=+mAqJOgM8Ae7l6t9jqHU0zRO0K/U2EOlnDRdwAzG1bY=;
        b=B9bEZR+j7kRa6FIs825QyyfDUIAZ+ohPsf3dItiLcCo8ldqMOYLx9mZiWNDpE2AlYJ
         f/VNQ68PNKBo35iao/6ZvZ8BJZAgRFatR06O1KiU8EzagLSwueVGBhlAGiw3hAQ/1/Iq
         mxy+LtknzAjFZ/wOHC8ahHjok4envr3wCgHVfLIXH2/uGudiNHb9FoffXRNrT0rQ9VFB
         6ogCHDaLJW6pv9YASpliIuSW6KTb2jsJA3zfQmaDtPZHcYvlSLe6aoE9IVL4xr6t+GGb
         kjC4fo2m6yls4YXB4PAeQht6VtxCYG4ANGTLdbmjT12wymnK/0O+qVbYWe6QsSn0Y3N3
         CWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=+mAqJOgM8Ae7l6t9jqHU0zRO0K/U2EOlnDRdwAzG1bY=;
        b=pQ1EkPHa013mIrmiK+ifMQ9UAcixXdKE4EKpUr3+ZTsfYLIYSlk3zhxmD3MST9GTdh
         mVB8zM51pIjQsRZtSnNDYdAZfTc8zYM36mW9txKcG8lEmeflo8Ewf2Wz453bGNQdgNtO
         uzJ/eqwYuGVhKWBO3aqLHfwCBYX5lRava7rGIkWLi6KkMrBGmKGEuKDGWhXEG7loKcKy
         Zhe7rpgamYrshgOPnazeH2Iou9rAqDHKzYDsKLxXQPFMbwfDE2I4q8RTwDypgik9WWkl
         BigZYa8J7NJ4SwZ8dFUjXqHHCzRiOfznbCSIqEPfschPo1h6w6ZuXbWK3g+T7Eb1KL/a
         Bpxw==
X-Gm-Message-State: ACgBeo3jSV9lomAMpIn/9OIkzcq3se3tkecoRGQAaKPZsI7sDEk+HHjC
	F9fsxF/u+L0maI2KX0vLmQV/0Q==
X-Google-Smtp-Source: AA6agR54woyzOPP4GJVG8gcbyG903ZIhHAHadHE2YriQY9jB67GC0diYbnI+NB4qlUollAbzWY9APQ==
X-Received: by 2002:a05:6512:168d:b0:491:3206:b63 with SMTP id bu13-20020a056512168d00b0049132060b63mr4384111lfb.149.1662737445845;
        Fri, 09 Sep 2022 08:30:45 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 6-20020a05651c00c600b0026ac3fedd20sm117314ljr.86.2022.09.09.08.30.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 08:30:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/4] memory: drivers for v6.1
Date: Fri,  9 Sep 2022 17:30:35 +0200
Message-Id: <20220909153037.824092-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909153037.824092-1-krzysztof.kozlowski@linaro.org>
References: <20220909153037.824092-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.1

for you to fetch changes up to 9f8fb8032febf594914999c33493c682eaf138cb:

  dt-bindings: memory: mediatek,smi: Update condition for mt8195 smi node (2022-08-16 12:21:14 +0300)

----------------------------------------------------------------
Memory controller drivers for v6.1

1. Fix OF node refcount leaks in pl353-smc and generic of_memory code.
2. Add support for FPGA DFL EMIF revision 1.
3. Update bindings for Mediatek SMI mt8195.

----------------------------------------------------------------
Debarati Biswas (1):
      memory: dfl-emif: Update the dfl emif driver support revision 1

Liang He (3):
      memory: pl353-smc: Fix refcount leak bug in pl353_smc_probe()
      memory: of: Fix refcount leak bug in of_get_ddr_timings()
      memory: of: Fix refcount leak bug in of_lpddr3_get_ddr_timings()

Tinghan Shen (1):
      dt-bindings: memory: mediatek,smi: Update condition for mt8195 smi node

 .../memory-controllers/mediatek,smi-common.yaml    | 11 +++-
 drivers/memory/dfl-emif.c                          | 62 ++++++++++++++++++++--
 drivers/memory/of_memory.c                         |  2 +
 drivers/memory/pl353-smc.c                         |  1 +
 4 files changed, 70 insertions(+), 6 deletions(-)
