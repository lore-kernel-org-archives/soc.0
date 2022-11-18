Return-Path: <SRS0=sUSC=3S=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF07C4332F
	for <soc@archiver.kernel.org>; Fri, 18 Nov 2022 12:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 728F0C433D6; Fri, 18 Nov 2022 12:10:39 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 56B61C433C1
	for <soc@kernel.org>; Fri, 18 Nov 2022 12:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 56B61C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id a29so7862226lfj.9
        for <soc@kernel.org>; Fri, 18 Nov 2022 04:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BBu6kfL23BcHBPVJQ1UWIgnUmXbGAwIjzt4B4fPiJ0w=;
        b=AXFZY+/lx/aXVTzw/rhvD8HHbAZHbfn8g6+fkD/V55tKKVPkHQ+YLiOo5hkqyMChTO
         3ZGQ0NXC86du4aWC1Ho9MB4lVacnDbi2SKl0dppOJlTNwiaQlLuBB217wMb1gcKoDrXh
         lnsewn4fbKJJyjf+nvNmdo+ORJlPZDhqNLiSNM4YP6V47KvuPuzCI7uGyVe8SZ/cP6uw
         QxrelX349mqG8VgoPXN6zFjtGNb0szbYWouhnnHjeLzgKA6sBbHCbOAg+IcSn1ryjGuT
         6vm9nLNBuAAzzfxoTGwA9s2Y3+t9OrvkkOVAUuV/BGx3K2eqVT1/b3eYHGmd10SQvoPN
         sihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BBu6kfL23BcHBPVJQ1UWIgnUmXbGAwIjzt4B4fPiJ0w=;
        b=8MptBpgbDcS3F0KKfpINUNT+oPkzr/QpnwEjK8jjWxVZp3xJK34pU6dcGOgO0hRrzm
         1qMAUhR/PnCkciH9DEqa847UVTK7BdbGsS8F4HDy1GmcRvPOxZdExS3Fv/VXILySHey2
         YjVMjBR/E7EBokq86BpiZzXeVUYbHIpT7lJfDelQQAt+soLYqevCg+4XQSpvNwh4raLk
         YJl7qzCUw0Q00WpQdZVQMBfc9iCZwcsOzJBB1bVizPXb8ACGT3NqEGrsYo4Oxd/b2l+v
         wvA/OWzU08PickF93FDT8onL47tB8paj/vNxdjasRsKxpCw428vU/WlKdO/GzJQp74Bw
         R61g==
X-Gm-Message-State: ANoB5plwkiamIQ/xHkJrrAiWpS9Oa9l0doSiTDx58m2UaL3sJO2Vm06E
	YgBT2JWXnzTKxDLqi1/E8TSIp3TmTsPQFw==
X-Google-Smtp-Source: AA0mqf6TUNjX0jmjkVETnHxatVQPJY6CHiLkVsJECbdcfEKrcYaJUvEtI7EWHfRx00vjlERgtoW6Yg==
X-Received: by 2002:a19:9113:0:b0:4b1:e3ec:d99d with SMTP id t19-20020a199113000000b004b1e3ecd99dmr2241140lfd.95.1668773436318;
        Fri, 18 Nov 2022 04:10:36 -0800 (PST)
Received: from jade (h-79-136-84-253.A175.priv.bahnhof.se. [79.136.84.253])
        by smtp.gmail.com with ESMTPSA id bd4-20020a05651c168400b0027628240ff7sm631838ljb.135.2022.11.18.04.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 04:10:35 -0800 (PST)
Date: Fri, 18 Nov 2022 13:10:34 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] Fix possible memory leak OP-TEE driver for v6.1
Message-ID: <Y3d2OuJ60U30OkZe@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small patch in the OP-TEE driver which fixes a possible
memory leak in the error path of optee_register_device().

Thanks,
Jens

The following changes since commit 094226ad94f471a9f19e8f8e7140a09c2625abaa:

  Linux 6.1-rc5 (2022-11-13 13:12:55 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-fix-for-6.1

for you to fetch changes up to cce616e012c215d65c15e5d1afa73182dea49389:

  tee: optee: fix possible memory leak in optee_register_device() (2022-11-17 09:22:12 +0100)

----------------------------------------------------------------
Fix possible memory leak in optee_register_device()

----------------------------------------------------------------
Yang Yingliang (1):
      tee: optee: fix possible memory leak in optee_register_device()

 drivers/tee/optee/device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
