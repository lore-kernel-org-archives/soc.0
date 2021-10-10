Return-Path: <SRS0=ZoBd=O6=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A37C433F5
	for <soc@archiver.kernel.org>; Sun, 10 Oct 2021 17:58:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B89FB61100; Sun, 10 Oct 2021 17:58:43 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33216610C7
	for <soc@kernel.org>; Sun, 10 Oct 2021 17:58:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33216610C7
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C373C40019
	for <soc@kernel.org>; Sun, 10 Oct 2021 17:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1633888721;
	bh=rKgAfJ12hcF8DFHLqF0Uys+r8EW0o0/y+bAD3IeB/jg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=a7C5ewQC0cUHfoWAlclgqjpTh3c9Gqg340O8gOsaz9S1hyPsPxZ3JNoao3xNmJXQi
	 Ik9bLE10zCz8p7MW3L67MwHXkzY78h1zCm5w7ehkPQGHvSBcMJJVN3dJxoD1rkpDFH
	 xOR8ScoXZNrxjyWRzKH4/vyWMY7ImsBLTYc7WsdPfd+Iq4QPX69xrBhjQ6dsB4WTVr
	 Larb+fg/hIr746fDjiZdFzjJ2Bz8iapJzdL5cSe6W8Z5CO34iCF8VQJKYQ5u/qPriv
	 Nx5MSfcXoi8ytoasjhDc2VDiTKFFfaeGfhEmFr633J9wmBf2orDrlql8qF5ZRMyksl
	 6CdHWe3jFW9rQ==
Received: by mail-ed1-f70.google.com with SMTP id h19-20020aa7de13000000b003db6ad5245bso5113538edv.9
        for <soc@kernel.org>; Sun, 10 Oct 2021 10:58:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rKgAfJ12hcF8DFHLqF0Uys+r8EW0o0/y+bAD3IeB/jg=;
        b=YslzygUdYxNDOZ5rjpSRCtNlwwCKDkzG+LyJWTZtsQMguXQBwH18g78YYC5lrwnHcC
         n9a8YL4+5xJu56U+li/qQicpHZiwpuwC3wfgtB8Q4/h1oGFbC5paHEwHovcU643Wpp3g
         HKoEN0f4Lh6U888ir9W79c9iwnWcJ8EBu3O1fFqAWz8m/DQhooU+01Da4pUgEKKgW78l
         /wU0768cgQ+/U8IPGNk/25XsO0gDGYLuVpmas0z8OH3qW0X7PKnED0qEapo96NCEDVOP
         kRnuj4YT8fZ0cOx5AjxVCT89LtgNZY3opn6ovIG2XUuYdl6NTtEKspnNSD30/HhNKmHV
         lvRQ==
X-Gm-Message-State: AOAM533N8pXGCMjugWYMjjT6mXve55R6lmoOq/U5zSPC6LQd0/c4lr48
	Ge+NJ+6ikN0cXfsb7YhNQ9ovMvPg0IkWK0EkOy7j0uUfhrBYRb+rNmi1UflLg8NkKdVkqZC1zIk
	ERanotl1mDZeQADxKw8/RzuE=
X-Received: by 2002:a17:906:9b46:: with SMTP id ep6mr19750388ejc.226.1633888721432;
        Sun, 10 Oct 2021 10:58:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1MgPOzxF07OexmASNsOYS3ctHTEtd/77o+u4QWFFDgfbBbWBc3P/wIao7oselGzuUMsiqAw==
X-Received: by 2002:a17:906:9b46:: with SMTP id ep6mr19750372ejc.226.1633888721285;
        Sun, 10 Oct 2021 10:58:41 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id au26sm2347948ejc.53.2021.10.10.10.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 10:58:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/3] memory: mediatek for v5.16
Date: Sun, 10 Oct 2021 19:58:35 +0200
Message-Id: <20211010175836.13302-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211010175836.13302-1-krzysztof.kozlowski@canonical.com>
References: <20211010175836.13302-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

A topic branch specific to Mediatek.

Best regards,
Krzysztof


The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-mtk-5.16

for you to fetch changes up to 93403ede5aa4edeec2c63541b185d9c4fc9ae1e4:

  MAINTAINERS: Add entry for MediaTek SMI (2021-09-22 08:43:09 +0200)

----------------------------------------------------------------
Memory controller drivers for v5.14 - Mediatek

Add MT8195 support to the Mediatek SMI memory controller driver.  This
brings also several cleanups and minor enhancements before adding actual
new device support.

----------------------------------------------------------------
Yong Wu (13):
      dt-bindings: memory: mediatek: Add mt8195 smi binding
      dt-bindings: memory: mediatek: Add mt8195 smi sub common
      memory: mtk-smi: Use clk_bulk clock ops
      memory: mtk-smi: Rename smi_gen to smi_type
      memory: mtk-smi: Adjust some code position
      memory: mtk-smi: Add error handle for smi_probe
      memory: mtk-smi: Add device link for smi-sub-common
      memory: mtk-smi: Add clocks for smi-sub-common
      memory: mtk-smi: Use devm_platform_ioremap_resource
      memory: mtk-smi: mt8195: Add smi support
      memory: mtk-smi: mt8195: Add initial setting for smi-common
      memory: mtk-smi: mt8195: Add initial setting for smi-larb
      MAINTAINERS: Add entry for MediaTek SMI

 .../memory-controllers/mediatek,smi-common.yaml    |  34 +-
 .../memory-controllers/mediatek,smi-larb.yaml      |   3 +
 MAINTAINERS                                        |   8 +
 drivers/memory/mtk-smi.c                           | 596 ++++++++++++---------
 4 files changed, 393 insertions(+), 248 deletions(-)
