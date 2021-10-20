Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC50C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 00:52:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38A4460EC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 00:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38A4460EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F9sPdMgvlMPja51oshe2DNHnv2J8XiXSiNj/bd0RvH0=; b=0WJZ5iCJNfqIsQ
	AGG2TtY8c23/qtHtZbca41DTKsuX/p+xUzC04SCyy1bJCziYHm4Wk72XJeb0uD8wrrKHjsW+bTQHg
	5UjYsBSiNGiK+dlPKoYOH4URkEGQSuTqUJUNMKicuKAk+asNkMXlIOr4lsasW1WbgERmhlnELlAAu
	GhkS0pPpQTQpXjoCpJ58zAebbAhF43WqrY1eL9PH9VAwLEn59bX8mWgOh86DArv9yCfdv5KClYJk4
	1A3wNA+sfe5ZNCcJXqTfgzPMt07AcWvaHhiU+DEGIuUmQhtPnmTxwozDtOmFo4MFK/PloR0aPQqox
	haVFhzypRSHP2AzdCL3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mczoO-0035WM-Bf; Wed, 20 Oct 2021 00:50:32 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mczoK-0035Vt-4i
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 00:50:29 +0000
Received: by mail-lf1-x12b.google.com with SMTP id n8so11320054lfk.6
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 19 Oct 2021 17:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
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
 b=AdrSkBe907sBxwAMlt2YdkiPew7odwrSHp3CbZLJUZY3dnaOLGwk9tqQb5jwZRVzA8
 L7aqSS539op3xOARtnAZlS4PfBY15fLsPAzR/7Gia8oUclHLzwZHyxxRNjRhuDkxtUAZ
 /PPZXVDeW2ZcVC1Skpk6Gp5qrXY06N2h/UXkz9Bw1szg8PlZmMd8D/ZIh8Ie8Ig3YpTo
 iLXOO4ZZphUfrAYig6cDnE/cLQPoLEd3mzHIrPnTVmM2T3YWCdXol1z/OhyZCP3I6grC
 xFlQDrFoz/CNj/vu+Zs7P54jDFm+6nRMnRgnOQjFJPvkFkJgbDJh1h1si/bEaeH9doqF
 3biA==
X-Gm-Message-State: AOAM533SFegJxrmT/j8VgDP1E4Zo3I4G3VSZq+NqBDetKlv51KYZbHOc
 fBFlQuaWt9Ifa8walaMr5X5HLvC9+b6QpQBKk9rm5jpGKYs=
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_175028_213669_7586AF26 
X-CRM114-Status: GOOD (  10.43  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211020005014.XPjDZnYVcdkPPBcphQHwcC87e3jpoeSLRarVHobCqDM@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
