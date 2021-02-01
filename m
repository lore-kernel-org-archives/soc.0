Return-Path: <SRS0=vtH0=HD=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDEC6C433DB
	for <soc@archiver.kernel.org>; Mon,  1 Feb 2021 10:19:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6658364E22; Mon,  1 Feb 2021 10:19:39 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E030864E11;
	Mon,  1 Feb 2021 10:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E030864E11
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=matthias.bgg@gmail.com
Received: by mail-wm1-f52.google.com with SMTP id c127so12638783wmf.5;
        Mon, 01 Feb 2021 02:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=jYgjAhuYor8KZh31mkKvytdAEVtP07GKVY07yWn/bqA=;
        b=eVF4tlseVEcY6UGfJwihEyzVzrpK4onBtWkBjI0rYTgUkGq4koCjlrxUYXOfGQ0AKv
         jTbJCdrXnd364JucdCpGtQ0bNvQA/SzvNJKZUoJvdt0JpoYoJVgm4x3sybjkyzfmcuMb
         f6I7jYE0yUeE16dzYRU4flRtOg2QT7i2BnKXM+YcEEqoA99v+DX4ey7K2Pbl/rfvg2Ra
         WnHik9Yv3tpkTncV8NV3CBlXEhYVl08cocr9mPh0JhQrlMTVQXkCRLafRuHWYMJjSXiU
         mu0N5L858edWBaKKYmyD18EqSu4MdHpIXFhZ/WSt2m9k/NZ9EC5dCwI3RE+JtT6WMj0c
         HNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=jYgjAhuYor8KZh31mkKvytdAEVtP07GKVY07yWn/bqA=;
        b=Jc8PIKc5JbxX2AVhY+47eOOv+fkkv5OxqGOBjyBU57on+ttxFI202vf2Q8uej0RBqL
         6+04mDoD3z3bWmC1ke9nQ+nHCms2MjGt4c4AF+nNraH2iMeY2GO7vio9kxPdF3MdQ7Vb
         3536Zns+1ifZAEJ3grskh7wKMlmpIIg3VnSw/kh7NQr4OvbABJeW0r2wq+0AxYqEr6hx
         GPOIPpoR5SuINbx8LwdfmgxWbEPXLmPtVVIx1LRJLlSjk5B/py3M7SXaS1vSITMu/J+H
         6H+YeenKvlZgiTmxegHRv0/C8ejFRBTGCOcZRvJ5lhyU1MLbazlRksr0j02eU4Vwosf+
         FycA==
X-Gm-Message-State: AOAM533Ycfr6MJRdL60JCKf1KS9mxe1BpeBbOvBfxfor+YTOtptCvpv0
	VFfRn+qEqio/cQUWFf3ycCFfDDWzNhp4XPys
X-Google-Smtp-Source: ABdhPJxOgwVGrhvLlhi1Yv2PKZyVe+vODoYrlI2aUzJLxpkh3nMIO48vwj59xXZL6neWUtnSvecRiA==
X-Received: by 2002:a7b:c853:: with SMTP id c19mr4223431wml.118.1612174777432;
        Mon, 01 Feb 2021 02:19:37 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id m184sm21955555wmf.12.2021.02.01.02.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Feb 2021 02:19:36 -0800 (PST)
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Argus Lin <argus.lin@mediatek.com>,
 Neal Liu <neal.liu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] defconfig: mediatek: updates for v5.12
Message-ID: <aa5c6673-f018-00d3-42da-46a4976d8ef7@gmail.com>
Date: Mon, 1 Feb 2021 11:19:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Arnd and Olof,

Here comes a few updates to the arm64 defconfig. Please have a look.

Regards,
Matthias

---
The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.11-next-defconfig

for you to fetch changes up to e25efbd140c296b52aaa5f0380628e55578c5eed:

  arm64: configs: Support DEVAPC on MediaTek platforms (2021-02-01 09:50:07 +0100)

----------------------------------------------------------------
- build PMIC wrapper as a module
- build DEVAPC as a module

----------------------------------------------------------------
Argus Lin (1):
      arm64: configs: Support pwrap on Mediatek MT6779 platform

Neal Liu (1):
      arm64: configs: Support DEVAPC on MediaTek platforms

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
