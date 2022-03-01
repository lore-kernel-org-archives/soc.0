Return-Path: <SRS0=GkT/=TM=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8FAC433EF
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 15:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0A359C340F3; Tue,  1 Mar 2022 15:05:52 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 29010C340EE;
	Tue,  1 Mar 2022 15:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 29010C340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id h16so18681845iol.11;
        Tue, 01 Mar 2022 07:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=areHjwPGysvnbpVsoZF0cOugapxK1lEU7HKcuamtX6A=;
        b=EaUBkMaCFPcg6U+e7c23GSkWJ4eH1sHMTGMDwmkv3QB82oNgy4lejCt7rL4mjzJXDF
         boNexuNCpsRRgnAd/AR0KQ0vW2vSrRz+DKXTlw3iEsiJbMVnNSxYvteKZvfew7qQU8yv
         RgxiyTFf0E4HYL3GToo1j959ePXo6fOoJZfBu+3tEMhr+7lhNpiYQbcr2c+HgvDEFWfF
         DhBvRx1zmhAmeK8xlcRD3gu9fmZ/S56DNAr8OYyfHfIrUdD1M63qLiRB+Rk0ZW+EAOFJ
         yLhhg4tQvojL6OcUr1otM7IJMa7QymNuD/SFSkY44/5aqa2z5AxbLh8k9RWjL8j6G4+O
         U6ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=areHjwPGysvnbpVsoZF0cOugapxK1lEU7HKcuamtX6A=;
        b=5ZhrAxPYpipHp5igrRz32Ev5sTW/iGCCHloe9+3z/XG3FpYMJpHPPgkKvZG7uWD6Ys
         aLExTwZzXP7ZLrJZORifZquMmSkIsC9l8FReDVu1WEZDMqFqE87w2tH0FdZgnCaTyrAP
         UOnswDqHCOa/HUCx1cerbSOx2d9b8AtSYr3sXEUFqJoIr+AlYScCLmhnX7pEtg6gmfhh
         PhFa06oGtrVFFrGKYIL7IDAFhb3G2lwWzfEpQhCjnCDxig9XQpcxBdhDcodBpGPaAe+S
         5iM86nRkHvVyu2IY2RbQIVnWSpdWZAsUo0p3oSmkFbH26Xug0ZBvsbTZ+C3EfzxDfL8O
         fo4Q==
X-Gm-Message-State: AOAM531VVSkkkgN8xfUsxFJcgP6OEfA2qaLRR8kfWc52JfmjA9a5Zp+h
	HeS9lOodD1BDRwks/fEtOXRXzg+HXhcEKg==
X-Google-Smtp-Source: ABdhPJwj37UszmrmIB4PuYFunLQjI1+FU8E9Mpwr/V5LoHc7/9XbZGFWbQFfZ3mMIufS0LidoKD/qA==
X-Received: by 2002:a02:9686:0:b0:315:af6:b12 with SMTP id w6-20020a029686000000b003150af60b12mr22580563jai.214.1646147150112;
        Tue, 01 Mar 2022 07:05:50 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p13-20020a056e0206cd00b002c23c551420sm7793582ils.36.2022.03.01.07.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 07:05:49 -0800 (PST)
Message-ID: <b6cd9478-7493-3f8b-144d-9f38b3ec6bdc@gmail.com>
Date: Tue, 1 Mar 2022 16:05:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [GIT PULL] soc: mediatek: updates for v5.18
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
References: <16a53482-5a8c-e95e-8cd4-b8304f110987@gmail.com>
In-Reply-To: <16a53482-5a8c-e95e-8cd4-b8304f110987@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 01/03/2022 10:38, Matthias Brugger wrote:
> Hi Olof and Arnd,
> 
> Please have a look on the SoC driver updates for v5.18.
> As you can see, we get quite some support for SoC devices based on mt8186.
> 

Unfortunately the branch has some issues. Please ignore this pull request for now.

I'll send a new one as soon as possible.

Regards,
Matthias

> Regards,
> Matthias
> 
> ---
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>    Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> are available in the Git repository at:
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
> tags/v5.17-next-soc
> 
> for you to fetch changes up to eb1b02bef52ae545d5eb24116d5c099f738d39d5:
> 
>    dt-bindings: arm: mediatek: mmsys: add support for MT8186 (2022-03-01 
> 09:26:56 +0100)
> 
> ----------------------------------------------------------------
> - add power domains support for mt8195
> - disable ACP on mt8192
> 
> mt8186:
> - add support for power domains
> - add mmsys and mutex support needed for DRM
> - add reset control based on mmsys subsystem
> - add pmic wrapper
> 
> ----------------------------------------------------------------
> Alyssa Rosenzweig (1):
>        soc: mediatek: mtk-infracfg: Disable ACP on MT8192
> 
> Chun-Jie Chen (7):
>        dt-bindings: power: Add MT8195 power domains
>        soc: mediatek: pm-domains: Add wakeup capacity support in power domain
>        soc: mediatek: pm-domains: Remove unused macro
>        soc: mediatek: pm-domains: Move power status offset to power domain data
>        soc: mediatek: pm-domains: Add support for mt8195
>        dt-bindings: power: Add MT8186 power domains
>        soc: mediatek: pm-domains: Add support for mt8186
> 
> Johnson Wang (2):
>        soc: mediatek: pwrap: add pwrap driver for MT8186 SoC
>        dt-bindings: mediatek: add compatible for MT8186 pwrap
> 
> Rex-BC Chen (2):
>        soc: mediatek: mmsys: add mmsys reset control for MT8186
>        dt-bindings: arm: mediatek: mmsys: add support for MT8186
> 
> Yongqiang Niu (2):
>        soc: mediatek: mmsys: add mt8186 mmsys routing table
>        soc: mediatek: add MTK mutex support for MT8186
> 
>   .../bindings/arm/mediatek/mediatek,mmsys.yaml      |   1 +
>   .../bindings/power/mediatek,power-controller.yaml  |   3 +
>   .../devicetree/bindings/soc/mediatek/pwrap.txt     |   1 +
>   drivers/soc/mediatek/mt8167-pm-domains.h           |  16 +-
>   drivers/soc/mediatek/mt8173-pm-domains.h           |  22 +-
>   drivers/soc/mediatek/mt8183-pm-domains.h           |  32 +-
>   drivers/soc/mediatek/mt8186-mmsys.h                | 115 ++++
>   drivers/soc/mediatek/mt8186-pm-domains.h           | 344 ++++++++++++
>   drivers/soc/mediatek/mt8192-pm-domains.h           |  44 +-
>   drivers/soc/mediatek/mt8195-pm-domains.h           | 613 +++++++++++++++++++++
>   drivers/soc/mediatek/mtk-infracfg.c                |  19 +
>   drivers/soc/mediatek/mtk-mmsys.c                   |  12 +
>   drivers/soc/mediatek/mtk-mutex.c                   |  45 ++
>   drivers/soc/mediatek/mtk-pm-domains.c              |  17 +-
>   drivers/soc/mediatek/mtk-pm-domains.h              |   8 +-
>   drivers/soc/mediatek/mtk-pmic-wrap.c               |  71 +++
>   include/dt-bindings/power/mt8186-power.h           |  32 ++
>   include/dt-bindings/power/mt8195-power.h           |  46 ++
>   include/linux/soc/mediatek/infracfg.h              | 133 +++++
>   19 files changed, 1559 insertions(+), 15 deletions(-)
>   create mode 100644 drivers/soc/mediatek/mt8186-mmsys.h
>   create mode 100644 drivers/soc/mediatek/mt8186-pm-domains.h
>   create mode 100644 drivers/soc/mediatek/mt8195-pm-domains.h
>   create mode 100644 include/dt-bindings/power/mt8186-power.h
>   create mode 100644 include/dt-bindings/power/mt8195-power.h
