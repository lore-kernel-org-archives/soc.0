Return-Path: <SRS0=Z+Dw=L6=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18801C4345F
	for <soc@archiver.kernel.org>; Thu, 25 Apr 2024 07:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F1EE2C113CC; Thu, 25 Apr 2024 07:31:25 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C3D1FC2BBFC
	for <soc@kernel.org>; Thu, 25 Apr 2024 07:31:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C3D1FC2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2db2f6cb312so9105921fa.2
        for <soc@kernel.org>; Thu, 25 Apr 2024 00:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714030282; x=1714635082; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ul9hzsEcg7DYm2vJuobyphUHRoFSWDx7IAFuHRf9zA4=;
        b=H0s41ToWgtO4MmeMIR+H7hVC18I0/y7+UjSJfyJYSE3kYpWr/08t+dnvfjjBzXswOw
         +goiy71cZmhL93ursFttqpEd2vE1T2k4RKURGHUw9VnKmocWhBsdPbfdLoOaNTx3XN9r
         57Fn4F0HNZSaKE0zI0z9S40IKxhSOUfxXB6k2HruDVJ+KKwdXYzWdZ97ANZE9exTqjLz
         1Tp0dlYckujBYBdYQJS90qJcdygaEejNYqOhI4W5KOZLTnK+TMppw/TtfxzQ6lTEJs74
         3mM32KoyuvJFWQ6KCEsGRoSO1zgCJuFB9TydKUZ7JJwGi0NMZakMmvvoQU4wVpn0DxKg
         aigg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714030282; x=1714635082;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ul9hzsEcg7DYm2vJuobyphUHRoFSWDx7IAFuHRf9zA4=;
        b=d3QCbOJDp/Qxs+idgtDwdEe6k+uZTSHaLeHolFRSEysWSwRPPgrTlQU8kqqcHYrlaR
         Chur0K+4NOni8ulV4q7XqPjNOaZvjEmInHVNdYOgz6EUf9BOZbUijK6PAY9kbiuqAnPo
         bmoi04URRrhHIErwfVmfp/Vr2w01zLsq9ba7QZrmDxAaTGkBI57ICwJrsJhlqQXLHQdL
         UvUz1qfBSrVpit8erBzVgTWkXeeqYBWmig5hEPF6hvcS8DfZ2tm4Q8nnhAVBAUhjhZIZ
         lJdgGZWhEgk9wYEF0SjKj/qwJh1SItVMycU4LFecFtNXNtwjAUp8Fs/vjNzh8E+5kF/6
         l+0w==
X-Forwarded-Encrypted: i=1; AJvYcCXGhYczRWviCEKg4SgwTuJUwqLGhLEo+PASj0FU5wPl7dz/U0J9txlfLmQ2tbpDdaB51qF1+BY7haNn162lEw==
X-Gm-Message-State: AOJu0Yzh4bdCTILnwLOcPNZTur4z8TtwrEtl1c7y6uISZJmauq9nd4JC
	5QhSI6dinrvnTAKcbioOKY9cXFBw6VGyFVvYQVU1u7LftXZO/pljbe1Wf6SXl6o=
X-Google-Smtp-Source: AGHT+IEiRBUviT2k4uhh1UXsujRvJ586KrHxaEdXV0yDDilA0LqYA463l/ieRAYdipdoU5lQ8sa7HA==
X-Received: by 2002:a2e:81c2:0:b0:2d4:6893:24e1 with SMTP id s2-20020a2e81c2000000b002d4689324e1mr3514710ljg.50.1714030281939;
        Thu, 25 Apr 2024 00:31:21 -0700 (PDT)
Received: from rayden (h-217-31-164-171.A175.priv.bahnhof.se. [217.31.164.171])
        by smtp.gmail.com with ESMTPSA id bo1-20020a0564020b2100b0056fd89cd52dsm8654055edb.85.2024.04.25.00.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 00:31:21 -0700 (PDT)
Date: Thu, 25 Apr 2024 09:31:19 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE driver for Trusted Services
Message-ID: <20240425073119.GA3261080@rayden>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull these patches that introduces a TEE driver for Trusted
Services. You can see more details below from the signed tag. These
patches have been in for a few weeks.

Thanks,
Jens

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git/ tags/tee-ts-for-v6.10

for you to fetch changes up to 31611cc8faa082a96009c29822d9906d893cce57:

  MAINTAINERS: tee: tstee: Add entry (2024-04-03 14:03:09 +0200)

----------------------------------------------------------------
TEE driver for Trusted Services

This introduces a TEE driver for Trusted Services [1].

Trusted Services is a TrustedFirmware.org project that provides a
framework for developing and deploying device Root of Trust services in
FF-A [2] Secure Partitions. The project hosts the reference
implementation of Arm Platform Security Architecture [3] for Arm
A-profile devices.

The FF-A Secure Partitions are accessible through the FF-A driver in
Linux. However, the FF-A driver doesn't have a user space interface so
user space clients currently cannot access Trusted Services. The goal of
this TEE driver is to bridge this gap and make Trusted Services
functionality accessible from user space.

[1] https://www.trustedfirmware.org/projects/trusted-services/
[2] https://developer.arm.com/documentation/den0077/
[3] https://www.arm.com/architecture/security-features/platform-security

----------------------------------------------------------------
Balint Dobszay (4):
      tee: optee: Move pool_op helper functions
      tee: tstee: Add Trusted Services TEE driver
      Documentation: tee: Add TS-TEE driver
      MAINTAINERS: tee: tstee: Add entry

Sumit Garg (1):
      tee: Refactor TEE subsystem header files

 Documentation/tee/index.rst         |   1 +
 Documentation/tee/ts-tee.rst        |  71 ++++++
 MAINTAINERS                         |  10 +
 drivers/tee/Kconfig                 |   1 +
 drivers/tee/Makefile                |   1 +
 drivers/tee/amdtee/amdtee_private.h |   2 +-
 drivers/tee/amdtee/call.c           |   2 +-
 drivers/tee/amdtee/core.c           |   3 +-
 drivers/tee/amdtee/shm_pool.c       |   2 +-
 drivers/tee/optee/call.c            |   2 +-
 drivers/tee/optee/core.c            |  66 +----
 drivers/tee/optee/device.c          |   2 +-
 drivers/tee/optee/ffa_abi.c         |   8 +-
 drivers/tee/optee/notif.c           |   2 +-
 drivers/tee/optee/optee_private.h   |  14 +-
 drivers/tee/optee/rpc.c             |   2 +-
 drivers/tee/optee/smc_abi.c         |  11 +-
 drivers/tee/tee_core.c              |   2 +-
 drivers/tee/tee_private.h           |  35 ---
 drivers/tee/tee_shm.c               |  67 ++++-
 drivers/tee/tee_shm_pool.c          |   2 +-
 drivers/tee/tstee/Kconfig           |  11 +
 drivers/tee/tstee/Makefile          |   3 +
 drivers/tee/tstee/core.c            | 480 ++++++++++++++++++++++++++++++++++++
 drivers/tee/tstee/tstee_private.h   |  92 +++++++
 include/linux/tee_core.h            | 306 +++++++++++++++++++++++
 include/linux/tee_drv.h             | 285 +++------------------
 include/uapi/linux/tee.h            |   1 +
 28 files changed, 1095 insertions(+), 389 deletions(-)
 create mode 100644 Documentation/tee/ts-tee.rst
 create mode 100644 drivers/tee/tstee/Kconfig
 create mode 100644 drivers/tee/tstee/Makefile
 create mode 100644 drivers/tee/tstee/core.c
 create mode 100644 drivers/tee/tstee/tstee_private.h
 create mode 100644 include/linux/tee_core.h
