Return-Path: <SRS0=64cw=CD=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4119FEB64D9
	for <soc@archiver.kernel.org>; Thu, 15 Jun 2023 16:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2415CC433CA; Thu, 15 Jun 2023 16:30:58 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7790AC433C0;
	Thu, 15 Jun 2023 16:30:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7790AC433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f7e7fc9fe6so22366505e9.3;
        Thu, 15 Jun 2023 09:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686846654; x=1689438654;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSvW8xQ3fMMmhQi1V12MVYx2Y4aXgyRBvyAHKsN/E1o=;
        b=YjH1qo3cT/ZFVWK3nPNhNhJTqtBGzdCz84w6OBqEbNzXERkVm4z1+r0EA9Rj/QtvZl
         d96C3yDoaRbW2KKfUN5YzD2tzMwIc8rm8VoDI/VHamU6UJpEBCFlLYhaim+jZWMNVQq5
         CySWTW7N1WSFnFEdcQ3Gr1PG2oGt7gI8o/Toy4axAyS1X2LKK3jHdgfjOHjKDY+hndOs
         DpQCSomhkHY0CvWk55JjbJbiSpEhHsCYJ2MVSsUMVgomibNEjpwO1+8XMK7UuQyQ80wf
         ooCFI5GYpwHGZt0e4sM/aSDeQNwrhEyXlAGPloHbzl6xlkf8G7Z4xsFd8KeQKDydeXHy
         WWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686846654; x=1689438654;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MSvW8xQ3fMMmhQi1V12MVYx2Y4aXgyRBvyAHKsN/E1o=;
        b=id55csKXR2HW95VKqCAik6W0C1DGz5UPpJdIvF8Pch8INtdt3NSqxbKjXFAvvxWWZ7
         5kwalDuFCHz+qKVkUQfXeNOXYniuK1BcuMR9OpoFbj0HFofKQGOd8oncB/luvgJgZQWZ
         0CzAG3vasqbbUdAID9Vnw+ttVgo9vOyPyp2TCKR3JOJpxSoho5acD2ckbjWJC1s4+B0S
         K9cWWqaqLpuIMjp5RT1VTOIYnMWrgt3KYFPVyJLlKjn48FyGJY4jjJelN/TFbgZSNguk
         VG33tS/rFa2oKxglRoBzhzTVxJmwBY4DPVuewdVT4iiQLIgSNgHIOmNojo2uUPjzB2FS
         JSlw==
X-Gm-Message-State: AC+VfDwm6buFhAoWFGrJyADG4RbFgZGYgqQMb3VAaV55dAK8qFRsgH0O
	/g5GKAEimmfYWWGDePx4xe5Idqve8Ls=
X-Google-Smtp-Source: ACHHUZ71wiijuoIQm9uEngcIwoxkMEEoEzoYs3wifgs7iwqrDeiX77lO/iZy7WMt23bSIXP+JN6NwQ==
X-Received: by 2002:a1c:4c0c:0:b0:3f6:496:e240 with SMTP id z12-20020a1c4c0c000000b003f60496e240mr15371208wmf.27.1686846654263;
        Thu, 15 Jun 2023 09:30:54 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l7-20020a7bc347000000b003f4248dcfcbsm21348272wmj.30.2023.06.15.09.30.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 09:30:53 -0700 (PDT)
Message-ID: <1ed1e5ae-6305-e63a-84a0-3c43f69c8f8b@gmail.com>
Date: Thu, 15 Jun 2023 18:30:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US, ca-ES, es-ES
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wens@csie.org>, "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL]: soc: mediatek: Updates for v6.5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Olof and Arnd,

Please have a look at the driver SoC updates for this round. The most important 
change here is, that we now support a PMIC companion device as is see in mobile 
phone SoCs in general and in the Sony Xperia M5 in concrete.

Please pull :)

Regards,
Matthias

---

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.4-next-soc

for you to fetch changes up to 21d4631eedb136f101d2633b72cf42c20db79202:

   soc: mediatek: remove DDP_DOMPONENT_DITHER from enum (2023-06-09 16:40:29 +0200)

----------------------------------------------------------------
PMIC wrapper
- support companion device
- add support for MT6795

SPMI:
- add support for MT8186

SVS:
- change gpu node name to match binding

----------------------------------------------------------------
Allen-KH Cheng (1):
       dt-bindings: spmi: spmi-mtk-pmif: Document mediatek,mt8195-spmi as 
fallback of mediatek,mt8186-spmi

AngeloGioacchino Del Regno (8):
       dt-bindings: soc: mediatek: pwrap: Add compatible for MT6795 Helio X10
       soc: mediatek: pwrap: Move PMIC read test sequence in function
       soc: mediatek: pwrap: Add kerneldoc for struct pwrap_slv_type
       soc: mediatek: mtk-pmic-wrap: Add support for companion PMICs
       soc: mediatek: mtk-pmic-wrap: Add support for MT6331 w/ MT6332 companion
       soc: mediatek: pwrap: Add support for MT6795 Helio X10
       dt-bindings: pwm: Add compatible for MediaTek MT6795
       dt-bindings: phy: mediatek,dsi-phy: Add compatible for MT6795 Helio X10

Chen-Yu Tsai (1):
       soc: mediatek: SVS: Fix MT8192 GPU node name

Jason-JH.Lin (1):
       soc: mediatek: remove DDP_DOMPONENT_DITHER from enum

Jiapeng Chong (1):
       soc: mediatek: mtk-mutex: Remove unnecessary .owner

  .../devicetree/bindings/phy/mediatek,dsi-phy.yaml  |   4 +
  .../devicetree/bindings/pwm/mediatek,pwm-disp.yaml |   4 +-
  .../bindings/soc/mediatek/mediatek,pwrap.yaml      |   1 +
  .../bindings/spmi/mtk,spmi-mtk-pmif.yaml           |  11 +-
  drivers/soc/mediatek/mtk-mutex.c                   |   1 -
  drivers/soc/mediatek/mtk-pmic-wrap.c               | 292 +++++++++++++++++++--
  drivers/soc/mediatek/mtk-svs.c                     |   4 +-
  include/linux/soc/mediatek/mtk-mmsys.h             |   3 +-
  8 files changed, 285 insertions(+), 35 deletions(-)
