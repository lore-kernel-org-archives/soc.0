Return-Path: <SRS0=5c0l=Q7=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778EBC433F5
	for <soc@archiver.kernel.org>; Tue, 14 Dec 2021 00:23:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 58844C34600; Tue, 14 Dec 2021 00:23:01 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 414A7C34604
	for <soc@kernel.org>; Tue, 14 Dec 2021 00:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 414A7C34604
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f173.google.com with SMTP id u74so25322206oie.8
        for <soc@kernel.org>; Mon, 13 Dec 2021 16:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=sItywfkzIUoxlJuvNd9D/LEMcLoXEcdTFZdYtiOEdXo=;
        b=XdAJxsAC5a75vHxQh9Ts5myl06tiIF1upsyKYu8nEVfh2REPiFw1jK99WaxVYawHOs
         /OnT/l0YOQ3f+6tzbzf557yCIaYW+DN5HfXPcY3TJy9nqI1crnAL5iuaH4Tv6Uy144jr
         JhLlBfDaV9e4lHIYbHXkFakIWCkWw1WLUfKrdRYr0rh1m+YuUQvqjQccobnMvn9pffaU
         FQmWY5HY6WxbIbNPpcYBGf99wWjm1E6IF6XKf2ooPa9l9ws1TysLXBpVJHB/nv1TA/GH
         36MTLUfCsosH0oV14irbowzTMGIbwSWZkEmm0zubpLe24I07SJwf5mguFgrQ/NsydjAy
         z3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=sItywfkzIUoxlJuvNd9D/LEMcLoXEcdTFZdYtiOEdXo=;
        b=YfETzRovEMvuLK7keduYaRmf4vocmLxX/sQEaRMIneXSR7/vZ3DlCsbZzD+tETpRrz
         hfevI7MU/QB+pNOJB2VY1boi+AQFarkwLAt6ZIRvaUg4qD86s9lkLI3Vr6QZXREevIzc
         rVB7ri1hP0lBTgT74wtQI/YgEi+/wHcTwwMG5iYKJMAXzeS2Elt5msTDieFWMO0rbtgV
         AueRJyG3j33DpQyXvT7hDcrgTQ/jfAS7pI01M1DE9Z5GaA/e1OX9bJs2skB/I82FCCRI
         w1KPlUViMySRRtmx7ojoaX26o3fuvHhMLQWZt7hqnb39v3bvuiQ13noKu226FzojehhQ
         Pk/A==
X-Gm-Message-State: AOAM533MQAQPuPCsKCUObUjtAO6zHux4uKfMuMW9szvt2Vv5kPLav6RO
	Nh4yj5P0jo4GEJRZyCXPRP1sF+5l+9sFcDXhjCVBUUDHfMbaqw==
X-Google-Smtp-Source: ABdhPJx0pQG4vSFeT5OcuLmqEJUyFeZpdsqBlUIOGszfR92A1GGmIyZMGIwP239b/blEQy8j0FgLx2PHoKg5qVfjJwI=
X-Received: by 2002:a54:4791:: with SMTP id o17mr1740678oic.114.1639441378976;
 Mon, 13 Dec 2021 16:22:58 -0800 (PST)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Dec 2021 01:22:47 +0100
Message-ID: <CACRpkdYiWK7TEbZrh4_0WT5obMk=ZSc7AQVUSPXL+-uZ_hsUEA@mail.gmail.com>
Subject: [GIT PULL] IXP4xx DTS changes for v5.17
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Zoltan HERPAI <wigyori@uid0.hu>, 
	Imre Kaloz <kaloz@openwrt.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC folks,

here are some IXP4xx DTS file changes for v5.17.
We have now a complete set of DTS files for the boards
previously supported by board files.

The plan is to delete the board files in the next merge
window for v5.18 (because of dependencies).

Please pull it in to the appropriate DTS branch in the
SoC tree!

Yours,
Linus Walleij

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ixp4xx-dtx-v5.17

for you to fetch changes up to 7b9eb6cfdb784ad713024a3f8f202620ad40ba70:

  ARM: dts: ixp4xx: Add devicetree for Gateway 7001 (2021-12-13 00:50:40 +0100)

----------------------------------------------------------------
IXP4xx DTS changes for v5.17:

- Add the LEDs to the Freecom FSG-3 that were missing.
- Add a devicetree for the Gorami MultiLink Router
- Add a devicetree for the Gateway GW7001 Router

This completes the migration of all IXP4xx devices to
device tree files.

Next merge window we will delete the remaining board files,
it cannot be done now because of cross-tree dependencies.

----------------------------------------------------------------
Linus Walleij (2):
      ARM: dts: Add FSG3 system controller and LEDs
      ARM: dts: Add Goramo MultiLink device tree

Zoltan HERPAI (1):
      ARM: dts: ixp4xx: Add devicetree for Gateway 7001

 arch/arm/boot/dts/Makefile                         |   4 +-
 arch/arm/boot/dts/intel-ixp42x-freecom-fsg-3.dts   |  59 +++++++
 arch/arm/boot/dts/intel-ixp42x-gateway-7001.dts    | 111 +++++++++++++
 .../arm/boot/dts/intel-ixp42x-goramo-multilink.dts | 180 +++++++++++++++++++++
 arch/arm/boot/dts/intel-ixp4xx.dtsi                |  17 ++
 5 files changed, 370 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-gateway-7001.dts
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-goramo-multilink.dts
