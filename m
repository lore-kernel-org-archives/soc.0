Return-Path: <SRS0=cpLJ=RY=lixom.net=olof@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB273C433F5
	for <soc@archiver.kernel.org>; Sat,  8 Jan 2022 20:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68BF0C36AED; Sat,  8 Jan 2022 20:20:27 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C750C36AE3
	for <soc@kernel.org>; Sat,  8 Jan 2022 20:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3C750C36AE3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=lixom.net
Received: by mail-pj1-f46.google.com with SMTP id r16-20020a17090a0ad000b001b276aa3aabso16995216pje.0
        for <soc@kernel.org>; Sat, 08 Jan 2022 12:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=M8nlxjsax+tZ6u93885GOWQETnXbkgAORedylCcReuk=;
        b=B7YLPMm0tPwaRcCRkC3c3O5rHpeMkKeuUwWDtLRZOCupmRem/ZNZwPxVvyt7AMKRMh
         2zmKJH7hvvDjOdvDngWh9RGFwJwphNQ4VKJvdX3Br6LgLI64TesIMe8hnXxrck2+viGk
         Dr5JRoyUqiqUlsl6eb+d96bzcoK/m3qkppCHT3YhczXLpQg7UVari/erbWnTbRsRxGOD
         qJYp6MLevdN57JiT90gtYphIeCMglCmC8zGo0PPe3/dfjWfM8Qh3NQ+6fOr5VFXRsHJW
         4CHXQg+xz7CLFddqsqt6A08umOjND6jawCni/jFJD+s85t54XuFAQpjhSeFsTFFSi9ha
         9/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=M8nlxjsax+tZ6u93885GOWQETnXbkgAORedylCcReuk=;
        b=NWqFxkBhxwigQRUncNvBeYfEpBbnzqOXsxj8OoGsO5LjHmIAOart3ask4Cjq66K8Zt
         FH6JcixAkNWSDZqoWwAWvXqnMSgNH5E56CqYvRt+ZxyMKQQwao96CIuRIfVUmvwEYLQO
         PJsX0e3E/b/ME/pLelG8tQKddBNIun15zrjd8NeKHf1lZ7688cUMEI/U2EdzN/T/b8lt
         vG2Jv/1lNyz9lcCn56fvx1wqAIHSvfnoAPQW3zKpeozHA9KlipDMFsd5+Ek8tQECLIID
         HTdzdfmtKlt7dLHyfqwORA43laSQkdKZT+1itP4MbEW3CWIQdlrNBbV01Jrz5DNa6KNw
         yIpw==
X-Gm-Message-State: AOAM5307iuaOpUBUwv13mA5x5CB8WOcvMyUqUEdALdYPypzanu4o7oMg
	xJU9NpX7gtFoEhuMlexU7P1Z+Q==
X-Google-Smtp-Source: ABdhPJxil+u06qw/bUKv6pIt1DhMgft16Ye8bg9TyK17pH3MkElpfotxEL/Ko5m9d4NGvM2kHOEJ1w==
X-Received: by 2002:a17:902:e84d:b0:14a:2b59:7779 with SMTP id t13-20020a170902e84d00b0014a2b597779mr161221plg.38.1641673225576;
        Sat, 08 Jan 2022 12:20:25 -0800 (PST)
Received: from localhost (99-152-116-91.lightspeed.sntcca.sbcglobal.net. [99.152.116.91])
        by smtp.gmail.com with ESMTPSA id j17sm2780550pfu.77.2022.01.08.12.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 12:20:24 -0800 (PST)
Date: Sat, 8 Jan 2022 12:20:11 -0800
From: Olof Johansson <olof@lixom.net>
To: torvalds@linux-foundation.org
List-Id: <soc.lore.kernel.org>
Cc: olof@lixom.net, linux-arm-kernel@lists.infradead.org, soc@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] SoC: Fixes for 5.16, part 4
Message-ID: <20220108202011.GA1760@lx2k>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Linus,

The following changes since commit fc74e0a40e4f9fd0468e34045b0c45bba11dcbb2:

  Linux 5.16-rc7 (2021-12-26 13:17:17 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.16-4

for you to fetch changes up to 8922bb6526ac4b20bd8de7f47d6e77808670f6c4:

  Merge tag 'socfpga_fix_for_v5.16_part_3' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into arm/fixes (2022-01-05 16:18:50 -0800)

----------------------------------------------------------------
SoC; Fixes for 5.16, part 4

A few more fixes have come in, nothing overly severe but would be good
to get in by final release:

 - More specific compatible fields on the qspi controller for socfpga,
 to enable quirks in the driver.
 - A runtime PM fix for Renesas to fix mismatched reference counts on
 errors.

----------------------------------------------------------------
Dinh Nguyen (2):
      dt-bindings: spi: cadence-quadspi: document "intel,socfpga-qspi"
      ARM: dts: socfpga: change qspi to "intel,socfpga-qspi"

Heiner Kallweit (1):
      reset: renesas: Fix Runtime PM usage

Olof Johansson (2):
      Merge tag 'reset-fixes-for-v5.16-2' of git://git.pengutronix.de/pza/linux into arm/fixes
      Merge tag 'socfpga_fix_for_v5.16_part_3' of git://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux into arm/fixes

 Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml | 1 +
 arch/arm/boot/dts/socfpga.dtsi                           | 2 +-
 arch/arm/boot/dts/socfpga_arria10.dtsi                   | 2 +-
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi        | 2 +-
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi            | 2 +-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c                  | 7 ++++++-
 6 files changed, 11 insertions(+), 5 deletions(-)
