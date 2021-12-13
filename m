Return-Path: <SRS0=d4yR=Q6=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0807FC433EF
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 10:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6FADC34602; Mon, 13 Dec 2021 10:24:03 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 16577C34600
	for <soc@kernel.org>; Mon, 13 Dec 2021 10:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 16577C34600
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id b19so21163221ljr.12
        for <soc@kernel.org>; Mon, 13 Dec 2021 02:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=ut8m/pHjQ/juGIhmsdLwzZw5EmhQOWRBvf8EYOGONH4=;
        b=HAQyv/tjCG5mRHKhpIOFK9wl9h2+bZ6gQ8cEV6v40WKZCm823BO9gkAogkN3wz0FDf
         hiSSJ/pgU8R5s+d15YlWz+630rdg2TsHmDrwJhtKL2NG0gUXldFBYaunYjoWHiNyoDK/
         aeVCIT3mm9ZMUuqenCGc824UG/HsIrJxYlRcv/pYxsXVXIZvtFGRyfFwRdHmTMq63zkn
         OBEHF8akbPSP9CBZtg1we5g2xj1q6PXAvk6UsxBuFfMmgkLS2TrdU/DNl7OdFLwBMG9c
         4PxWmp7G9yq1XDCRlgbIeU9/ijwDd3NRuuo9s6V+zM2HJ7DiRHVhidGkqtRYGoMa/s3g
         w+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=ut8m/pHjQ/juGIhmsdLwzZw5EmhQOWRBvf8EYOGONH4=;
        b=AkLIU4GFpDNIhsB617xtXMNW8aBvYXzywteiCi2y/gXgZncpv/KkC8pLf3E4SaV42z
         HxIcuISBboIWWahXf4DavhWLfDxYt6QBf0aIGvTXw839dcjqjmujq71zOIB/bBFBonak
         ewX1iq5bZg+3Q5QYNR9ALYIBcvPPmD3iU80SC6xiYUp9X21meew0PjoI0mUGIsuipWEL
         wKK9eo81A0QcxuMNu27o7lr1ENXcXKwX1Tc8vIeO4AjKeLmb7oR2nG77e5o4WLRO0fZN
         XTniJtZQ2+E9Pq8dnXdUTNwziehPdmCSL8KdzUIYaJRGWX+DxyG5q3F12NGgYTFPVdxk
         hb7Q==
X-Gm-Message-State: AOAM533EjfsdilCV1UR6mUKv6pyml24cCmW46O/pW3BITqehlPQdj8Ji
	qs2tyaGXuSmX2X5TpOir9hKN4A==
X-Google-Smtp-Source: ABdhPJx/4K8Z4t6FEgQWd5ClisIx4aHYvKFbFIVbVb+MklUDPdcuGjpBcXB1nVsjDoEFR2A0EbdcuA==
X-Received: by 2002:a05:651c:2123:: with SMTP id a35mr30019716ljq.174.1639391041082;
        Mon, 13 Dec 2021 02:24:01 -0800 (PST)
Received: from jade (h-94-254-48-165.A175.priv.bahnhof.se. [94.254.48.165])
        by smtp.gmail.com with ESMTPSA id f4sm1374617lfc.18.2021.12.13.02.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Dec 2021 02:24:00 -0800 (PST)
Date: Mon, 13 Dec 2021 11:23:59 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: op-tee@lists.trustedfirmware.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] OP-TEE add async notifications for v5.17
Message-ID: <20211213102359.GA1638682@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull these patches which adds support for asynchronous notifications
from OP-TEE in secure world to the OP-TEE driver.

An edge-triggered interrupt is used to notify the the driver.

These patches has been in linux-next for a few weeks already.

Thanks,
Jens

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-async-notif-for-v5.17

for you to fetch changes up to b98aee466d194788bd651cb375b0e0f7e0e69865:

  optee: Fix NULL but dereferenced coccicheck error (2021-11-29 22:02:25 +0100)

----------------------------------------------------------------
OP-TEE Asynchronous notifications from secure world

Adds support in the SMC based OP-TEE driver to receive asynchronous
notifications from secure world using an edge-triggered interrupt as
delivery mechanism.

----------------------------------------------------------------
Jens Wiklander (6):
      docs: staging/tee.rst: add a section on OP-TEE notifications
      dt-bindings: arm: optee: add interrupt property
      tee: fix put order in teedev_close_context()
      tee: export teedev_open() and teedev_close_context()
      optee: separate notification functions
      optee: add asynchronous notifications

Yang Li (1):
      optee: Fix NULL but dereferenced coccicheck error

 .../bindings/arm/firmware/linaro,optee-tz.yaml     |   8 +
 Documentation/staging/tee.rst                      |  30 +++
 drivers/tee/optee/Makefile                         |   1 +
 drivers/tee/optee/core.c                           |   2 +-
 drivers/tee/optee/ffa_abi.c                        |   6 +-
 drivers/tee/optee/notif.c                          | 125 +++++++++++
 drivers/tee/optee/optee_msg.h                      |   9 +
 drivers/tee/optee/optee_private.h                  |  28 ++-
 drivers/tee/optee/optee_rpc_cmd.h                  |  31 +--
 drivers/tee/optee/optee_smc.h                      |  75 ++++++-
 drivers/tee/optee/rpc.c                            |  71 +-----
 drivers/tee/optee/smc_abi.c                        | 237 ++++++++++++++++++---
 drivers/tee/tee_core.c                             |  10 +-
 include/linux/tee_drv.h                            |  14 ++
 14 files changed, 523 insertions(+), 124 deletions(-)
 create mode 100644 drivers/tee/optee/notif.c
