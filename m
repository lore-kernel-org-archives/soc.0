Return-Path: <SRS0=v0mk=BG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83812C7EE32
	for <soc@archiver.kernel.org>; Wed, 17 May 2023 13:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6BD0AC433D2; Wed, 17 May 2023 13:13:09 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 31B41C43323
	for <soc@kernel.org>; Wed, 17 May 2023 13:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 31B41C43323
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-510bcd2d6b8so6653922a12.0
        for <soc@kernel.org>; Wed, 17 May 2023 06:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684329186; x=1686921186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsCYEtDB1ffr+2Y+/vC2jddSRU/GNfdHR9H1LD49MZ4=;
        b=AY4YtKtj0ujl9+Mmw+CN96C9qS1pl/EP9v0K0ELoQazLV651LI2GjmChiUhIn9r2bh
         xeXqQ7sJ+WCpNmAkbF/6YEdSVcYfmd4qodUP7gpKPgdFLvMnYB/UO0H+iwNfBl4MC95G
         Mvdm+rLhHfM7lKzFEQQU+sXSGNyWozdxEnKOiIuZZDLsZIo8GgVLUbGrrLGBvq2kDErf
         oMVN90lZnHHJpP6NHBpoca10ZkD2n8Kx40bij1U3jH3g646VVOZSQBeQPNozefNIPv4H
         V+ae/JgK7z4xmgoihVFr+QScA1c4i2uNL66UzChrtQO2FLWQzf3LBB2Tk7pS2WRBRcyy
         5cYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684329186; x=1686921186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RsCYEtDB1ffr+2Y+/vC2jddSRU/GNfdHR9H1LD49MZ4=;
        b=PaXI9JAKIGSOBYAjy0kjoNariwZf7Oz7zdG4jeb7V0lFDmWRgand65yWzxobXt2R/L
         K4T86jB0XDWOwTBTJ7lLpG5YIS3/0i25w1dhyJm9LC/MgUAlOGJTvFssC8EF3z8AKM7x
         Hv/sd31DteukW6HpkuCM4MHm3NtwFSbAkdgxSq80pdLejIJs2H3ax/dwcR8VKL5YECjg
         Y5D0iyIRvk8+mRRsR8yKrgpVZONysm6ua7UKBdTiunopN5Vm9bFaA5uEhon715lgQZu7
         6aX4s+Ns9a7HJim4zmEqj5IAnzzTonZ0K3Xrml92J2RpuJQXZ+LLXUb3DXDyrUnRs68S
         3e+g==
X-Gm-Message-State: AC+VfDxO0jY2Yd4z9wQZez9rwNlHF84w6Se0jh5RPqBxtn/5iHVbO71K
	JlhIQ8LxuxWYqs8WwGpR6r9RcQ==
X-Google-Smtp-Source: ACHHUZ4KHT9X6WEz67mV7Zi3b4JfOl7XqzWOKK6QNiEjbdiMOUpttEUxIbNwfYMDn2EKItI3M03jZQ==
X-Received: by 2002:a17:907:1621:b0:968:892b:1902 with SMTP id hb33-20020a170907162100b00968892b1902mr2122535ejc.6.1684329186304;
        Wed, 17 May 2023 06:13:06 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id hs32-20020a1709073ea000b009534211cc97sm12291184ejc.159.2023.05.17.06.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 06:13:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com
Subject: [GIT PULL 2/2] ARM: dts: cleanup for v6.5
Date: Wed, 17 May 2023 15:12:55 +0200
Message-Id: <20230517131255.471002-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517131255.471002-1-krzysztof.kozlowski@linaro.org>
References: <20230517131255.471002-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-6.5

for you to fetch changes up to 21f475946d89911e31bccd02f8a7ce40b8f52a70:

  ARM: dts: en7523: add missing cache properties (2023-05-16 18:26:24 +0200)

----------------------------------------------------------------
Minor improvements in ARM DTS for v6.5

Minor improvements to fix dtbs_check warnings:
1. STE: Align UART nodes with bindings.
2. EN7523: add missing cache properties.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      ARM: dts: ste: align UART node name with bindings
      ARM: dts: en7523: add missing cache properties

 arch/arm/boot/dts/en7523.dtsi                      | 2 ++
 arch/arm/boot/dts/ste-dbx5x0.dtsi                  | 6 +++---
 arch/arm/boot/dts/ste-href.dtsi                    | 6 +++---
 arch/arm/boot/dts/ste-hrefprev60.dtsi              | 2 +-
 arch/arm/boot/dts/ste-nomadik-nhk15.dts            | 2 +-
 arch/arm/boot/dts/ste-nomadik-s8815.dts            | 2 +-
 arch/arm/boot/dts/ste-nomadik-stn8815.dtsi         | 6 +++---
 arch/arm/boot/dts/ste-snowball.dts                 | 6 +++---
 arch/arm/boot/dts/ste-ux500-samsung-codina-tmo.dts | 6 +++---
 arch/arm/boot/dts/ste-ux500-samsung-codina.dts     | 6 +++---
 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts     | 6 +++---
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts     | 6 +++---
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts     | 6 +++---
 arch/arm/boot/dts/ste-ux500-samsung-kyle.dts       | 6 +++---
 arch/arm/boot/dts/ste-ux500-samsung-skomer.dts     | 6 +++---
 15 files changed, 38 insertions(+), 36 deletions(-)
