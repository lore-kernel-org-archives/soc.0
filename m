Return-Path: <SRS0=BwRQ=NE=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B037C4338F
	for <soc@archiver.kernel.org>; Fri, 13 Aug 2021 16:22:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CA06060462; Fri, 13 Aug 2021 16:22:01 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F69B610E9;
	Fri, 13 Aug 2021 16:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F69B610E9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id f10so4109255wml.2;
        Fri, 13 Aug 2021 09:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cvMCxY97+19NBnX/9se1xiPhL0qxZh2NAax8kyQ2dwo=;
        b=dUbSPwhvwSjHPMw92H/M1+w9GaV/wRo54rK6vfEWeNEM5Ajh2pCT2OG8xFbmxWMnCf
         2tUTRHwNcIfsApSO9jYxTE7E6gXiLGRYFWjlnYu4WdQs5OMNKQSDw8WLWlBfVVEOb7BF
         /pEnKizufa1clufaDdxhNJBqX9MgLmMuCB5x2Ky7b+u0Omw427lGZmx9BIiSeZio+/ZB
         yVFHvlBl53sEUpf9YmEcMx1xqOiURmTtm6T6sorfxt6fy7DuhZg9x20uJYeJ/gCdDvYV
         9gLZR2MFU9gr8zBntLqAuLjMewdKGHqjV18al/pUGEgRhn4wgYHuqKQkIN++hlLTXfaC
         mq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cvMCxY97+19NBnX/9se1xiPhL0qxZh2NAax8kyQ2dwo=;
        b=L4Km9LHIBmQdTXC4GeJkon1Lf6PclVbarEqS4frUMiy88f3cGgdXdV8B01RJOLpFkG
         KHXjcEPMBZTiodNDxFlY1yg5XhlkBionDDRqTUJPhwWmuslPW3gm+wtQ/M6Mo4F5zfxi
         LtRxOOyJ+UI43ZDsR+mL+azfQ+30eDTLluS0oO8Lxnf41ak1wJOvK1/uYVkRXJhjAJVY
         JFXbdiQS4HoCnVSdN8jlgZ7I36Wtuwr9Tm0mmSIKNmcYVFLWpcPUdLOyDqjwLayUMD1+
         eSzRrh05s3UjjF1gJLqNHbp4BHIp2e4BGnEjD6r5nVMVt443ELgaW2z1XGnZECZK8Gu3
         xSgQ==
X-Gm-Message-State: AOAM532+3GSCoujayvSpSKdu2cUtf62cii23sfgVpIiVywW0LYmFG6Hh
	ljkKNgH363swHZS9b5fakvLVYyynkf8=
X-Google-Smtp-Source: ABdhPJwn/ymZnHrGWDZ5iKAtYE+5ZRurgB6fOyOH3CXkBKWzIk2EWBxsfrai5X2NWibh+8KUsGe2mw==
X-Received: by 2002:a7b:cf0c:: with SMTP id l12mr3467826wmg.62.1628871719342;
        Fri, 13 Aug 2021 09:21:59 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id l38sm1769106wmp.15.2021.08.13.09.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 09:21:58 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] dt-bindings: Changes for v5.15-rc1
Date: Fri, 13 Aug 2021 18:21:52 +0200
Message-Id: <20210813162157.2820913-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-dt-bindings

for you to fetch changes up to 900a486ac73dfdf9b1629e7e4df6eacc92da7578:

  dt-bindings: tegra: Document NVIDIA Jetson TX2 NX developer kit (2021-08-12 15:06:28 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.15-rc1

This contains a single patch that adds the compatible string for the
NVIDIA Jetson TX2 NX developer kit.

----------------------------------------------------------------
Thierry Reding (1):
      dt-bindings: tegra: Document NVIDIA Jetson TX2 NX developer kit

 Documentation/devicetree/bindings/arm/tegra.yaml | 1 +
 1 file changed, 1 insertion(+)
