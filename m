Return-Path: <SRS0=gLzk=PG=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F104EC433F5
	for <soc@archiver.kernel.org>; Mon, 18 Oct 2021 12:13:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D2F1D60FDA; Mon, 18 Oct 2021 12:13:27 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD6BE60FC3
	for <soc@kernel.org>; Mon, 18 Oct 2021 12:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD6BE60FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id s19so8625981ljj.11
        for <soc@kernel.org>; Mon, 18 Oct 2021 05:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=TX6EfNcesD6AFpSmkWfASRr7QWijxOVxr8diDKAguug=;
        b=RVOxDu4FFforRKFoxAvoyorF7CocY7yNyOu9VgebzdNR175rwXxap9U60Dy1SB2gH0
         YTphR1K0AjvthzuBNETIAFNRVzfGt1SY40flk27eUlyhnLb/+LH0RUYuOjMfRR5nf/vd
         Rb/WqhTr+qfrC+qzK8QF1eiQRRVPl4CYeV4mg5ey7magmJBG0Xx1qiCQPcAHKvelUVEy
         3xiwLj4iGSD2gDIwHjjZNbNTzzJ851jhkNctpXjVHQXK8y975CPJzV2TZlS6nfDaZG1K
         Z7BDVIUUoHeFpQjgU381WRZSJJXb5okuXKIZPoMH3vn9xHax+7SBnsVMw9GmVzl0GtA6
         J8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=TX6EfNcesD6AFpSmkWfASRr7QWijxOVxr8diDKAguug=;
        b=YaCzZG1812PZXT56q3Te7HfUnA6f6mqL11pFarzuefhdqg3AA9Juw9WEvydYwsggQn
         vyQBRytz+si79Zt4ColU20xkbd32yNLVwEE/j9R92Jna2pRVbFuQYu7uL3T2gR5+UJg4
         7FiwmiCQWgetjdzRTeVIAHfTPJxilOcN5Vx98pPiDjCxweH47tWUm+rDemDo4dRUILqH
         8+aQvli4exOlEGikdqNVrNrFnDS9NTK3paaWD9xHfDsa8lwK0oHeoc9W35Yi3vUxJx89
         T83WN6+X1rvANLqWNMfB0jLaZ2jURZvGPrgtRBu+m91MIrtJUhKsRCa8gqyIzTEcd0Wx
         E3XQ==
X-Gm-Message-State: AOAM532H0Y7cdcMW+jJMfSjXrs24ZvPo3XQWQqGjh0w3eF/WfqNYVxHQ
	fr5Gyep8pJcJTbFtrM9ORE+gXA==
X-Google-Smtp-Source: ABdhPJzafrLvKuJfjaxiKL3PSkm6Ol58iIp2P65rhl5bie+NUIUVQ727/8PYB0vomwuVW6OpoPg8bg==
X-Received: by 2002:a2e:6e06:: with SMTP id j6mr32115032ljc.120.1634559205764;
        Mon, 18 Oct 2021 05:13:25 -0700 (PDT)
Received: from jade (h-94-254-48-165.A175.priv.bahnhof.se. [94.254.48.165])
        by smtp.gmail.com with ESMTPSA id c19sm1614982ljj.130.2021.10.18.05.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 05:13:25 -0700 (PDT)
Date: Mon, 18 Oct 2021 14:13:24 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: op-tee@lists.trustedfirmware.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] OP-TEE FF-A for V5.16
Message-ID: <20211018121324.GA2943530@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull these patches which adds support for FF-A [1] in the OP-TEE
driver. There's a bit of shuffling in the code where everyhting related to
the old SMC based ABI is moved to drivers/tee/optee/smc_abi.c, but there
should not be any changed in behavior for with the old ABI.

Note that this is based on top of the recent fix 7f565d0ead26 ("tee: optee:
Fix missing devices unregister during optee_remove") which has already been
requested to be pulled.

Thanks,
Jens

The following changes since commit 7f565d0ead264329749c0da488de9c8dfa2f18ce:

  tee: optee: Fix missing devices unregister during optee_remove (2021-10-12 13:24:39 +0200)

are available in the Git repository at:

  git://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-ffa-for-v5.16

for you to fetch changes up to 4615e5a34b95e0d81467f6d2176f19a5d184cb5d:

  optee: add FF-A support (2021-10-18 11:44:23 +0200)

----------------------------------------------------------------
Add FF-A support in OP-TEE driver

Adds supports for the OP-TEE driver to communicate with secure world
using FF-A [1] as transport.

[1] https://developer.arm.com/documentation/den0077/latest

----------------------------------------------------------------
Jens Wiklander (5):
      tee: add sec_world_id to struct tee_shm
      optee: simplify optee_release()
      optee: refactor driver with internal callbacks
      optee: isolate smc abi
      optee: add FF-A support

 drivers/tee/optee/Makefile        |    5 +-
 drivers/tee/optee/call.c          |  445 ++----------
 drivers/tee/optee/core.c          |  719 ++------------------
 drivers/tee/optee/ffa_abi.c       |  911 +++++++++++++++++++++++++
 drivers/tee/optee/optee_ffa.h     |  153 +++++
 drivers/tee/optee/optee_msg.h     |   27 +-
 drivers/tee/optee/optee_private.h |  157 ++++-
 drivers/tee/optee/rpc.c           |  237 +------
 drivers/tee/optee/shm_pool.c      |  101 ---
 drivers/tee/optee/shm_pool.h      |   14 -
 drivers/tee/optee/smc_abi.c       | 1361 +++++++++++++++++++++++++++++++++++++
 include/linux/tee_drv.h           |    7 +-
 12 files changed, 2728 insertions(+), 1409 deletions(-)
 create mode 100644 drivers/tee/optee/ffa_abi.c
 create mode 100644 drivers/tee/optee/optee_ffa.h
 delete mode 100644 drivers/tee/optee/shm_pool.c
 delete mode 100644 drivers/tee/optee/shm_pool.h
 create mode 100644 drivers/tee/optee/smc_abi.c
