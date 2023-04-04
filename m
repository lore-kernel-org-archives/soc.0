Return-Path: <SRS0=nFn0=73=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E57FC7618D
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 06:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D6BFBC4339B; Tue,  4 Apr 2023 06:27:32 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D166DC433D2
	for <soc@kernel.org>; Tue,  4 Apr 2023 06:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D166DC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id k37so41058261lfv.0
        for <soc@kernel.org>; Mon, 03 Apr 2023 23:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680589650;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EeGOQuK/PqzO98tcIpRjRjtyM7MAYGn7fx/rVzbfxbA=;
        b=EjTKQSWArVmGJn07Bgb/RFPq5OzTe3ynIe2RyF5sF6J6Zu9Hd0vb7aD+HRM8iAcVvO
         4SvVFyxsHSrUb6S33xnWPv9ocTxqDRvt9PRAvwZxOxhYWwgpdvxlgfhlPqWvSI24ldza
         AhFjvGx8lBjyhJfAeIap4dVjqK7hI1MXX3uST5UYCTd39PcfM/1XBT4yfGhp4XhS2XK5
         Tm1lp/aV32UX73s9Ygr41J2Id0nRyaXcdhOfXqfRJAuyGBbQ8h1kqI/LsfJfKpqlDKWF
         ygaY88FBUb5UeEhZ+eWID0wdxF/fcoivqeMvyONaS6BB9172Rlod8RiuGEFkcsYjhujX
         wYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680589650;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EeGOQuK/PqzO98tcIpRjRjtyM7MAYGn7fx/rVzbfxbA=;
        b=hTNLoU6IHwc5iuiegfsweUNDy6sPCrowCFVtCg5kZ9QvJ6INON8PwIOqSD7swpWRNc
         TETtKnWvZssznS1K3uPJD2BaE/7cMm30hu4wOI7RhB358UonvsJkEk7OAYSe1eY5mMUk
         nIRvgd3qHMwyZJaIOP0IgtoB04OoyFIiGP2BrZEDds2PGjsEViFprLGJly3HZ9TLeNH2
         gINUIbhNn50MP2Kunpu/JYAU7/DIOUMOh+5yGfUrRjNUCIN4OLnYJl3eaN/MQh4lXxoK
         PD5v7ipnowH6hYgBSiUgpunve04pkEKEWS3UI6gfIVyYvTxQu/dn3VN+TxzzaHUH3Ljs
         ONQg==
X-Gm-Message-State: AAQBX9fCwG7Yhxen+dg9zIZ+hRQZRwxOohens5lQVA+g6xXSqwbK8pz7
	jbkPnEiuEa8eHQB/MlboccKASQ==
X-Google-Smtp-Source: AKy350YiC2UwD4PywR32gwG+CKVshieQmX+ZaOSzlwo9nQhlBMJAJK90V5UaCUIkUF7iWuYN7em4AQ==
X-Received: by 2002:ac2:4911:0:b0:4de:7a23:23e2 with SMTP id n17-20020ac24911000000b004de7a2323e2mr308513lfi.21.1680589649762;
        Mon, 03 Apr 2023 23:27:29 -0700 (PDT)
Received: from rayden (h-46-59-78-111.A175.priv.bahnhof.se. [46.59.78.111])
        by smtp.gmail.com with ESMTPSA id y27-20020ac2447b000000b004e9b183fc5bsm2157556lfl.8.2023.04.03.23.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 23:27:29 -0700 (PDT)
Date: Tue, 4 Apr 2023 08:27:27 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: op-tee@lists.trustedfirmware.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Sumit Garg <sumit.garg@linaro.org>,
	Etienne Carriere <etienne.carriere@linaro.org>
Subject: [GIT PULL] OP-TEE per-cpu irq for v6.4.
Message-ID: <20230404062727.GA2765560@rayden>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull these patches which add support for using per-cpu interrutps
to signal asynchronous notifications from OP-TEE in secure world to the
OP-TEE driver.

Thanks,
Jens

The following changes since commit eeac8ede17557680855031c6f305ece2378af326:

  Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git/ tags/optee-per-cpu-irq-for-v6.4

for you to fetch changes up to b3b4ced12c1bc829888803ce07fff317e590ec1c:

  optee: add per cpu asynchronous notification (2023-03-30 08:27:05 +0200)

----------------------------------------------------------------
Add OP-TEE per cpu asynchronous notification

Adds support for signalling from secure world with per-cpu interrupts in
addition to edge-triggered peripheral interrupts.

----------------------------------------------------------------
Etienne Carriere (2):
      dt-bindings: optee driver interrupt can be a per-cpu interrupt
      optee: add per cpu asynchronous notification

 .../bindings/arm/firmware/linaro,optee-tz.yaml     |   3 +-
 drivers/tee/optee/optee_private.h                  |  24 ++++
 drivers/tee/optee/smc_abi.c                        | 122 ++++++++++++++++++++-
 3 files changed, 144 insertions(+), 5 deletions(-)
