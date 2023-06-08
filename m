Return-Path: <SRS0=udSp=B4=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFBAC7EE25
	for <soc@archiver.kernel.org>; Thu,  8 Jun 2023 12:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B01FBC4339B; Thu,  8 Jun 2023 12:09:20 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 70750C433EF
	for <soc@kernel.org>; Thu,  8 Jun 2023 12:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 70750C433EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-3f61530506aso4659375e9.1
        for <soc@kernel.org>; Thu, 08 Jun 2023 05:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20221208.gappssmtp.com; s=20221208; t=1686226156; x=1688818156;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPKtUmVfmf92A4UXMx62OshvQeFm2MZAKIf3Qn9qpn0=;
        b=AxV8wkpbMeXxE77C2eHiAZMqKzICjpzS5l915zQ8Lzrp5STPl7QzqlE2cX/XESpSJ5
         tR7hm8SXlSnqVIofrof1Muesiefm0t9JiODgdn71cF8a4+VXLy+rxW2DRSJge5uLdpwX
         z7GXptnXxngiMUhD35CJWLh++yIV3EfZouYyYIO5oLq0X49tVEueKQKYxkMMApebtN9M
         lVuPF3S8QQZ1ozq3Ow8kxU1Q3+WhgVuL10gTy7KaIWG6pFwGgjbv0mtfRkBbrr2yQ/yP
         cs7Y/CL5xOfMzyXRYkSJjHxGnhTjjATcgEn9K7YOnN/pfI7VgpBFThN3Dpaw/2zAwt/u
         +G0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686226156; x=1688818156;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aPKtUmVfmf92A4UXMx62OshvQeFm2MZAKIf3Qn9qpn0=;
        b=NOTxO1O498C6Qi/wDyDBKIhZrD3QvNBBbzS0iVJIw9edyVcql9GOUJPK0rCtBBmUXm
         vRPC8w0wTb9YffHH+zLlshDoCKfL7oD/T9FMwpY3HZdPUYCjhUlFniYkPa95Gx+SonOg
         uK1AWbnPwIBoULc4PbGaXaKZJl+t8BGyZjibzMkofOzNAyxrUFGkFXiuxVrDmx3H0SAq
         shzmKCqc3jdqeYJUqWr6mmWRME+wJvJnj3MuxG5PdvKhEGr6UHVGG/E4UWNU/Ofbze4V
         J91eG9gx3FlrDwiHkcLG7HJoJ3Lbse+XJm5WdiXqmnCdo6ylRa+ch4aCN1tOACLWWE5g
         0nFg==
X-Gm-Message-State: AC+VfDy0lDr9UEvqqc/fXOzNPhZUTzIP2oIZ0TuRRVb5y197+4H4YlBs
	7YfhPcG67DOm26iyxXZUc+2AUZ5TqzJ7G24ZpEFa2Ks0mNI=
X-Google-Smtp-Source: ACHHUZ53p5bV6JvufOaxc7mTUza/vGaTD0c0hsfzZ5fXPtkxiqXTBVcRhVFVTv8YAewyl1iLED4wbA==
X-Received: by 2002:a05:600c:210c:b0:3f7:cc2d:3f6c with SMTP id u12-20020a05600c210c00b003f7cc2d3f6cmr1349859wml.24.1686226156006;
        Thu, 08 Jun 2023 05:09:16 -0700 (PDT)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id c23-20020a7bc017000000b003f1958eeadcsm5066815wmb.17.2023.06.08.05.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jun 2023 05:09:14 -0700 (PDT)
Message-ID: <411aee78-e7e8-5966-cbe8-40ff45e27ba2@monstr.eu>
Date: Thu, 8 Jun 2023 14:09:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: "git (AMD-Xilinx)" <git@amd.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] arm64: soc: ZynqMP SoC changes for v6.5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

please pull these changes to your tree. I have also included changes in 
MAINTAINERS fragments. If you want me to send it separately please let me know.

Thanks,
Michal


The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

   https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-v6.5

for you to fetch changes up to a49e482c52d551b46ec10fb12bbf5ad242848a59:

   MAINTAINERS: Switch to @amd.com emails (2023-06-05 13:29:09 +0200)

----------------------------------------------------------------
arm64: ZynqMP SoC changes for v6.5

soc-power
- Use of_property_present() instead of of_find_property()

soc-event
- Avoid use after free eve_data in event manager code

firmware:
- Extend zynqmp_pm_fpga_load() interface

MAINTAINERS:
- Clean xilinx records

----------------------------------------------------------------
Dan Carpenter (1):
       driver: soc: xilinx: use _safe loop iterator to avoid a use after free

Michal Simek (2):
       MAINTAINERS: Remove Hyun and Anurag from maintainer list
       MAINTAINERS: Switch to @amd.com emails

Nava kishore Manne (1):
       firmware: xilinx: Update the zynqmp_pm_fpga_load() API

Rob Herring (1):
       soc: xilinx: Use of_property_present() for testing DT property presence

  MAINTAINERS                             | 16 ++++++----------
  drivers/firmware/xilinx/zynqmp.c        | 12 ++++++++++--
  drivers/soc/xilinx/xlnx_event_manager.c |  6 ++++--
  drivers/soc/xilinx/zynqmp_power.c       |  4 ++--
  4 files changed, 22 insertions(+), 16 deletions(-)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs
