Return-Path: <SRS0=ctD/=PJ=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2362C433F5
	for <soc@archiver.kernel.org>; Thu, 21 Oct 2021 05:34:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 96906610D0; Thu, 21 Oct 2021 05:34:53 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0072A60F9E
	for <soc@kernel.org>; Thu, 21 Oct 2021 05:34:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0072A60F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id t2so5124076qtn.12
        for <soc@kernel.org>; Wed, 20 Oct 2021 22:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=GCDNxBCfQrTCgy65OYovBu7GvVP02m8fWJKotJSowI8=;
        b=W/GkOBcUgbznUu6AFf4sEGPIgLXPobT/BxjC+RQ3UsOXTtnV5s6Hu7Ehbf53dn/0dW
         die3vh2BoBfZDlbB/dS5zHgJleBKE0Qhk/wgjqtCn4fxrG4pT94SfjyDUzNfI/VGaKoC
         wFijimLQhIyC+PKSWs3jla26tom1jdJut+KGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=GCDNxBCfQrTCgy65OYovBu7GvVP02m8fWJKotJSowI8=;
        b=YKfkmdTffQD9VkSW7Kv83FzU+UKCOt5JaYzRjxtg+Sz7nExAIad+T/UgQIzxHCpVQz
         JhIt+8Y00Hs5tSwUMFa5XmjUo4Q6snMoydTfwxHiMk54MJZ/YhUdMmlH8ZbzllqGqTjk
         Hm1dMavg4N7PwlIl+BC8QxxKiBohmEA/cKXOTq/d7W12iBZg1VfYClZ55W+DE6546HxA
         ori+WRvHxu8LTWXiqkcH1dFzoFCTWcIFpi4zgPMsY6WfmvX3wFpoyWRCCeGg4jjnGkRX
         R8y5DN6AMY0W5BY6ovKpzvC+SvfyJQPYXlBTLJIn5McxpoB9AGQEzJPsyHtjsmRwmmvS
         Xe7A==
X-Gm-Message-State: AOAM532OcI2oxFXCk87IVLDAr+DOEAQ5Zn6GruKqqBvaYD/f+t5w8ceb
	Xn95LdEKxXCvrqj2tlgMrGUo/9aY9u2bzeVsQlK9oGTkL6c=
X-Google-Smtp-Source: ABdhPJyMzuyXO0SBIINy0WPCXlJC1D/b24gY7qkNEliyXfFi81yGd9amHY8WRVOpNJ9LSE4dVghPNhwf5FLlVMDmErM=
X-Received: by 2002:ac8:5f06:: with SMTP id x6mr3827041qta.295.1634794491508;
 Wed, 20 Oct 2021 22:34:51 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 21 Oct 2021 05:34:39 +0000
Message-ID: <CACPK8Xd0mVn2Cy7d=VBTDMpU=WHrftsiihwH224ekFSDGKAbyA@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: defconfig changes for 5.16
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"

Hello Soc maintainers,

Here are aspeed defconfig changes for v5.16.

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.16-defconfig

for you to fetch changes up to 52a490e0efac02f236295cf43e136a1cb3a786f7:

  ARM: configs: aspeed: Remove unused USB gadget devices (2021-10-15
15:02:32 +1030)

----------------------------------------------------------------
ASPEED defconfig updates for 5.16

 - Add options that are enabled in the common OpenBMC kernel

 - Re-enable DRM_FBDEV_EMULATION

 - Turn on the various sensor drivers that are used in BMC systems,
 so we can boot test where they are modelled in Qemu

----------------------------------------------------------------
Joel Stanley (6):
      ARM: configs: aspeed_g5: Reneable DRM_FBDEV_EMULATION
      ARM: configs: aspeed: Disable IPV6 SIT device
      ARM: configs: aspeed: Enable commonly used drivers
      ARM: configs: aspeed: Enable pstore and lockup detectors
      ARM: config: aspeed: Enable Network Block Device
      ARM: configs: aspeed: Remove unused USB gadget devices

 arch/arm/configs/aspeed_g4_defconfig |  1 +
 arch/arm/configs/aspeed_g5_defconfig | 35 ++++++++++++++++++++++-------------
 2 files changed, 23 insertions(+), 13 deletions(-)
