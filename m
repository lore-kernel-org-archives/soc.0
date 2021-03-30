Return-Path: <SRS0=skuN=I4=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C06C433E2
	for <soc@archiver.kernel.org>; Tue, 30 Mar 2021 08:22:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1789F6196C; Tue, 30 Mar 2021 08:22:13 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DF916157F
	for <soc@kernel.org>; Tue, 30 Mar 2021 08:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DF916157F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=jens.wiklander@linaro.org
Received: by mail-lf1-f49.google.com with SMTP id n138so22523438lfa.3
        for <soc@kernel.org>; Tue, 30 Mar 2021 01:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=0qSy1MVbTFfSGRDPmoKRiOph5YqV5xL5GvGDM8LZE/k=;
        b=XYNxb8bjIXQEiworr1609zQd16eadlj0gAF1chjtfPOiFBme8JeFUlRcIXjDxyrfND
         gv5FZneuoNsUBwWM9uYiDWqOIqEvxX93EkVbTxGI79oRHhCcmPp2R7DzuiGS7RRw2V5q
         kbf31yl3dzceedNPgrLajMyF8AJG8gpI/N6FkabpZ+zNXCk68/cpEy5/0+X9yBYGXG4F
         eAKjXQqt7lK0JY0neJPFfoemD6jwy8m3nvEc75gqlh/OYQQD0Wte4WddyzgPZAnhmWPO
         1fk9lg6SaU/CmX42M9RP2IdDu+Fta7reSJwsxFu1oPSF3d81WaRx9FFWwtSWFxyfaJtM
         HcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=0qSy1MVbTFfSGRDPmoKRiOph5YqV5xL5GvGDM8LZE/k=;
        b=Pfu/zI9yGmEoCVhUOCKfUVqb8gesCTpYCfjKp4pRTctVylGo2KYKS3oFkylLGMuSaW
         NuZzSZ6N+V1UoIY0JSaLygDYqAvyUrj/M0ltA7rDSYpl+yAp20h31BBUv3XWVMw3/UJN
         iJG32ntaKW3Uf6VNhTD2nyR0nbjPEI0zvj2971IUFKSXxU+u4riVJKvglHzPaG/IKsJ6
         O6IeOI5dy9eJr3lsnbBVfnpNXmVolnO8SfX6ijFujnZpgnenUorhNW3LD/MUZUwCO3Ag
         fpdu65cb/jMZtA/8rD4sfzEVlpaqlfxojNbefbT/prQ5TdRVLEHkwG5U3e2feBABozeP
         yHIg==
X-Gm-Message-State: AOAM532iEk8azlmo1XjSBPVLKQC36xnNbgMj4ybAYAcC5zKoqD69PJ2K
	7ts6n2mZIkGOo8+MCor0tPeWPw==
X-Google-Smtp-Source: ABdhPJzIl4hLL8Krt5oiEyybF+iTwH8dmHrf/cbfUkYsI71XvGAAZYvLMPiz20B6oFT9GtQNOmFUTg==
X-Received: by 2002:a05:6512:304c:: with SMTP id b12mr1038631lfb.3.1617092530844;
        Tue, 30 Mar 2021 01:22:10 -0700 (PDT)
Received: from jade (h-249-223.A175.priv.bahnhof.se. [98.128.249.223])
        by smtp.gmail.com with ESMTPSA id 192sm2701813ljj.95.2021.03.30.01.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 01:22:10 -0700 (PDT)
Date: Tue, 30 Mar 2021 10:22:08 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: op-tee@lists.trustedfirmware.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [GIT PULL] OP-TEE tracepoints fix for v5.13
Message-ID: <20210330082208.GA965793@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

The previous pull request for OP-TEE tracepoints introduced a build
error when building whithout O=..., apparently many regression builds
uses that option.

Please pull this small fix for the build error.

Thanks,
Jens

The following changes since commit 0101947dbcc3204f08fb5b69a21dbd4b1535cad6:

  tee: optee: add invoke_fn tracepoints (2021-03-15 12:04:01 +0100)

are available in the Git repository at:

  git://git.linaro.org/people/jens.wiklander/linux-tee.git/ tags/optee-tracepoints-fix-for-v5.13

for you to fetch changes up to 7ccdcaace80810175bd20b2ece856b42edd43991:

  tee: optee: fix build error caused by recent optee tracepoints feature (2021-03-30 09:33:33 +0200)

----------------------------------------------------------------
Fixes build error for recently added OP-TEE tracepoints

----------------------------------------------------------------
Jisheng Zhang (1):
      tee: optee: fix build error caused by recent optee tracepoints feature

 drivers/tee/optee/Makefile | 3 +++
 1 file changed, 3 insertions(+)
