Return-Path: <SRS0=8y+7=XG=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FBAC433EF
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 08:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7328CC3411E; Fri,  1 Jul 2022 08:13:14 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 78EB7C341C6
	for <soc@kernel.org>; Fri,  1 Jul 2022 08:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 78EB7C341C6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f49.google.com with SMTP id d17so2020572wrc.10
        for <soc@kernel.org>; Fri, 01 Jul 2022 01:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:to:cc:subject
         :content-language:organization:content-transfer-encoding;
        bh=HwLeHqQPElorq6Og4+tDk5X+T/oy7d1KKsj0RbH81C0=;
        b=bHpxrDi1joMTeaaiFVPtfffheyCyKXceHc01tC7INBxAwFzceWUHhun81DYtTa9wtU
         iG++gTdkLzV5Is+3J1w9EdVAfHBEaBIKIeceQGSj/Da+9BXcTFnhxdbYmEvszBh5koyq
         T1UtPlD3n0gidXyNDEa82gkvBMU7z6D00g7wY37iQoooQPgFuVOZsB6l+ZP6M5fivgcT
         DdgwN+EtmSzPi9ibYiu9NVQ7meRhcx5tHTAQw7G/AycI/hGW+ZtfFvzK2J49DzA/fwCJ
         yf8p+C1XR+RF3IX4KE61huNIyLo9cXVF7Hewejjp3tk+3+yHT3SDFJzArbOdXtl38tkP
         G3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
         :cc:subject:content-language:organization:content-transfer-encoding;
        bh=HwLeHqQPElorq6Og4+tDk5X+T/oy7d1KKsj0RbH81C0=;
        b=Uu/ceEt4X1/ov1EC2bUu5MDZ5Rw4KixW8rngt0jZCdtZ/pmODcIxVx9GQNUJ8qOY6K
         XB0LEWQjQ38sU2R+LfwVL2kWndoLAX8ox2SrZLFnKAaU7/Gv6P1sWCGfSKYA8phMyEj8
         8zeiuHExynDBMU1npiwdPDg65swY/7gRxfwPrBlzbMfy1gKeODcRClmBJJzgM6ww2DU+
         A6w4quHgJY6XdzWsXP1y0GOODje1RBMs+vnS+0wUuzxc/1oMIImSDYKw6KEuQ136DLPb
         28MHYdRW9N7ftOPcsFUosxSLsvfaQ2LfzH0SajKZ8aruyW0F7G9ibbo0c1T9UYgPGYEh
         a8aA==
X-Gm-Message-State: AJIora8geuAyVy4ABDH1YuJ3VcBZvt1aXuDzZd0dx+0qBmIg8SGfmV+c
	1CxHogk0GUgS7mVcJNSgPDA+j87v0cBzAd0o
X-Google-Smtp-Source: AGRyM1u1BN7zw8isDhjU7X/ZJVBot0OFEjFkwjjXd3OlCtR6x02MDz3OAHse4yhY6kft5WsjdpDIrg==
X-Received: by 2002:a05:6000:137c:b0:21b:994a:a6e1 with SMTP id q28-20020a056000137c00b0021b994aa6e1mr12452993wrz.636.1656663191377;
        Fri, 01 Jul 2022 01:13:11 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:5d81:390:1737:2a33? ([2001:861:44c0:66c0:5d81:390:1737:2a33])
        by smtp.gmail.com with ESMTPSA id j10-20020a5d448a000000b0021b8c99860asm21771427wrq.115.2022.07.01.01.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 01:13:10 -0700 (PDT)
Message-ID: <0c01e173-9abf-69ac-7882-e6ecc3935c33@baylibre.com>
Date: Fri, 1 Jul 2022 10:13:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
From: Neil Armstrong <narmstrong@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] amlogic Drivers updates for v5.20
Content-Language: en-US
Organization: Baylibre
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's a set of Amlogic Drivers changes for v5.20, with refcount leak fixes.

Neil

The following changes since commit f2b03c1056ef5c0829678f51273eace3e6327884:

   soc: s4: Add support for power domains controller (2022-03-07 09:40:39 +0100)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v5.20

for you to fetch changes up to d18529a4c12f66d83daac78045ea54063bd43257:

   soc: amlogic: Fix refcount leak in meson-secure-pwrc.c (2022-06-17 09:40:40 +0200)

----------------------------------------------------------------
Amlogic Drivers changes for v5.20:
- Fix refcount leak in meson-secure-pwrc.c
- Fix refcount leak in meson_mx_socinfo_init

----------------------------------------------------------------
Liang He (1):
       soc: amlogic: Fix refcount leak in meson-secure-pwrc.c

Miaoqian Lin (1):
       meson-mx-socinfo: Fix refcount leak in meson_mx_socinfo_init

  drivers/soc/amlogic/meson-mx-socinfo.c  | 1 +
  drivers/soc/amlogic/meson-secure-pwrc.c | 4 +++-
  2 files changed, 4 insertions(+), 1 deletion(-)
