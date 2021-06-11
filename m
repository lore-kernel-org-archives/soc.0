Return-Path: <SRS0=vghQ=LF=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2A0CC48BD1
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 11:03:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A587561357; Fri, 11 Jun 2021 11:03:38 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79C976108D;
	Fri, 11 Jun 2021 11:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79C976108D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=matthias.bgg@gmail.com
Received: by mail-wm1-f50.google.com with SMTP id g204so7851610wmf.5;
        Fri, 11 Jun 2021 04:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=vCyIaGr9HdSXYbdEnNeROI14YOfKenOTdPKQ3oJ5BUk=;
        b=XdZXYxNXeZIqT1kDjEoWtLkZY+kjSFW/PBv77Uo5qw/D77t0eZPPt13/efx0fgi1se
         q0VGrzYdijD19X4pwI6ylZ08Iltzi++/KVJf9AfMM+uZ7jyONVtzFZjHNaZh+0FE+TY4
         VafzOnggMVmI+bNj4t0E+pt0anjcgM9tkH33W7/E9Z02jghoMybL90dBEbtyLPCgMeWg
         fpOdtFGz0OhFRVeFM2hapslXJ4UOCY4yfITnMjtedVhsnjCkdd9G39tQ48JVt9aBvneV
         FD6v+uBDfFnUyQHDXW8xBh4h6Hpqvvf/CzAw5ZDbZaD2/oA6bWUVIIsJ1CpNwtdXnVsf
         7P6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=vCyIaGr9HdSXYbdEnNeROI14YOfKenOTdPKQ3oJ5BUk=;
        b=tGhav4KacQnb8rMBCxj9o4TbLq13Klc6nnfYB/w8w8Yc8xZFqR8Nrtssz96+9T3ecW
         UmfA1dP/C1oaqG6K8d1TnUcOy2l36rQGLImhdlw1Q1nsTgL5oxYD8xV9Y+li3wSHztYS
         5hbYctKRhXEDZP3S8HLkpkhm2RAkfxIvlcjuFhpbhqtcbNmEX8zfAnJyWyOdecEaqkDw
         YgKOGgpo4dzMaYnMeLNm6RthjNG0Zpw8ge1tDzF49SrS6cvw2s7jXsKgxuPpFIn3CcvO
         nSx8GuJvtHBuri/4RV1FHEBGdX29uboBAjh4Fx5VgNq+JkBBvo+aOL/TLSjg5Yq8tkII
         mvng==
X-Gm-Message-State: AOAM531DLSNEOb2+Bz5JP8PwATDGFWxGbVZjzka+fgryfSvsYuziMRRw
	W3G0tRecc+m+rll4ny/ZkU4=
X-Google-Smtp-Source: ABdhPJx7k6OC3naTAi4dvgfEX7Cu/9UQOk3TGxu+cv4XfIpS0y0ZlvA4xYVRKs1qikYJiZ0LImqcbg==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr3336364wmk.25.1623409417153;
        Fri, 11 Jun 2021 04:03:37 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id c7sm6745205wrs.23.2021.06.11.04.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jun 2021 04:03:36 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Henry Chen <henryc.chen@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
 Zou Wei <zou_wei@huawei.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] soc: mediatek: updates for v5.14
Message-ID: <479ec9ad-95d3-ce91-8243-63596c4c6676@gmail.com>
Date: Fri, 11 Jun 2021 13:03:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Arnd and Olof,




Please have a look at the soc driver patches for v5.14
.



Regards,


Matthias




---

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.13-next-soc

for you to fetch changes up to e88edc977b00cc467d598e4ea5091b8bb4a7f78d:

  soc: mediatek: pwrap: add pwrap driver for MT8195 SoC (2021-06-03 19:41:26 +0200)

----------------------------------------------------------------
devapc:
- add missing MODULE_DEVICE_TABLE to fix modalias

mkt-pm-domains:
- register smi node as regmap and not as syscon
- prepare-enable and unprepare-disable dependent clocks

pwrap:
- add support for MT8195

----------------------------------------------------------------
Henry Chen (2):
      dt-bindings: mediatek: add compatible for MT8195 pwrap
      soc: mediatek: pwrap: add pwrap driver for MT8195 SoC

Hsin-Yi Wang (1):
      soc: mtk-pm-domains: do not register smi node as syscon

Weiyi Lu (1):
      soc: mtk-pm-domains: Fix the clock prepared issue

Zou Wei (1):
      soc: mediatek: add missing MODULE_DEVICE_TABLE

 .../devicetree/bindings/soc/mediatek/pwrap.txt     |  1 +
 drivers/soc/mediatek/mtk-devapc.c                  |  1 +
 drivers/soc/mediatek/mtk-pm-domains.c              | 42 +++++++++-------------
 drivers/soc/mediatek/mtk-pmic-wrap.c               | 35 ++++++++++++++++++
 4 files changed, 53 insertions(+), 26 deletions(-)
