Return-Path: <SRS0=qSJt=RB=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC09C433F5
	for <soc@archiver.kernel.org>; Thu, 16 Dec 2021 15:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A6EAC36AE5; Thu, 16 Dec 2021 15:07:51 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 655BFC36AE0
	for <soc@kernel.org>; Thu, 16 Dec 2021 15:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 655BFC36AE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id i63so38983092lji.3
        for <soc@kernel.org>; Thu, 16 Dec 2021 07:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=9X0RjBHPLivbiVNAdZyiLl4+pNiD7DUVjNDWx5AeBbc=;
        b=Zdsgu9qsJq4qcchiaa3E8O8yDJy0sQTGRNh42sfeTfhjLAjueKtQnNHRh5QkVdz85e
         fGApJ31vD8zYtCewzZCXSG9w8C+hkCCjUbc7f/eFIQeyiNL7zbrp8YI1mOx50tpKTRKf
         ecogXo0Dt4Ki2/0HdDQRRpteZNVkQqO0wDIlkrXxOmeH3F28gKDFra9gTxDAk1JuUXjM
         iriUD9JMRFJgjRBGx4y5C/y+u4sJjNvu7Oly3+kzAUp5+Frf7xDPouMpxawk9Y7BGdwb
         S6bLzvgYLGCkx3fXikDS9nYXsEMm+HSMJKB+ATNcph0YjEZVoRzdcAYxxYwBWmkIs5Bu
         Awxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=9X0RjBHPLivbiVNAdZyiLl4+pNiD7DUVjNDWx5AeBbc=;
        b=E0/nTsG9zNDYmVPtHKElzyxkbxTkZ8W2cfYCufSiZZ16kVBSekeeHNldEViKi9fe+0
         1fDIR6+N9lZyI8fzNQfiOM6UxtbU2o9oeXNQu2O8VIDrBBgfeIU4xii79bE4v1zOULxX
         VzVMBlaFjum/XxWW8RhYSlHE4m/RPbLqdyDGOaEH/mh0Rqu+LdYK8gAGMg9sGYkELNVu
         PNLIIZru6Yb7yB9pa1ZeH3lZSLnSLxQ4kdOKkfQyulpal83zXx4AcAl9k2h3PcNhm7WE
         xfdgXrjvS2CMRl2oWoRLPH+IQoPUHm/Ig2yTEiK5oBZe2sEmXP1oCVnfV8pe4zu0cQRP
         qKrw==
X-Gm-Message-State: AOAM532wICSZRqTQ1RjdKdRErt7soepiwHhCrYDFovQWHScnbvtOh/z+
	SpeUw1mlAl+m5iw7R6FWqfIKsg==
X-Google-Smtp-Source: ABdhPJx98BP9clojgv/CDFJocfhgP1byE1E+a6NOGsae8EetpchJRYkFFgaCcK1kf4if7RGsFK0eJA==
X-Received: by 2002:a2e:b5b7:: with SMTP id f23mr15447783ljn.244.1639667268258;
        Thu, 16 Dec 2021 07:07:48 -0800 (PST)
Received: from jade (h-94-254-48-165.A175.priv.bahnhof.se. [94.254.48.165])
        by smtp.gmail.com with ESMTPSA id l20sm912682lfj.36.2021.12.16.07.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 07:07:47 -0800 (PST)
Date: Thu, 16 Dec 2021 16:07:45 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE and OP-TEE fixes for v5.16
Message-ID: <20211216150745.GA3347954@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull these TEE subsystem and OP-TEE driver fixes which by coincident
all are concerning memory shared with secure world.

There's one in particular nasty race fixed when a tee_shm is about to be
teared down.

Thanks,
Jens

The following changes since commit d58071a8a76d779eedab38033ae4c821c30295a5:

  Linux 5.16-rc3 (2021-11-28 14:09:19 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git tags/fixes-for-v5.16

for you to fetch changes up to 6add87fdae9bcb1d20b4503df5bd02ce5246cc8b:

  optee: Suppress false positive kmemleak report in optee_handle_rpc() (2021-12-16 15:32:48 +0100)

----------------------------------------------------------------
TEE and OP-TEE fixes for v5.16

- Fixes a race when a tee_shm reaches reference count 0 and is about to
  be teared down
- Fixes an incorrect page free bug in an error path of the OP-TEE shared
  memory pool handling
- Suppresses a false positive kmemleak report when allocating driver
  private shared memory buffers for OP-TEE

----------------------------------------------------------------
Jens Wiklander (1):
      tee: handle lookup of shm with reference count 0

Sumit Garg (1):
      tee: optee: Fix incorrect page free bug

Xiaolei Wang (1):
      optee: Suppress false positive kmemleak report in optee_handle_rpc()

 drivers/tee/optee/core.c    |   6 +-
 drivers/tee/optee/smc_abi.c |   2 +
 drivers/tee/tee_shm.c       | 174 +++++++++++++++++---------------------------
 include/linux/tee_drv.h     |   4 +-
 4 files changed, 72 insertions(+), 114 deletions(-)
