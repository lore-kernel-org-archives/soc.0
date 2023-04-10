Return-Path: <SRS0=Jlev=AB=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA971C77B70
	for <soc@archiver.kernel.org>; Mon, 10 Apr 2023 23:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E182C433D2; Mon, 10 Apr 2023 23:26:18 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5243C433EF;
	Mon, 10 Apr 2023 23:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A5243C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id cj22so7070704qtb.3;
        Mon, 10 Apr 2023 16:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681169176; x=1683761176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTQV6cSmows/yMKRVXpvkfgSiCRACrDK63Q//T1ObiU=;
        b=qIZzy67rQsSVjBiayMgcnKPatZx2CU8UW2LyMIuf6bHZ0g1wVKSKJn61UYypZIs5ws
         YYVCuxVVSz02bT/lUg/k1rHLZkPpvSBGIf6oRxGfjXxUNjPpaZO5oNj7uZmuF88Ft4Dp
         /nUwaOS3HWKiH+B4noHy6fmBShquVkqfAQDgrHiKe6BZ8RFwNfnyl7OpufZhWuVi1JC6
         qopAgA+kZ1RKClpGaZVsVmXvBnrbHC5Am601IR1TkNdXaRQmnv9aD+E8jWD3N4U2R1HC
         pL1xqMTlYB1GHtWG1dGwXcsZlBQfui/pT4iYLCKFgnfPCPXfNA9Sg72TzHyR33ASvg0q
         o9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681169176; x=1683761176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTQV6cSmows/yMKRVXpvkfgSiCRACrDK63Q//T1ObiU=;
        b=Vy7O+cQpWzJfikp4Wp5DRk6ht5DxA9OlW0vHgeFQ930zHFDUSmKTOj5XgiwSnyif8U
         XkvxbPVp/SCEdLB5fUbKvVcuRLHeZnLu1hn4lTmqX4xxs+EpXwMCu8Lx2FyhUuXVqU2u
         3J8vUv8FzePH91/R63TRJwQ3KIDUL33RGfKKT08dhffeKj7ubZW3IXORmie7ErwovD49
         lqZ4BBYC6XR+/K1XU8+v5qAbWZE35snKBiy1pbnGrV/inR7TzBp+vTEcZBmEXBLql66Z
         4joD8s7WfSlEggm9cQwrLei6jfb+b0w7cFpbZ4EITReKfGM/Wi1bb4AVPeTrPB6sHric
         enrA==
X-Gm-Message-State: AAQBX9crYnzSa0rqS7pIYfAx8ErsZvsbi78uYtn0x2JKsIZnhBqMvM30
	jo5yIOaCF0fxFnunAmKdVKss+A/DiSK2Pw==
X-Google-Smtp-Source: AKy350arlprb5SFts029avtTtenRhI0iMvtmfJ1gaiFk8NhIMopWJJ4byEmywiwZ8xY0sBMeXbKUUA==
X-Received: by 2002:ac8:7d16:0:b0:3e4:ce72:29b with SMTP id g22-20020ac87d16000000b003e4ce72029bmr1458194qtb.16.1681169175910;
        Mon, 10 Apr 2023 16:26:15 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id v126-20020a379384000000b007460093cccdsm3604775qkd.25.2023.04.10.16.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 16:26:15 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 4/4] Broadcom soc changes for 6.4
Date: Mon, 10 Apr 2023 16:26:06 -0700
Message-Id: <20230410232606.1917803-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230410232606.1917803-1-f.fainelli@gmail.com>
References: <20230410232606.1917803-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.4/soc

for you to fetch changes up to 3c01b05407bfeb42c4db0f7cc079437228ab0ab2:

  ARM: bcm: Use of_address_to_resource() (2023-03-24 14:08:43 -0700)

----------------------------------------------------------------
This pull request contains ARM-based platform code changes for 6.4,
please pull the following:

- Rob makes use of the of_address_to_resource() helper instead of open
  coding it in the Kona SMC code.

----------------------------------------------------------------
Rob Herring (1):
      ARM: bcm: Use of_address_to_resource()

 arch/arm/mach-bcm/bcm_kona_smc.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)
