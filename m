Return-Path: <SRS0=hmFV=JC=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6E9C433ED
	for <soc@archiver.kernel.org>; Mon,  5 Apr 2021 22:48:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1CC0E613E1; Mon,  5 Apr 2021 22:48:24 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34F3361040
	for <soc@kernel.org>; Mon,  5 Apr 2021 22:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34F3361040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=khilman@baylibre.com
Received: by mail-wr1-f50.google.com with SMTP id c8so12176551wrq.11
        for <soc@kernel.org>; Mon, 05 Apr 2021 15:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version;
        bh=xWE2bWe6MeibC3WAG0QRM+W3rbg9QKme8vyFRrD/y+Q=;
        b=E8huiKDTHZ9HKAeH9wTPI/1XKl0BL12GfWUsBhT7u1d6/K4dvclSp74mbon6dlLIcn
         dKI3iz7+TQD4MsqFEzFSoSj+2Nxm5YNo7aEydSYWxogguDguu/o5IiUy1Cq+Wgg3vFj3
         St/QPUNP/svzt6KFuw6bZtOuRcNE3Vo6hnb4ujC3piggRQmhC8Vcw+cW7Xp5O9F3NrfY
         iErjnI9qDNV4+LcDWyU3ZJL8ACNygBeRnhry2vc0uaECy7dd1PdlV7navFfoOOXhTtG3
         hsJyG053Q7m25DQeqExZ43nNQf5PSg5cqoCzFEUAjMc/opgd5TJjskH+teqDX00Mm/KN
         /j0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
        bh=xWE2bWe6MeibC3WAG0QRM+W3rbg9QKme8vyFRrD/y+Q=;
        b=khZ8aYQv7ipwzTern5OvQAshkuvsuEiOBjeXtgaHoqOe3vGL3T5h4Y4CLhnUOHRnSY
         7UBktehx1/a3jhhxrDKyze1BD6PuM2nm4gkiTqq7ysFUZensaRZUDeG2gfxYa8Tf3cnI
         gJLzkivwsDo9tKvAuhxt0SzvbK4ArqpZsoXIdz/bTe0t/axUF9yZuWqTaETbiYEs71fK
         niUV5fYKmTIZBpCELgGBc6daNPCgumQGe2Slx4cjkQD+Ig3CZz8aLRgf4qgu6u/p3KNT
         HMxu8NPWEaj+9q+0fmqyEgZic50nISstkoTUVtidB5IZvcHXykgmb8IllBrNpN0fxcMt
         sl8A==
X-Gm-Message-State: AOAM530Ic24GikQ3JTCRg/buebU1l5u+KH9/ITSCKoqaumR9wECAdnA2
	nkNCiEP9h7A0atmN2o13PaaxJ7VNteEOj6kM
X-Google-Smtp-Source: ABdhPJycRLaoaFaMGHePU6xVulEfdOLfIaRvTc2DlrDXyeW+ducssmiYN038kyRSy6w4QGsbLusPmQ==
X-Received: by 2002:a5d:5256:: with SMTP id k22mr7498wrc.168.1617662901564;
        Mon, 05 Apr 2021 15:48:21 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id w7sm3038723wru.74.2021.04.05.15.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:48:21 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.13
Date: Mon, 05 Apr 2021 15:48:18 -0700
Message-ID: <7h5z10mjpp.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:

  Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64

for you to fetch changes up to 727d93ed3ba67307a82c3ac5ebc7e335265e8b9e:

  arm64: dts: meson: add initial device-tree for MeCool KIII Pro (2021-04-05 15:35:39 -0700)

----------------------------------------------------------------
arm64: dts: amlogic updates for v5.13
- new boards: MeCool KII & KIII, Minix NEO U9-H
- used fixed index for MMC devices

----------------------------------------------------------------
Alexander Stein (1):
      arm64: dts: amlogic: Assign a fixed index to mmc devices

Christian Hewitt (5):
      dt-bindings: arm: amlogic: add support for the Minix NEO U9-H
      arm64: dts: meson: add initial device-tree for Minix NEO U9-H
      dt-bindings: arm: amlogic: add MeCool KII/KIII Pro bindings
      arm64: dts: meson: add initial device-tree for MeCool KII Pro
      arm64: dts: meson: add initial device-tree for MeCool KIII Pro

 Documentation/devicetree/bindings/arm/amlogic.yaml             |   3 +++
 arch/arm64/boot/dts/amlogic/Makefile                           |   3 +++
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi              |   6 +++++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi                      |   6 +++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts |  86 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts      | 113 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts        | 120 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 337 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts
