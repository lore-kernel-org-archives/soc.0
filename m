Return-Path: <SRS0=hN7X=XU=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A39C43334
	for <soc@archiver.kernel.org>; Fri, 15 Jul 2022 22:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E09CC341C0; Fri, 15 Jul 2022 22:18:00 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F0B2FC34115;
	Fri, 15 Jul 2022 22:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F0B2FC34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id v21so4289115plo.0;
        Fri, 15 Jul 2022 15:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rlMrCMhkxXJkStZBc0v/cdJVnnqIPqIuzYP72p6ixAM=;
        b=LFmxi+CgDPabfGTeX87VxQH6UEu2neWhPR1fwxEl7SIU7NJWKeyExlzEYQaCMfgJhC
         P8MCkXPlVgWAE54R9XrQOycJuDY4sj2G0YBMU97KmjTgSBBQgQQujrv7xope5BNbu3gC
         xUnmllAIfpCUcGgnAz67ELLmjWBiEiQ7/0n50k7y2Agfpmt3DwJrcv9MPugfWgrIb1QO
         0iknOTfpsJeF/KNh/zdSyz/2+z5XNUMkQ/Tt3b3soQj6Iv3zKUZPg3gTRmVJvG/H8Vpc
         QDi3EESmwXKVvlUYOBAqQJ8C2AWYjdHuitbLoBqZzUljrQ4/CtD6zZWql9tGIlssozNB
         F6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rlMrCMhkxXJkStZBc0v/cdJVnnqIPqIuzYP72p6ixAM=;
        b=Pn8Y91qolZnOK4gZLbaANSInrTgnbvbOrPEqNWy7esLHl8yaZA6Xe7PuTlJQRY9arb
         liqBMCi9WeAy1bgVd/OU5fXoID3WyHv+9PmDaPVAQeCdsF6Ahhuajh67D+AfudKVgJme
         fzRzis/Jyro1BYf59Rh2s0yYFAkheLu/tZ4Q+uAbpd13yuj1SuygrhXVdlbk7g9IN7sX
         Xxrn/H0F9nWaHnZAS2xVauYaqfM1gI6a8tPWnlsTNJk3QQduHdCJ2IdMp/R/RliDOW0r
         2klfMOJjPdTVaNYTfQX0k//ekOgN8Abmf2yVG8xO0KHAc64xUmavsjvrfWLNaTg0wuYC
         KHYg==
X-Gm-Message-State: AJIora+DUDlvRdcIB/cCDZ9JMfz9beO4s+etGx8DmGs0bRPzPMlPOk/m
	oY8jllSmSYrVjp9DF34OGh9GMs0T+5M=
X-Google-Smtp-Source: AGRyM1scBT+6PoRc5+6ZSincFn1wwAO+11QDEP/RZQWz82iw1KTB3S32q6+J0U3LVBV7N3JIIlYXcg==
X-Received: by 2002:a17:90b:4a83:b0:1ef:de4c:65f0 with SMTP id lp3-20020a17090b4a8300b001efde4c65f0mr24625817pjb.149.1657923479032;
        Fri, 15 Jul 2022 15:17:59 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id w63-20020a623042000000b0052ab8646500sm4391123pfw.56.2022.07.15.15.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 15:17:58 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Florian Fainelli <f.fainelli@gmail.com>,
	William Zhang <william.zhang@broadcom.com>,
	Kursad Oney <kursad.oney@broadcom.com>,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org
Subject: [GIT PULL 2/3] Broadcom devicetree-arm64 changes for 5.20 part 2
Date: Fri, 15 Jul 2022 15:16:41 -0700
Message-Id: <20220715221642.297536-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715221642.297536-1-f.fainelli@gmail.com>
References: <20220715221642.297536-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit eab6bb0994b806525fc5e362e8b865f61c4a9e20:

  arm64: dts: Add DTS files for bcmbca SoC BCM6813 (2022-06-15 10:40:02 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.20/devicetree-arm64-part2

for you to fetch changes up to 746ef3ac89cadfac2c444b1704962b32fb309d4a:

  arm64: bcmbca: Include full family name in Kconfig (2022-07-15 14:59:08 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree changes
for 5.20, second part, please pull the following:

- Rafal adds basic support for the BCM4912-based router Asus GT-AX6000,
  he also has ARCH_BCM4908 select ARCH_BCMBCA such that in the next cycle
  we can remove ARCH_BCM4908 and continue to have make oldconfig work.
  Finally he spells out what BCA means to make it clearer

----------------------------------------------------------------
Rafał Miłecki (3):
      arm64: dts: Add base DTS file for bcmbca device Asus GT-AX6000
      arm64: make ARCH_BCM4908 select ARCH_BCMBCA
      arm64: bcmbca: Include full family name in Kconfig

 arch/arm64/Kconfig.platforms                          |  3 ++-
 arch/arm64/boot/dts/broadcom/bcmbca/Makefile          |  4 +++-
 .../dts/broadcom/bcmbca/bcm4912-asus-gt-ax6000.dts    | 19 +++++++++++++++++++
 3 files changed, 24 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/bcmbca/bcm4912-asus-gt-ax6000.dts
