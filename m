Return-Path: <SRS0=7nXX=QS=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A10C433F5
	for <soc@archiver.kernel.org>; Wed,  1 Dec 2021 10:40:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EEB2BC53FCC; Wed,  1 Dec 2021 10:40:44 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B5E1C53FAD
	for <soc@kernel.org>; Wed,  1 Dec 2021 10:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B5E1C53FAD
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f48.google.com with SMTP id p3-20020a05600c1d8300b003334fab53afso21858643wms.3
        for <soc@kernel.org>; Wed, 01 Dec 2021 02:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=GryEuUZgiwqNPWZVOVqstgCbzW0+pZjjdZ33gd6/PgA=;
        b=xtZT2LnZd4/ll2NLack8wsnhqQ8T3uJEjWri0PFJsKIhZu3+3X0AzaZfq+A4oWoUAW
         wsovzfgDz93CvUdhqKc7CF64oxJaQ7dLKuDqJcAkMNi0DEoQbCOYZNPY3qDNpOepI4pt
         jfjdOmqggXH5znYs/p6HOSpZarkTk16X5MjVvUPKYJb4HGN8isfQc4of3F9rFhOOKgsz
         AZum2cDGhPMBPRJspyXtCrGkJUkAWTMiarjh+roCgugYyx9g6JsXGv/EBeXREABcCOfU
         Bs+N7i5aXA7TAWKH9mFlLcEPnUG9qeVnz7pm/nxATMzP8hvuv+W5Fqta36Hiww1iKcOj
         InPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=GryEuUZgiwqNPWZVOVqstgCbzW0+pZjjdZ33gd6/PgA=;
        b=yTsJtZGRCv7EqS8paQxbIz7KGO28lGL8uUhYbXqvShw9fT9VTdATOSxntnwxWIQtVn
         23ZM+A0H3/sr9M4o6Fkjsm/BqBgzaUDq2T0eFVOdwZ7IKQx09BBet+dTq9wi/dIcAuPm
         ELMhDkfzbHZPBvBn8eFRjcRQ93J1mltqVLphTg9DlFSkAxMfx+Xh3ECYofIYmt7xiPx/
         3PPpvYynjccDfgEGr9/Jf5JG2/9Z2XjzFLjtiC7q8vjPDuXIRxutUzRtq73lnCC6jtmZ
         l1lUEReEm35nCN4dzvdBrRyCRULOPjcFHnPQ5LbPhxAnGfgShsFtkT4J6xAVl40y8nY+
         BuMQ==
X-Gm-Message-State: AOAM532uJqz6RTPAtHjlH0+gDQhAZGePofsoUgYA/FXBqmztvHFz31eh
	W03gNULExcracpBBiECxOgTjMl51HaB5BZlw
X-Google-Smtp-Source: ABdhPJzxnrcP4L5CRE1ziVrMBv92OiiMDBEhdjbM9BkQG4tkIwD7pHLv0iZj30rf6kAfHu7gnO+zLg==
X-Received: by 2002:a05:600c:b46:: with SMTP id k6mr5969187wmr.45.1638355241590;
        Wed, 01 Dec 2021 02:40:41 -0800 (PST)
Received: from [10.1.3.24] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id 10sm24641423wrb.75.2021.12.01.02.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Dec 2021 02:40:40 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] amlogic fixes for v5.16-rc
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Organization: Baylibre
Message-ID: <ab9f066f-480b-84b2-248e-953f2f2b5f59@baylibre.com>
Date: Wed, 1 Dec 2021 11:40:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Here's a couple of fixes for v5.16-rc1, one for the amlogic Kconfig and another for the JetHub D1 DT.

Neil

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git v5.16/fixes

for you to fetch changes up to 5ad77b1272fce36604779efe6e2036c500e6fe7a:

  arm64: meson: remove COMMON_CLK (2021-12-01 10:29:12 +0100)

----------------------------------------------------------------
Jerome Brunet (1):
      arm64: meson: remove COMMON_CLK

Vyacheslav Bocharov (1):
      arm64: meson: fix dts for JetHub D1

 arch/arm64/Kconfig.platforms                       |  1 -
 .../dts/amlogic/meson-axg-jethome-jethub-j100.dts  | 30 +++++++++++-----------
