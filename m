Return-Path: <SRS0=QZMW=Y6=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63C2ECAAA3
	for <soc@archiver.kernel.org>; Fri, 26 Aug 2022 12:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A099CC433C1; Fri, 26 Aug 2022 12:32:31 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A379FC433D6
	for <soc@kernel.org>; Fri, 26 Aug 2022 12:32:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A379FC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id og21so2911726ejc.2
        for <soc@kernel.org>; Fri, 26 Aug 2022 05:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=kkWWxdtCrpBCdAXB6fNbfKbE/E3PjloMm9wt/+MWh8w=;
        b=ogYKJNM6NCov3ghMkSS/0l1jVVbEMdwmAbu8jx+lnZFVfvZilS/cRptUO01FYnZTW+
         qYWz7FszaMdN4zHlk+hjNvki+SXbDYERscV0fmlYOS1rXjRcnmtb5MmelQBGsx3duMOI
         gTxJUU1q6cxSemvxENSYQmxcDAz95p12f3ucIrD6R7puC15jyBhJ5YiulhWwcW+Og8zQ
         +5vwiwqNDZBRCedR51c45fpG2KJucHVnY0J/zzrnVz9D0pbjiZ+MrRh4d3TZddoF+uzv
         V+PNQMRK9YVYCsGHL6Z6OG/1tIKy+D0ZjCMnJZTO87a6o6kfnr3GFpG55tx3pVPSAGU4
         v0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=kkWWxdtCrpBCdAXB6fNbfKbE/E3PjloMm9wt/+MWh8w=;
        b=2a2prQQHfefE8R7V882vBTqXIYCC+Q3qrzZ07ozOsB4xVDUXPW/QcWpTwBjJZ3fq9f
         P9/2piQgnRdd7T47JB2sbxDQMY6ciiBlrC4mw4QI2dARC8do5ZLjTascL+nGCYZGJekW
         ug0lVKBexY3ZQOZWAAu6eXXRQ0+vKrnpMgoaCIepF6Wzjavyb9T56Vz4jj/kIRRIig0+
         QANplaOVXUlDz+JOAG7LyYhLGttQ+DqIsVauZMsWcpfgsLZObkBn+LxY6LC4X57TBV2o
         Z5x5INjHwfxHjym6kbqznE1KdUJnPbnBOftIgQ8T8P8z008Q8wrYfE1f3t9/oMshlO0R
         uNsA==
X-Gm-Message-State: ACgBeo1aPDKOm42BDz5XirFu9zk7i7H6SJgpcmKEZu1dFjpBPeBImIbZ
	rb9D/xKjn6CtukF9m0fNsmbkDv9RQz6GvBgCuHSDpQM+Xdp+lQ==
X-Google-Smtp-Source: AA6agR628SissAnLKZXibpHvj+PxpUEWrtFu45n0XNbYp/ZTFMfRdi1R6bYdCOxEY1EAPXVGPJ7/gO/pRmGw7En8flE=
X-Received: by 2002:a17:906:9b86:b0:73d:72cf:72af with SMTP id
 dd6-20020a1709069b8600b0073d72cf72afmr5469279ejc.440.1661517148761; Fri, 26
 Aug 2022 05:32:28 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Aug 2022 14:32:17 +0200
Message-ID: <CACRpkdZt58ExwG+6EicODLhuVc8NSgCGUj4uNQmtnES8Cnf5uQ@mail.gmail.com>
Subject: [GIT PULL] Some Gemini DTS updates for v6.1
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Hans Ulli Kroll <ulli.kroll@googlemail.com>
Content-Type: text/plain; charset="UTF-8"

Hi SoC folks,

here are some minor Gemini DTS updates that should be queued
up for v6.1, details in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/gemini-dts-v6.1-1

for you to fetch changes up to f485f6d852696d4cd9a2cc1c8e3dd8dba75a3e17:

  ARM: dts: Let Gemini NS2502 parse redboot partitions (2022-08-26
13:38:35 +0200)

----------------------------------------------------------------
Gemini DTS updates for kernel v6.1:

- Enable Gigabit ethernet on SSI1328 and NS2502
- Modify NS2502 us use RedBoot partition parsing

----------------------------------------------------------------
Corentin Labbe (2):
      ARM: dts: gemini: ns2502: permit to use gigabit
      ARM: dts: gemini: ssi1328: permit to use gigabit

Linus Walleij (1):
      ARM: dts: Let Gemini NS2502 parse redboot partitions

 arch/arm/boot/dts/gemini-ns2502.dts  | 33 ++++-----------------------------
 arch/arm/boot/dts/gemini-ssi1328.dts |  4 ----
 2 files changed, 4 insertions(+), 33 deletions(-)
