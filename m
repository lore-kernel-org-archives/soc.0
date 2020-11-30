Return-Path: <SRS0=Lymt=FE=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E646FC5519F
	for <soc@archiver.kernel.org>; Mon, 30 Nov 2020 06:58:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 923F2206D8; Mon, 30 Nov 2020 06:58:13 +0000 (UTC)
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A044206CA;
	Mon, 30 Nov 2020 06:58:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="ITx8z2TB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A044206CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=joel.stan@gmail.com
Received: by mail-qv1-f65.google.com with SMTP id es6so5143577qvb.7;
        Sun, 29 Nov 2020 22:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=OV2/oCMRKb4iFtEJq0PMwC8rGdDQ0Cya4HMVyNhoQOs=;
        b=ITx8z2TBkTudcjpQRFd5Q0O2M/zqJwFfytqs8pB8uuuVwQUwx5qQzdUeSHHbOkqV1A
         3uOHgzddQeGPqHv16b3rnDUTZD2oHF0hY0FLgzX0DlFSPPrUAKHPf69ZteKRz7dj35LP
         YQ3GcbdIA6+htnbvhrLbEqyaM2XvMcQPN/npU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=OV2/oCMRKb4iFtEJq0PMwC8rGdDQ0Cya4HMVyNhoQOs=;
        b=uZh945JP4HPKhTdvdBT0oqk/kUgradD4kaeotRYUEVNvXWw2Zf+4lBPyJoaq0eMh9n
         wWEuDKpVZOCd0JrnDEgzAGKW7lAG33opXCA2q/2i5A/E5QAswpPGqdCseKl561Sj7boH
         ruradU+P422shJR80ZDoswPwogQlpoUzjjmeZ/IwDhXMWDs2fX8VpcSIzhPczaq86V+R
         MmQOzAlZ2JeGdBFat8OcUwaQYUrATOqHZuUhl+4iknfjwR/IXIcGY4kGl4u9daf3tQyR
         1aR/1VxJtn/ZWtgwFWBR+m0b8qTQxdHFfyGFrX/5DzW4evDSZEUkuJcBiNivu9+AWQV5
         KXYg==
X-Gm-Message-State: AOAM532BTSSVTaxzZqPnMxGHVQn5Rb3Iuw5IHyrI7O22PDtbJ+rjvEgm
	I/bn6U2FxOS0po5Xf3IiukrG130jnc9aWeKbdOgch+Jd1BDNlA==
X-Google-Smtp-Source: ABdhPJzwzgEZp/xZuvoDglE5Y+hJUs/74kEeYJOFe+ueGsTRYI/p2sD3JIZhf118YfvTI4f0QXP59Rf2pz8E0Jx05wo=
X-Received: by 2002:a0c:f4d0:: with SMTP id o16mr20134235qvm.43.1606719491031;
 Sun, 29 Nov 2020 22:58:11 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 30 Nov 2020 06:57:59 +0000
Message-ID: <CACPK8Xd8RaLv_p6t9ckBwCwtZww+2YYOAoAYQdvni0dxc2mS7A@mail.gmail.com>
Subject: [GIT PULL] ARM: nuvoton: devicetree changes for 5.11
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm <arm@kernel.org>, Tomer Maimon <tmaimon77@gmail.com>
Cc: Avi Fishman <avifishman70@gmail.com>, Benjamin Fair <benjaminfair@google.com>, 
	Nancy Yuen <yuenn@google.com>, Patrick Venture <venture@google.com>, 
	Tali Perry <tali.perry1@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hello Soc maintainers,

Here's a different one from me. A little while back during a
discussion about the OpenBMC ventor kernel tree, and how we could get
the Nuvoton patches upstream, Tomer asked if I could help prepare a
pull request.

Here it is! These patches have been sitting in the OpenBMC tree for
varying amounts of time, sometimes dating back to 2018. The Nuvoton
team is still working on upstreaming their drivers, so the device
trees are reduced versions that only describe hardware that is in the
mainline kernel.

If it looks okay to you then please pull. If not, let me know how you
want to proceed.

The following changes since commit 879e5b3f98bae035cf8e2f777cc3c64bde8d6d9b:

  dt-bindings: vendor-prefixes: Add FII (2020-11-30 17:14:05 +1030)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/nuvoton-5.11-devicetree

for you to fetch changes up to 879e5b3f98bae035cf8e2f777cc3c64bde8d6d9b:

  dt-bindings: vendor-prefixes: Add FII (2020-11-30 17:14:05 +1030)

----------------------------------------------------------------
Nuvoton device tree updates for 5.11

 - New machines

   * Fii Kudo, a NPCM730 BMC
   * Quanta GSJ, a NPCM750 BMC
   * Qanta Olympus RunBMC, a NPCM750 BMC

 - Updates to the common device trees and NCPM750 EVB

----------------------------------------------------------------
Fran Hsu (2):
      ARM: dts: nuvoton: Add Quanta GSJ BMC pinctrl
      ARM: dts: nuvoton: Add Quanta GSJ BMC

Joel Stanley (1):
      dt-bindings: vendor-prefixes: Add FII

Lancelot Kao (1):
      ARM: dts: nuvoton: Add Fii Kudo system

Tomer Maimon (7):
      ARM: dts: nuvoton: Modify clock parameters
      ARM: dts: nuvoton: Modify timer register size
      ARM: dts: nuvoton: Add pinctrl and GPIO node
      ARM: dts: nuvoton: Add new device nodes
      ARM: dts: nuvoton: Add new device nodes to NPCM750 EVB
      ARM: dts: nuvoton: Add Nuvoton NPCM730 device tree
      ARM: dts: nuvoton: Add NPCM7xx RunBMC Olympus Quanta machine
