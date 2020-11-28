Return-Path: <SRS0=l92L=FC=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78E28C64E7A
	for <soc@archiver.kernel.org>; Sat, 28 Nov 2020 16:34:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5C35A246CF; Sat, 28 Nov 2020 16:34:22 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23110246CA;
	Sat, 28 Nov 2020 16:34:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j947Wy9p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23110246CA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pl1-f178.google.com with SMTP id bj5so4150628plb.4;
        Sat, 28 Nov 2020 08:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wc0nyS8dzfOavbOXrqC7eni+mcCu2FOMeKW4jeT7vyw=;
        b=j947Wy9p0q+rAUjgkMm8kdMwwdNbzshmIu7FSEn/IDz8zavpWSpLXmKD5VsTgRV2iY
         fb43v4xzcP/oEWoPzuvBd2TYhPmsNWNBMSD+YN+PIibF/+rbDKwFGK3Gt4BFgc5fUqRe
         dmh4z1bASeUI49SAfrKupeFSTVxuFsL50Ir+V9LcQxs8Qyj78CF1neVlgYG9rWtsfklf
         EmeF+5aaAWw6LGem+LbpVkSxpvEzUDWvGC/1HRupC34lNBXA1V2HwC+XINP3N7fzZVB+
         kKyt12yNVR4IiWDAozr2JeDhNTe3C/aywEBQrD++ahGF1rrANka/KYQHOn2AJf1bDUVx
         wjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wc0nyS8dzfOavbOXrqC7eni+mcCu2FOMeKW4jeT7vyw=;
        b=GsVQFSm6VOOE0y5lr+P0p10O7XDDEEE3NcczNMx1ewMLuAhKZvmAzq1dd7zaCKxxb6
         77k3h2WBwm7yvwBLm6EDgEbxogW7RLsiKDuS0lLBMWyZiX9GQSRNbe2tRF8HN00NLbxB
         ElKVbO3NGx9snBpKjRi6AN8pN83zggx+RL8gtMBt9mP2xJU+iPATqYRGF6G8oV6rieix
         Pf2hkcD0B+UE1TD6GuvyZAQ7nd4wV6PAujgxVII7atehF1PsWuxgSpkGu71iONXNB6MD
         7xo6dIJ+eyKrxtHyO/UdlU0Xak3l+c2htE4UdTRxnIiySt8SoLpAhctEyZIGeCwuJeo4
         KIlg==
X-Gm-Message-State: AOAM530zfSWkgcNJKHlC1y3W8ZooA+S3ChgOXA8bwVwDB3Wyl/tzuVpP
	0be/o23fz2lFTet4amn02rB7GcKvwQs=
X-Google-Smtp-Source: ABdhPJzukg0n15WSZduzQOD6MIK+fRpeh6hDf9gLa77zVnqELS2lAC2JfcamQIDpFo/ea7FlCnCrsQ==
X-Received: by 2002:a17:902:bb8b:b029:da:beb:b81e with SMTP id m11-20020a170902bb8bb02900da0bebb81emr11855775pls.44.1606581261175;
        Sat, 28 Nov 2020 08:34:21 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id c3sm10909209pfn.67.2020.11.28.08.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 08:34:20 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 4/5] Broadcom devicetree-arm64 changes for 5.11
Date: Sat, 28 Nov 2020 08:34:09 -0800
Message-Id: <20201128163410.1691529-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201128163410.1691529-1-f.fainelli@gmail.com>
References: <20201128163410.1691529-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.11/devicetree-arm64

for you to fetch changes up to dccb22d078ebd098115e4f66bde1ee2249c8640b:

  arm64: add config for Broadcom BCM4908 SoCs (2020-11-25 09:07:49 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree changes
for 5.11, please pull the following:

- Rafal adds initial support for the Broadcom 4908 which are SoCs used
  in home routers and are based on the DSL architecture and using
  Broadcom Brahma-B53 CPUs.

----------------------------------------------------------------
Rafał Miłecki (3):
      dt-bindings: arm: bcm: document BCM4908 bindings
      arm64: dts: broadcom: add BCM4908 and Asus GT-AC5300 early DTS files
      arm64: add config for Broadcom BCM4908 SoCs

 .../devicetree/bindings/arm/bcm/brcm,bcm4908.yaml  |  38 +++++
 arch/arm64/Kconfig.platforms                       |   8 +
 arch/arm64/boot/dts/broadcom/Makefile              |   1 +
 arch/arm64/boot/dts/broadcom/bcm4908/Makefile      |   2 +
 .../broadcom/bcm4908/bcm4908-asus-gt-ac5300.dts    |  66 ++++++++
 arch/arm64/boot/dts/broadcom/bcm4908/bcm4908.dtsi  | 187 +++++++++++++++++++++
 arch/arm64/configs/defconfig                       |   1 +
 7 files changed, 303 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/bcm/brcm,bcm4908.yaml
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm4908/Makefile
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm4908/bcm4908-asus-gt-ac5300.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm4908/bcm4908.dtsi
