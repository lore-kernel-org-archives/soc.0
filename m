Return-Path: <SRS0=1zmO=VL=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69873C433EF
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 19:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 51402C385A4; Tue,  3 May 2022 19:29:22 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9798AC385A9
	for <soc@kernel.org>; Tue,  3 May 2022 19:29:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9798AC385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id y32so31982345lfa.6
        for <soc@kernel.org>; Tue, 03 May 2022 12:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=vrL7XkKPM/fDDKM+WseGESNouqMD+FfUqKoaeNFxXOw=;
        b=XWuECTjXnwuPdrZllK4DeqHBBkqyK3F/k+4xtX/o3AuWklbUoso8ijNsaXpy6IQ+c3
         UdH1qbnVvBOYesa2R8E8Fpzlfq5bg3X7qQvGtEFh8LGYWaI/+RJRLncOt0+Nzw24WAka
         gVzRyloeN6KRSicVJH0VDKzgBzes8xrfDMcENHbvJ4HseJkNQm/DuVjElzOgm9FlnsX7
         nCcGIbiFmqeadeJmgsw8mXjzjUPDTq+9NaQOEAbzNIMtAIe++NFEUN8WvCptDH2wUTFG
         Lhtay5xL0CajMIDc0XtfXBal2lZoxjafp+p6eje9z7wqINLTqp9MAYdzN506ksRmajIJ
         DIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=vrL7XkKPM/fDDKM+WseGESNouqMD+FfUqKoaeNFxXOw=;
        b=pClGOHUQHRWTCEjvRPkmSehXQRkINTfNtq/cIBJb6MEEplch0Po+APmx/uggqI2evW
         y7R8qzeCQqKqpAHHyibnLCnGS7qTzwVvi9uHBQDtSnuDlr3ZQ7aOpxhBnVCH7IeX94lY
         8eG+ebhgbu202vr/+zLVPLf/bGlcwM+krSeGslPKDZT3zSmaaT2t92oFXZ5tGd5GidHB
         FpqVtR9oXDi3cbSchd7L04TZU0BVzFWZY9uqedi1Cvn8u84Do9AL3wSyda35S6p+NKTg
         NPVnW1pDvYVuIfCWmjrNCDSz3AkJhtrJ0SYYkF2h6/j15GA1HfCQSbVBQ7ojapKuZhLs
         v3OQ==
X-Gm-Message-State: AOAM531rOzwmlba8ogmcU5TSdh/n6NbEqWTD43HQ7p6OzepAK8gcZr97
	W+gZ57dCTFPdovGJw7RppwfmDQ==
X-Google-Smtp-Source: ABdhPJzf6t1KXZQ7VbgFSHWEP9s4rPmvnO49pd4XQDm0Sr89zB1DbHVlC9wf5jwU+tibSOhz4uCZ+Q==
X-Received: by 2002:a05:6512:b11:b0:44a:2ead:daf2 with SMTP id w17-20020a0565120b1100b0044a2eaddaf2mr12201966lfu.642.1651606159560;
        Tue, 03 May 2022 12:29:19 -0700 (PDT)
Received: from jade (h-79-136-84-253.A175.priv.bahnhof.se. [79.136.84.253])
        by smtp.gmail.com with ESMTPSA id a8-20020ac25208000000b0047255d21161sm1015104lfl.144.2022.05.03.12.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 12:29:18 -0700 (PDT)
Date: Tue, 3 May 2022 21:29:16 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE SHM vmalloc for v5.19
Message-ID: <20220503192916.GA3288817@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this patch which enables tee_shm_register_kernel_buf() to
accept vmalloc()ed buffers.

Thanks,
Jens

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git tags/tee-shm-vmalloc-for-v5.19

for you to fetch changes up to 3e47235eaee09488c7e467b9aaccb7c93c862c6b:

  tee: make tee_shm_register_kernel_buf vmalloc supported (2022-04-05 08:04:16 +0200)

----------------------------------------------------------------
TEE accept vmalloc()ed buffers for tee_shm_register_kernel_buf()

----------------------------------------------------------------
Phil Chang (1):
      tee: make tee_shm_register_kernel_buf vmalloc supported

 drivers/tee/optee/call.c |  2 +-
 drivers/tee/tee_shm.c    | 35 +++++++++++++++++++++++++----------
 2 files changed, 26 insertions(+), 11 deletions(-)
