Return-Path: <SRS0=5F7A=74=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2B7C76188
	for <soc@archiver.kernel.org>; Wed,  5 Apr 2023 06:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2AB06C433D2; Wed,  5 Apr 2023 06:27:06 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0CB05C433EF
	for <soc@kernel.org>; Wed,  5 Apr 2023 06:27:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0CB05C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id q16so45244706lfe.10
        for <soc@kernel.org>; Tue, 04 Apr 2023 23:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680676023;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qbguUgawsCe7zb1mn9asSInaSJEAc8njZ7HzZ+tIgaU=;
        b=A84l4DGr8WUS7zCXfRe+7AX9NAoe7RomnQXWIBSKDtkqXOerCknSecq1aQALAVCJNU
         86Ja0pQca0GPYeuVLgI9EZ//VUmtuvhQXeuFyx/xMnQHXZ2RPBxBpm3xE9I9VAxhAc4v
         1+2HEblYRyf1ur/44DiQ+eXL2Z055J11xZ6f7ZKKkcR68AxPfGNXt35YyZb6y+qeKIP/
         7a5tptEsoXnb/0Ix27GIE4yAdh1KsiC7NRsntrtvxCsNp4Cr8WOraz4uO2JOtCaYrI+X
         Lf56NLp1ipQeOB81vMdswtko8PumyF5K+4FvHfKllIVcq370iWaUcRUJO+dHAJlU/unq
         id1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680676023;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qbguUgawsCe7zb1mn9asSInaSJEAc8njZ7HzZ+tIgaU=;
        b=uGpaC2v1GV+q++fI+1w2xu7WfIZ8/yoH3Z81cuSt84Am6KF9bUDbgzxKKhugWFef6X
         067FJ5IdjDGX8XDLBurhJ/yw4K6zeoI89HCqGb7AyzJYbJvO9czZFW339awwUeY59Ue0
         j8qTOZo4uChDoBp/agedqeZzIXo9disrNTpJb407TZ9xRYoADxam0URcGuh+AtFX2piL
         01GcVdqk567M6CEQ2K1n57jJUaOGKQCMTypwVo/Gxn3VP/ndhvNnAIZgZ12AWqfwzf2j
         YElu2NRNTdBcUeweiltmpVqDNDSEdgSCb6U4IJ8Tds1SOD65Md8s5omNjGcLrseJzoSd
         FQNw==
X-Gm-Message-State: AAQBX9frBJknWX3vSCe3iQi8xJy6wy7HpMgcAXmtpSu9NB7Kp/M1PpWb
	0xJ0rDH7oKgGdYEcYVo9txOOyA==
X-Google-Smtp-Source: AKy350YJmCPryn03SV+cEWg2nQOaJViWzu/BH0gzZ+w7PZpo7ajhkK4wUPVSrjyFPcm884/MFQmmOA==
X-Received: by 2002:ac2:5e81:0:b0:4e8:44e3:f3da with SMTP id b1-20020ac25e81000000b004e844e3f3damr1328726lfq.39.1680676023040;
        Tue, 04 Apr 2023 23:27:03 -0700 (PDT)
Received: from rayden (h-46-59-78-111.A175.priv.bahnhof.se. [46.59.78.111])
        by smtp.gmail.com with ESMTPSA id b9-20020ac25629000000b004d783b0d310sm2679356lff.307.2023.04.04.23.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 23:27:02 -0700 (PDT)
Date: Wed, 5 Apr 2023 08:27:01 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: op-tee@lists.trustedfirmware.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [GIT PULL] OP-TEE load for v6.4
Message-ID: <20230405062701.GA3391925@rayden>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this patch to enable loading of OP-TEE by the kernel.

This feature is by default disabled and should probably always be so since
it requires a quite specific security model to be secure.

Thanks,
Jens

The following changes since commit eeac8ede17557680855031c6f305ece2378af326:

  Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-load-for-v6.4

for you to fetch changes up to f3040daab8104ac68e2b241bc93288f63b88a3c7:

  tee: optee: Add SMC for loading OP-TEE image (2023-04-03 08:57:49 +0200)

----------------------------------------------------------------
Add SMC for OP-TEE image loading

Adds an SMC call for loading OP-TEE by the kernel.

----------------------------------------------------------------
Jeffrey Kardatzke (1):
      tee: optee: Add SMC for loading OP-TEE image

 Documentation/staging/tee.rst |  53 ++++++++++++++++
 drivers/tee/optee/Kconfig     |  17 ++++++
 drivers/tee/optee/optee_msg.h |  12 ++++
 drivers/tee/optee/optee_smc.h |  24 ++++++++
 drivers/tee/optee/smc_abi.c   | 137 ++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 243 insertions(+)
