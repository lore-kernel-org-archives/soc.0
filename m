Return-Path: <SRS0=l/su=55=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40223C38142
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 18:04:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23C75C433D2; Wed,  1 Feb 2023 18:04:13 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C13BC433EF;
	Wed,  1 Feb 2023 18:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3C13BC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so2152626wmq.0;
        Wed, 01 Feb 2023 10:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5KZiRymOgmoFKYb+8KOC0oIVQvjXLlNlO5a0oUzbIA=;
        b=aRux9YeBsiH2fL6KfgbAKLyE3sNBDd3BocoZKmTpwA90gnMR2gpbghljQk3JfHgPgy
         38eWNkef5SWeS2DG2lZLPj95YOgFlfo65uiWtGmJNhQV2/g8LsNE0dG13qBfr7ON9TYb
         iGokrU/f0uVuZ40wS9X27Sqfp4on7rZc7xtz/nPIoXjcLmAO36mN/kuut+zCUni3MLA7
         stGptPSdjZBoCbR+vjJYnWziMKKC/E0Jq/lXJzdU+xpX5D00wlrU3vYvzqw4g79IpGO/
         5nsN+V02nHdv8ITr6M5X9fmq9O87EVfI56jZFsffFUchQgsaZ1YsJ1wq2FDubUnRg59H
         i6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a5KZiRymOgmoFKYb+8KOC0oIVQvjXLlNlO5a0oUzbIA=;
        b=zevXSmYNFdbVxnCXQILUdWXtBxXxKazVWkzJCfiHIWsb18hw/9HCJ9p+9DY2Gij8ya
         KNyQfS3RRL6J0llaMiRfWhMX1YsE5fp19CtHfWoWpQa8YJFhUnUAsB0BmWB13jMiwKO3
         842afx348oBZXcNzZx//OkZfVvV0C1HjLmDCnVuYVs54veKwB9VEi9+fZD1t35qvG5LU
         Y444tZouJ6kfo58uEdWR1KGKj30sqOZ26ckiryVyc3MmtKmhfPqnFmW+WhhjIHQLFM4K
         wlAy0nKf3guxWhTWhN8OdhXXI1jYTHNpS0yDdpnMgM8hs0Bhrn7oE287G+SMtBLO2Z2w
         9y/w==
X-Gm-Message-State: AO0yUKUFIw74KTzTlkXZlsCAsXF6JG5CRtWkML+zy53BFW2dJTPpIUbE
	06LsEDm7tt36Jx0Y3x/nzajp+SUg1ns=
X-Google-Smtp-Source: AK7set9kk0lcUIlRMhhZtfA8auRzjpmAooJQay9/78Dr+EZSBsrlntyCTXYT0CTkmeLGrXbSIOt2sw==
X-Received: by 2002:a05:600c:3554:b0:3de:e8c5:d830 with SMTP id i20-20020a05600c355400b003dee8c5d830mr2552480wmq.28.1675274650534;
        Wed, 01 Feb 2023 10:04:10 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id i40-20020a05600c4b2800b003dc42d48defsm2273504wmp.6.2023.02.01.10.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 10:04:10 -0800 (PST)
Message-ID: <17aee808-1f3f-fe75-68d4-adb71915e5cb@gmail.com>
Date: Wed, 1 Feb 2023 19:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] ARM: dts: mediatek changes for v6.3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Olof and Arnd,

Please have a look on the 32-bit DTS changes below. This round it's just a few 
cleanups.

Regards,
Matthias

---
The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.2-next-dts32

for you to fetch changes up to f104d74bbf4859a628c2234d6f86a53949b9b1b8:

   ARM: dts: mediatek: Remove pins-are-numbered property (2023-01-09 17:17:19 +0100)

----------------------------------------------------------------
Clean ups only:
- deleting unsused pins-are-numbered property
- not existing second IRQ

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
       arm: dts: mt7629: Remove extra interrupt from timer node

Bernhard Rosenkränzer (1):
       ARM: dts: mediatek: Remove pins-are-numbered property

  arch/arm/boot/dts/mt2701.dtsi | 1 -
  arch/arm/boot/dts/mt7623.dtsi | 1 -
  arch/arm/boot/dts/mt7629.dtsi | 3 +--
  arch/arm/boot/dts/mt8135.dtsi | 1 -
  4 files changed, 1 insertion(+), 5 deletions(-)
