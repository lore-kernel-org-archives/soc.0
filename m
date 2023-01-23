Return-Path: <SRS0=6Gkx=5U=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D6FC05027
	for <soc@archiver.kernel.org>; Mon, 23 Jan 2023 10:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84A26C4339E; Mon, 23 Jan 2023 10:53:36 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B003C433D2
	for <soc@kernel.org>; Mon, 23 Jan 2023 10:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B003C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id q8so8633301wmo.5
        for <soc@kernel.org>; Mon, 23 Jan 2023 02:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FdJJNcufNtuaisjvQK2ChXy93daPNKRKW1qtkKLWAQ4=;
        b=yEVqAbeWLluveXp/VTFrrCJYUrV4elpQpWZWdW21Wauk98Xo7klhAO3oAHWpjvOqHU
         W51Nx2DzBJSM36+25bPjyHrvimxXlPIZUbkiTYmUkB9VQKvvBNO2Y5Xfbs0F4sM2+nsU
         D4/icgc0CI0AB7QU1HHjcBYmDSa6E+mOsudetMmQS3WLjeTIC+1PeXvmyVgOlFKv/JVI
         xnFlnjCLFJQj/p8CmvLJNB3RPZyT8vFkw2VPZOGYSS7eb6xwj+U8VUCOGTFTB8MVoM5p
         mXl1Z/ZBr2tEcwo7ihH687hnYjo7lC5O8/ioxE930GrlA8thIsJwOXAauKUbttFoiQhB
         4HYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdJJNcufNtuaisjvQK2ChXy93daPNKRKW1qtkKLWAQ4=;
        b=ijJXEtNwYPDGf3PvmT6MxHxQkZBArGvAoYVYPmC/aFxOQfdjli4MWyxfqMshbBCe8X
         yFaO8ADUoBx1eoCr3HG4eN2DlCVyHaCQozLQ0gECvbaD3fPZF86tI9exIxcmsKPCgOeT
         eaG6PrN/xsM1SbHMQL/Lf4JDm895SwqnW+/ejS+DVOt9YSb3DWJpeyER8uSduFPbjtHX
         9XscCHcveDKc+BV2Pb0GN9NKDYwkrpumra3WodaQwXMVLYGRgt0lfYEaNGE9ju9f+p9h
         bptdG6aVfgvb6SaEgnwx0IH4MLGmS9Z6Egrh0Dx8uu1PaFxBmtNy3UgcXtXnRny9qiTj
         SmXQ==
X-Gm-Message-State: AFqh2kon9gh4HalQACQY08bzFjz32qK5h4kUxZVHKoiaevxjP4wd3khs
	oc09oYMR06SxpAk8oPBr1p08ww==
X-Google-Smtp-Source: AMrXdXvCUzBZ7lNA/yyyDLkfzfr7k8v1XZckOCzSEcaqREsi/y3xn7LlyZaKArybPHRgG7gssZYxgA==
X-Received: by 2002:a05:600c:4f96:b0:3db:2df0:f2b8 with SMTP id n22-20020a05600c4f9600b003db2df0f2b8mr12762253wmq.36.1674471213842;
        Mon, 23 Jan 2023 02:53:33 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l7-20020a05600c1d0700b003d990372dd5sm11382125wms.20.2023.01.23.02.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 02:53:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] memory: drivers for v6.3, corrected, v2
Date: Mon, 23 Jan 2023 11:53:30 +0100
Message-Id: <20230123105330.63709-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Version 2 of the same pull request - dropped one patch which was not needed.

Best regards,
Krzysztof


The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.3-2

for you to fetch changes up to bbaf6624f23d6e538401382be97ba3d4bcba963e:

  memory: ti-emif-pm: Use device_get_match_data() to simplify the code (2023-01-23 11:48:31 +0100)

----------------------------------------------------------------
Memory controller drivers for v6.3

1. TI Emif: simplify device_get_match_data().
2. Renesas RPC IF:
   - Few fixes (decouple driver's private data structure from other
     drivers; unbind and rebind due to triggering managed resources
     allocation from other drivers);
   - Bigger rework around improved runtime Power Management.

----------------------------------------------------------------
Geert Uytterhoeven (6):
      memory: renesas-rpc-if: Split-off private data from struct rpcif
      memory: renesas-rpc-if: Move resource acquisition to .probe()
      memory: renesas-rpc-if: Always use dev in rpcif_probe()
      memory: renesas-rpc-if: Improve Runtime PM handling
      memory: renesas-rpc-if: Pass device instead of rpcif to rpcif_*()
      memory: renesas-rpc-if: Remove Runtime PM wrappers

ye xingchen (1):
      memory: ti-emif-pm: Use device_get_match_data() to simplify the code

 drivers/memory/renesas-rpc-if.c | 152 ++++++++++++++++++++++++++--------------
 drivers/memory/ti-emif-pm.c     |   7 +-
 drivers/mtd/hyperbus/rpc-if.c   |  18 ++---
 drivers/spi/spi-rpc-if.c        |  14 ++--
 include/memory/renesas-rpc-if.h |  34 ++-------
 5 files changed, 119 insertions(+), 106 deletions(-)
