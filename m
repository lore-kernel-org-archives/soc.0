Return-Path: <SRS0=Lymt=FE=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D3EC5519F
	for <soc@archiver.kernel.org>; Mon, 30 Nov 2020 06:30:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5D903206CA; Mon, 30 Nov 2020 06:30:59 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A1BB20644;
	Mon, 30 Nov 2020 06:30:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="nMiIsMha"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A1BB20644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=joel.stan@gmail.com
Received: by mail-qv1-f41.google.com with SMTP id cv2so5089166qvb.9;
        Sun, 29 Nov 2020 22:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=SkKhQ5M+XjsMOdIyTo4RQMaCEvjK4oB1kdXFcYS/kQA=;
        b=nMiIsMha3UxRAI8vZLScX2bDFT3T4OijJ5bou1n/fEOjUWFYwuS3QnCubsI7It8zaH
         KaGxl/BJ12F2zIBH7MjB/b2ma3DAe1p8rTUmKL8LM1c2UA6SuhToH+hWU+UkcWC9uikN
         Mdz3mQOboxM9l1ANSqEMpMW/QhFM4wiYZk0ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=SkKhQ5M+XjsMOdIyTo4RQMaCEvjK4oB1kdXFcYS/kQA=;
        b=dPNvRATy30QBjhtGutFhFN3uferCcqu9+VCmi9LCClLTutKhC4Nf5VCrzCjt5shB2G
         knqpcdXB9XhC5rvIY8l4QHetBGVyPt67oxZEUBVNWnmRzgzBxeXJlPpnib/gfDOF4Lhs
         tu8L60dnrBumxglKJW7cpMS2Ax0vv4N5R2TeYMEQQihvPVXgG5L+6edD/y8X2ES0P2xO
         auibuIysxti4C6skE/vgz0o0/fH8XwBZZ45/ex/Er0J/JZcFkXbZjBhpFt5tHzAEcD/o
         L4FfgDkF2G819Yrl5qRKvj1MjAnAW6oZsp3m3Ilp/pYklm8XySBsD+nrcX3kVB4vq4WO
         3LYw==
X-Gm-Message-State: AOAM532i85jgb4KfRrl7AE9vUi/ma21PDKEMz4YBsYHAmz/RdNd+p9Nk
	Mks5GDrP1naMWnUMkkCFCVA7WqpsvjZxgoW3ssGuR+AbXbnq1g==
X-Google-Smtp-Source: ABdhPJxqT90NVWY+61RTtkBQ23jQdz+Ls+bu8p2zWyPN3Hhm8Lr/ml00x02T4KEFdUzhoqaueZVNmK39TWk+PZth4FQ=
X-Received: by 2002:ad4:5687:: with SMTP id bc7mr4544845qvb.61.1606717855656;
 Sun, 29 Nov 2020 22:30:55 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 30 Nov 2020 06:30:44 +0000
Message-ID: <CACPK8Xfd7AmuEaUdFfYLu4ktcrpTnYUgwQSxUbC-McB02hvo_g@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: soc changes for 5.11
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, Andrew Jeffery <andrew@aj.id.au>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"

Hello Soc maintainers,

Here are some ASPEED changes for the 5.11 merge window.

The following changes since commit 2ba56f464f0c1a7264160f8675063b3df92e7966:

  ARM: dts: aspeed: ast2600evb: Add MAC0 (2020-11-19 22:31:18 +1030)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.11-devicetree

for you to fetch changes up to 2ba56f464f0c1a7264160f8675063b3df92e7966:

  ARM: dts: aspeed: ast2600evb: Add MAC0 (2020-11-19 22:31:18 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 5.11

 - New machines

   * Bytedance G220A, an AST2500 BMC for an x86 server
   * Facebook Galaxy100, an AST2400 BMC for a network switch
   * IBM Rainier 4U, an AST2600 BMC for a PowerPC server

 - Reworking of Facebook device trees to use common dtsi

 - A 64MB flash layout used by the G220A

 - Misc updates to tiogapass, ethanolx, s2600wf, tacoma and rainier

----------------------------------------------------------------
Andrew Jeffery (4):
      ARM: dts: tacoma: Fix node vs reg mismatch for flash memory
      ARM: dts: rainier: Add reserved memory for ramoops
      ARM: dts: tacoma: Add reserved memory for ramoops
      ARM: dts: aspeed: rainier: Don't shout addresses

Billy Tsai (1):
      ARM: dts: aspeed-g6: Fix the GPIO memory size

Eddie James (2):
      ARM: dts: aspeed: rainier: Add 4U device-tree
      ARM: dts: aspeed: rainier: Mark FSI SPI controllers as restricted

George Liu (1):
      ARM: dts: Fix label address for 64MiB OpenBMC flash layout

Joel Stanley (2):
      ARM: dts: aspeed: s2600wf: Fix VGA memory region location
      ARM: dts: aspeed: ast2600evb: Add MAC0

John Wang (2):
      ARM: dts: Add 64MiB OpenBMC flash layout
      ARM: dts: aspeed: g220a: Add some gpios

Konstantin Aladyshev (4):
      ARM: dts: aspeed: amd-ethanolx: Update KCS nodes to use v2 binding
      ARM: dts: aspeed: amd-ethanolx: Enable KCS channel 3
      ARM: dts: aspeed: amd-ethanolx: Enable devices for the iKVM functionality
      ARM: dts: aspeed: amd-ethanolx: Add GPIO line names

Lotus Xu (1):
      ARM: dts: aspeed: Add Bytedance g220a BMC machine

Paul Fertser (1):
      arm: dts: aspeed: tiogapass: Enable second MAC

Tao Ren (6):
      ARM: dts: aspeed: Common dtsi for Facebook AST2400 Network BMCs
      ARM: dts: aspeed: wedge40: Use common dtsi
      ARM: dts: aspeed: wedge100: Use common dtsi
      ARM: dts: aspeed: Add Facebook Galaxy100 (AST2400) BMC
      ARM: dts: aspeed: wedge400: Fix FMC flash0 layout
      ARM: dts: aspeed: minipack: Fixup I2C tree

Vijay Khemka (1):
      ARM: dts: aspeed: tiogapass: Remove vuart
