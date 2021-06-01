Return-Path: <SRS0=OMTs=K3=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E58C4708F
	for <soc@archiver.kernel.org>; Tue,  1 Jun 2021 09:45:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6C9BE6136E; Tue,  1 Jun 2021 09:45:09 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46618611CA
	for <soc@kernel.org>; Tue,  1 Jun 2021 09:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46618611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lj1-f182.google.com with SMTP id a4so18354318ljd.5
        for <soc@kernel.org>; Tue, 01 Jun 2021 02:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=aeflruk+sBPtid1nZ+1lhuvBercg4I32ZO4v88/nF8c=;
        b=Tphttdqa9t8ioVNoOxOHTnwIbLZl2Lp6AjZE6/5XNd6o3KzSDvCR3jnSCIUy8qn++t
         49lBZaJwej9Nlx2/q8JeWhxfAWDhyXIhRqSEensBJu4ZT2Pu+Ifxa6nTQaHq1MGg+4Z4
         3cD7oU5zU1PnSDoMOB0fM+ioxejhYgs01uPbvudsb9RqXHNORb27uhri8vTJmIa0hdoB
         bwbwvpmDOStQ97BRRc6dv9gxmPA873yrzhcsSqHWA2lIFG65s6Io5jNgeTQYIxFGNp0p
         oMnFkw9/OrtQ9g4hgxy3b+IL6uPg9PTrKId3h5mqP6rcmf7jj4rVvrrSPzmd14HBKd/b
         169Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=aeflruk+sBPtid1nZ+1lhuvBercg4I32ZO4v88/nF8c=;
        b=Q2CMxFK0pD9gzhqdu/6q5s/jL9pD839yZAjL9JPlMuZWYLlBcf8d9VrWUp4drzOu+l
         ncYxc8s97AVdboqwbdze2IFYQR5J3yAwrwYol3uxczhPV1ZI1i9fJhpmP/Gq4JdbDeDG
         gNqgg2wqg36buzvXiW/F66NE9xGAVE02Z8yl9TmxRIjLgTjj2b+Esj/WW0/tJowdLyLL
         wPqakfLxJR8lth7F28VdLI9W6pxQXNdF/uhMtxGqsX8/mzbNDymFtERVBom+liB5e0vd
         oGxMDDYDfI0UDu3wsoQzpDHIkkiY5Wwd7hEMwPu17Hw+pVUX8UIKoPeUHTOIjmAVPjRX
         biNw==
X-Gm-Message-State: AOAM530NHGKKxewGQ+qQ4VQwkeZFrcy8t83b8sOXPrmNx1SZnUju6rzm
	ixqnNK+Pa0AiJv8f2oFewRWtzGTmN0S2kj4ZPdcTbISkSIdOEw==
X-Google-Smtp-Source: ABdhPJyBAXPovaFjjvNjV8Cqp8bblZqefwz5Z228geICib+pi7jwwdwLdYYtkfB7LWgysLJ5u4QE8fvYVttggP6SXyU=
X-Received: by 2002:a05:651c:4c6:: with SMTP id e6mr20666608lji.326.1622540707519;
 Tue, 01 Jun 2021 02:45:07 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Jun 2021 11:44:56 +0200
Message-ID: <CACRpkdZWpLAcAStq8dEyGL_d9Bvp-WNPu-2EuJw1eTL4kyvgig@mail.gmail.com>
Subject: [GIT PULL] Gemini DTS updates for v5.14
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Corentin Labbe <clabbe@baylibre.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>
Content-Type: text/plain; charset="UTF-8"

Hi SoC maintainers,

here are some collected DTS-patches for Gemini destined
for the v5.14 kernel.

Corentin is working on some more really interesting stuff:
crypto acceleration and two new boards. If this gets finished
in time for v5.14 I will simply send another pull request on
top of this one.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/gemini-dts-v5.14-1

for you to fetch changes up to 78924664af92fabc203a946eac09c69592fa12c4:

  ARM: dts: gemini: remove xxx-cells from display (2021-05-22 01:54:05 +0200)

----------------------------------------------------------------
Gemini device tree updates for the v5.14 kernel:
- MAINTAINERS fix for the DTS files
- Drop a duplicate ethernet node on the RUT1xx DTS
- Add device_type to the PCI node
- Fix up some DTS syntax so it agrees with the schemas merged
  for the v5.14 merge window

----------------------------------------------------------------
Corentin Labbe (10):
      MAINTAINERS: gemini: add missing dts pattern
      ARM: dts: gemini: rename mdio to the right name
      ARM: dts: gemini-rut1xx: remove duplicate ethernet node
      ARM: dts: gemini: add device_type on pci
      ARM: dts: gemini: use the right rtc compatible
      ARM: dts: gemini: convert obsolete SPI properties
      ARM: dts: gemini-dlink-dns-313: rename gpio-i2c to i2c
      ARM: dts: gemini-dlink-dir-685: rename gpio-i2c to i2c
      ARM: dts: gemini-dlink-dir-685: Remove address from display port
      ARM: dts: gemini: remove xxx-cells from display

 MAINTAINERS                                |  1 +
 arch/arm/boot/dts/gemini-dlink-dir-685.dts | 11 +++++------
 arch/arm/boot/dts/gemini-dlink-dns-313.dts |  4 ++--
 arch/arm/boot/dts/gemini-nas4220b.dts      |  2 +-
 arch/arm/boot/dts/gemini-rut1xx.dts        | 14 +-------------
 arch/arm/boot/dts/gemini-sl93512r.dts      |  6 +++---
 arch/arm/boot/dts/gemini-sq201.dts         |  6 +++---
 arch/arm/boot/dts/gemini-wbd111.dts        |  2 +-
 arch/arm/boot/dts/gemini-wbd222.dts        |  2 +-
 arch/arm/boot/dts/gemini.dtsi              |  5 ++---
 10 files changed, 20 insertions(+), 33 deletions(-)
