Return-Path: <SRS0=JsAi=E5=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E11DCC56202
	for <soc@archiver.kernel.org>; Mon, 23 Nov 2020 14:54:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A917C20658; Mon, 23 Nov 2020 14:54:08 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1729020773
	for <soc@kernel.org>; Mon, 23 Nov 2020 14:54:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U5hr8MQn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1729020773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lf1-f65.google.com with SMTP id l11so24196681lfg.0
        for <soc@kernel.org>; Mon, 23 Nov 2020 06:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=7YSHXXDe2F2P0TwtPFMPAjfiKJylj/0yhpHvRnXTUQs=;
        b=U5hr8MQnNH1kAeZCLlOSDCxEsQkeCYcB1qwpE9NzhFn5xqYpcjD5qnBbeJolaOmHeR
         xEGmm59hevz9Q42zc/r5g8Tj9dMGn4/LzryLqNBWT4fWlUghfcwktkIn46XmYzycIUqD
         +yPM+J0sRlb+az+FmRvECZFq2bcEkn66n5dPsm/QjnrM05nddyn9+e/USDZIL3p9p99K
         MmTaVxNAru9f/FwkyYfD6VKsM0DB2jjwDm2aOtWX6hWMdbXjhO0tFa7jo4bD8mcdqZW0
         ufRy/z6tMnvm2oQOh+FhU7TYAmBPoZzRhYVmUjk270N+MPs1XFjMNdm5pzu9pdOaw/iO
         RNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=7YSHXXDe2F2P0TwtPFMPAjfiKJylj/0yhpHvRnXTUQs=;
        b=RI93sP6ZNOldSJEfMqabM42Y7ClN/0UV1OCVZLkVWKaTQ613NaIkg5WgwqEMe6CLG1
         dlesZVAUGDHWm8KuIEW4iKc6pFDNLIf8rEcNo6ZMcpiJ+eMYk7b5AH6FKy4LM7+Qijoh
         lHKtUwMM5Pu81p3ccZOSKKtmYssIsNw9qDVbzE3QM9lqg9JTsuDeC81MCcfa9r0NYbXF
         ZGft1ZfeL9S8DWelbAoIJCdryyo471f1b7evWDIWmtSgPfeq45fuNCkH0TjPjlBiXVhi
         +2+/gNAiNiW2K6X42CcAj9J/sY8WUHWgz5oxs0ameQLNwHH4H886umIgEduYgIuOXO+Z
         QOXg==
X-Gm-Message-State: AOAM531hw9w89JyKQTm0yI+Dw4ow6oRNfk83B0taW3vTpc1s2HWQBxXO
	qcROpfD7oMtpPqBtPvF40weifta5WB3pOi415dHXPOTjRd48BxWA
X-Google-Smtp-Source: ABdhPJwTKDiYMNDeIJgBKKOjawBMqtNzCwY4G0Doxz58mG7r5FZThg/pWlKtStqPrfSgRbtkeV9zEjfFhI7GQB5d7KQ=
X-Received: by 2002:a19:5f11:: with SMTP id t17mr1765535lfb.572.1606143245774;
 Mon, 23 Nov 2020 06:54:05 -0800 (PST)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 23 Nov 2020 15:53:55 +0100
Message-ID: <CACRpkdY_M4xj++QhRPqX6N3x9YmFNJkz70DnvBj7Ai-dOtCJSQ@mail.gmail.com>
Subject: [GIT PULL] Ux500 DTS updates for the v5.11 kernel
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC tree folks,

here are some Ux500 DTS updates for the v5.11 kernel
cycle. Details in the signed tag!

Yours,
Linus Walleij

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-stericsson.git
tags/ux500-dts-for-v5.11-1

for you to fetch changes up to ef5704b535194fb98ee1ceb00f6952e2f01e39a6:

  ARM: dts: ux500-golden: Add proper supplies to touchscreen
(2020-11-23 15:36:17 +0100)

----------------------------------------------------------------
Ux500 DTS updates for the v5.11 kernels:

- Rename the DSI controllers to match the preferred
  schema.
- Pull down the SDI2 feedback clock on the Skomer.
- Add proper supplies to the MaxToch touchscreen on
  the Golden.

----------------------------------------------------------------
Linus Walleij (3):
      ARM: dts: ux500: Rename DSI controller nodes
      ARM: dts: ux500: skomer: Pull down SDI2 FBCLK
      ARM: dts: ux500-golden: Add proper supplies to touchscreen

 arch/arm/boot/dts/ste-ab8500.dtsi              |  6 +++---
 arch/arm/boot/dts/ste-ab8505.dtsi              |  6 +++---
 arch/arm/boot/dts/ste-dbx5x0.dtsi              |  6 +++---
 arch/arm/boot/dts/ste-href-stuib.dtsi          |  2 +-
 arch/arm/boot/dts/ste-href-tvk1281618-r2.dtsi  |  2 +-
 arch/arm/boot/dts/ste-href-tvk1281618-r3.dtsi  |  2 +-
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts |  9 ++++++---
 arch/arm/boot/dts/ste-ux500-samsung-skomer.dts | 12 +++++++++++-
 8 files changed, 29 insertions(+), 16 deletions(-)
