Return-Path: <SRS0=5ZCx=PI=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B73BC433F5
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 00:40:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2EC12610E6; Wed, 20 Oct 2021 00:40:37 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ECE5610F8
	for <soc@kernel.org>; Wed, 20 Oct 2021 00:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0ECE5610F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id o26so9383484ljj.2
        for <soc@kernel.org>; Tue, 19 Oct 2021 17:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=L5NfXVZad4XV5R3tE0XjXKlGzs6sY0yussJBq1esyO0=;
        b=Rs1NpD6/Dem+jevdWR6JQkEt85xkikh38aLJ6wer3yMVJAXJSyUFyz3UYA/kIYPtD4
         EDD6pFy0nV1LT6W0tq1Twr11h4ZvPQDig/0HxMlYXyX8s868XNIqFCndkZR31EyOMvqw
         q3cW9czWH+rnqexRwQNQGFzBJkjYCTKV8EdA1kEyNhYrYMDb+gIrbDAsdbvdpm6M1svD
         3Vd4RmulGCy1mBMDD3h8r07vMQp9ryHtvMcnlpedQp4ND2vkk0k6fJGd3REmMcg4EXER
         KzOVHd+9GzMROgfSL/nDx+BkkJd7gNaq8rLbHUu4Ipvv6m+VrJ86C7xGf/wlSZhlBG8z
         /+Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=L5NfXVZad4XV5R3tE0XjXKlGzs6sY0yussJBq1esyO0=;
        b=ljq+D7AsMwY5bJsZlg6K1LIpjnytN3hNREO4t/m92bwZrlEwcsiWch6R8nHx4VUOSJ
         g++ebtRTUzk3/NlW2THTAlzAULZAll6lGv1wbv6zrDwuofyYDrIL+NnWerQrc9F1SupH
         VCnjllm+uKgzoq6ay5+RWuegvgpRQEG9khMj/8y3NaSDwp/Qdw45wNnx2zIjer0W8Lvy
         ge99aU50LsPEHfOM47BVIMleRtd1JeI0ZowtDd3LSbhTsUzZhOq4TDtWNUmiI242Oe15
         THyvZUa1uT7atQ+U/lwmADcwF5TX0ZOQ3zkbminnlgN9qUlVswyVYcryrna1PubSNtqc
         wT+A==
X-Gm-Message-State: AOAM533aTuPFerqWvRlGoYCShos1twos2n/7/3D/IDOwrMOieOMnw4Yz
	c+greXTRbBhiOjUsVJkveaJoagI3I8s+hR2pco1Dw4x/uomndQ==
X-Google-Smtp-Source: ABdhPJw4fDOZZ4UcOFf9/MhwIk6PAFRAmLDtcYvWhAOz6Pjz5T2uyDMc7DScShS9XDJvspU+IwHi3JqjOXt8NUk5sIs=
X-Received: by 2002:a05:651c:111:: with SMTP id a17mr9880781ljb.145.1634690435152;
 Tue, 19 Oct 2021 17:40:35 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Oct 2021 02:40:24 +0200
Message-ID: <CACRpkdbSJ662h_B9mAGdXWBeq8ZwKTQvSJ7cZ2x2d8UgELP5QA@mail.gmail.com>
Subject: [GIT PULL] IXP4xx changes for v5.16
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: arm-kernel@lists.infradead.org, Imre Kaloz <kaloz@openwrt.org>, 
	Krzysztof Halasa <khalasa@piap.pl>
Content-Type: text/plain; charset="UTF-8"

Hi SoC maintainers,

just a few IXP4xx DTS changes this merge window, described in the
signed tag. Please pull it in!

Yours,
Linus Walleij

The following changes since commit ac08b1c68d1b1ed3cebb218fc3ea2c07484eb07d:

  Merge tag 'pci-v5.15-changes' of
git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci (2021-09-07
19:13:42 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ixp4xx-dts-for-v5.16

for you to fetch changes up to 3e70cee46cbcdf3dc5b89c525a4632f051f8abd9:

  ARM: dts: ixp4xx: Group PCI interrupt properties together
(2021-10-20 02:31:22 +0200)

----------------------------------------------------------------
IXP4xx DTS changes for the v5.16 kernel:

- Add the PTP timesource

- Push down PCI interrupt properties to the individual
  board files.

----------------------------------------------------------------
Linus Walleij (1):
      ARM: dts: Add PTP timesource to the IXP456x

Rob Herring (1):
      ARM: dts: ixp4xx: Group PCI interrupt properties together

 arch/arm/boot/dts/intel-ixp42x-adi-coyote.dts        | 2 ++
 arch/arm/boot/dts/intel-ixp42x-arcom-vulcan.dts      | 2 ++
 arch/arm/boot/dts/intel-ixp42x-dlink-dsm-g600.dts    | 2 ++
 arch/arm/boot/dts/intel-ixp42x-freecom-fsg-3.dts     | 2 ++
 arch/arm/boot/dts/intel-ixp42x-gateworks-gw2348.dts  | 2 ++
 arch/arm/boot/dts/intel-ixp42x-iomega-nas100d.dts    | 2 ++
 arch/arm/boot/dts/intel-ixp42x-ixdpg425.dts          | 2 ++
 arch/arm/boot/dts/intel-ixp42x-linksys-nslu2.dts     | 2 ++
 arch/arm/boot/dts/intel-ixp42x-linksys-wrv54g.dts    | 2 ++
 arch/arm/boot/dts/intel-ixp42x-netgear-wg302v2.dts   | 2 ++
 arch/arm/boot/dts/intel-ixp43x-gateworks-gw2358.dts  | 2 ++
 arch/arm/boot/dts/intel-ixp45x-ixp46x.dtsi           | 8 ++++++++
 arch/arm/boot/dts/intel-ixp4xx-reference-design.dtsi | 2 ++
 arch/arm/boot/dts/intel-ixp4xx.dtsi                  | 2 --
 14 files changed, 32 insertions(+), 2 deletions(-)
