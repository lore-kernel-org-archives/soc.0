Return-Path: <SRS0=GkT/=TM=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55214C433EF
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 09:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D461C340F1; Tue,  1 Mar 2022 09:43:46 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 79999C340EE;
	Tue,  1 Mar 2022 09:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 79999C340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id e10so1931494wro.13;
        Tue, 01 Mar 2022 01:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:from:cc
         :subject:content-transfer-encoding;
        bh=rOmN4V+xJUGCVbSaaoQKRY67N1Y8KELF/hGRuY/098s=;
        b=GIZ0LwDzThgQ8EkckWdE3U+8RlWFFpAZObsHcDdplrezM43ysRw31PCFl0K58iSL5s
         C37hTR8fEAGkhfqWaNUKkPPVGsQLEYtMen7z96TQgotwdAc3awjRIEsRVkj7o8a+7Vge
         iNV2Jo5hz/l0Zw7yGPqNGkzuYsgKh87aTdnDoReUEh0ipNzarBNrmsPdC/gFQp2pLT2C
         1Egiv6Ibg8IB/sElmQfpW33UYbu3DL4YCgk3fnbLO9U5qsrFbWlTbBO9pmQ4OpVZMYhr
         ESXbLmI6z8J6WI5jndWu77hPTbVdlsgDQJZteYYVigvvrc5NCv9L//QjiOhq9fb9ZS+y
         +PQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:cc:subject:content-transfer-encoding;
        bh=rOmN4V+xJUGCVbSaaoQKRY67N1Y8KELF/hGRuY/098s=;
        b=L8TMMQHulPccxuJuZWOC1xFh37uHGU33li4NGYK7QyHi8S3cJsCNJ2pbDixo1kbljg
         1ZJnSPy20EXbxFllcfXFSY9J/MGIrBRDaUp+NeMIEED+rqNH8f4m5Sr727FK55AI+Dfm
         5OsK6huGqBazh7vXKVoLLevErX1HKASk3sRpUSH7CrDuCmf5FbfyxQjNDuEDfiTWHXjh
         Fr4ulGuRw5QAjhphFb4dnPrfFiUhBTMHtGzh9q9j84IT7jYxx4+qE0WK++LG46zWvktb
         YLx5V+dk4ijrVrAk+OyzZPdmQqy7U0O61/jhKDMA4/VoRG8p7hARB2LuRKshG0yRfPsC
         MdvA==
X-Gm-Message-State: AOAM5323lkCVyByNF5EU39qGB6xUfag697j49ofT/CENq7jArd7B1Uf4
	U1OHVEIaKgzDwgW+fypu0gw+3JnqxhTFDQ==
X-Google-Smtp-Source: ABdhPJzbfQbp6ZUKvlQYKBtdH/149h6N2qnfXs47IS27PDANx/7exxQPeC56Ym/gFRKMWf0/JGF8Eg==
X-Received: by 2002:a5d:560e:0:b0:1ef:7498:bcc2 with SMTP id l14-20020a5d560e000000b001ef7498bcc2mr14759842wrv.36.1646127823748;
        Tue, 01 Mar 2022 01:43:43 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id m62-20020a1c2641000000b00380d0cff5f3sm2009856wmm.8.2022.03.01.01.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Mar 2022 01:43:43 -0800 (PST)
Message-ID: <c2064dcc-acdc-c86b-5ef7-cb8e7ae3122f@gmail.com>
Date: Tue, 1 Mar 2022 10:43:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Sam Shih <sam.shih@mediatek.com>
Subject: [GIT PULL] arm64: dts: mediatek updates for v5.18
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Olof and Arnd,

Please have a look into the below updates for v5.18
Little by little the mt8192 is getting into shape, now that the devices have the 
corresponding clock drivers. We also gained watchdog and power domain controller.
Also mt8183 has now support for the keyboard connected to the PMIC as well as 
the JPGEG enconder.
On the router side, unfortunately the mt7986 is moving a bit slow. Hopefully in 
the next cycle we can get more drivers supported for this new chip.

Regards,
Matthias

---
The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.17-next-dts64

for you to fetch changes up to 809967d76e919af142028fae0f024b8d6966fac8:

   arm64: dts: mediatek: update mt7986b memory node (2022-03-01 09:49:02 +0100)

----------------------------------------------------------------
mt8192
- add clocks to the devices
- add watchdog node
- add power domain controller node

mt8183:
- add pmic (mt6358) key board node
- add JPEG enconder node

mt7986:
- update memory node
- add clock controller for mt7986a version

----------------------------------------------------------------
Allen-KH Cheng (6):
       arm64: dts: mediatek: Correct uart clock of MT8192
       arm64: dts: mediatek: Correct SPI clock of MT8192
       arm64: dts: mediatek: Correct Nor Flash clock of MT8192
       arm64: dts: mediatek: Correct I2C clock of MT8192
       arm64: dts: mediatek: Correct system timer clock of MT8192
       arm64: dts: mt8192: Add watchdog node

Chun-Jie Chen (1):
       arm64: dts: mediatek: Add mt8192 power domains controller

Maoguang Meng (1):
       arm64: dts: mt8183: add jpeg enc node for mt8183

Mattijs Korpershoek (1):
       arm64: dts: mt6358: add mt6358-keys node

Sam Shih (3):
       arm64: dts: mediatek: add clock support for mt7986a
       arm64: dts: mediatek: update mt7986a memory node
       arm64: dts: mediatek: update mt7986b memory node

  arch/arm64/boot/dts/mediatek/mt6358.dtsi     |  12 ++
  arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts |   3 +-
  arch/arm64/boot/dts/mediatek/mt7986a.dtsi    |  68 +++++-
  arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts |   3 +-
  arch/arm64/boot/dts/mediatek/mt8183.dtsi     |  12 ++
  arch/arm64/boot/dts/mediatek/mt8192.dtsi     | 299 +++++++++++++++++++++++----
  6 files changed, 350 insertions(+), 47 deletions(-)
