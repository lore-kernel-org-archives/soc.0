Return-Path: <SRS0=Z9Qk=3X=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2755C4332F
	for <soc@archiver.kernel.org>; Wed, 23 Nov 2022 02:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 90079C433D7; Wed, 23 Nov 2022 02:31:00 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E0805C433D6
	for <soc@kernel.org>; Wed, 23 Nov 2022 02:30:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E0805C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id bs21so27481251wrb.4
        for <soc@kernel.org>; Tue, 22 Nov 2022 18:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1GvBDoH3WpGBzY5OnJ9FJeCjvi9It1JHZ2SlHS5mdWA=;
        b=BTvwBJZhF/0hVQLaz4yq8ZLTZUNzGZ93tdEyHSeKpOxUjUWp0a9SKvfn8kkBZxDVCT
         gjYY8/PzQ4Ecj+pMJ+1/vyNC1zCxQ9RwubMsFKt6ASKKYcSQH9b61lubkAB0CORv0JRp
         QKQkqMsyo+Gs7DYgt7oYjmwK/yGxsoU13IKwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GvBDoH3WpGBzY5OnJ9FJeCjvi9It1JHZ2SlHS5mdWA=;
        b=Q7lNHzNROMX4qawML29Qh1fjzTRE8kcQecdK8DtRXT6TqkGxWahMok+v9gJdLr2y37
         QXQtNImNnKK1+LTNZtAhsEmcvaRJMyO4J+46sZ6VM2ZqaDpjCm4Ehx5t/biBHz1Toup1
         8UujAk2OwIJ1cyn1ClyaWiqnbKKUsA+P1SKyUq1QIJPxINpXhF1yCS+iIgj4mQuFYZDb
         0eajkpoagRdfKkbk39e/odQziEyByiQEEKfLb8NOcTdsOtugaF4c4l0ujs4vwIeBOlz8
         AFseRGOKQwkz4ocGIij5qDAFKS8u/vW0AWl4CaysZWGZFH1iMuxwl4dbu4lo2MeJIrO3
         anYw==
X-Gm-Message-State: ANoB5pl+gYnib6Z4gdKuOhCIRkpLhZvQad7h2ey6Ox4dAH9ZLc/cuPbr
	lT9Uk1UrFzyve/DFmCVGKRoEyzLt6Ds6ZEhTX3A43zfTuSc=
X-Google-Smtp-Source: AA0mqf6gCn9fi7H8mLGVzKHn08WXKKchsSAHbEQGo2GJq0XrzJNY54lcp6S6qoGyMShEmnIy2+Cykj5yOULDP33q/c4=
X-Received: by 2002:a05:6000:258:b0:236:74c5:7e2 with SMTP id
 m24-20020a056000025800b0023674c507e2mr15506290wrz.3.1669170656818; Tue, 22
 Nov 2022 18:30:56 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 23 Nov 2022 02:30:45 +0000
Message-ID: <CACPK8XffL5_L5D_ZGQid0r4h0wfTc+XBGUO1-0QW7ErPPrrvEQ@mail.gmail.com>
Subject: [GIT PULL] ARM: nuvoton: devicetree changes for 6.2
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello soc maintainers,

Here are the nuvoton device tree changes for v6.2.

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780=
:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/nuvoton-6.2-devicetree

for you to fetch changes up to 88cfe56ea64a4cc1038c18b9dd416d817d1c8ae5:

  ARM: dts: nuvoton: wpcm450: Add missing aliases for serial0/serial1
(2022-11-22 12:07:20 +1030)

----------------------------------------------------------------
Nuvoton device tree updates for 6.2

 - Update fix-partition syntax

 - WPCM450 updates for SPI controller, clock, watchdog, serial

 - GPIO line names for Supermicro X9SCI-LN4F BMC

----------------------------------------------------------------
Jonathan Neusch=C3=A4fer (7):
      ARM: dts: nuvoton,wpcm450-supermicro-x9sci-ln4f: Add GPIO line names
      ARM: dts: nuvoton: Remove bogus unit addresses from fixed-partition n=
odes
      ARM: dts: wpcm450: Add FIU SPI controller node
      ARM: dts: wpcm450-supermicro-x9sci-ln4f: Add SPI flash
      ARM: dts: wpcm450: Add clock controller node
      ARM: dts: wpcm450: Enable watchdog by default
      ARM: dts: nuvoton: wpcm450: Add missing aliases for serial0/serial1

 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts          |  2 +-
 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts          |  2 +-
 arch/arm/boot/dts/nuvoton-npcm730-kudo.dts         |  6 ++--
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts          |  4 +--
 .../boot/dts/nuvoton-npcm750-runbmc-olympus.dts    |  6 ++--
 .../dts/nuvoton-wpcm450-supermicro-x9sci-ln4f.dts  | 36 ++++++++++++++++++=
+---
 arch/arm/boot/dts/nuvoton-wpcm450.dtsi             | 34 ++++++++++++++++++=
+-
 7 files changed, 75 insertions(+), 15 deletions(-)
