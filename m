Return-Path: <SRS0=+Tl1=I6=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F68BC433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 14:01:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EC77861277; Thu,  1 Apr 2021 14:01:40 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79C65611ED;
	Thu,  1 Apr 2021 14:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79C65611ED
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=matthias.bgg@gmail.com
Received: by mail-ed1-f54.google.com with SMTP id j3so2061656edp.11;
        Thu, 01 Apr 2021 07:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=Kpqxj1R5RpTVz1wBSRjGUo0ShbRDPWFOGRiU4h0lHJs=;
        b=KF+livsuleM1CtrGNFRxImYJSlRq24NlTbJfISnKTFNHN0k227mnczQBcjgurTdtYQ
         k4ieptHLFhVoH3h9LbDyNEoU/P/1mEoUGVNSTig3i3xgjB5VZ2FxtQ0Mu9ioE5yO8gAj
         AokZVHGiwwIFVMogDK2/vSlAK/iXp9f6gRsUWm84idp/WE7bvolY+0/mUs43db+R9k8l
         aDY4bGk3rvqgZoVQRd0Ndh00uyIwnhIwGAmJ3Zgv2PWTGWmfoxMDEWXOUAtd8+d9GyhX
         wWi1v3HuqppBj4psniCgJ1KVhwAWCyhZ1IUkYVWt8vSXV1eCos2QS+jbcmzmTV/ZtsA4
         Orgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=Kpqxj1R5RpTVz1wBSRjGUo0ShbRDPWFOGRiU4h0lHJs=;
        b=ZXPhaUnwRA79YJwIkZ1JygjJeQNegqAR9wyrq8dtbk67WQ08T6XuHUIj3SFqbVbmZP
         WJjLiW/cRPqJo1XuQmiVLp+gWwNTJ5+NdO/A+9HYwl0lRIpxi4ydyZTMVcpT5ghJXCf8
         dHDLAEJmUlHSLh4CSRw9ClUPlFuTBo82XTD07x2CA+ihoGSs2WwOvhYXhqTc8L28U8Rp
         43IAYDWtMzIWXuk78KRJRfk6+qh+DdX49Kcy3knXs7NbGSIgFPrpHKnvntkJJWoJT7UK
         c4CacYpImP+JDoVbA3F8AiuZ3BOvYnACkUOil2Y4QeCW9OaBP2JFPamSnWMUL268ByMA
         rKJg==
X-Gm-Message-State: AOAM5305XIN0wDiuSgkqL01AJ9iKa/HuxowfMjiGDkx/4pfq+Oxwi/HK
	o1UW1o65rpE73xN04qIB+xg=
X-Google-Smtp-Source: ABdhPJy+F6nVJbW11NEWKQKmNn/+8SdFFd8vKpxN0TylkP1ecGu2agI49lAIvGeMA80rjZLRsH5Ohw==
X-Received: by 2002:a05:6402:1713:: with SMTP id y19mr9948692edu.52.1617285699193;
        Thu, 01 Apr 2021 07:01:39 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id v15sm3566132edw.28.2021.04.01.07.01.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Apr 2021 07:01:38 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Boris Lysov <arzamas-16@mail.ee>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] ARM: dts: mediatek: updates for v5.13
Message-ID: <be262120-6cd9-87a7-ccc3-f5c403cff66b@gmail.com>
Date: Thu, 1 Apr 2021 16:01:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Olof and Arnd,

Please take the below patches into account. These are mostly cleanups to make
the DTB checker happy. Apart from that we now have SMP support for MT6589, it's
nice to see that someone keeps working on this old platform with which I started
upstreaming :)

Regards,
Matthias

---

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.12-next-dts32

for you to fetch changes up to 562f818deaf0601f224999cc39b6c97fbb2adc57:

  arm: mediatek: dts: activate SMP for mt6589 (2021-03-30 12:12:25 +0200)

----------------------------------------------------------------
- fix dtbs_check warnings
- enable SMP for mt6589

----------------------------------------------------------------
Boris Lysov (1):
      arm: mediatek: dts: activate SMP for mt6589

Chunfeng Yun (3):
      arm: dts: mt7629: harmonize node names and compatibles
      arm: dts: mt7623: harmonize node names and compatibles
      arm: dts: mt2701: harmonize node names and compatibles

 arch/arm/boot/dts/mt2701.dtsi  | 19 +++++++++++--------
 arch/arm/boot/dts/mt6589.dtsi  |  1 +
 arch/arm/boot/dts/mt7623.dtsi  | 26 ++++++++++++++------------
 arch/arm/boot/dts/mt7623n.dtsi |  4 ++--
 arch/arm/boot/dts/mt7629.dtsi  | 12 +++++++-----
 5 files changed, 35 insertions(+), 27 deletions(-)
