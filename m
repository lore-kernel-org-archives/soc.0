Return-Path: <SRS0=lNGk=Z7=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F7DC32771
	for <soc@archiver.kernel.org>; Wed, 28 Sep 2022 04:44:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F22B0C433C1; Wed, 28 Sep 2022 04:44:22 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 122A3C433D6
	for <soc@kernel.org>; Wed, 28 Sep 2022 04:44:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 122A3C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id s14so17971430wro.0
        for <soc@kernel.org>; Tue, 27 Sep 2022 21:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=UbIdGPHTQb0rSyUCqwB7KsZpj7r2X4N4SUM3dLW5wRw=;
        b=T6qOtTbao+oc5+lfR1CrJOinJ2d7LfNIOdBM/zoz5Q3Uykpxza4+GQ0XwvlBJ3hZVF
         LgCzSVp3Eyf3AlWK3Y6Q44SLpEoe31kAVkApgVYilMY5mIhbNv5CtKTSd/W62xMGMVZ7
         wUSDVTJsB4wd7pli4xhHH7hnoSCP3HKsoRIZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=UbIdGPHTQb0rSyUCqwB7KsZpj7r2X4N4SUM3dLW5wRw=;
        b=AWILbseGNj+MnATWoQs9UC14xzeRMl8ni3x+StgwFZEmFFpdNlUckP3XA5sRBudy3A
         yXpomtAEIdFgmpd7cBLx0Zo/f5Zk7x+nl8fh4DFHrg6AkSdEaiixri7ZfG9y62ZHcbiR
         ZcYNRqie2kHWSemNBcF0VVD3IT3w1HPxEXsJkvjW96p9yUKhZFF0MksNlRuJXVx3DVxd
         ZrlNYEJFUAiU7ozaKtOq5sWnh9b5hRtEOPD8Rw3oVrDXmgATW9IFQio7J8W0FV/sX6P4
         LiSeXhOvwNRfNsUgZsi/Atp+awl7luhrnkaYtraI63+ZJ++ESQo8CDsMg2z2gOpJGkkC
         WNsw==
X-Gm-Message-State: ACrzQf2dHww0Y32fhp+YFz8Z38VLut+86FPDdLX0aLaTm/keYAuq8suy
	vNFw0xYpfNml8GDCtI+DrWGWT3tDn5WKI5zZC+lB60qowcZt1Q==
X-Google-Smtp-Source: AMsMyM4M7MRQ8DivtDCUCQYo6LwQksQkEsZJGlIrOSAMy13q8S4xwp/hAm/ZHbhJEVlUWJhJbYe1PiOOSj031vMlEhY=
X-Received: by 2002:a05:6000:1a8e:b0:22a:f55a:94d6 with SMTP id
 f14-20020a0560001a8e00b0022af55a94d6mr17982701wry.606.1664340259828; Tue, 27
 Sep 2022 21:44:19 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 28 Sep 2022 04:44:08 +0000
Message-ID: <CACPK8XeLzL3hT8fwVw9fV7Ccduz_PNhZn_67z2yXefCEha6jJg@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: defconfig changes for 6.1
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"

Hello Soc maintainers,

After a brief hiatus that saw me absent for the past merge window, I'm
back on deck and catching up. This branch has a long awaited sync of
the openbmc defconfig (where most of the aspeed code is consumed) with
the one in mainline.

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-6.1-defconfig

for you to fetch changes up to e0d468427882556b8815e09769bbbc3281478b1e:

  ARM: config: aspeed_g5: Enable PECI (2022-09-28 12:34:02 +0930)

----------------------------------------------------------------
ASPEED defconfig updates for 6.1

 - A long awaited sync to make the config closer to that used by OpenBMC
   machines

 - Enable PECI to provide defconfig coverage for the subsystem

----------------------------------------------------------------
Adriana Kobylak (1):
      ARM: configs: aspeed: Add support for USB flash drives

Joel Stanley (10):
      ARM: configs: aspeed_g5: Add mp5023 driver
      ARM: configs: aspeed_g5: Add TPM TIS I2C driver
      ARM: configs: aspeed_g5: Add PL2303 USB serial driver
      ARM: configs: aspeed_g5: Enable MCTP stack
      ARM: configs: aspeed_g4: Enable OCC and NBD drivers
      ARM: configs: aspeed_g4: Enable IPV6 options
      ARM: config: aspeed: Enable namespaces
      ARM: configs: aspeed: Refresh defconfigs
      ARM: configs: aspeed_g4: Remove appended DTB and ATAG
      ARM: config: aspeed_g5: Enable PECI

 arch/arm/configs/aspeed_g4_defconfig | 10 +++++++---
 arch/arm/configs/aspeed_g5_defconfig | 20 +++++++++++++++++++-
 2 files changed, 26 insertions(+), 4 deletions(-)
