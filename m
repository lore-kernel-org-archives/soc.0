Return-Path: <SRS0=YSus=WG=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B731C433EF
	for <soc@archiver.kernel.org>; Mon, 30 May 2022 11:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5497FC34119; Mon, 30 May 2022 11:26:18 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8723CC385B8
	for <soc@kernel.org>; Mon, 30 May 2022 11:26:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8723CC385B8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id m26so544673ljb.0
        for <soc@kernel.org>; Mon, 30 May 2022 04:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=npSoPOR18gr4kYVcO6FCP7SdcO9Nfox2m4Mymj662QY=;
        b=DzFBkjp3mxBY6C3TkNtzvS3/ADlVGt5Bn8JVavdokD3lBw+vFquDRlLPRgJVM1nCxk
         cTwSZ3t9JJ2thLH8pWrWRvRU8/zAPYoK5BBLjTHlm3amSYYgZSk3UlFMe8E4Kk+ku6Qx
         GaV7upGsDVYX+XZgINYmA5dgGadtfVH4qDLm443NC1Jj7mZpLfIbb5ycqic/c1ozMzIY
         pv5X3DY4xnp4kezJSQyNLofVY/k6Tp99MSgOyFZVVv8IsbSrISqyzfDCUdi1XYuTFgLg
         JND5M5/OmgGPqvgvTwidQk/pN2uDRmFBb0+jjq0ff+1Ua8b4VDVrRRvoWrtY3okgLLf3
         2TSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=npSoPOR18gr4kYVcO6FCP7SdcO9Nfox2m4Mymj662QY=;
        b=ACWGYbhBiU8XRa36DK8KGpSpg26o2lIn48wo8IMII6kEIwRZA9MNtL1fV84/y3ybGo
         ka0VSnfjv0IT7fYEIyAmQ2G90hlRXOfLuNs6MUqk6la27AIvx6qqScA64fvG0Yaw/gRb
         ywjrsSHKrmbET/0Ak9gJLlddiVuHLBOTjJWfAYuYLUrac/0usaPXVzgQf+UjxurR1gVV
         xXnymRDOF9mZSOvZLwveivw1OSa+t1/L9vINJfvylPvPYxw1B3Ss4N9NE6Og43jUTWUG
         kkyB76Wj4YrQ0B0KWkfW5sVurtx7/YI/sMyblFiD7gmvGIxsLFt11TmoyCXWDmMwsdz6
         whCQ==
X-Gm-Message-State: AOAM531syaZt6RKtXS1tayWBK3b47bLq33JRc8W4DMdLY5jCP1lEBC4m
	9iR1Bv5XjUSVqFGo15l6zRHXaA==
X-Google-Smtp-Source: ABdhPJyvMauwBGWci6pyzoGU2h1C9VnN++whWVOzXhb8QUPfKvpCll4M/eYaFsgnVQeW9MsJ5FB22Q==
X-Received: by 2002:a2e:330f:0:b0:253:da40:de51 with SMTP id d15-20020a2e330f000000b00253da40de51mr31122907ljc.76.1653909975531;
        Mon, 30 May 2022 04:26:15 -0700 (PDT)
Received: from jade (h-79-136-84-253.A175.priv.bahnhof.se. [79.136.84.253])
        by smtp.gmail.com with ESMTPSA id a10-20020a194f4a000000b0047255d2117csm2257899lfk.171.2022.05.30.04.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 04:26:14 -0700 (PDT)
Date: Mon, 30 May 2022 13:26:12 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] Fix OP-TEE compiler warning for v5.19
Message-ID: <20220530112612.GA1511426@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small patch which fixes a compiler warning in the OP-TEE
driver.

Note that this pull request is on top of and earlier accepted/applied [1]
pull request in order to avoid a merge conflict.

Thanks,
Jens

[1] https://lore.kernel.org/lkml/20220503192916.GA3288817@jade/

The following changes since commit 3e47235eaee09488c7e467b9aaccb7c93c862c6b:

  tee: make tee_shm_register_kernel_buf vmalloc supported (2022-04-05 08:04:16 +0200)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git/ tags/optee-warning-for-v5.19

for you to fetch changes up to a3b9ecc805e9131476c719111fe347c7dbc0d1d1:

  tee: optee: Pass a pointer to virt_addr_valid() (2022-05-30 08:06:45 +0200)

----------------------------------------------------------------
Fix a compiler warning in OP-TEE driver

----------------------------------------------------------------
Linus Walleij (1):
      tee: optee: Pass a pointer to virt_addr_valid()

 drivers/tee/optee/call.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
