Return-Path: <SRS0=6JJP=QD=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC79CD4F4A
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 00:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 55575C4CEC3; Thu,  5 Sep 2024 00:12:16 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9D903C4CECA
	for <soc@kernel.org>; Thu,  5 Sep 2024 00:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9D903C4CECA
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2d8a744aa9bso102700a91.3
        for <soc@kernel.org>; Wed, 04 Sep 2024 17:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725495134; x=1726099934; darn=kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wL4u12NV1VQuj60Ffym57Y1XbUkuHQYZgv+GZJbTtq4=;
        b=eixLWNVq0QPcwgtSc+9r3bY3zEKwie3c+hJ+fjpbU+P4bAvESlj+X7HTOqXijYvbQt
         7OILBr6lyZ9lEZHb8ODmyJvgMru4rI1Or6/dLKrQjZilzTImlNXisO3ilTBDkvpjhgHN
         shWOJFTnMr5fXE4F3K8eXwupazvvseHynna6o63szFn8CTLzt9V3gjI89j+sG+AmS1fl
         g5u/mx8ekfT63ESjFMpU3FB11ENbM3WVpn9iyCTIq3DfLBjRChfyYOkOkNVkZ/XHgGW/
         rxphnZZ+HqloOt8GkhKFkAP+NEqo7A+mAe8MlvW6WVsyV30G3YqeC6xnt4rcYzETCuZN
         iLAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725495134; x=1726099934;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wL4u12NV1VQuj60Ffym57Y1XbUkuHQYZgv+GZJbTtq4=;
        b=rPtWFgDxYwhsdVgPvIJ26joeyf0Nz9zQQqH68SuiJ95ipn0mkc7DwH7ZJD/+cxeIIw
         ShhgdhyM763a+3RHk7uanAmH96lRbtJWuzQPyjpFkePpTpEyGCwmiG3itrURET+MSCzl
         zWMbop/jhxJsWnW+pgR/lvcGwhQKrQVCpHusTfXdIErplnMvRPifWfCjP8gH003D9g7A
         Cvszm3Z8/EhfKFVHqzqynV8MRqm1U6fmuZttlNKt7yAISRhWxnv9rtx2kqkaAWRpE1qI
         nlQMt5OBDK+sdJAPZP3NnNqvuucxcBKVk/rpET88NKwkAQ47fEJvDIdojWf77d8qja0B
         NDhg==
X-Gm-Message-State: AOJu0Yw87iQRMPmt0bV6w36yK7FpsiiXXwrUebl+26jbIx+n69mrCFcD
	3csv+ibBUnzUyw+pALnjEqYJEOj4yOiWZx5C2Gs8+8fxXvnpir3DetTAz9IsBgJkmZMl6KrIWH2
	Q
X-Google-Smtp-Source: AGHT+IHRgKHREGcL6/nlj6uLIcHmZYxDODMrBfRBQC3/5avKjZqTeGkLfatx8jlHlDO1tmkfRdykTA==
X-Received: by 2002:a17:90a:c244:b0:2c8:e888:26a2 with SMTP id 98e67ed59e1d1-2d89728c0c5mr14359797a91.13.1725495133815;
        Wed, 04 Sep 2024 17:12:13 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8ace66f14sm8981201a91.20.2024.09.04.17.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 17:12:13 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org
Subject: [GIT PULL] ARM: OMAP1/2: misc SoC updates for v6.12
Date: Wed, 04 Sep 2024 17:12:13 -0700
Message-ID: <7h8qw7arhe.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.12/soc-signed

for you to fetch changes up to 1934b0c82e980df4c9503315bed4e178905cc1d8:

  ARM: OMAP1: Remove unused declarations in arch/arm/mach-omap1/pm.h (2024-08-20 12:18:12 -0700)

----------------------------------------------------------------
ARM: OMAP1/2: misc SoC updates for v6.12

----------------------------------------------------------------
Andy Shevchenko (1):
      ARM: omap2: Switch to use kmemdup_array()

Dr. David Alan Gilbert (1):
      ARM: omap1: Remove unused struct 'dma_link_info'

Gaosheng Cui (1):
      ARM: OMAP1: Remove unused declarations in arch/arm/mach-omap1/pm.h

 arch/arm/mach-omap1/omap-dma.c    | 13 -------------
 arch/arm/mach-omap1/pm.h          |  4 ----
 arch/arm/mach-omap2/omap_device.c |  2 +-
 3 files changed, 1 insertion(+), 18 deletions(-)
