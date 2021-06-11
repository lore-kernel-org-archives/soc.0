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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24538C48BD1
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 11:04:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EF9E6613C8; Fri, 11 Jun 2021 11:04:00 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5EE461357;
	Fri, 11 Jun 2021 11:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5EE461357
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=matthias.bgg@gmail.com
Received: by mail-wr1-f51.google.com with SMTP id y7so5601539wrh.7;
        Fri, 11 Jun 2021 04:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=MT73zUtjj68+uwBZNhc5O5dywAeEwkLpcCZIt6YIhUY=;
        b=RouWaMJB15WJr8pPxfhTQcAgQfyT6hQFWIVK3Ut7Pza3dUsHd1ZbA7A5kCqOexZcuC
         cmEVuZ5zoifeD29MtZDeZHFRGnDxre6sc4vkqZaXkgRhYb/cAoIDua5i4TCNpE1XEVSr
         qH4H9LDBzUa2QHgxHUBZ3OHl5l+j3qCmymwoiUHEBWy+Y5UysDxdQ3snFX2mjUqk9iLh
         D+Hacoan2AcmhYybxVQLi/zj9qjvgxvqAr6Xr2jYMm9duEARvKh0KGMeppPulz94yvqT
         QQFfJXY+6B2L4Uov90jAEML7Yev+ISujQUQJoHpHtMk4gWPRXiFJYGC6JcGKUQbQFgdN
         C8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=MT73zUtjj68+uwBZNhc5O5dywAeEwkLpcCZIt6YIhUY=;
        b=SjqvrGzZROsJ1i5Zhv1lLHnFC4dxNAz9hCFXb1fngNlYDjsxi0yILQUExR+dU8047Z
         Qxcv1bhUBBc6PU/5/a5W0y/8jZMo4VAD0ezkmI5QQjXDR13HRvx7/hCqcSF/K5rwLE3N
         Gb98nkzl9h9ux5xeRknprm8YPjzdyRsuQRcCWAC3YBOvU1v/Bk5rUAIdiYhgKWeL8W2k
         g7z/QTmQtHj38EIDGzECC3+R+gc9QfpAfOoRAhltNVl3jTwYtN/17V4OGznPw9lA8YX5
         b2ioj//5ySfG/C9mxbI50FI38uTAWrirEGiN/thfX2bI8IeCeORC6LXT4DlE5Sv74n4t
         W3uQ==
X-Gm-Message-State: AOAM530gmaOF2/BNr3zIrpYAwMyCAbUIvWpVSHH6wGKTT0Jhthp0POna
	PQt2YYyw8OogMMfM0htPw3k=
X-Google-Smtp-Source: ABdhPJzNRH15C/Rt55bk/ej3Fvi4o/EwrYfsEtCgwWJJHD5yiDmyp+zlrbscjMOivJzV0nEAEvgiHw==
X-Received: by 2002:adf:8bc9:: with SMTP id w9mr3322743wra.378.1623409439399;
        Fri, 11 Jun 2021 04:03:59 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
        by smtp.gmail.com with ESMTPSA id k36sm5506155wms.30.2021.06.11.04.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jun 2021 04:03:59 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: defconfig: mediatek updates for v5.14
Message-ID: <ad6f7f4e-7e4d-08b9-8781-71bd78444929@gmail.com>
Date: Fri, 11 Jun 2021 13:03:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,

Please have a look at the defconfig patches for v5.14

Regards,
Matthias

---
The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.13-next-defconfig

for you to fetch changes up to 6c2cfc947607dc8de338377479939893f1288f37:

  arm64: defconfig: Allow Mediatek boards to boot from the mmc (2021-05-14
09:41:28 +0200)

----------------------------------------------------------------
- Delete MTK_PMIC_WRAP added twice.
- Set MMC_MTK as built-in to be able to boot from MMC device.

----------------------------------------------------------------
Enric Balletbo i Serra (2):
      arm64: defconfig: Do not override the MTK_PMIC_WRAP symbol
      arm64: defconfig: Allow Mediatek boards to boot from the mmc

 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
