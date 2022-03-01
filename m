Return-Path: <SRS0=GkT/=TM=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB26C433EF
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 09:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9580BC340F1; Tue,  1 Mar 2022 09:54:31 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06F5EC340EE;
	Tue,  1 Mar 2022 09:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 06F5EC340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id bg31-20020a05600c3c9f00b00381590dbb33so1018430wmb.3;
        Tue, 01 Mar 2022 01:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=Uuqfudvqx8A1r7O6FRl0D0tm/yyoYCBJlkBGNHCef98=;
        b=QbyMlpsQA1iLg4MH7Yrz7E5h4lWt6CBS6hO7GkfwEQnGdwLw7yE7TPRdgH2srDbN2h
         4EDPzd5JPwyq4AK40se0wMu1WZXM7MYjARYEpUvAfns9BV12bisS8xYoL9lJHtYpqhAv
         xdOIgfOKMFbDWEJeKk7rIDd5t1MFs3EHTQvWbLirLaeHqFYbODvss79pe027BWlNgfnr
         Lbx+5NOfS2zFEGP8yFdd7OQ/EgTtQ0jSdZ36qAFDMquTfYiloctcuikPkzACp3GZZZ5B
         HZMdy9vaKMsmeQn2BnQDZrCZvLTDB4Tea5cdkJPvdxoD3nHtGXk7s7Bq01eEHhPZ53Qn
         djqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=Uuqfudvqx8A1r7O6FRl0D0tm/yyoYCBJlkBGNHCef98=;
        b=OcfOCxlWm4riLJhxpvWGqYgm1sTsH2rCePJFVAb5VctWIe8qzDJcnksKIIN4klTW4o
         KHeg0wnsS2tl5rk2jJa9HDamLj763J7Rvo1dVr2QkSu9sDoKZxhEL2hK1I5xRDPSO5B2
         LwtD75qOltwRz4x1rYYSt0NyF/+d54veX+07zaxkQRLB1dfKiSypgxsLy9urXtTd93is
         m1oUrFo+97GDJCc8nUZ4gZhxQybaDHJ026Q2L6vOmuThTFbce6SRpinai485cSEauG4S
         wqVawbWyZE1dbzCuVIVlgTc8+rk996KtfM6gI6dgKWGtm3jabu/uUe5HuRujYSVnWQfl
         uCAA==
X-Gm-Message-State: AOAM533FImXXPNUkGXEgiKHDDG3hNUpPKMT2uYL6lxlbTO8xfrnBoS3o
	9KN5JFT+gRIaXu3UPNeCdmd49L8M9r3LUQ==
X-Google-Smtp-Source: ABdhPJxFgSr4iz+YiXmOJ60RzQhJ8hm4ZtrBSwpq9G487MOI13arAtpuNsd41HY811OsZqPGtoxsXA==
X-Received: by 2002:a05:600c:4e4a:b0:380:e40a:289 with SMTP id e10-20020a05600c4e4a00b00380e40a0289mr16319445wmq.17.1646128469257;
        Tue, 01 Mar 2022 01:54:29 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id z5-20020a05600c0a0500b0037fa93193a8sm2630094wmp.44.2022.03.01.01.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 01:54:28 -0800 (PST)
Message-ID: <9b90b407-025b-ec78-a626-faccdbc7ab39@gmail.com>
Date: Tue, 1 Mar 2022 10:54:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, John Crispin <john@phrozen.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] defconfig: mediatek updates for v5.18
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,

Please have a look on the below defconfig changes for v5.18.

Regards,
Matthias

---
The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.17-next-defconfig

for you to fetch changes up to b5d8378ff0baa69e6ee857dcb7548c10bf16d64e:

   ARM: multi_v7_defconfig: Add support for Airoha EN7523 SoC (2022-03-01 
09:08:31 +0100)

----------------------------------------------------------------
- Enable Airoha SoC on armv7 config.
- Enable CPU freq for arm64 based SoCs.
- Enable PMIC based (mt6397) RTC for mt8173

----------------------------------------------------------------
John Crispin (1):
       ARM: multi_v7_defconfig: Add support for Airoha EN7523 SoC

Nícolas F. R. A. Prado (2):
       arm64: defconfig: Enable MT6397 RTC
       arm64: defconfig: Enable cpufreq for MediaTek

  arch/arm/configs/multi_v7_defconfig | 1 +
  arch/arm64/configs/defconfig        | 2 ++
  2 files changed, 3 insertions(+)
