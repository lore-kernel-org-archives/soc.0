Return-Path: <SRS0=7UwO=XM=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DB2C43334
	for <soc@archiver.kernel.org>; Thu,  7 Jul 2022 14:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4CF20C341C6; Thu,  7 Jul 2022 14:16:44 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB246C3411E
	for <soc@kernel.org>; Thu,  7 Jul 2022 14:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DB246C3411E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-ej1-f42.google.com with SMTP id h23so32627842ejj.12
        for <soc@kernel.org>; Thu, 07 Jul 2022 07:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=sgk09dgGJURL1garHz4OtEk3J2r/6UlHgF7yi8qGAm4=;
        b=gtNEKK/Xu5NgRrni5S4ri9tYVOlzxD2bLeYvHYdHFFbHn14CMIiI/ZWMmzvPKWy0tk
         ovIeQV2mqWRFZxBkCNU2E8J5laZ0tB6rmmz5XgJCJVQuHbdhox9jT3y7Eg+579iJO9uc
         753CBAuENJSgrQj2dXs1wzHME5TGsD5Yt0ukqrNUEWWwk8hpP2oTuLR+IT0TGIf4unco
         +nsu8aZYGqkwlSuUu3QmYO2e8mQF0/rJuKsyPhTjeJVGyez2b7YyzZHudP8b6f88LVIz
         UqRPRsTelOhfHLSpQvjpG1vY0il+Al0WRm1hHtLax9wFXGhbfW/m4RlEO7goCts83mfb
         ePbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=sgk09dgGJURL1garHz4OtEk3J2r/6UlHgF7yi8qGAm4=;
        b=Mt13mzhLIWDSBp71seL9Y+CBcYPLRfL4i+3hbRzwLe8VfdA52iP8udR4h8kEygn195
         0f2QVtrJyFtytZNrLSicVKcZ9x2we8207SfJGpTQlWuzExQI2N2mBEk6BsXhpH81oSza
         I8X32iqUOC0IfWakKmHS6ikVTaXEdaRWsXJ61cnEH8NQuQy8mxTmiuX1K/bkP7vZuVE1
         iRkLt43+0Nb3079ucuoqTj/ecQpCeUy426qO4zrvIL5vZ1+cVOj9UQnaiVL1D2tEF7BM
         nNyIlETo+IPTZd2grZQ7x/jL8/P1zGqcEK+oXfU5O6BfpcyGOuN2RS+UVnD8zrlIvdUG
         1z2w==
X-Gm-Message-State: AJIora9jQmmilSZOqjCvIYFxZJHs8AZUWgync5hXwGdKfEjShIn2LIP7
	2snJNNk5P4WIOHZg+uthHBLXK033NvoArQ==
X-Google-Smtp-Source: AGRyM1tDyLgiSSEaL0FhVwUD29IkJIo7sPONfu1wiDT/3weRbfOstsFSBosd3vKeqTXI1MO7Dd7W/Q==
X-Received: by 2002:a17:906:c10:b0:6f4:6c70:b00f with SMTP id s16-20020a1709060c1000b006f46c70b00fmr45451771ejf.660.1657203400692;
        Thu, 07 Jul 2022 07:16:40 -0700 (PDT)
Received: from ?IPV6:2a02:768:2307:40d6::f9e? ([2a02:768:2307:40d6::f9e])
        by smtp.gmail.com with ESMTPSA id 8-20020a170906300800b0072aadbd48c7sm7714182ejz.84.2022.07.07.07.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 07:16:39 -0700 (PDT)
Message-ID: <e1d0a721-afa4-93a0-7119-0e4481a0624b@monstr.eu>
Date: Thu, 7 Jul 2022 16:16:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: git <git@xilinx.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] ARM: soc: Zynq SoC changes for v5.20
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

please pull the following fix to your tree.

Thanks,
Michal

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

   https://github.com/Xilinx/linux-xlnx.git tags/zynq-soc-for-v5.20

for you to fetch changes up to d1ff2559cef0f6f8d97fba6337b28adb10689e16:

   cpufreq: zynq: Fix refcount leak in zynq_get_revision (2022-06-29 14:12:08 +0200)

----------------------------------------------------------------
ARM: Zynq SoC changes for v5.20

- Fix refcount leak in zynq_get_revision()

----------------------------------------------------------------
Miaoqian Lin (1):
       cpufreq: zynq: Fix refcount leak in zynq_get_revision

  arch/arm/mach-zynq/common.c | 1 +
  1 file changed, 1 insertion(+)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

