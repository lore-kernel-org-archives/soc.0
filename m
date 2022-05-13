Return-Path: <SRS0=25J4=VV=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65F8C433F5
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 11:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9F58AC34117; Fri, 13 May 2022 11:21:37 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E79DFC34100;
	Fri, 13 May 2022 11:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E79DFC34100
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id u3so11038247wrg.3;
        Fri, 13 May 2022 04:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=ZUk+eLoJy5I+snd7UZ1OV529h1hWoin5n2Ec64oMRlk=;
        b=CWjH2j6UR1YBZZHb0hya2d6B6Q83DonodeGKRM6fRMECzhTYYB43s+iu1C90d365cC
         8Wa1px4trV3fPQz+pkoH4KoldLfsaX+0rzdo4BUpi0K/nPjig9vKx3FTo5j+y3hgHH/1
         wF/TjP9eASV2IvzyOr7SnIf8q6G25rr5RvqZHeSBwGLAk/ML0uw2zc1sK5oygt1o1Vu0
         AljwUwvVkxblV04o3/rkmjtl3Axo9weNCGU5lUfeUWFdjOvQ03RSBEKPxNZyF44BfTAm
         8sBEmtAmLnYhq0rGTC5kG3b656iz25C2MFrOiiVAL2Kmyt7fOddG5cphkNPnipXYaAGV
         eUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=ZUk+eLoJy5I+snd7UZ1OV529h1hWoin5n2Ec64oMRlk=;
        b=tGd38UYksasOuEYX8nk1PdL34jlPLLlD6w3Is0NGJ1GdADQwdFwRM3ewFdgbMmdBqf
         CiCeZXz5cAD5Hb1mOk8riPUTRGzMd7SplSIhVuZwRZKIoAAL/kPIzgpn53e91YtHR7tc
         US/LsRt7eubd2sO4IqZxwxcXC9XvcqqTXJzj3agg4nfmKlKilFtZrgLJLtTEPs0rjuXF
         Do/t2wB2uc59Tne/F1veiwmxHi1g1PjGUdGnWvtgMAxs70hf1FfU/XtDQwjqTYz5EbR5
         Zs9OnYpZvJTt7zLnErdRe08wA5+QTamj2jF05rTlQOABkc0zLIq1TD2syOx266MhIIJ3
         lBPg==
X-Gm-Message-State: AOAM532YJrL7Eatk/Teb9rUjx4uM2rKyKKPmUHKk5URBhlo9CiPt0oSN
	sDHBIniBppa78dnjbBMXKbxukT3OIr11GA==
X-Google-Smtp-Source: ABdhPJxx2Vfx97P9L/8wqfJ9xKB60NGKEsgJOweCgR1hSAFuWPEuz0DG5dDxvs0OFl20spPi8KYfnw==
X-Received: by 2002:a5d:6c65:0:b0:20c:5230:f145 with SMTP id r5-20020a5d6c65000000b0020c5230f145mr3419627wrz.337.1652440894983;
        Fri, 13 May 2022 04:21:34 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id w22-20020a7bc116000000b003945f955b51sm5059860wmi.3.2022.05.13.04.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 04:21:34 -0700 (PDT)
Message-ID: <b4383f23-0adc-b9de-a1d9-abd1c2f82b27@gmail.com>
Date: Fri, 13 May 2022 13:21:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm: mediatek: DT updates for v5.19
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd and Olof,

Please have a look on the below 32 bit DT updates for v5.19. Apologies for the 
late pull request but I got sick and needed my time to recover.

Regards,
Matthias

---

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.18-next-dts32

for you to fetch changes up to a044e6a0883bcd4ad71849c97f79fd213e940077:

   arm: dts: mediatek: Get rid of mediatek, larb for MM nodes (2022-04-22 
15:49:12 +0200)

----------------------------------------------------------------
Delete no longer needed properties of MediaTek Larbs for MT2701.

----------------------------------------------------------------
Yong Wu (1):
       arm: dts: mediatek: Get rid of mediatek, larb for MM nodes

  arch/arm/boot/dts/mt2701.dtsi  | 2 --
  arch/arm/boot/dts/mt7623n.dtsi | 5 -----
  2 files changed, 7 deletions(-)
