Return-Path: <SRS0=fsjQ=FX=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74670E95A8E
	for <soc@archiver.kernel.org>; Mon,  9 Oct 2023 10:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 34E76C433CA; Mon,  9 Oct 2023 10:38:40 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 55819C433C8;
	Mon,  9 Oct 2023 10:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 55819C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9b974955474so743706066b.1;
        Mon, 09 Oct 2023 03:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696847917; x=1697452717; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x3J73euIEV8eyB2wmuVgatH6Jh9dGNNNj6rdYQeMksc=;
        b=nK/Bw8IA9xtmjFqhmbcR1dnseHHqduT2L5O3J0tyY/hATNEbeE0prmOttw7cfNa73Z
         GtAKk+5OjT/mYnAgPViDGrcPXglcQUcIeltikBDP9wPIVbYgIQCJOb0oqmaMQg2PdYmN
         qIWhiiRTORRwfkt9+UzWfbI2QLjMYRJ2iYhcVpHLNPtfFL0w3HSo3lIfrE5q9fjpHW2Q
         sgsZm8yRHR37Tq5LclJ4FKCtbh3Xhv6JWvK0nl9ip8UjvXrXm979XdWZD4AhM5jmd0fk
         dwZ3AApEoyeg87SkWdZ76uGm9sPAWCUXnS3N8fsqHgTse96C/1DYYum+pOjdn78cNPjx
         NZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696847917; x=1697452717;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x3J73euIEV8eyB2wmuVgatH6Jh9dGNNNj6rdYQeMksc=;
        b=ZZseACFKtHUrpQkC77ycQh0SplmvHi3uVEDL3DW6Ht2zF1Anlv5CHCdSOwhglLgbPW
         zykV6Xi1NGZUHZZOv4g9IpV9wuAfgxpo/Ku1RuFngLcBINlw9eo0H1ye1G9Z/23LDVvt
         bEOoXifX+uL0HKzgKPqu5a7xNCTsVoy3RZ1VjscEUH00LSic6CejTL0e6RtL83xnr+m8
         E6aW1S01Imv0gJIOfJSBsNYGVVtCLJ9434UfZOWfy2z2AjDdbDvpw/zSwnU1XgKQkhEr
         x7D+cJzQbGA6RijIZXCEJ+8+XwZkQoA2K6nqJLZ/6v6ag9KOSoKZQKE8FMhQt3/vadGn
         tnKQ==
X-Gm-Message-State: AOJu0YxYC4DNgnRFOcvajnos1fIvN1iMduBm+USk6IToyvDVdN7Ioc2P
	WiCxzMFAbJpZHHmyDPlOpUIqhk/DD/c=
X-Google-Smtp-Source: AGHT+IHo12kdAU1akvWTEeAq1UVmtpvo/cS3/aj5gnG4bA0846pnpYavyGYEoQTf7pfIsIuedml/hQ==
X-Received: by 2002:a17:906:3156:b0:9b2:b71f:83be with SMTP id e22-20020a170906315600b009b2b71f83bemr13022049eje.1.1696847917145;
        Mon, 09 Oct 2023 03:38:37 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id jp20-20020a170906f75400b0099bcb44493fsm6624599ejb.147.2023.10.09.03.38.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 03:38:36 -0700 (PDT)
Message-ID: <d25ccd90-277a-fd05-8605-f7d1d129d4fa@gmail.com>
Date: Mon, 9 Oct 2023 12:38:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US, ca-ES, es-ES
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mark Tseng <chun-jen.tseng@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] soc: mediatek: Updates for v6.7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Olof and Arnd,

Please have a look on the few changes for the MediaTek SoC drivers for v6.7.

The patches were collected with the help from Angelo.

Please have a look and hopefully: happy merging :)

Regards,
Matthias

---
The following changes since commit 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa:

   Linux 6.6-rc4 (2023-10-01 14:15:13 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.6-next-soc

for you to fetch changes up to fa095fe0ab3589109dc5add3f34e16a053d90260:

   soc: mediatek: svs: Add support for voltage bins (2023-10-05 12:14:47 +0200)

----------------------------------------------------------------
MediaTek drivers updates for v6.7

- Added support for Smart Voltage Scaling (SVS) on the MT8188 SoC

----------------------------------------------------------------
Mark Tseng (3):
       dt-bindings: soc: mediatek: add mt8188 svs dt-bindings
       soc: mediatek: svs: Add support for MT8188 SoC
       soc: mediatek: svs: Add support for voltage bins

  .../devicetree/bindings/soc/mediatek/mtk-svs.yaml  |   1 +
  drivers/soc/mediatek/mtk-svs.c                     | 184 ++++++++++++++++++++-
  2 files changed, 181 insertions(+), 4 deletions(-)
