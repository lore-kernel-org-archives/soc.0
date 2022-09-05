Return-Path: <SRS0=6fcB=ZI=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90234ECAAD5
	for <soc@archiver.kernel.org>; Mon,  5 Sep 2022 13:55:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4C449C433D7; Mon,  5 Sep 2022 13:55:00 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59CFAC43470
	for <soc@kernel.org>; Mon,  5 Sep 2022 13:54:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 59CFAC43470
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f53.google.com with SMTP id d5so5295140wms.5
        for <soc@kernel.org>; Mon, 05 Sep 2022 06:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:organization:content-language:subject:cc
         :to:from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date;
        bh=krKlcnTZdKSlo/zGRjkjNpcb+YkXL08HqYSlJd9Ifnk=;
        b=hfVPDii3QFNYESNB+FvWc5Wsv75HGBTxb5conCJDkDWyvc36bEwNh5g+ZJpOS9ljBy
         2QNspjo1Ai2K+DYxypZCD1CZpDas66ZK6CnLZG9XZV1Fa3usId8dnzauvnDpN5gLPflc
         9efOJ9g8ed3OteNGcq/JQ6zNWhpLKWc84RC7ZTyNAU4zu2/igRz6LcAi4ED3I+fevBIR
         sDNE1nMFwRmGOyl/TeIR1UgVlCLfsGIBI8WYDC7RIHmc3QVZD4juM+qiiJb0HxJaVd31
         dxvGDvdcRT20k+EPyCT9tNLD+zhhiAu/Ip6i/TixHUgngChF7It9+9nh7iPHa4Cmflxy
         0qNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:content-language:subject:cc
         :to:from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=krKlcnTZdKSlo/zGRjkjNpcb+YkXL08HqYSlJd9Ifnk=;
        b=6MFekGZleZKPSezOggiTRxeBaiTa/ZRndrbpDT23zn9k7kU2mVFwLDv2qapnZlXEJ7
         aRAmP2S/IWnbA0ipGDqjN8WfN3c22ZgZ58MfZOxGELB0um3Qbe1tc9jOJ+EDtf3LUpKS
         7frNHGfa2JLHgRgshMHSJjCrzMt+vXeJ/VzGM1xn7xeMTDSaOG62Or7ycbmaWGJqvo0Y
         PjYuykCI5TFpIcj2CTZp5upUbmcdZtwbeaGlaqPESkiVmhHkXbwGG/UdKy3Q/BAXHtia
         b3UXxrPluRR64C3cZ7638xC1pif6n2uljEhPJZgneqW1CwRX4GFqeQfbViOJ7klqqsx8
         eOhQ==
X-Gm-Message-State: ACgBeo2eLWLPlp6KMXz+tbBLD2jndcND5dmVBjk2QqmxHGjLbeG+62Bo
	pSI1tUiVyjipyAw7A6IS1w7S4Amn8XsKEnv2
X-Google-Smtp-Source: AA6agR4/MWKs7kS2axm3FVpvnZ4tuRkqR4/RBPo2tUD974F7x6HXd6OKS5M4PMrNlxya+Lhl6hTZSw==
X-Received: by 2002:a05:600c:348d:b0:3a6:b4e:ff6d with SMTP id a13-20020a05600c348d00b003a60b4eff6dmr10278176wmq.95.1662386095065;
        Mon, 05 Sep 2022 06:54:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f365:27e9:453c:4c15? ([2a01:e0a:982:cbb0:f365:27e9:453c:4c15])
        by smtp.gmail.com with ESMTPSA id o5-20020a05600c510500b003a31fd05e0fsm34941568wms.2.2022.09.05.06.54.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 06:54:54 -0700 (PDT)
Message-ID: <d0079686-40ae-58b2-e58b-c8dc6361d7f0@baylibre.com>
Date: Mon, 5 Sep 2022 15:54:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
From: Neil Armstrong <narmstrong@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.1
Content-Language: en-US
Organization: Baylibre
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's a set of Amlogic ARM64 DT changes for v6.1, with 2 new boards:
- Beelink GT1 Ultimate TV box
- JetHub D1p, DIN Rail Automation Controller

+ fixups with removal of invalid 'enable-active-low' on SM1 & G12A boards

Neil

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v6.1

for you to fetch changes up to 5b3a87a5c4f20da682d50dbaf8c4aa357cfd0d2d:

   arm64: dts: meson: add support for Beelink GT1 Ultimate (2022-09-05 09:25:59 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v6.1:
- add Bindings & DT for Beelink GT1 Ultimate
- Remove invalid 'enable-active-low' on SM1 & G12A boards
- add Bindings & DT for the new JetHub D1p

----------------------------------------------------------------
Christian Hewitt (2):
       dt-bindings: arm: amlogic: add Beelink GT1 Ultimate binding
       arm64: dts: meson: add support for Beelink GT1 Ultimate

Fabio Estevam (2):
       arm64: dts: meson-g12a: Remove 'enable-active-low'
       arm64: dts: meson-sm1-sei610: Remove 'enable-active-low'

Vyacheslav Bocharov (2):
       arm64: dts: meson-axg: add support for JetHub D1p (j110)
       dt-bindings: arm: amlogic: add bindings for Jethub D1p (j110)

  Documentation/devicetree/bindings/arm/amlogic.yaml |   2 +
  arch/arm64/boot/dts/amlogic/Makefile               |   3 +
  .../dts/amlogic/meson-axg-jethome-jethub-j100.dts  | 338 +-------------------
  .../meson-axg-jethome-jethub-j110-rev-2.dts        |  37 +++
  .../meson-axg-jethome-jethub-j110-rev-3.dts        |  27 ++
  .../dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi | 351 +++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |   1 -
  .../boot/dts/amlogic/meson-gxm-gt1-ultimate.dts    |  91 ++++++
  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |   1 -
  9 files changed, 515 insertions(+), 336 deletions(-)
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-2.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j110-rev-3.dts
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-axg-jethome-jethub-j1xx.dtsi
  create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxm-gt1-ultimate.dts
