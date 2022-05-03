Return-Path: <SRS0=1zmO=VL=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477B7C433EF
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 19:16:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 09D07C385B1; Tue,  3 May 2022 19:16:32 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 342A9C385A9
	for <soc@kernel.org>; Tue,  3 May 2022 19:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 342A9C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id bq30so31959419lfb.3
        for <soc@kernel.org>; Tue, 03 May 2022 12:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=wPTnR2Zu/nMupXPED8+6zfG3R03kfxI0ufpTxQT+s40=;
        b=tjQdxT++eBAtCciDu2vU3NoUP4QW6qBmdwluJN7ZqTxj5rCLdpDXoPA48gZOr5T9JR
         Te40XWsMzEhOWZumvQ0tidKpqGFo+dZmA84nwmchSTzMnxyLvAWfAxhk6KmTExqHOZ2w
         BNXaoBlUSVt/2a+kA8BScws+d2nLejwqepBJLd/c4n84GvLJRoqcAge0xcRpuNsjcHKC
         MKHJmMwbkmyHpazMg6NuqL52MS88IhStwuUzr6I/+6NP9KepZ1guoda30WFcSYGasBnk
         Z6MdIzaa3k9WdCnxWtr/DghvKxLTu8EFbc/vLdy5GHAALvnLBG2KuGJAvwIqoSo0QOZ/
         fbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=wPTnR2Zu/nMupXPED8+6zfG3R03kfxI0ufpTxQT+s40=;
        b=XVplWmJYBst24pHxboACQH57e3PCVWjBwW1PQmDXmidHfLThTRMuCGiOznJtZnq9IZ
         5/WsqTB++UMJnZXUh/noRpJ27QKxwGotAfo0NhJJHpl1M7asnTTWq1Clmivtc710oeFU
         BXf9/FF61T4u1mYiW8OAsZcDS4j3jSO6A6Slr8NQ3gXHXxmrcztO6m3jKXMc5HC3JiTT
         C4PoESDdbDLguzYl7Gb7cmktA+VXghzLQQgNnp71U2J46txNkic8W09l4snKNgDd6wNU
         +HzKvacPSmxi++hVt4neRZMu9jODtk21ZYSTHdhogNLjsA/AmYfL06bJN7/+RFwK5BaP
         i77Q==
X-Gm-Message-State: AOAM5321BUv6FFft+CAFLDluT75AlpqlXkfq4xIFDMHeW7X6hfeyO0kI
	AHD3fjXJ0T4mBCVYvYrMPoO61UlYHtXb+w==
X-Google-Smtp-Source: ABdhPJwPzzX7IVXeDUZKXs6KdmMPkgA7AOVPSzXGlSNues3oWyX7bzj63hV8upZvkAXNMXk0YzSTWQ==
X-Received: by 2002:a05:6512:3f88:b0:44f:567f:8715 with SMTP id x8-20020a0565123f8800b0044f567f8715mr11912202lfa.609.1651605389115;
        Tue, 03 May 2022 12:16:29 -0700 (PDT)
Received: from jade (h-79-136-84-253.A175.priv.bahnhof.se. [79.136.84.253])
        by smtp.gmail.com with ESMTPSA id d10-20020a05651221ca00b0047255d2119bsm1013800lft.202.2022.05.03.12.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 12:16:28 -0700 (PDT)
Date: Tue, 3 May 2022 21:16:26 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE menu for v5.19
Message-ID: <20220503191626.GA3278203@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small patch which combines the config and menu for TEE's
menuconfig into one line.

Thanks,
Jens

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git tags/tee-menu-for-v5.19

for you to fetch changes up to a4b75fe8e1c15c96c4eb083e211ccbbfd56599f9:

  tee: combine "config" and "menu" for TEE's menuconfig (2022-04-05 07:32:23 +0200)

----------------------------------------------------------------
Combine TEE config and menu in one line

----------------------------------------------------------------
Jan Engelhardt (1):
      tee: combine "config" and "menu" for TEE's menuconfig

 drivers/tee/Kconfig | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
