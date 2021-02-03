Return-Path: <SRS0=brLZ=HF=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59670C433DB
	for <soc@archiver.kernel.org>; Wed,  3 Feb 2021 19:25:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0C20764DF5; Wed,  3 Feb 2021 19:25:29 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1069564F5C
	for <soc@kernel.org>; Wed,  3 Feb 2021 19:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1069564F5C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=khilman@baylibre.com
Received: by mail-wm1-f52.google.com with SMTP id m2so855048wmm.1
        for <soc@kernel.org>; Wed, 03 Feb 2021 11:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version;
        bh=x3faUe3ENc8XDGqlqmMZYsoReEXRHgzJw6DbiwpAh60=;
        b=HXZUIAq6jGAzzYxnud9rmONH+wjdL3aR33PloIVIw+UemVo1YX3gnK/XCv+hU/THrG
         HvXVszkaWZsYE0hMCtrvO+Gfl2hewL6CdJVEZrK00BcKbb+OO7CTOVfp4/HJMscyksr6
         Yup2BETZDgRVQtsN/CywUpFOenwLrGttAaUbRA2Y+JuZiOEBR8M55R7fr3wxXz47ISE6
         XxRKI+R/OntPLyitJ1RPVEVdeP/TOGXzLc7nYDKeb15BF4zVF3jdak8pZF0xH/k8wNcF
         n65v4daeTrrJpeFHCMjqXMzN22h0h0lSstqpcDkPaBk8E48AxxaeqolC7XFRb08a41GM
         ZdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
        bh=x3faUe3ENc8XDGqlqmMZYsoReEXRHgzJw6DbiwpAh60=;
        b=e5nmGlzJUX5s7l+3RQgXQ89ZCxIsQcquqC1D/w6U9RoiJmQmF2f4teCiHZCwAgxqCM
         SJsNme+usihQcasnJQe3v7fU454rrWbYe0xps2lYg6vjFwGiNk8Slpx9zfnkfoCw9Fc7
         xgdpAIS6nLJg46p8YlslMxAtva+dt6ul2AkuxONYJ8ryjhHP2njFxGjuazd7ZYyoEgxR
         nPS3gUpYAxKH2w+xi/7Cj7na6iqIqGx56cpWIjvQcnosFwUTj3x9Sm0fYNx0JGqXjuIm
         8VMLEmZiShn0DHwJlU1p00iy4eZFedAB2eD+mr76AnE7FBMicP/IcpJfgafeoRDsahN9
         0qzg==
X-Gm-Message-State: AOAM532XeORENu8VJo9JTk22Y54dbT4Nkhuxv5JTselq1DtdYisbvm4C
	qOWOjOCKN3hY3cHbAcGClWoP1JWiVfflh/52
X-Google-Smtp-Source: ABdhPJyam34LSR7c8LzBz6n9HrSk70jFtD+yAN8T7ZOW/VSvTSfJRlobznT0vJO6YQMWHuXZrcHsVw==
X-Received: by 2002:a05:600c:4f88:: with SMTP id n8mr4282178wmq.34.1612380326252;
        Wed, 03 Feb 2021 11:25:26 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id e11sm5000531wrt.35.2021.02.03.11.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 11:25:25 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: amlogic updates for v5.12
Date: Wed, 03 Feb 2021 11:25:23 -0800
Message-ID: <7ho8h12bto.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt

for you to fetch changes up to 9073f694efd8733b0e7c97d3396d81161bd05582:

  ARM: dts: meson8b: add the thermal-zones with cooling configuration (2021-01-25 09:46:44 -0800)

----------------------------------------------------------------
ARM: dts: amlogic updates for v5.12
- add thermal zones with cooling configuration

----------------------------------------------------------------
Martin Blumenstingl (4):
      ARM: dts: meson: move iio-hwmon for the SoC temperature to meson.dtsi
      ARM: dts: meson: add the ADC thermal sensor to meson.dtsi
      ARM: dts: meson8: add the thermal-zones with cooling configuration
      ARM: dts: meson8b: add the thermal-zones with cooling configuration

 arch/arm/boot/dts/meson.dtsi              | 12 ++++++++++++
 arch/arm/boot/dts/meson8.dtsi             | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/meson8b-ec100.dts       |  5 -----
 arch/arm/boot/dts/meson8b-mxq.dts         |  5 -----
 arch/arm/boot/dts/meson8b-odroidc1.dts    |  5 -----
 arch/arm/boot/dts/meson8b.dtsi            | 54 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts |  5 -----
 7 files changed, 120 insertions(+), 20 deletions(-)
