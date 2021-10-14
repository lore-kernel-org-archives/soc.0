Return-Path: <SRS0=WMNB=PC=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86761C433FE
	for <soc@archiver.kernel.org>; Thu, 14 Oct 2021 16:44:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 597C961108; Thu, 14 Oct 2021 16:44:10 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C5A460EBB
	for <soc@kernel.org>; Thu, 14 Oct 2021 16:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C5A460EBB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id y26so29729823lfa.11
        for <soc@kernel.org>; Thu, 14 Oct 2021 09:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=vCU6ojwh+dKcX10IObMSSn07IYYcVauIvQZUzyoiKMk=;
        b=JBhLM81UcR6td0xbPvt8v/V/HG8tUsxQQ5u3sFKnNC9tJY518kXgz/orzt4hZyaF5l
         rRUOUvdi/2+lRAODGS93BFH0/vR+dn0jxWPO4CRag323IBbO3ruLuKS7gUG9SBrFQpB0
         hdrk0o3j1sNbgIjycddI3ZNEq5AmZfMVv6TO8Z7hz29KMB1z0cJAHWihs5ziXMWHOG9O
         iT5HkBfsOa0FN8r5Pz7V0yqHiqC643YZ1wHcps+XNTE5FhZPtBMajRVGkRd+eHGTcNKM
         RT7+2Szt/2ou0KOPyKCBYbedAzIqZcAov0pHJkJOIYl+XR3BhixXxYUB0p8+pyiCeCny
         xpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=vCU6ojwh+dKcX10IObMSSn07IYYcVauIvQZUzyoiKMk=;
        b=A7/AXI54xQqNgWxFOgKwBR7xcQ96vmAJIkhdPuvNqu9jVxps3qMNPZCem+aeDI/EOR
         RWnk6v92svRhqb/negmQJw8vZbxTputTmZ3scnroRBIGg4Vqra1PWqyPSSj6NALhluyj
         ycZ1sY29rtEpeqjVsKbH5G7b8ZbWAAGrBrS9kQUZU/01EHWfi1PVLPVeoLJYnC8KOP8M
         OtBEYIQ7t8F9vfCbzCcXC6+BwLrsnu60KrmR1oiSS9HVXnH/LucC1l21VmiQfZYR8EoM
         2mvAzaXtiSj2FOcOh3vx7yNJ/jEWci2lniiHX9xjnR0gAzynYc2UdWVG9MQsd3i6T6DW
         1E6Q==
X-Gm-Message-State: AOAM532a6MrkKk3xIDtdEBaqdsrkzIUOjQinkP9+34Xtr1Z2pIUubDtB
	5UEK1ZdYyj0oODiPzNrBH4MNv1Efar7txMxxrgiBg88SrmdMFg==
X-Google-Smtp-Source: ABdhPJzd4oHSTyeXqa+AbHo2kBEmcMfAGrgrzKFJ6HQ5sVCwDljKmalad0yYvcQgURQhnXV++0CPLQmUL81Nl4yd0rM=
X-Received: by 2002:a2e:7f05:: with SMTP id a5mr7013939ljd.261.1634229848170;
 Thu, 14 Oct 2021 09:44:08 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Oct 2021 18:43:57 +0200
Message-ID: <CACRpkdYf5GwRvG1Gemk4mE+aw6UnAVTY8OudwsVNPQXThHXu6g@mail.gmail.com>
Subject: [GIT PULL] Ux500 DTS updates for v5.16
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC maintainers,

here are some Ux500 DTS updates for the v5.16 merge window.

Details in the signed tag!

Please pull it in.

Yours,
Linus Walleij

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-dts-for-v5.16

for you to fetch changes up to be3a60a94390651499ea317ae6853bdb5c756065:

  ARM: dts: ux500: Switch battery nodes to standard (2021-10-14 17:41:10 +0200)

----------------------------------------------------------------
Ux500 DTS updates:

- Flag the janice SPI display lines properly for the right line
  semantics.
- Fix some errors in the Skomer regulator configuration.
- Fix some SD card pin configurations on Skomer.
- Assign the Skomer SD card a 300 ms power-on delay.
- Rewrite the battery nodes to use the standard binding
  "monitored-battery" as used in the updated bindings, and
  provide the right Samsung battery compatibles for the Samsung
  phones.

----------------------------------------------------------------
Linus Walleij (5):
      ARM: dts: ux500: Tag Janice display SPI correct
      ARM: dts: ux500: Skomer regulator fixes
      ARM: dts: ux500: Fix up SD card pin config
      ARM: dts: ux500: Skomer eMMC needs 300 ms power on
      ARM: dts: ux500: Switch battery nodes to standard

 arch/arm/boot/dts/ste-ab8500.dtsi              | 13 +++------
 arch/arm/boot/dts/ste-ab8505.dtsi              | 13 +++------
 arch/arm/boot/dts/ste-href.dtsi                |  6 ++++
 arch/arm/boot/dts/ste-snowball.dts             |  6 ++++
 arch/arm/boot/dts/ste-ux500-samsung-codina.dts |  4 +++
 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts |  4 +++
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts |  4 +++
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts |  7 +++++
 arch/arm/boot/dts/ste-ux500-samsung-kyle.dts   |  4 +++
 arch/arm/boot/dts/ste-ux500-samsung-skomer.dts | 38 ++++++++++++--------------
 10 files changed, 61 insertions(+), 38 deletions(-)
