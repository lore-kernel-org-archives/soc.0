Return-Path: <SRS0=wYM+=54=monstr.eu=monstr@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08666C636CC
	for <soc@archiver.kernel.org>; Tue, 31 Jan 2023 11:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC8EEC4339B; Tue, 31 Jan 2023 11:08:29 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5BA93C433D2
	for <soc@kernel.org>; Tue, 31 Jan 2023 11:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5BA93C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-ed1-f50.google.com with SMTP id v13so13993942eda.11
        for <soc@kernel.org>; Tue, 31 Jan 2023 03:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQNJKsEUMULgRJAA6IJz6w60DG2Tc1M9y2m52UHoRDM=;
        b=RKB10IXv+bX0ej/Ugc4KU/qnZesUNZr33KcOYMQ5N06BNvwvazJWsj+BK7Jxu8g+cT
         3Trr6an/Omo2A7nkZk1GsHPArScsUBICdRn0S6r47ULuvQaB2A9zE6ix8Gv09+Zpli1q
         +acDFCujkNDqOZcvdVQSlOqZ7nlUBVraWZLjMBI08/DGWJX4JvaNrtS3/IXWN0KpULs8
         8v2h3fi1wIv/jAa5n9cXNowepb5yH3E8Uf43mIwaYfbpOVJNQdJ9EMSFM135HdpDstqC
         90bnC49Ti2RQx7VKoUKoHLUzYrPdH0WWCyEn14sJ9XaNh6K25Z0J3sI/VYN60jlyqiqN
         eRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nQNJKsEUMULgRJAA6IJz6w60DG2Tc1M9y2m52UHoRDM=;
        b=xxzWN2KKYwyQqSzdfZG/Q1rF+OdDmuxBiluVKVt6oQGoNmmk03xSj08own8vqyCCHW
         16h4GacnOSpwN15EQqeRI6aaGW1N8yEQy+YMmfHV/TAkVZooPJBfIGrTXzkHI9pGi4z8
         4nMoGiDPBZFxqoFoajJblH3CfXxT5F7ZTof0CuCWQ63tqb1zFMobq3EmDN3ZkcVwT9oJ
         5QvRX5fOzekOwBNOzX1ga/Oko4V77HyLL/k5SCVrOHNU9jXG18AkyQxKZZjimR/7B0Kf
         3aoJ8VCXQYLwduBpma8UPWPpvWIlbAIbqP1XykcLnWOMjTO8bdkvrlh3HuyeXPZ2Rujz
         leoA==
X-Gm-Message-State: AO0yUKUxHkFkCr8Vy8s2sD9Xmf+32tV82I3/vhRPIsqQvjLybEdAYQyv
	8XJEq0QP/woi/prtUdP837E2bP7ykR3cU+gX
X-Google-Smtp-Source: AK7set8AxHYskWsaIBwB3VZWd4CsFrWvEs/k9ucdV7xIRAT3ybfGjx3xxqUS22zjtGpazCXLkMLZfQ==
X-Received: by 2002:aa7:d4c5:0:b0:4a2:67e2:6230 with SMTP id t5-20020aa7d4c5000000b004a267e26230mr2281071edr.26.1675163305182;
        Tue, 31 Jan 2023 03:08:25 -0800 (PST)
Received: from [192.168.0.105] (nat-35.starnet.cz. [178.255.168.35])
        by smtp.gmail.com with ESMTPSA id p2-20020a05640210c200b00499e5659988sm8055795edu.68.2023.01.31.03.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 03:08:24 -0800 (PST)
Message-ID: <42be5129-3ca2-ddbc-ac3b-6448245b61c2@monstr.eu>
Date: Tue, 31 Jan 2023 12:08:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] arm64: soc: zynqmp: Xilinx SoC changes for v6.3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

please pull these changes to your tree. The most interesting one is from Marek 
which is adding support for older PMUFW version which didn't handle TAP delay 
programming for SDHCI properly.

Thanks,
Michal

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

   https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-v6.3

for you to fetch changes up to a4b2e6063cfeaab1160501acfb27e8618a7c693f:

   firmware: xilinx: Clear IOCTL_SET_SD_TAPDELAY using PM_MMIO_WRITE (2023-01-05 
10:18:07 +0100)

----------------------------------------------------------------
arm64: ZynqMP SoC changes for v6.3

Firmware changes
- fix memory leak in error path inside notification code
- trivial comment cleanup
- add workaround for SD tap delay programming with old PMUFW

----------------------------------------------------------------
Gaosheng Cui (1):
       driver: soc: xilinx: fix memory leak in xlnx_add_cb_for_notify_event()

Marek Vasut (1):
       firmware: xilinx: Clear IOCTL_SET_SD_TAPDELAY using PM_MMIO_WRITE

Michal Simek (1):
       firmware: xilinx: Remove kernel-doc marking in the code

  drivers/firmware/xilinx/zynqmp.c        | 27 ++++++++++++++++++--
  drivers/soc/xilinx/xlnx_event_manager.c |  4 ++-
  drivers/soc/xilinx/zynqmp_pm_domains.c  |  2 +-
  include/linux/firmware/xlnx-zynqmp.h    |  4 +++
  4 files changed, 33 insertions(+), 4 deletions(-)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs

