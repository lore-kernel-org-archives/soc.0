Return-Path: <SRS0=OxWk=3V=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5056AC4332F
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 18:49:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 35271C433B5; Mon, 21 Nov 2022 18:49:02 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 438F8C433C1;
	Mon, 21 Nov 2022 18:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 438F8C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id x17so7755813wrn.6;
        Mon, 21 Nov 2022 10:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l97CFMxK013jbwqr86PBB0+4UzVCHm4yLdQdXZhW1zs=;
        b=kv5O+q+4J0Dbvr9/kbtg9lBOaSHuygjekbTq73oxC6WmcqYF+4p/c1l4U+LzBCSPNp
         JISTCgAqmg2lkzEbTna0iJG0WSLsNwmmNto/HLzLhlcx1W+Y3GDPJSqqFRHtwWrLcAJ+
         kzfbaPfWByxvKQo2afv7h0nFdzhefyQ1hG9/xrPhR65vsh2EvkGG8OrWo/adM9SlmKju
         Qzk4rtbzXFiyjpe26jFCXmDTGOh9baUdqPRps76jZH/T7hsRiOiETz4CC3pyJbfXkvOM
         JhsIqjlWZWzTKaEIXhFEVqpiDSIuKg13BDzYwFexhRGrpFIOPmfhTYYzmVImqlZDgGyz
         xKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l97CFMxK013jbwqr86PBB0+4UzVCHm4yLdQdXZhW1zs=;
        b=U9ZemRsbA5EdUoIUpz+UrnfAkpHxmTb8rWuzKRjOtOdqSx9+/clcMRaxKwcmLVUEBJ
         gbuKIrKbyM+po+KUZV5grua1SzlETuEJ+8I5CLL3qEbo8TpEHGKp/GM4b8s9B+1QoQFO
         ZDd6fGUljfU6CE8zeaFjlaz/BsrwYAWQ/nrw5nSEWMCjiXrYjtMvXF0NO84chgqNOloQ
         oXs6NBqOUQEQefgX0scPJfvwuWRcrAa+JBWiKCXY97cYiqV1XqHQxNe4xipMPwaqmdeG
         LH9oU/dyZksS7iVd10JjrIonLcXzE5LNBiJPXMOqftA7EzFosjBheBKJHxqV+QGSph1x
         dYhg==
X-Gm-Message-State: ANoB5pn9Yt0NoqrUChHibVSepju3HvHMmKC9OXJhDVRRv6UQUFPeMn7y
	K4CZkRHvLpXW3HKTJxkhXLSVGrrksfc=
X-Google-Smtp-Source: AA0mqf5SxIjT9Ke9s3gwPHWa5/eDwUkP9WIJotQNGSGS0b1ho7FUkY2SJWOIkn1yiTqehQ0a1IR9FQ==
X-Received: by 2002:adf:f6ca:0:b0:241:dc52:5556 with SMTP id y10-20020adff6ca000000b00241dc525556mr2408875wrp.291.1669056539489;
        Mon, 21 Nov 2022 10:48:59 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id q125-20020a1c4383000000b003c6cd82596esm19135941wma.43.2022.11.21.10.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 10:48:58 -0800 (PST)
Message-ID: <610edfca-0a3a-fd41-5208-71978866be4f@gmail.com>
Date: Mon, 21 Nov 2022 19:48:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] defconfig: mediatek updates for v6.2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Olof and Arnd,

Please have a look on the only patch for defconfig. We basically enable drivers 
needed to support MT8183 based Chromebooks.

Regards,
Matthias

---
The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.1-next-defconfig

for you to fetch changes up to 83f3da58682861327e571b3b5149d51a0d8bab27:

   arm64: defconfig: Enable missing configs for mt8183-jacuzzi-juniper 
(2022-11-11 09:41:16 +0100)

----------------------------------------------------------------
- enable missing drivers for to boot from MT8183 based chromebooks

----------------------------------------------------------------
Nícolas F. R. A. Prado (1):
       arm64: defconfig: Enable missing configs for mt8183-jacuzzi-juniper

  arch/arm64/configs/defconfig | 18 ++++++++++++++++++
  1 file changed, 18 insertions(+)
