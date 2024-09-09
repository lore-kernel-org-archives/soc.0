Return-Path: <SRS0=MLyQ=QH=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9BAECE577
	for <soc@archiver.kernel.org>; Mon,  9 Sep 2024 19:05:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CCE52C4CECB; Mon,  9 Sep 2024 19:05:44 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E607EC4CEC5;
	Mon,  9 Sep 2024 19:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E607EC4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cb0f28bfbso21276925e9.1;
        Mon, 09 Sep 2024 12:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725908742; x=1726513542; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzdIyFwes5E7fNP0XbG/FRyMiugQp0LAX05kqVps+ao=;
        b=QGdU4jah/leYkK7EMsTPR0Tyeocj2ivzx60TgjyzA5UiEmhHbjCbhD9QdNVCWVtRrX
         QNkfUtLoY19u//2KrAhPBzuiJRv7wxSQTfC0FKqzoykzB3ZNFZ2FO1W4Bb27KHyo7vqb
         ToUM8e+T4Nvb9nfZqsM/vHX1Oeugsu+yPTkrrZSbsCVkkyuWgxM28888y2cX+5eq+wbA
         sBri5A9OYUb/oou/xkdFyIx3dDxRn9X2YnZYWekrWK0Jro9tuDfaKZ9+iWvUmPK+FM70
         UCHoPikwukBkZxB8E8p9vKcRU/EnrEDy8Q3VSb8KQsoUrXq054W2fUjpTYijxL/uG18J
         yTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725908742; x=1726513542;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hzdIyFwes5E7fNP0XbG/FRyMiugQp0LAX05kqVps+ao=;
        b=Ircb/htvd/kM51Ryo/mNQalxC+pNekrrzASUvOV+zpGaI5RzD1hMFPQD2Bm5C0FTvf
         BdCkbP0FjO+gHD6m/R4eCjOJUguW8Yo3XpD9LB6SEab8VRhFdkSw0KhmGGAIfkShQM8x
         Qaz3hExedtWtMu14ydIWLskAEvybrc+HrGKQP5ytzKOb0yb3HhN20r7Waas0Xz2eob3m
         Tayc3pwn0kyFghmK2CPn6Qn2pFumeBc1u4dDafzS9tYGo+9UooApo7evMF9NJp1Wa5/w
         RelBVocozgpUHpHbk5vFTLxEqedOdETAVdTwVEjMPLxG2xPvxske3+aElq5Mjks44WLT
         jlVw==
X-Forwarded-Encrypted: i=1; AJvYcCXXBrfukcBN96EHEHdmkzxGCvQE/yCoSLYExU06fZX6xz8sU3RKlv95hj1rt1nBcHD2Ur4=@kernel.org
X-Gm-Message-State: AOJu0Yzyp8sj5CNTIVRL85BRgloS2LJi0kNFct9/ejxgKCmj2vSeKx+y
	Hfz4yWPUwVUHS3XchZ8nxYc9URaoSNdBZKSNkVEqBbw40nhzLbhsmlDjpqcz
X-Google-Smtp-Source: AGHT+IGGFS6+SNzhStLak4DTSssNfwHMJp+x/lO5SGNb0RMvaiFuXTAvIydG+lDYr7vGpowfqu+5Yw==
X-Received: by 2002:a05:600c:1d9f:b0:42c:bf0b:c489 with SMTP id 5b1f17b1804b1-42cbf0bc58cmr456635e9.18.1725908742222;
        Mon, 09 Sep 2024 12:05:42 -0700 (PDT)
Received: from [192.168.2.177] ([81.0.7.156])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cae117aeesm88930315e9.6.2024.09.09.12.05.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 12:05:41 -0700 (PDT)
Message-ID: <bfa9ab87-9de8-41fc-bfd1-de5ec324cfe0@gmail.com>
Date: Mon, 9 Sep 2024 21:05:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, ca-ES, es-ES
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] MediaTek driver updates for v6.12
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

Please find below the changes for the SoC driver for MediaTek. Sorry for the 
delay. Hope we are still in time to get the patches in.

Matthias

---


The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ 
tags/v6.11-next-soc

for you to fetch changes up to d1e5d531d20b085bb83d9ab1868ed99fdeb0cc42:

   soc: mediatek: mtk-mutex: Reduce type size for mtk_mutex_data members 
(2024-07-30 10:58:46 +0200)

----------------------------------------------------------------
pmic warpper:
- reduce size by constifying data structures
- use devm_clk_bulk_det_all_enable

mutex:
- reduce size by changing variable bit size

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
       soc: mediatek: mtk-mutex: Reduce type size for mtk_mutex_data members

Christophe JAILLET (3):
       soc: mediatek: pwrap: Constify struct pmic_wrapper_type
       soc: mediatek: pwrap: Constify some struct int[]
       soc: mediatek: pwrap: Use devm_clk_bulk_get_all_enable()

  drivers/soc/mediatek/mtk-mutex.c     |  52 +++++++--------
  drivers/soc/mediatek/mtk-pmic-wrap.c | 118 +++++++++--------------------------
  2 files changed, 56 insertions(+), 114 deletions(-)
