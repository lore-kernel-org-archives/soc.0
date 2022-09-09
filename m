Return-Path: <SRS0=6vKs=ZM=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E715DECAAD3
	for <soc@archiver.kernel.org>; Fri,  9 Sep 2022 15:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CED4EC433D7; Fri,  9 Sep 2022 15:30:51 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6694DC43141
	for <soc@kernel.org>; Fri,  9 Sep 2022 15:30:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6694DC43141
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id bt10so3342362lfb.1
        for <soc@kernel.org>; Fri, 09 Sep 2022 08:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=BvCXK3YQt13LeJapsx/v8Xr4fEe64m3JS7hEavSdj6k=;
        b=AXANFeMvuASemcbrpl0qNmBJaM4SfLLb49QfgpAESk6Q/BLHIVQnylJZrHSDveuEa9
         0PoUPllENRkfFM2UkOUNIKY5AjnFqNHPyCuMDx6BIt1X1/HkTlaC31+gMuIFq3/ZibzH
         SFraiPdNfM0DAc0lDzyApKD5fpJFrtPDN01Dd3TdZU1AfiTjVBt8lrURtlamZSd8voVS
         rgpeflEiEjVhsBilmiBaYnNW25Vv63ferNVKWFq9d7Cxg/xq9zUdo7ZHiXw9ZHoc+/Q0
         g2yiOEL+xv4uzgrhvtdSq/K9axzuEvks1lLf/1Yj8PCC34jgPd6PiMZBQCnBcX4eptXi
         2fiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=BvCXK3YQt13LeJapsx/v8Xr4fEe64m3JS7hEavSdj6k=;
        b=HUMC1HpeWOvDMsSDD8SFy6i3ZrHpbgYKvsQGiath/I79zmEI7qVCJQMjSGVGsl4/Gn
         g047V/nm2PneJbuevQuE/wcVjG1r4E/On6rxyiHZNnc56XGLBwR2TPUNtmMH0UReKwDB
         NcWdelJWnJZaf9hnr+TUcB4CqAw8HYiQeaCTptcnDq/5HiEs6FEVkYImnmFeia6ID5xT
         Ih79321FdOq3KHn7cSgRVxtV22/VmM3LC+ZXF6gwobfx2ftFZMM+76GC31B1/Cvr3dyS
         sTDgnCCG1CFnmBtNfr+Pc0iwMeDNqEV2Kx345nzIwrtZ0rr9iKMQPAC8+ZLKD9lPtxhN
         kXXg==
X-Gm-Message-State: ACgBeo0fqKA6Z/1RWA3Uo8BifPXWIi5U4zTWM25GZjz+1K9RFfJb6LTX
	rB1w+XVIvrFx7PHX1ZgeOfbY/g==
X-Google-Smtp-Source: AA6agR7Zd7IRUHOhcUXLKhW0kDnZxC9nQxGqcrpEnbQbCu13nvdQHY9NW7WmFbYYOhqSjSsta8L9aA==
X-Received: by 2002:a05:6512:1395:b0:48d:81b:4955 with SMTP id p21-20020a056512139500b0048d081b4955mr4408315lfa.307.1662737448433;
        Fri, 09 Sep 2022 08:30:48 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id 6-20020a05651c00c600b0026ac3fedd20sm117314ljr.86.2022.09.09.08.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 08:30:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 4/4] memory: mediatek for v6.1
Date: Fri,  9 Sep 2022 17:30:37 +0200
Message-Id: <20220909153037.824092-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909153037.824092-1-krzysztof.kozlowski@linaro.org>
References: <20220909153037.824092-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Topic branch.

Best regards,
Krzysztof


The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-mediatek-6.1

for you to fetch changes up to 673e71df5ccfaefeb32bb5b3130a5d397b742194:

  memory: mtk-smi: mt8188: Add SMI Support (2022-08-30 20:54:05 +0300)

----------------------------------------------------------------
Memory controller drivers for v6.1 - MediaTek

Add support for the mt8188 SMI memory controller.

----------------------------------------------------------------
Chengci.Xu (4):
      dt-bindings: memory: mediatek: Add mt8188 smi binding
      memory: mtk-smi: Add return value for configure port function
      memory: mtk-smi: Add enable IOMMU SMC command for MM master
      memory: mtk-smi: mt8188: Add SMI Support

 .../memory-controllers/mediatek,smi-common.yaml    |   4 +-
 .../memory-controllers/mediatek,smi-larb.yaml      |   3 +
 drivers/memory/mtk-smi.c                           | 109 +++++++++++++++++++--
 include/linux/soc/mediatek/mtk_sip_svc.h           |   3 +
 include/soc/mediatek/smi.h                         |   5 +
 5 files changed, 114 insertions(+), 10 deletions(-)
