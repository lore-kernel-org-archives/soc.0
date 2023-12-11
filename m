Return-Path: <SRS0=WmvE=HW=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE7CC4167B
	for <soc@archiver.kernel.org>; Mon, 11 Dec 2023 10:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 936FDC433CA; Mon, 11 Dec 2023 10:26:05 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9747AC433C8
	for <soc@kernel.org>; Mon, 11 Dec 2023 10:26:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9747AC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a1ca24776c3so1094253566b.0
        for <soc@kernel.org>; Mon, 11 Dec 2023 02:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702290363; x=1702895163; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r2aeQLk9tLoU8aAvYRhP9s0o8YVupdtuxQZShU2pq18=;
        b=V5LZIcwoohPkAJRjX6s/71WE2Ri/RnrXoBato5cd5IZNQ2A3Jgfr0VVJwVMiDroHmS
         CCZLuDOmpjVvUSfSxF/dDUxj2XKZyon+R8hVP2/80vQU08DW7L4Udt2HjyQ9MWNzJCUj
         5CuoKJWs/au8GRP3FqrhJ61YeJyUNBpOgjt3t3AtpVGOaaVQnZi2u7UNcrLntN7QmvKy
         5/D3xaP7mOsSQSHrMF7PDNg0q0sqD/JiDB0dN04S41lgS5UfiyQGrulaMwqU7f+YWPZj
         egJk00fF4R8uVVqiw4XtYcb7JJlqnnx0NNDFrObBVa5NbIQEsOnqyCSRLEtNQYZmVYon
         0fVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702290363; x=1702895163;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r2aeQLk9tLoU8aAvYRhP9s0o8YVupdtuxQZShU2pq18=;
        b=vYVXVs0/s2bOT1+Rmh+88G7olmPlyEVvFJa54bnEHZGVJOrraxLCVJ4dOM0KvlwQY0
         OO4LhZVha5k4tFEo7f71N8Q1girV3ZycLEmj0gjsNc8yXPQQsmqECI33+ELu8P4IvIoe
         RoWgsy7XA/vX2R0wRo0TJmMxPVofJzfiaWjb32y/APeFB9c2AJRQPtTXoKp5BvNjrJzj
         frhv3JprBVVXhbWQMnGnD/NElJbSDQLuTc6s1+4LUWHo4ZDO3K3lBhhrw3ZbC5UgNJeR
         mxI2RZ2Rtvy3nC0YIgSJg+4qgTM+NcnecDPBUtS8csSfQqq0AWKOlc8dIPZwwqvZevl9
         07vw==
X-Gm-Message-State: AOJu0Ywokz0NYGS3/IyUZW6fOy4+9A1LhBYTV75Ft0Nv8lYDprqja1I2
	J8TPnvs8/9Bbfpvg/CAksbFrBw==
X-Google-Smtp-Source: AGHT+IHnKIDENGCReOWeULMrsPkwpXYOp0bNojasZmK0ptnP+q/0vscN2VYywudbNNMmv4QFdJ40fg==
X-Received: by 2002:a17:907:20aa:b0:a1c:6e3e:4873 with SMTP id pw10-20020a17090720aa00b00a1c6e3e4873mr3407157ejb.43.1702290362869;
        Mon, 11 Dec 2023 02:26:02 -0800 (PST)
Received: from rayden (h-217-31-164-171.A175.priv.bahnhof.se. [217.31.164.171])
        by smtp.gmail.com with ESMTPSA id tf7-20020a1709078d8700b00a1f7852c876sm3647282ejc.185.2023.12.11.02.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 02:26:02 -0800 (PST)
Date: Mon, 11 Dec 2023 11:26:00 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE reserved system thread for 6.8
Message-ID: <20231211102600.GA571787@rayden>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull these patches that enables SCMI with OP-TEE transport to to
reserve a thread in the secure world to guarentee that requests will not
have to wait for a thread to become available.

Thanks,
Jens

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git tags/system-thread-for-v6.8

for you to fetch changes up to 4b391c9c37646f25118355f414b9e6d9fefe782f:

  firmware: arm_scmi: optee: use optee system invocation (2023-11-17 15:48:03 +0100)

----------------------------------------------------------------
OP-TEE add reserved system thread

Add support for a reserved system thread in the SMC-ABI of the OP-TEE driver.
SCMI with OP-TEE transport uses this to guarantee that it will always have
a thread available in the secure world.

----------------------------------------------------------------
Etienne Carriere (4):
      tee: optee: system thread call property
      tee: system session
      tee: optee: support tracking system threads
      firmware: arm_scmi: optee: use optee system invocation

 drivers/firmware/arm_scmi/optee.c |   4 ++
 drivers/tee/optee/call.c          | 130 ++++++++++++++++++++++++++++++++++++--
 drivers/tee/optee/core.c          |   5 +-
 drivers/tee/optee/ffa_abi.c       |  14 ++--
 drivers/tee/optee/optee_private.h |  29 ++++++++-
 drivers/tee/optee/smc_abi.c       |  32 +++++++---
 drivers/tee/tee_core.c            |   8 +++
 include/linux/tee_drv.h           |  16 +++++
 8 files changed, 211 insertions(+), 27 deletions(-)
