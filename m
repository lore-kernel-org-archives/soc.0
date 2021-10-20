Return-Path: <SRS0=3HjL=PI=gmail.com=romain.perier@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177BFC433EF
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 16:30:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E7A3B6137C; Wed, 20 Oct 2021 16:30:16 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C069761260;
	Wed, 20 Oct 2021 16:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C069761260
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id g79-20020a1c2052000000b00323023159e1so3165004wmg.2;
        Wed, 20 Oct 2021 09:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6XjNUCU584GTOF4zet3x8OCHbU1oMVSJN8YC6vpFGz4=;
        b=bZKBwte2qSshvK2+C2XZIwJ1WsU8pZ2r1PO6PLG5plZi3jUfxXYHSk5ygMJDdCmIhg
         /WEHNRLWMBU4QL7JmoBt293d0I1GUcPkicdNdqDr1HXHUNvQvHLFBNr/46XfgAUtrMIl
         pw2Jz7hlvA8GmQKGGDQTxOHWvLT4bXTNGJmKCFYlammkerw2nmEk62qF1/o584lHJ7ag
         9gDL3DsEhlW2aYRdy+fXodqmM9kYGLEL9gaoLVrl/+RslaobvhQ2z3MAa9K4ihWs43gc
         +Qj8JBhFZoQ1k+98EEd1docGaRmgem3+8rh//lPX2utT21Six9PNzhHf0FHCGQ2zq6tg
         OVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6XjNUCU584GTOF4zet3x8OCHbU1oMVSJN8YC6vpFGz4=;
        b=X/jem2rhUKNSaYuxiEy8qHGh1SUMMn0pA9AbC2PdU55Kb8cnKkTElAnD7YsFAA9Yyb
         Zb2A5dnl9Q/+3SBqr/56Kds80AKiO4Bn/4x/bic+lwO9KZCCJQo3/5DzwB3FEPmrLpEe
         NCLvG8WGuFMidAozFEcoCv2tLkg5nieQf0W46E8L75v4Rhii1s2Yp6CvZSjGXtvuw/br
         gBcEp5fl6PLW0dauln37jIUP3VMiFnULp/Vyesem8OekbpHh1/jIu7YeYxfYZ8U0MYjC
         Bj8aEASTR0RcU/UG0msadNyQVdSyhT0XwimI3OnKUGd/AVb7WVYKo9x4esBoq1Ad1rQ3
         Lf7A==
X-Gm-Message-State: AOAM532yNsRYiqMlzZGfcD6gWUlwzpZp33N4GXzeHYtjkYiDME5fYM08
	8haEfo9vccvjmV1Blb9+ghM=
X-Google-Smtp-Source: ABdhPJwEa/F3q6KA93Qz30hCAnZCFTLTY0F/LvLTFg3ChJTyaT10uzY2LDoJjde8kLVM3oJWvHINHg==
X-Received: by 2002:a7b:cb92:: with SMTP id m18mr1772874wmi.15.1634747415181;
        Wed, 20 Oct 2021 09:30:15 -0700 (PDT)
Received: from debby ([2a01:e0a:a6d:a8d0:7ff4:8f61:5574:9f95])
        by smtp.gmail.com with ESMTPSA id f15sm2390843wrt.38.2021.10.20.09.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 09:30:14 -0700 (PDT)
From: Romain Perier <romain.perier@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Daniel Palmer <daniel@0x0f.com>,
	Romain Perier <romain.perier@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [GIT PULL] ARM: dts: mstar: updates for v5.16 v2
Date: Wed, 20 Oct 2021 18:30:10 +0200
Message-Id: <20211020163010.3079-1-romain.perier@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,
Here's the ARM DTS changes for v5.16:
 - mstar-v7: Mark the arch timer as not being initialized by the firmware
   and rely on the physical timers.
 - mstar-v7: enable rtc

Regards,
Romain

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://github.com/linux-chenxing/linux.git mstar-dt-next

for you to fetch changes up to 4ad12dd5a2b05406473dc33bdf7dc6fd79024ca6:

  ARM: dts: mstar: Mark timer with arm,cpu-registers-not-fw-configured (2021-10-20 16:47:30 +0200)

----------------------------------------------------------------
Romain Perier (2):
      ARM: dts: mstar: Add rtc device node
      ARM: dts: mstar: Mark timer with arm,cpu-registers-not-fw-configured

 arch/arm/boot/dts/mstar-v7.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)
