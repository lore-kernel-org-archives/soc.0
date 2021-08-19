Return-Path: <SRS0=9TqI=NK=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D294AC4338F
	for <soc@archiver.kernel.org>; Thu, 19 Aug 2021 05:32:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B892360EFE; Thu, 19 Aug 2021 05:32:07 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3619660EBD
	for <soc@kernel.org>; Thu, 19 Aug 2021 05:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3619660EBD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id g11so3039442qvd.2
        for <soc@kernel.org>; Wed, 18 Aug 2021 22:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=uILcPJJOM+zztrksljRpH+JlVIrsNLx0rX4deMIyXRw=;
        b=Q/Y/nlRa3gEiP7D2ymRx62azW9Y6xeo9lyO/AyKtMLlwqTq8h2QILIobGMGe/vrlaw
         fenV/Ztp0pjXGLnsDKO18cy9CdYcRxG6fQwVrTUh+Gc673s6oNO8UZx19CuYqLjNzJkB
         l20vwXerZDkzbXzll7qKsnKp1uSgJ6Ks8Z8qE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=uILcPJJOM+zztrksljRpH+JlVIrsNLx0rX4deMIyXRw=;
        b=HbfDdOV+AJvT940k3oAJhb+LfnrezN8s72fEprvja3YVbWvso+7pnQLDCIre9HqnYx
         CgtwTqATsyLZBtgxesGHyVbvuRYrGjsyoyzZbX2LkuwZcS3dEdP+i86uqhq1lT9tUP90
         6osOikIvVbl+74uiE31f03boeWfqfKoP94Dg8/gUYWBKgzAVmG8wwDq0t3L2AnIwrfp4
         oM3rFnG7fSRPR+eL/f7Jw8xYm8ocMKXuR0LP3dVyZw+shDZox/nAzOuGh34/nHBtwuIc
         tdoRq+sqaLIoRxN/tzBecrHkkq4D0aWVRvhbLeAXyjl4CrcWp7h9VftYrC4PiAQk3MrO
         xQuA==
X-Gm-Message-State: AOAM530m3jSCOi4BPJdJuDlp0oFCqG/qSVNfOo8h6Qm+1ZBvYg5jm7Lu
	9ZCob7TXGUA+V/wubAB2CVCnC+PuCobNrDNLXtY+eSKVbgU=
X-Google-Smtp-Source: ABdhPJyLFV4R3lBRTBpqUa3Y8sHajJUfmKf6QmuJrccBRv2MtowA33NMOZbJWKhHPTCr6fsQDVZ68YPQgciEMa+Lemo=
X-Received: by 2002:a05:6214:27ee:: with SMTP id jt14mr13006026qvb.61.1629351124799;
 Wed, 18 Aug 2021 22:32:04 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 19 Aug 2021 05:31:53 +0000
Message-ID: <CACPK8XdyT0rCkoeE7x2EQyvFy1Z7ZwFNdm1SQfCG9yC_Z7UbxA@mail.gmail.com>
Subject: [GIT PULL] ARM: aspeed: soc changes for 5.15
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: "Winiarska, Iwona" <iwona.winiarska@intel.com>, Andrew Jeffery <andrew@aj.id.au>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-aspeed <linux-aspeed@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"

Hello Soc maintainers,

Here are some soc changes for 5.15.

The following changes since commit 2734d6c1b1a089fb593ef6a23d4b70903526fe0c:

  Linux 5.14-rc2 (2021-07-18 14:13:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
tags/aspeed-5.15-soc

for you to fetch changes up to 2f9b25fa668218f22a85ebe8c55d1d132fc0019d:

  soc: aspeed: Re-enable FWH2AHB on AST2600 (2021-08-19 13:59:28 +0930)

----------------------------------------------------------------
ASPEED soc updates for 5.15

 * Two fixes for drivers that control the mapping of BMC memory over
   PCIe and LPC

 * Re-enable FWH2AHB on systems that have it closed off by default

 * A new id for the AST2625, an AST2600 variant

----------------------------------------------------------------
Iwona Winiarska (2):
      soc: aspeed: lpc-ctrl: Fix boundary check for mmap
      soc: aspeed: p2a-ctrl: Fix boundary check for mmap

Joel Stanley (2):
      soc: aspeed: socinfo: Add AST2625 variant
      soc: aspeed: Re-enable FWH2AHB on AST2600

 drivers/soc/aspeed/aspeed-lpc-ctrl.c | 31 ++++++++++++++++++++++++-------
 drivers/soc/aspeed/aspeed-p2a-ctrl.c |  2 +-
 drivers/soc/aspeed/aspeed-socinfo.c  |  1 +
 3 files changed, 26 insertions(+), 8 deletions(-)
