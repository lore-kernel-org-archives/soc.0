Return-Path: <SRS0=DOHa=XK=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 186F2C433EF
	for <soc@archiver.kernel.org>; Tue,  5 Jul 2022 22:35:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CCA5FC341C8; Tue,  5 Jul 2022 22:35:06 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD6A8C341C7
	for <soc@kernel.org>; Tue,  5 Jul 2022 22:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CD6A8C341C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f172.google.com with SMTP id b85so11155879yba.8
        for <soc@kernel.org>; Tue, 05 Jul 2022 15:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=0oUc6UryO3MlCoX9PHI6EF+0ZOChS6DeTopeX0hT47I=;
        b=Opa0cU7So+w+OmRoT8YtvAPBwxvKJEihVg9StfsCY7C9/jsC/p1Dzt8HJ/fM3Lpmn7
         z7Xwex8006nv0wxs/hnIVaDqaTlgPpV/4JaVBxxUXqnCpS3UsM5ebtFj0UOZaB9WRG4d
         dTsNN8MUQ6T4fELl26VRY5lKHYu2h4hei2P/4MsdfRVlyoFB7ZZJbOZfc6E3d1znC/6r
         J/P0LRFfSbjPvFUEJV2rVuCg5D5rSnMLk7mysHW0ft/vk9d1ETUkaqfv1nAx/pP6pSFL
         p+CZc2QwEY1KyDh5DktI3h4+oylQ+0LMa0nkkIVB1EdkFZ7HlmvqntiV1+4msCRRVoul
         25ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=0oUc6UryO3MlCoX9PHI6EF+0ZOChS6DeTopeX0hT47I=;
        b=73MRQvBN4uSPJa3AMyx1MN9r4VE6nYNRxnsLXSOWG5qa/IZOb9xVlC0U80Y9tvSq+a
         8YffEzuK3c7Yc7yAGieFza031yc5GHZI2YXPI1cWEP3D1QzwNt8qVRrJ+aU8sIGOxKQ1
         LsKcMl3p4a/eDmStlATW1Bn0y3NWMuFFNyzr+4j+jqnLMo2mlRhUO1xKEV++mONfVaqD
         Hd8Vi1dnQyYwkkOcRVxA7e2OJ0yFHv2yaIc12ZtMSkW89jHFL0OWaufh6Hq2edk89EEF
         ivBaOaaIrgPntE8RJYku7q4TzB/5LOsD7r2m6hrJEA1Mv1F0NZlJgrAY0ixCHQ2yaORM
         SGrw==
X-Gm-Message-State: AJIora+ST830QRE+6UnblewA/rj+5CYqf7o32vAy1w/XAY1hbA2Y8s+I
	12PNnPPDB2Dbf0udVh/o3yKw9Banf2/LqCKaYi5k114hkik1jA==
X-Google-Smtp-Source: AGRyM1s8op/j+czvW2WOjB3IW3X2VIerfWYF+FkPu8fJ03Z/Kwe1XxQlc+k7uQxM6rczTgKgn7ySulBBJvu37I+Mkt8=
X-Received: by 2002:a05:6902:1184:b0:66e:756d:3baa with SMTP id
 m4-20020a056902118400b0066e756d3baamr5513928ybu.533.1657060504656; Tue, 05
 Jul 2022 15:35:04 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 6 Jul 2022 00:34:53 +0200
Message-ID: <CACRpkdY1MG=HG+tOCmD1_LEAStV1-ycCLkwShMRD4R=4jGDYHQ@mail.gmail.com>
Subject: [GIT PULL] Ux500 DTS updates for v5.20
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC maintainers,

here are some minor Ux500 DTS updates for v5.20. Details in the
signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-dts-v5.20

for you to fetch changes up to c6aaccf1c906fd9539b738a59f53dda603c99b2e:

  ARM: dts: ux500: Drop unused i2c power domain supply (2022-07-05
01:07:29 +0200)

----------------------------------------------------------------
Ux500 DTS updates for the v5.20 kernel:

- Fix orientation matrices on a few U8500 mobile phones.

- Drop unused i2c power supply handled by the power domain.

----------------------------------------------------------------
Linus Walleij (4):
      ARM: dts: ux500: Fix Janice accelerometer mounting matrix
      ARM: dts: ux500: Fix Codina accelerometer mounting matrix
      ARM: dts: ux500: Fix Gavini accelerometer mounting matrix
      ARM: dts: ux500: Drop unused i2c power domain supply

 arch/arm/boot/dts/ste-dbx5x0.dtsi              | 5 -----
 arch/arm/boot/dts/ste-ux500-samsung-codina.dts | 4 ++--
 arch/arm/boot/dts/ste-ux500-samsung-gavini.dts | 4 ++--
 arch/arm/boot/dts/ste-ux500-samsung-janice.dts | 4 ++--
 4 files changed, 6 insertions(+), 11 deletions(-)
