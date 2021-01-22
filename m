Return-Path: <SRS0=m7oM=GZ=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD2BCC433E0
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 07:42:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4118323106; Fri, 22 Jan 2021 07:42:39 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 915E722DBF
	for <soc@kernel.org>; Fri, 22 Jan 2021 07:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 915E722DBF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=jens.wiklander@linaro.org
Received: by mail-lj1-f181.google.com with SMTP id f2so246927ljp.11
        for <soc@kernel.org>; Thu, 21 Jan 2021 23:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=nVvrd/4gPehvCF1j59+Xexug3ddL/zOX6NDGUcJwgnA=;
        b=T8m1a84twNCsjiFCdRXVr+AliLEZ0NT1IUG0uFOYs6b4CTpDZyDNk8B+ZxpziV6TNb
         Rk84Zr8oOhv0+x6+XymTDp2nedh88MAfMQPJagT4V0tiLJsO3mU76PeCZS6AmrZBFS0P
         fLRzkxlXYrAbyMflhrFIbO0tgtLsyWm4SWKrA0ZLZhYNxtiTUu7ROwvkrS+N6fIid1X9
         7QOM1KMH26+IKhEUwKTdXXLwE1BwW8uhm+8SyivDAW43K7evLXGQv/QrFGCe/Pv12lw5
         Rb+xa5UHiyvIgxGA9N7UpYn5b1ipLYGBnYnZzS7iEeF4AQ9dKGAvfmy4wdBsf8xeQHOj
         GcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=nVvrd/4gPehvCF1j59+Xexug3ddL/zOX6NDGUcJwgnA=;
        b=QG+We8CsB+tGj2BYheafQWsZW/14rObBI49GB1MZSskewhxN1FavAhoYE4ntHvAinL
         LbmpmE69ASe/drEx4vKCI6b9Luw63C24D3Nt/1yJaN31ZTnAAdBFuMxhDFu7mjzQamf6
         NLsIbDquLKStz8MKEdEq7jxRoJXManRZBBYR1Rr68ZwWQ8YGRKxU9ii+aht97iF5dZI+
         e8ybkoqT6pMkfbfAAPtGwXi1bNGwrfflIdBTqkJzaiIZjkRsqz0OLGc7UcQOi7WvG2cB
         SZOF1lff2PSQoEm+R1UduV5jFJC/uzU6oOOhsCKjognC0HdP8nu9WMT/m9lmDzH3ty38
         1PwA==
X-Gm-Message-State: AOAM532ijyDXiE87Mvi9DetnUAXTskyLQG1rwYmQBfdlq9xlW5b92K+o
	OJFWy2/gTxoBF/vr5iGc+lDz+A==
X-Google-Smtp-Source: ABdhPJyz7Ix+zgmc7bZkms0yQWWIpAnIgekw7RmjQEOk+bEuvZBV774uADhHu+N3XM8H8ImsiobPhg==
X-Received: by 2002:a2e:8118:: with SMTP id d24mr1718148ljg.105.1611301356768;
        Thu, 21 Jan 2021 23:42:36 -0800 (PST)
Received: from jade (h-249-223.A175.priv.bahnhof.se. [98.128.249.223])
        by smtp.gmail.com with ESMTPSA id r29sm850730ljd.54.2021.01.21.23.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 23:42:36 -0800 (PST)
Date: Fri, 22 Jan 2021 08:42:34 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: op-tee@lists.trustedfirmware.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Rouven Czerwinski <r.czerwinski@pengutronix.de>
Subject: [GIT PULL] OP-TEE driver fix for v5.11
Message-ID: <20210122074234.GA1074747@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small patch taking care of a rcu_sched trace in some
corner cases when OP-TEE is invoked.

Thanks,
Jens

The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:

  Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)

are available in the Git repository at:

  git://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-rcu-sched-trace-for-v5.11

for you to fetch changes up to dcb3b06d9c34f33a249f65c08805461fb0c4325b:

  tee: optee: replace might_sleep with cond_resched (2021-01-21 10:36:48 +0100)

----------------------------------------------------------------
Fix rcu_sched trace from OP-TEE invoke

Replaces might_sleep() with a conditional call to cond_resched()
in order to avoid the rcu_sched trace in some corner cases.

----------------------------------------------------------------
Rouven Czerwinski (1):
      tee: optee: replace might_sleep with cond_resched

 drivers/tee/optee/call.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
