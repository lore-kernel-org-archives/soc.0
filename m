Return-Path: <SRS0=XMaa=DV=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CD2C001DB
	for <soc@archiver.kernel.org>; Fri,  4 Aug 2023 11:13:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9A179C433C9; Fri,  4 Aug 2023 11:13:24 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A25C3C433C8
	for <soc@kernel.org>; Fri,  4 Aug 2023 11:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A25C3C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-317c3ac7339so1392931f8f.0
        for <soc@kernel.org>; Fri, 04 Aug 2023 04:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20221208.gappssmtp.com; s=20221208; t=1691147599; x=1691752399;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTsRI/gChXSly2gRwwc1zg5owQoijiID6TtWerVPCEM=;
        b=uObRhQzdmLhvDOJD+kt3Xh6pFidp647WmGMq2elJgtAIavwoYcc2qPcIJO9V8jO3on
         S0urbcG10Uuc++iBFwkXYarshrwZOQs0qXqbCqrEvbLfGheHuhPeFBgXbMxBqU9E+9ER
         PLyZsB6/NIykq/oeNmaV7nTKQIl0E6k4zWLPN4ag2SiNR8UFGv6U3uSDf6yHlnjERn06
         Walno/0rk/sI0hEQuAJq62gVrqqbDkrBDtzGx8Uq2nmTgPFkeC/wlenkfmnkBTvpX5po
         Jyz1E7fEKfbfkEe0IP4l1a+EGoMGEHhXvfxCnywz4RxO2YDoBmVvwPk/KAW3JJloQc2M
         0/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691147599; x=1691752399;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OTsRI/gChXSly2gRwwc1zg5owQoijiID6TtWerVPCEM=;
        b=MfYszlYOvJ6ratAbqWvLDERUDVLoKbVOs0mjeG6xb88Uc4zLQBjanECoJJXRWhADnF
         KyydBUNujMO2LpKuGJBDASaiLJG/YmkuDElZiil1ztZCpO7chrCvVuJIo0lHVpoTghGn
         rktbpkYBmTXbndkANZE87X9mdwlKwLk07WeCnTXkL+rvlNrvqeB+q/ge7erdPf3ruFW0
         fDhdn14cPXZWSJ+lXqThgWsKQVrPhMjMCnVX5I98JxAeiMtbWKIYBRv8M2G53SEvQPYF
         a0C2Y0Cwj/2GbffWoHrG5gb8cViXW6VsPpAbi9F862t0wW3wmvBbnLTSFcCctgc8qjQx
         RZYg==
X-Gm-Message-State: AOJu0YwxeCoApgTRdROD7d/ReZ20YgO62+FEN1KA8KsB6ntNwrdo6Tll
	ITn+4xhXcGUc1/yEWdD4DrCJY02BKM4Iw5FZYEg=
X-Google-Smtp-Source: AGHT+IELZe5h6nix8wdhqiBMwa0BuR9Muf4gX9vu0XRs0v52GORO8ODIF4zYP5Ns/WRimFm3+/K7kA==
X-Received: by 2002:a5d:4044:0:b0:314:a3f:9c17 with SMTP id w4-20020a5d4044000000b003140a3f9c17mr1262849wrp.42.1691147598861;
        Fri, 04 Aug 2023 04:13:18 -0700 (PDT)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id i5-20020adfdec5000000b00313e2abfb8dsm2242373wrn.92.2023.08.04.04.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 04:13:17 -0700 (PDT)
Message-ID: <a56457a0-7e5a-df46-2c86-3f2ace578984@monstr.eu>
Date: Fri, 4 Aug 2023 13:13:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: "git (AMD-Xilinx)" <git@amd.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] ARM: soc: Zynq SoC changes for v6.6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

please pull this one Rob's patch to your tree,

Thanks,
Michal

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

   https://github.com/Xilinx/linux-xlnx.git tags/zynq-soc-for-6.6

for you to fetch changes up to bb54e6609977f5140eb0af9b0c42d957cb35b4f4:

   ARM: zynq: Explicitly include correct DT includes (2023-07-20 17:06:50 +0200)

----------------------------------------------------------------
ARM: Zynq SoC changes for v6.6

- Sort out OF headers in pm.c

----------------------------------------------------------------
Rob Herring (1):
       ARM: zynq: Explicitly include correct DT includes

  arch/arm/mach-zynq/pm.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs
