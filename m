Return-Path: <SRS0=hZ7m=K3=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA8BFC4708F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jun 2021 09:46:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66E88611CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jun 2021 09:46:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66E88611CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CW5v4328bKr5d9iKD2c1j8rjQ8Ig6v2FHWIf+Nk5my8=; b=J1nkFqd7N6aePE
	ZVnmysUfKqi4cE6Srt7m8owXJNqwTMxYwGCTVkJSbGSJMpfDAYIFLRPadx5ldWq4E4A9wXEHn0O1c
	jAQhoznl0w4NC9PLU2Bg6B9BoLdigTEUXPq+/ItfYk/hwe4kyPb02jktsaL4Hi/zm/I8VQovm/b/0
	Cympvc4lvmMjYutd3MsjQSbZUrK5s8urtZnhWEHpQZ8PzxWx7CT8Uhwn90Mqx6DxSSU6bdPSoWrO/
	RAh3uCJEhiFeO67Uh2kl5F3asWPFAFn275F5kzL0RpojO6pRwEyfIAT+j0wgF7QA4SkNDOQxcwFOa
	q78QC3v9yPllxuA87iyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo0xW-00Fi6S-4T; Tue, 01 Jun 2021 09:45:14 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo0xS-00Fi5a-9l
 for linux-arm-kernel@lists.infradead.org; Tue, 01 Jun 2021 09:45:11 +0000
Received: by mail-lj1-x22d.google.com with SMTP id t17so8655328ljk.7
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 01 Jun 2021 02:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
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
 b=F26XlfRWTZKJh6JvNpds0mbjXTr0ykqr7BiaPgN3EHgnChyrbyFbDDL7SXvGOdIl4L
 75vBmU9+RfqBjUwhtGJyrXUNgHKdp5FOAQM0hZolb42Tr5Mu/ASFuCMUMSKu8t0o72B/
 0zULVYQRal7v/mdvoW4/rhs3DwJFSwtR+TJBgKwsgJ+u/b66K8EiGz/k6W1wCrGsfvjg
 nUVqF6WMsIg7DmH8W8iG5pFmngB7XcXCdXvLYrbq90g8tNOxiKNCFLl6qBzaOmctwRLa
 Q2NNehjaWV9VkfHsynMlOCl1gxxT7woGXgK1qM1sWmZi1QPjeXm1mJnowTSrtr+K5tQp
 mAXA==
X-Gm-Message-State: AOAM531eK5bB8CzB1x6RgI67GfkV+7CSbT5NOa/Ult5LFBD1ps2EY8bv
 yWMXPhNb03pRB9jKuugIYhQiwi5P4awnCXlOCT3H0g==
X-Google-Smtp-Source: ABdhPJyBAXPovaFjjvNjV8Cqp8bblZqefwz5Z228geICib+pi7jwwdwLdYYtkfB7LWgysLJ5u4QE8fvYVttggP6SXyU=
X-Received: by 2002:a05:651c:4c6:: with SMTP id
 e6mr20666608lji.326.1622540707519; 
 Tue, 01 Jun 2021 02:45:07 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 1 Jun 2021 11:44:56 +0200
Message-ID: <CACRpkdZWpLAcAStq8dEyGL_d9Bvp-WNPu-2EuJw1eTL4kyvgig@mail.gmail.com>
Subject: [GIT PULL] Gemini DTS updates for v5.14
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Corentin Labbe <clabbe@baylibre.com>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_024510_403694_8F5D629D 
X-CRM114-Status: GOOD (  12.51  )
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
Message-ID: <20210601094456.iz6sW9IBuIt45A5Ekh_CJ1ypdMseaOThI6kwXwJMGP4@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
