Return-Path: <SRS0=MYJy=JE=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CD3C433B4
	for <soc@archiver.kernel.org>; Wed,  7 Apr 2021 11:00:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1108C613A9; Wed,  7 Apr 2021 11:00:28 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8D52611EE;
	Wed,  7 Apr 2021 11:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8D52611EE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=matthias.bgg@gmail.com
Received: by mail-pg1-f182.google.com with SMTP id y32so9578610pga.11;
        Wed, 07 Apr 2021 04:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=LQOymtko7HIAx5KTgF2SvD7yA3dJoLvQ8IWqPxL0aAg=;
        b=MxFMvHw92o+NleiXmGY6uehuhXwpuXclR7qxQCgz1Jmacm9tSFdoqYhiZd51wYtIUc
         O4nOOKmdVsh88W6ikSX/v+/HwHrtHctFPWYXaxk8iJy5xs5HOgDsEApWxmUpjoBXGG86
         RVmG1PRuHPnu90n41vYsSWtYaXuBZgzRCKHtbdiHXEJVy/E8k7wpxmj5EybvtGhBKc7w
         9qMy0x05WObSvyxAM+SswUZdAauaZedxsLjlu9cxh+1kUbYs22RO32ZJH4w4wogUsNmx
         RNEpOsc6iU0fTIju4NdxsU8+nXFj782EAepThpu3TfKMRMBXpaGiDDAo6FWEEkLHwZDP
         J3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=LQOymtko7HIAx5KTgF2SvD7yA3dJoLvQ8IWqPxL0aAg=;
        b=iVpX385PpevShMS0xagA+OuwFGEslz4m+17M++N0c+6otq9OTifRFHCxykv3cs42Mt
         u4azEXd6F1bOuN3JTuGgU3XtQxOfm3VnsDXiXOnQ7n2w6Pir8hJIacHjeYiyfdr1cpbE
         7KjpCrmQu4DD+0JEznzGbsyVtRiaEFBDGu6y92VxoDnR3pRWbq024Vp7diErxAjuuaIn
         Wj28EgAldQxQg1BCoZBtU/s7R/WwPlRnWPuN8i+FpOtxY9fKWKS4wifYz5FP8Xr3jri0
         zvncHjQr118P3pi709JaNKp3CKdTLsOrdf9CFYiDLkLsozzpB6mWV6wEdjhq1oMIZHHX
         d1Qg==
X-Gm-Message-State: AOAM5315famTZ9KRFqA3pcf/O2YGKMKdzYOWnJ8TK0/Ck3vzCk9CIL5K
	7jgaqwL8xSX0kmP/oTs6g5skTLWbVcpu7A==
X-Google-Smtp-Source: ABdhPJxD1TZsuYjrVq53MEHRkgQgBKHD7KPa9iml5EDrde+7i3N9eN3cRfMeDqMrQmdAKkSTM/EC/g==
X-Received: by 2002:a63:5466:: with SMTP id e38mr2818659pgm.172.1617793227543;
        Wed, 07 Apr 2021 04:00:27 -0700 (PDT)
Received: from ziggy.stardust ([37.223.140.37])
        by smtp.gmail.com with ESMTPSA id d24sm5033895pjw.37.2021.04.07.04.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 04:00:26 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Fabien Parent <fparent@baylibre.com>,
 Irui Wang <irui.wang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: dts: mediatek: changes for v5.13 (second round)
Message-ID: <22814673-e9fe-f65b-cc0f-b02be4f90d1a@gmail.com>
Date: Wed, 7 Apr 2021 13:00:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Olof and Arnd,

Here comes the second round of arm64 DT patches. Hope I'm not too late.
Basically we add several node to MT8167.

Please have a look.
Regards,
Matthias

---
The following changes since commit a7dceafed43a4a610d340da3703653cca2c50c1d:

  arm64: dts: mediatek: fix reset GPIO level on pumpkin (2021-04-01 11:39:10 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.12-next-dts64.2

for you to fetch changes up to 3a8c657a3b4a70405582bf8e1cc39ff3b55c53f6:

  arm64: dts: mediatek: mt8167: add some DRM nodes (2021-04-06 15:12:40 +0200)

----------------------------------------------------------------
- separate enconder blocks for MT8173

MT8167:
- add power domain node
- add nodes for graphical output (iommu, larb, smi, mmsys)

----------------------------------------------------------------
Fabien Parent (6):
      arm64: dts: mediatek: mt8167: add power domains
      arm64: dts: mediatek: mt8167: add mmsys node
      arm64: dts: mediatek: mt8167: add smi_common node
      arm64: dts: mediatek: mt8167: add larb nodes
      arm64: dts: mediatek: mt8167: add iommu node
      arm64: dts: mediatek: mt8167: add some DRM nodes

Irui Wang (1):
      arm64: dts: mt8173: Separating mtk-vcodec-enc device node

 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 270 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi |  60 +++----
 2 files changed, 301 insertions(+), 29 deletions(-)
