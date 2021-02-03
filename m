Return-Path: <SRS0=0kbu=HF=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF23C433E0
	for <soc@archiver.kernel.org>; Wed,  3 Feb 2021 12:09:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6664F64F8C; Wed,  3 Feb 2021 12:09:58 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA34D64F7E
	for <soc@kernel.org>; Wed,  3 Feb 2021 12:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA34D64F7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=jens.wiklander@linaro.org
Received: by mail-lf1-f54.google.com with SMTP id i187so32943265lfd.4
        for <soc@kernel.org>; Wed, 03 Feb 2021 04:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=pv1qciXbuEXdJ686V9ClECcdM/TT1AFBeAb3316YkDo=;
        b=be9HmGyubkh2mJwqE28CDJr937G7MiPdy0oXglGV6mdW5A71v9Nz8VwFUVXPx9VSjk
         4VTkRA3KgdvxNDCJlEZs12xcsk1f9KEkP20PUSbNnr7Zn76cXRGjF9mrgILapZzvd/n3
         rt1wzOkL8JAsWBAaARiQBWfpCSrG8/AvmcTV027IrwRd9s62EJ4SatogWi/oOXg71bx0
         XEfAAZJe+xHak4SXETmwmyX5WfRfnMss9IB7glmH1+B3B8QZzj0IqgtfL7ZE6ToRmEmu
         Bubwm/KNhEoKLreZFn0XjL1zYX2JYr7nUF8Dv00ILjn5Jwwreu3pW5CA+kAhlPOVHI7i
         ax6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=pv1qciXbuEXdJ686V9ClECcdM/TT1AFBeAb3316YkDo=;
        b=OTHh9uC2sDhu+n9RIDPW0lC5pz7423u5p3IA/Aln+7dzy42dyFEDoKo09VhZbAJVNh
         RBulSrhU7E5HqL06l3QnTmDUKcynstuZl5y1Pn/wu18OTXlu6PqK4r0npFDdJbxP1b1o
         JU33HjUImPkF6XIF+ynwyyqv91+4XsP9Z66ShKFQPU5lel6cJxbQJ8kLTZYQXZFc0yZW
         dwXtnSiDmAYZIy5U5xfgxGzYlL+Fkb5BZ/A8EyridaJw7yRT+buAQ/JrwXOPJuXOeAt8
         yfSlMluIftI+up47bkxjVxyRCwfbmT7ZDLQGfp/RxTILs0QptUQYc/nYkEPDzwFRsYd9
         1zQA==
X-Gm-Message-State: AOAM5318zcTFxZdyxKF0LwfffIDiZ1EQDW56fuPjZhsHTRuRNawNKNTS
	3zmeDGk6NqPghj5xM3GmeAw1nQ==
X-Google-Smtp-Source: ABdhPJybRZzGpTiMX5nvQjiDuUczL+iSxnRQlwBPmLzDZwU7MLBda/LI3lJUp+t2+7nGnEPsRgJ/3Q==
X-Received: by 2002:a05:6512:2004:: with SMTP id a4mr1590639lfb.212.1612354196266;
        Wed, 03 Feb 2021 04:09:56 -0800 (PST)
Received: from jade (h-249-223.A175.priv.bahnhof.se. [98.128.249.223])
        by smtp.gmail.com with ESMTPSA id j8sm224571lfm.79.2021.02.03.04.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 04:09:55 -0800 (PST)
Date: Wed, 3 Feb 2021 13:09:53 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: op-tee@lists.trustedfirmware.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] OP-TEE fix for v5.12
Message-ID: <20210203120953.GB3624453@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small fix removing an unnecessary call to need_resched()
before cond_resched() while the OP-TEE driver is handing a RPC.

Thanks,
Jens

The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:

  Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)

are available in the Git repository at:

  git://git.linaro.org:/people/jens.wiklander/linux-tee.git tags/optee-fix-cond-resched-call-for-v5.12

for you to fetch changes up to 958567600517fd15b7f35ca1a8be0104f0eb0686:

  tee: optee: remove need_resched() before cond_resched() (2021-02-03 08:11:11 +0100)

----------------------------------------------------------------
Remove unnecessary need_resched() before cond_resched()

----------------------------------------------------------------
Jens Wiklander (1):
      tee: optee: remove need_resched() before cond_resched()

Rouven Czerwinski (1):
      tee: optee: replace might_sleep with cond_resched

 drivers/tee/optee/call.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
