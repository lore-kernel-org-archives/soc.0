Return-Path: <SRS0=8Y9D=F6=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C7BCDB47E
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 01:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 404F5C433C9; Mon, 16 Oct 2023 01:48:01 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 69EC2C433C7
	for <soc@kernel.org>; Mon, 16 Oct 2023 01:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 69EC2C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9ba1eb73c27so652104266b.3
        for <soc@kernel.org>; Sun, 15 Oct 2023 18:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1697420877; x=1698025677; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2gi9c7eKRL4XqjpqT3Lj//N+9Q1k9fI+kzxaFF2cLfM=;
        b=YJcFTsw4jaIl8OPRz8Z8qK/R65Fg+25nwEjvFYKGgjRbqBbICNxYaq+eJuZpYQkOL+
         CHGNGeXBOlvEJNyaQWh7V1ooAhAeF7sMNlRnQr/JvVJnzNd+Q+cx9EN61wmy2hRrk3sG
         CPbKJzFCWwNoXag6Sh7zRMvc5c5vBwW70g2Js=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697420877; x=1698025677;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2gi9c7eKRL4XqjpqT3Lj//N+9Q1k9fI+kzxaFF2cLfM=;
        b=hzT+VA/5uHgeptGk3a+YOFtevtZaW6hy3z7VzSrHuddBt2dmKZWOmK4eAD0gd/EASb
         KfjCrxB3WTvNFvIrcWoCfif2fVSMqjq+HLcYBzYhvv17J7j4JpwcU6JF6Fok5C43jjPl
         OMBktTU5kVjHTRIfSDjiwIfW7Wqn/G8MWVfmQqUChCkHrx83RNI0QALfaH65SoroW78F
         Oa+xNS0UpLRr8FCyRKQMiyLBR4N7tXm8I9Rqnc0FhSxoFKbj2XI69TC3Ci64kVeUbEie
         Qpik4pyua0M0D/07XQYPRaGVhDAUsWwtIlQ4EKrq2JZxLF4rqecYQp37O0UYVVWJMD+k
         smRA==
X-Gm-Message-State: AOJu0Ywih5MUH0/uogKeDXwW6NHuTjNGu3D4ibnW2KVAtdIfQLjrJVLI
	KxrWyCLrtzS2lf4kkgdkaM8eVRetgO74XI5cCq2fcSPRLE4=
X-Google-Smtp-Source: AGHT+IEeNVVDtf63s6s5ORKap+0q4n2lmr+oL3UCh6TIq2jsgVIqT9pZ3aPv49+cZqQMMqe8NW6/XpdvZKFWgvQ6sQ0=
X-Received: by 2002:a17:907:3e94:b0:9be:6ff7:1287 with SMTP id
 hs20-20020a1709073e9400b009be6ff71287mr5051490ejc.57.1697420877178; Sun, 15
 Oct 2023 18:47:57 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 16 Oct 2023 12:17:46 +1030
Message-ID: <CACPK8XebMAQvgQTRH+KoaTFg7CzRkS79Fz3Kn8p4mbaezWGkUQ@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 6.7
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"

Hello soc maintainers,

I've rejigged my gpg setup and I'm now signing with a new sub-key. Let
me know if that causes any issues.

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-6.7-devicetree

for you to fetch changes up to d024ca2792b17577c48f0cf23d648cea6f1a0b9a:

  ARM: dts: aspeed: mtmitchell: Add I2C NVMe alias port (2023-10-13
14:59:03 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 6.7

 - New machine:

  * Facebook's Minevra, as Chassis Management Controller using the
    AST2600

 - Updates to Ampere's Mt Mitchell and Mt Jade systems, and IBM's
   Bonnell

----------------------------------------------------------------
Chanh Nguyen (6):
      ARM: dts: aspeed: mtjade, mtmitchell: Update gpio-line-names
      ARM: dts: aspeed: mtjade, mtmitchell: Add new gpio-line-names
      ARM: dts: aspeed: mtjade: Add the gpio-hog
      ARM: dts: aspeed: mtmitchell: Add inlet temperature sensor
      ARM: dts: aspeed: mtmitchell: Remove redundant ADC configurations
      ARM: dts: aspeed: mtmitchell: Add I2C NVMe alias port

Eddie James (1):
      ARM: dts: aspeed: bonnell: Add reserved memory for TPM event log

Yang Chen (2):
      dt-bindings: arm: aspeed: document board compatibles
      ARM: dts: aspeed: Minerva: Add Facebook Minerva CMC board

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |   1 +
 arch/arm/boot/dts/aspeed/Makefile                  |   1 +
 .../boot/dts/aspeed/aspeed-bmc-ampere-mtjade.dts   |  66 +++--
 .../dts/aspeed/aspeed-bmc-ampere-mtmitchell.dts    | 302 +++++++++++++++++++--
 .../dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts | 265 ++++++++++++++++++
 .../arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dts |   8 +-
 6 files changed, 595 insertions(+), 48 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva-cmc.dts
