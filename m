Return-Path: <SRS0=8H8H=HM=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C759C433DB
	for <soc@archiver.kernel.org>; Wed, 10 Feb 2021 12:28:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5933064E40; Wed, 10 Feb 2021 12:28:38 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7DD364E3B;
	Wed, 10 Feb 2021 12:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7DD364E3B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=joel.stan@gmail.com
Received: by mail-qk1-f182.google.com with SMTP id s77so1383313qke.4;
        Wed, 10 Feb 2021 04:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=vI8LTqZNRbWKdjOBJGdCR1A9O42gwiRAlVy4aB+gjt0=;
        b=UWUHSPK2UgUR1Opbv/hP+s9OXD8+lmPO3KTBgt2KyxMCb5rUpC+M5kQXYKKTI6FpCu
         duv1gcgxmy042asbgJC4Adw4BNM86J4Qrqe0iF0rSPMrgZ8Y8u4uwz7WPl/ihBw5Wuiq
         VGaeK6v/PHrOZqy9raO2rEcAKY7kPqrPcaMFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=vI8LTqZNRbWKdjOBJGdCR1A9O42gwiRAlVy4aB+gjt0=;
        b=aMAEbUpyeTpmWUG8PIjAYntDGjMgKdpS6UVR6l748qzCpBia2Dc5r0NPUQvTcAFvfi
         WXRycr+SRR4w9ik//UAMO0qFzSyOfFXk265x0+yINH13CuwmYu/Z2PrwvE+Gw9m9SwU1
         DOoXDE8zy+wPUgwNVXcM3E/W4Fc8+USJ5suSjLSiqvsrUXhB6XgdekiqrQ1zZhHIXjc7
         U7M8xxep9ehIyu1Y9mAikG/nTk9ay6AGkUu9veOCcKCa/eznvRsQ+kPPyAh3Lnz4Cxl0
         4/in+YvGy9FHToVVvxZF9o081VHFU7/iYBIJnm4GV81lQf2R9KrAl666BRI1ScU3mGpd
         PHuw==
X-Gm-Message-State: AOAM530vb6+WNgscH8oXFQkx0NaQeAQjtLW9spKMi4WCKQG6Ok2Hptzr
	2Z2R7wyYs6dzSdNq4e5effZkkyPyTfgeykocp2FprT0heYGmaQ==
X-Google-Smtp-Source: ABdhPJxjIvSwIe2LcPNfvc5jPUF+6QlqW8H70/X76vGSIgNLwakHY/aQ7AyZjlqjYEgZjUXBB1iDcH472vf7tDszxzw=
X-Received: by 2002:a37:ac10:: with SMTP id e16mr2984793qkm.465.1612960115018;
 Wed, 10 Feb 2021 04:28:35 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 10 Feb 2021 12:28:23 +0000
Message-ID: <CACPK8XfQgGch5bK3YD0La+CE2L5DxVa1MNw6m1fc40j0w7e9Tw@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: devicetree changes for 5.12
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm <arm@kernel.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"

Hello Soc maintainers,

Here's my late pull request. I've deferred some LPC device tree
bindings rework that need a closer review, so the contents of this
pull request should be straightforward.

The following changes since commit a74c6525f12f35a5af529ff057e63cfdc461704c:

  ARM: dts: aspeed: ast2600evb: Add enable ehci and uhci (2021-02-10
21:21:36 +1030)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.12-devicetree

for you to fetch changes up to a74c6525f12f35a5af529ff057e63cfdc461704c:

  ARM: dts: aspeed: ast2600evb: Add enable ehci and uhci (2021-02-10
21:21:36 +1030)

----------------------------------------------------------------
ASPEED device tree updates for 5.12

 - New machines

  * Ampere Mt. Jade, an AST2500 BMC for an x86 server
  * IBM Everest, an AST2600 BMC for a Power10 server
  * Supermicro x11spi, an AST2500 BMC for an ARM server

 - AST2600 eMMC clock phase configuration

 - Proper clock support for LPC snoop

 - Misc updates to ethanolx, mowgli, ast2600evb, g220a, and rainier

----------------------------------------------------------------
Andrew Jeffery (1):
      ARM: dts: aspeed: rainier: Add eMMC clock phase compensation

Ben Pai (1):
      ARM: dts: aspeed: mowgli: Add i2c rtc device

Eddie James (1):
      ARM: dts: aspeed: Add Everest BMC machine

George Liu (2):
      ARM: dts: aspeed: inspur-fp5280g2: Add GPIO line names
      ARM: dts: aspeed: inspur-fp5280g2: Add ipsps1 driver

John Wang (2):
      ARM: dts: aspeed: Add LCLK to lpc-snoop
      ARM: dts: aspeed: g220a: Fix some gpio

Konstantin Aladyshev (1):
      ARM: dts: aspeed: amd-ethanolx: Enable secondary LPC snooping address

Lotus Xu (1):
      ARM: dts: aspeed: g220a: Enable ipmb

Quan Nguyen (1):
      ARM: dts: aspeed: Add device tree for Ampere's Mt. Jade BMC

Ryan Chen (1):
      ARM: dts: aspeed: ast2600evb: Add enable ehci and uhci

Ryan Sie (1):
      ARM: dts: aspeed: Add Supermicro x11spi BMC machine
