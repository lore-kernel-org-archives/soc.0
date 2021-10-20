Return-Path: <SRS0=5ZCx=PI=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF6BFC433F5
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 00:50:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C2A8060F25; Wed, 20 Oct 2021 00:50:27 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F98F610FC
	for <soc@kernel.org>; Wed, 20 Oct 2021 00:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F98F610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id x27so11282117lfa.9
        for <soc@kernel.org>; Tue, 19 Oct 2021 17:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=PnmiyFrV6tTQdn0FqndBJLJnsTsmuUo4OL/Ej3Z78mw=;
        b=sYSb25MoMilYnMjN1I1resKc4hqes94VjbUXsZqfbrGoDC67PqsE7+FifnZkghvoQO
         Rrj4/ri0QwAbtdaBdcE/NCM0cr/7F5q/Sw5+5Rhl9jM2Qm9bQRmJy00l5G6M3jrt+b8N
         qQBsRlOp66PeJtAp510t7QMbQU/wDz7nuHLHWXJDRpsvQ9KYASnkTxDJQk6CGEg/oa5b
         HNbe3CecY82CnXgDyDyJyhQeW+UaAxuu1ghwxYfyOMsBTKpFTXlMwREmpTUjocW9SVp6
         15DuPJYFKF7FBZ1l0U1mdMw+veTEECa/QSbNpM5YDc5tFIKE9CkclJB8ZyFWyPE2m2ZF
         F7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=PnmiyFrV6tTQdn0FqndBJLJnsTsmuUo4OL/Ej3Z78mw=;
        b=a4N6CE53Bw5I8CbATogGjTH0npn049gUzyrpORYfSKnR6edZrg0YQiDp8qUr9oactQ
         qVrkYevAXOxvHIvx9xhvFaFryU2ZrHFl+tj+OK8wHrGT3L9feluy8oj5pSIntzxocxgT
         gmzKQht89s4IgFfTUiESZHVOZwf1lq+JRbNDkhh5/LkpTfPLBcrapm8OaT+RAcgCKH5R
         4y1Pd5y/nt5t/BL/ehxPe2QRadKOffrVwSKuwcDHYP9UV0oIk3ueFKVa+trDxLtyRtmY
         1V8L+VdUb4MUgcEio3HGSXjGN57UNINkXcm2gwtYj1xr0xXGLPUXBLQ05P27zby/2pT/
         UGBw==
X-Gm-Message-State: AOAM533yaZ8vVMDLJWjs30hQ4GEOIxYAiPDYTLc77wb7JiADfiXSFqxZ
	oV7jbTVfkfyXORFWkHUH/IpIgIrNJBVoVhE+LqOHiLfTGMg=
X-Google-Smtp-Source: ABdhPJyd3TspkSnyHPtQCSdFmX+verr6T/AxsyPwN9H83xVltV5C1zhLszVHIF77Oq9wCDV53PnPC0STr5cEeGBxRHE=
X-Received: by 2002:a19:c10a:: with SMTP id r10mr8816275lff.95.1634691025719;
 Tue, 19 Oct 2021 17:50:25 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Oct 2021 02:50:14 +0200
Message-ID: <CACRpkdac5Sbt42CtuLMgCazfHdhcP98mEKGjeZ-DVcb=_N90Bg@mail.gmail.com>
Subject: [GIT PULL] Gemini DTS changes for v5.16
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Corentin Labbe <clabbe@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

Hi SoC maintainers,

these are some DTS changes for the Gemini platform for
v5.16.

Sorry for being late. Details in the signed tag.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/gemini-dts-for-v5.16

for you to fetch changes up to 07a6602bdc79fa08df8eb9669ebee66a3d36571c:

  ARM: dts: gemini: Consolidate PCI interrupt-map properties
(2021-10-20 02:41:51 +0200)

----------------------------------------------------------------
Gemini changes for the v5.16 kernel cycle:

- Add device trees for Edimax NS2502 and SSI 1328

- Consolidate PCI interrupts

----------------------------------------------------------------
Corentin Labbe (5):
      ARM: dts: gemini: add labels for USB, IDE, flash and ethernet
      dt-bindings: add vendor prefix for edimax
      dt-bindings: add vendor prefix for ssi
      ARM: gemini: add device tree for edimax NS2502
      ARM: gemini: add device tree for ssi1328

Rob Herring (1):
      ARM: dts: gemini: Consolidate PCI interrupt-map properties

 .../devicetree/bindings/vendor-prefixes.yaml       |   4 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/gemini-dlink-dir-685.dts         |  18 ---
 arch/arm/boot/dts/gemini-ns2502.dts                | 148 +++++++++++++++++++++
 arch/arm/boot/dts/gemini-sl93512r.dts              |  18 ---
 arch/arm/boot/dts/gemini-sq201.dts                 |  18 ---
 arch/arm/boot/dts/gemini-ssi1328.dts               | 138 +++++++++++++++++++
 arch/arm/boot/dts/gemini-wbd111.dts                |  18 ---
 arch/arm/boot/dts/gemini-wbd222.dts                |  18 ---
 arch/arm/boot/dts/gemini.dtsi                      |  33 ++++-
 10 files changed, 318 insertions(+), 97 deletions(-)
 create mode 100644 arch/arm/boot/dts/gemini-ns2502.dts
 create mode 100644 arch/arm/boot/dts/gemini-ssi1328.dts
