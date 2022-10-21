Return-Path: <SRS0=4lOA=2W=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7420C38A2D
	for <soc@archiver.kernel.org>; Fri, 21 Oct 2022 21:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 832AAC433D7; Fri, 21 Oct 2022 21:19:58 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 77F76C433D6
	for <soc@kernel.org>; Fri, 21 Oct 2022 21:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 77F76C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id w8so8203019edc.1
        for <soc@kernel.org>; Fri, 21 Oct 2022 14:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hU/FgGBsebJlFogRMbkXNuemW0TgNj/jaWAjVEWA9wo=;
        b=zCgUO5kxXz/2BuN9aT0ORifAe9ivjxyjDC3gYs4dXeku6SwxjA5bsN6KCapW9WBHl4
         fBRM8GzJmWFwwUTfW+9eWa30Ica/bNuvGW1D6YvqXCMXQRDvpXppThWruaXbB/bMAao3
         jH7X21BHZqaJVq3cMn+Euwsa34WD+z8tQB64HEMboPfoHrzu6T9ACSE275OIIClD+eLr
         E8hnJ3Lr+ED//Cv50BuNt86zUxxJoCh6qsfLFL1mJ8Hva8NaFaD7+74sBDOCqH85P2yM
         r+SwUTfx5POQnsAPf1MJdAg2GXmKyyEFs7oa8kl5eeEsbteTcb2UyB4wGpehlGJIzGZH
         6SZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hU/FgGBsebJlFogRMbkXNuemW0TgNj/jaWAjVEWA9wo=;
        b=svWEU67+lyHcWVHjGcwBjOVzBQn04Wixz+GFg6ddFf3wF07wkjBvBLjJDQndVvT/Fg
         hNlgfpL4cBAgldJzOStJezckmKyiPAkN+wJrx+iBl6Wny9T2/RYHCyz3fp+++5icuQ4L
         4OXXmLF/humkiIYr7f+a6uT+v6UKae2RBg8SZQygYXgnj/Y5XoQYA3KCsznkx7WxaDqu
         Lvc7c0g4D2n8y4QkPlTh9eVdTvi0ft+Ri2Jdd9xQNehd+VznwXxp4O69ePh53MI/D1ly
         v8oJFemq+xLd7AJbk+932VmfcWKCnbGq7Iwz/aMLdOsEaQhJwVxFhqmguJ19An6ad3WU
         M5dA==
X-Gm-Message-State: ACrzQf3T9D0B3l8n9qdSwyivtctRqdwHY3nunsaIr7KU2BDv59sWJicr
	Y9UAO9lPBWCDrkaGLjj9vRLmUgO2x4VXqjaOMnPta9DYZs3VsA==
X-Google-Smtp-Source: AMsMyM6rrpzdiz3sWGhEqjJCPdAb2DrR7V2kHRm1ITRwJIXtvN8qsnP/Opt0GfVxn9Vobe7Q4KQa8HE62t3M+N2WBO0=
X-Received: by 2002:a05:6402:4029:b0:45b:d50c:b9b0 with SMTP id
 d41-20020a056402402900b0045bd50cb9b0mr19189847eda.126.1666387195643; Fri, 21
 Oct 2022 14:19:55 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Oct 2022 23:19:44 +0200
Message-ID: <CACRpkdaXmmZWsGdTG5tqNragkoefcTeUHjR+ZwNyNaa0S7s-7Q@mail.gmail.com>
Subject: [GIT PULL] Ux500 DTS changes for v6.2
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC folks,

here are som DTS updates for the UX500 for the v6.2 kernel.

Please pull it in!

Yours,
Linus Walleij


The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-dts-for-v6.2

for you to fetch changes up to 1e15c02cf8c8085d0e6e548bfa2ee0b2f6231221:

  ARM: dts: ux500: Add GPS to the Kyle (2022-10-17 15:05:52 +0200)

----------------------------------------------------------------
Some Ux500 DTS updates for v6.2:

- Some cleanups from Krzysztof for the SPI nodes.

- Fix up the NFC chip in Janice.

- Drop a bogus power domain regulator that isn't used for
  the crypto blocks. (We use proper power domains now.)

- Add GPS to the Kyle.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: ste: ux500: align SPI node name with dtschema

Linus Walleij (3):
      ARM: dts: ux500: Fix up the Janice NFC chip
      ARM: dts: DBx500 cryp and hash uses power domain
      ARM: dts: ux500: Add GPS to the Kyle

 arch/arm/boot/dts/ste-dbx5x0.dtsi                  |  6 ++---
 arch/arm/boot/dts/ste-ux500-samsung-codina-tmo.dts |  2 +-
 arch/arm/boot/dts/ste-ux500-samsung-codina.dts     |  2 +-
 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts     |  2 +-
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts     | 16 +++++++-----
 arch/arm/boot/dts/ste-ux500-samsung-kyle.dts       | 29 ++++++++++++++++++++++
 6 files changed, 44 insertions(+), 13 deletions(-)
