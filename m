Return-Path: <SRS0=gyIo=XN=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55F0C43334
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 17:36:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B281C385A2; Fri,  8 Jul 2022 17:36:10 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D4474C341C0;
	Fri,  8 Jul 2022 17:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D4474C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id p4so3475197wms.0;
        Fri, 08 Jul 2022 10:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=GuHO2sMYvOP0wHr0TcjQCOSbiWz+0AP0K6+73tZUu9o=;
        b=m3a1b+NuehTX+Z76ztZUtVpWt8UMrzyXCf96ws7E8as9/l7TEPIagj2kLNneGRtM0a
         3sxi04UOkvdBopygxEXkB+YR5/IaLbF2WsDjaq3BEL+YyiXkU9BGo8IMEOWogAaUPdP5
         HwmyJAYCE9nSq0nbYHActQ2BgD9QPdQNiF8KD1LGQewXFtrRgfk8TxOdXR3z8frT0QzT
         U8RDcM0qO349vKKmfVq25MNGEnA46CBMLJw2+SQsZmIoP9DUq7InEbIfWYapmMSLLKiq
         G1/yAIeWaKombYijNWJWScGvWz8RtTU+jW360zkWSi9KADbpK7HAV6PyBfo/KikPifnj
         lG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=GuHO2sMYvOP0wHr0TcjQCOSbiWz+0AP0K6+73tZUu9o=;
        b=RxuLIhWQDn0lppP9KRTuzLqHhauFRDZCXdT+IwAt1exi6aqtpQI888q/UMAwUIynLs
         /V1Dl+B/wpUU/j5G/mCdgPA7zXG5aiiuwDZpftwRdnlpqNJAqFWcA5L1oP0C5Wbr8wV3
         zYHuc/OphS8z2vLPqkezSsb4yhCekS/SoBNPtSWtkXwkxCUSBLd8E2z59vHb4V12+18E
         JwrYugk8hgTylMA2fUyNwDJ6QFD+GuE9quzxyminrfdpuXfPizb01F01lwWCKesLHTfZ
         HEvOKvvw0O/qF0C8ni3UkAcRdKLHlEp3atezlVRMX8n/svz/C6IMlxKKYZjV2UDZ+oVh
         Fp5g==
X-Gm-Message-State: AJIora+r1xcf/asup+LszCcyqkl8PhHwMNOENh6i40OCg5qNQzYZUbLv
	jqhkGCv0Xnj68opCq6xsLARIb9aKNIR42w==
X-Google-Smtp-Source: AGRyM1sI5jEtED3H+P34gJ/5UIh/Ok06sT/0L7MEYiZKnQ5VGOQCeD519tPxR9WhClaaRQWjpjXjAw==
X-Received: by 2002:a05:600c:27cd:b0:3a1:8b8c:b156 with SMTP id l13-20020a05600c27cd00b003a18b8cb156mr976232wmb.156.1657301767900;
        Fri, 08 Jul 2022 10:36:07 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d684b000000b0021badf3cb26sm6831148wrw.63.2022.07.08.10.36.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 10:36:06 -0700 (PDT)
Message-ID: <63536da6-fbe4-2d96-ab91-ae756cd580c4@gmail.com>
Date: Fri, 8 Jul 2022 19:36:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Felix Fietkau <nbd@nbd.name>,
 Krzysztof Kozlowski <krzk@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] ARM: dts: MediaTek DT changes for v5.20
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Olof and Arnd,

Please have a look at the following changes to MediaTek based HW in the 32-bit 
Arm space. The most notable change is that we now have support for clock and 
PCIe on the Airoha EN7523, which were the last two bits that were missing.

Regards,
Matthias

---
The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.19-next-dts32

for you to fetch changes up to 4da8b5e9f24a8036660f7a09553c0ddc5db4839a:

   ARM: dts: mediatek: align gpio-key node names with dtschema (2022-06-17 
12:44:05 +0200)

----------------------------------------------------------------
Airoha EN7523:
- Add clock and PCIe support

Several style fixes to comply with DT spec.

----------------------------------------------------------------
Felix Fietkau (2):
       ARM: dts: add clock support for Airoha EN7523
       ARM: dts: Add PCIe support for Airoha EN7523

Krzysztof Kozlowski (2):
       ARM: dts: mediatek: adjust whitespace around '='
       ARM: dts: mediatek: align gpio-key node names with dtschema

  arch/arm/boot/dts/en7523-evb.dts              |  8 ++++
  arch/arm/boot/dts/en7523.dtsi                 | 66 +++++++++++++++++++++++++++
  arch/arm/boot/dts/mt2701.dtsi                 |  8 ++--
  arch/arm/boot/dts/mt7623.dtsi                 |  6 +--
  arch/arm/boot/dts/mt7623a-rfb-emmc.dts        |  4 +-
  arch/arm/boot/dts/mt7623a-rfb-nand.dts        |  4 +-
  arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts |  4 +-
  arch/arm/boot/dts/mt7623n-rfb-emmc.dts        |  4 +-
  arch/arm/boot/dts/mt7629-rfb.dts              |  4 +-
  9 files changed, 91 insertions(+), 17 deletions(-)
