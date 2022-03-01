Return-Path: <SRS0=GkT/=TM=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C597C433F5
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 09:38:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F0230C340F3; Tue,  1 Mar 2022 09:38:37 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4EABEC340EE;
	Tue,  1 Mar 2022 09:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4EABEC340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id u1so19452976wrg.11;
        Tue, 01 Mar 2022 01:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=AGqj3zqARUTZ9ZQDgZs+PFSA6lptX1zD63YRGqiRdK0=;
        b=YJx9pSRECJeyQYK0gK55pl0wp7u2Eg2umDYPQ3h9jtA6X7HwS7nEbrB2GDXEr20kwY
         n7l05236ttx1dewcupvyh3s0ixqLzBX8NAAO3rfGFTBws95Cq9SzLNXtNmkiw4KDc0R9
         jbO3LMlBJOzgFS5ogZ2RoVgX5fbGsS+b/cB182BHCFrSZf4V23GaPBu3V0m0gKbB/Cxy
         7r+sTPJgLpO1EMNM9YlXbmdstxeSPmO3PJ/iC/FU8obJlRAfzYUCVnef0Gh8yL64jIpM
         3RsbkLnAxqpct5Zb+JpWOR7rEcqD53Ksgzyk1ddhY7C3Gs10Tj/vOS4xRp7BAtKK017g
         M9Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=AGqj3zqARUTZ9ZQDgZs+PFSA6lptX1zD63YRGqiRdK0=;
        b=ihCw9l1loEFbrMNRKNlJsH0WJVATQruvWwCOR0TLncojOldYMeb+YB0394lWdP8RiW
         DTvDXkprz+/HynEM8lVAuSQUkOQLsCh3djrZSYfKfxQmLACuRsT9HqgsBxhyoU7V/wmK
         m3KOZnNnQifMvHB52/nhYl2XvBVOtjApd4jo591uxIS+rLtdWcKczTEG3kZwPn9V6b3c
         kghyeDMbLIScmX8woNekMxhFkH5VCgGSvv9kXb6ujMbLA6QJY9bQa4106hUubZPxU9Mo
         jJ+oN5RwTiTziQbHfFBw+rItFyiYfYGICpjmMlO1qjp0uCsnW+HhRkUtji6HfMly5cp7
         Y6og==
X-Gm-Message-State: AOAM532V8BciirNDEsEERXKwGAws/MqTdyT7jltvuyEPo48IHXsyRscZ
	BByVR1eDD8/rmAAkvBXpMqjWiumhaJgW2A==
X-Google-Smtp-Source: ABdhPJz2waHTw2Hy4YaCi5TEU/BCv9YAfaUv76iZGQbHTxkNRo0QbwunbCVfOdPJ/X+TUIcnNjHxBg==
X-Received: by 2002:a05:6000:1364:b0:1ed:b65a:da45 with SMTP id q4-20020a056000136400b001edb65ada45mr19081629wrz.680.1646127515509;
        Tue, 01 Mar 2022 01:38:35 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id i6-20020adfaac6000000b001e7f9a9498asm13510452wrc.50.2022.03.01.01.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 01:38:35 -0800 (PST)
Message-ID: <8eb8510d-c597-4fee-e4b3-924b6d4bb3be@gmail.com>
Date: Tue, 1 Mar 2022 10:38:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: MediaTek fixes for v5.17
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,

Please have a look on the following fixes for v5.17.

Best regards,
Matthias

---
The following changes since commit 5c1ee569660d4a205dced9cb4d0306b907fb7599:

   Merge branch 'for-5.17-fixes' of 
git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup (2022-02-22 16:14:35 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.17-fixes-tag

for you to fetch changes up to c432cd598a185afefba1ac3b0ee226f222f71341:

   soc: mediatek: mt8192-mmsys: Fix dither to dsi0 path's input sel (2022-03-01 
08:36:59 +0100)

----------------------------------------------------------------
- Set display pipeline to DSI on mt8183 kukui jacuzzi
- Fix display for mt8192 based boards by fixing the routing table

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
       soc: mediatek: mt8192-mmsys: Fix dither to dsi0 path's input sel

Nícolas F. R. A. Prado (1):
       arm64: dts: mt8183: jacuzzi: Fix bus properties in anx's DSI endpoint

  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 ++
  drivers/soc/mediatek/mt8192-mmsys.h                    | 3 ++-
  2 files changed, 4 insertions(+), 1 deletion(-)
