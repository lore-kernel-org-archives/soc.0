Return-Path: <SRS0=3bpG=SS=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA40C433F5
	for <soc@archiver.kernel.org>; Thu,  3 Feb 2022 13:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 47648C340EF; Thu,  3 Feb 2022 13:23:28 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BAF05C340E4
	for <soc@kernel.org>; Thu,  3 Feb 2022 13:23:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BAF05C340E4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id q22so3877539ljh.7
        for <soc@kernel.org>; Thu, 03 Feb 2022 05:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=Ak+COwfE20Lh+wMI8BKPZo4w9eb0zqwsjKIhrR00dVY=;
        b=yRZR355Mfhbhl7GZ+SdOSUxtvGqB0IXPTh6ytscrhlFCEv43c7EBU/TQ1aGjc2VfOR
         JuU/u1jM17F0EjWgpYrdnjHMoFIZc0Xs8zvK7uOdj4qoKXJmnVhvw6eYpL2EyVkUmpH5
         8s7Mf0ExwIO4vY4BBdVZdNpbu/qh1OG/NhwQxSoKCP6m3PUkISixEhJxYfV4hQpv9D3S
         uFkP+E2X6UK5tA+lmkehEXmg/nV+BTB0Fx/MgzVHDL//DVr7xKOYVWL9679ZH/JK8bba
         xVnng3bqzF4EZcHpOUwkcWs6Hnc1CnXjASHgichtBvMQpJr4BUc91Ijh3Om16dCIRr+W
         qSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=Ak+COwfE20Lh+wMI8BKPZo4w9eb0zqwsjKIhrR00dVY=;
        b=7hPujb/V1BH7f/h9a8sv6sl3a67P9Fl/wcYA1L4+oXFGa7nQEs7JEL9IWLKAVXAZvo
         mrhciXG+Nd1uLSuHE9bIjHzhxfztKBbjUryNq3MqciQZ83Q4BCGWf7/N9Sb6yBEOD0Lh
         GWP34ssQD2lALJULdVmsmqjH1uQjUoCoWsumVdXzoZgh4N5fvg3zy8J7+67B/ZywF52r
         +dLQwPT1wOn7n2iGR6S/IgHIxx9+tZEaiR2RtT8UXzqd7a7M4BK1L1nsnI3iYpRjdZbX
         B5MfhhuSx9cv2YKPTh5EQflU5jk9rPsAA7FE0rq93wTmW3Wo7H57xaaRtkrOFbHF2nvO
         zBaQ==
X-Gm-Message-State: AOAM533X6sAHVuvuaApA/c8jGvRskCgKdo761UJHTmca5ex/5q/PJpFH
	MzI6G6vpT4Eq0t78CN4Uxrln6Q==
X-Google-Smtp-Source: ABdhPJxTD07obBKqx4ohmhw45P/a5zdsLVVR5rdZko14LhaAA6p7Co6lBa+Vn7lU+WEd9hRq1B8eYQ==
X-Received: by 2002:a2e:a4dc:: with SMTP id p28mr19960705ljm.367.1643894605785;
        Thu, 03 Feb 2022 05:23:25 -0800 (PST)
Received: from jade (h-94-254-48-165.A175.priv.bahnhof.se. [94.254.48.165])
        by smtp.gmail.com with ESMTPSA id u18sm4096730lff.139.2022.02.03.05.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 05:23:25 -0800 (PST)
Date: Thu, 3 Feb 2022 14:23:23 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE fix for v5.17
Message-ID: <20220203132323.GA4132001@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this OP-TEE driver fix which decouples driver private shared
memory objects from the original tee_context. This fixes the root cause of
a shutdown problem where the driver would dead-lock waiting for tee-supplicant.

Thanks,
Jens

The following changes since commit 26291c54e111ff6ba87a164d85d4a4e134b7315c:

  Linux 5.17-rc2 (2022-01-30 15:37:07 +0200)

are available in the Git repository at:

  git://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-fix-for-v5.17

for you to fetch changes up to aceeafefff736057e8f93f19bbfbef26abd94604:

  optee: use driver internal tee_context for some rpc (2022-02-03 13:36:32 +0100)

----------------------------------------------------------------
OP-TEE fix shutdown problems

----------------------------------------------------------------
Jens Wiklander (1):
      optee: use driver internal tee_context for some rpc

 drivers/tee/optee/core.c          |  1 +
 drivers/tee/optee/ffa_abi.c       | 77 ++++++++++++++++++++++-----------------
 drivers/tee/optee/optee_private.h |  5 ++-
 drivers/tee/optee/smc_abi.c       | 48 +++++++++---------------
 4 files changed, 64 insertions(+), 67 deletions(-)
