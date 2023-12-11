Return-Path: <SRS0=WmvE=HW=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F206C4167B
	for <soc@archiver.kernel.org>; Mon, 11 Dec 2023 10:52:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 24760C433C7; Mon, 11 Dec 2023 10:52:59 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 459C8C433C8
	for <soc@kernel.org>; Mon, 11 Dec 2023 10:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 459C8C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5ca1b4809b5so124054a12.3
        for <soc@kernel.org>; Mon, 11 Dec 2023 02:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702291977; x=1702896777; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dy0Zb8GZwtRwUsfyN7YDaLjZK7xM4pji8PYYJ7g0zJs=;
        b=tt2hHYrbtzjVneuLunjKjGAafWKnjQiT3/ZzGi+sg5x91mYCnfrhAxqAReHhezGs2w
         TH4ZOkdKARXPKux9fob3nZUNewZNtPHRdFvbA1HFEzoD7fIiM61HlPxx+9KE+Qzjzxdi
         MdidVBR4iH/E+OgZKoHSuSWHUcQ+NDA55N6ZXruTbZ0Zoq0tv/IeWkcOsFmEmFJX6Gaj
         2oF/ufJlRSP9thRz1XubEEgNgtC76M1L8j6pyCvyO7WBsRE4tljbiGcqdZE5YQylOD+h
         VsGtpcaA6lpr9aFEGmLK3CXQYZtFm0Q2riDt4KeearIzeEmTwmW13ozyuO3oVyyDxhtZ
         WquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702291977; x=1702896777;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dy0Zb8GZwtRwUsfyN7YDaLjZK7xM4pji8PYYJ7g0zJs=;
        b=R6V3vBpgaj08pL0YzKsMuXBa41sADHszWcAzti1wFKC8UieYYocFvLGqrTCjHE1526
         j7QdygQfmaCRfX+CAk1sAFl031iFtUnhZExcwECaKCTvXla+HIG2KUcBi+UTFEIYw7Mg
         ThwVhugwy92SRwa/4lNIDD73VY+LxO+Q+qXOJVge4G08wY8wR5P+p6FSXJYxh9kj9y4u
         7phhBoDxuQqPUKnkbUsI/wusC5RvLuUCUwXZKpQjjfvYgSIkLBwaiuZRtEzh/40Ma1vI
         bwNd3ID71wVFYp57+B9NZ0aXCTaGSaI0yT2wOUinoH2LLLtivohf5JVzMi+NL06OeHRm
         pPBg==
X-Gm-Message-State: AOJu0YwMlaW5zooT/4a2kcGOiwE6No8VPvLN4H7jfXqo1OD857t3OgnI
	O+bj7n2/B8EVTzTNdKLETpPH5W/ivZRZQclGvJY=
X-Google-Smtp-Source: AGHT+IGlfs9NOB4Bdlr8Do475taU6StZskH8gQC08vA1+lCvO27M00ERC6HaYrxRCQlP8keYAbBjFA==
X-Received: by 2002:a05:6a20:394a:b0:18c:ab4:f6c9 with SMTP id r10-20020a056a20394a00b0018c0ab4f6c9mr2003960pzg.56.1702291977599;
        Mon, 11 Dec 2023 02:52:57 -0800 (PST)
Received: from rayden (h-217-31-164-171.A175.priv.bahnhof.se. [217.31.164.171])
        by smtp.gmail.com with ESMTPSA id 19-20020a17090a1a5300b002802a080d1dsm7302776pjl.16.2023.12.11.02.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 02:52:57 -0800 (PST)
Date: Mon, 11 Dec 2023 11:52:49 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE FF-A asynchronous notifications for 6.8
Message-ID: <20231211105249.GA587253@rayden>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull these patches that enables asynchronous notifications in
OP-TEE FF-A driver. This pull request is on top of the
"system_thread_for_v6.8" pull request to avoid a merge conflict.

Thanks,
Jens

The following changes since commit 4b391c9c37646f25118355f414b9e6d9fefe782f:

  firmware: arm_scmi: optee: use optee system invocation (2023-11-17 15:48:03 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git tags/ffa-notif-for-v6.8

for you to fetch changes up to d0476a59de064205f4aaa8f7c6d6f32bc28a44d4:

  optee: ffa_abi: add asynchronous notifications (2023-11-17 15:55:41 +0100)

----------------------------------------------------------------
OP-TEE: asynchronous notifications with FF-A

Add support for asynchronous notifications in the OP-TEE FF-A driver. This
is the FF-A counterpart to the asynchronous notifications already
available in the OP-TEE SMC ABI.

----------------------------------------------------------------
Jens Wiklander (2):
      optee: provide optee_do_bottom_half() as a common function
      optee: ffa_abi: add asynchronous notifications

 drivers/tee/optee/call.c          | 31 ++++++++++++-
 drivers/tee/optee/ffa_abi.c       | 93 +++++++++++++++++++++++++++++++++++++--
 drivers/tee/optee/optee_ffa.h     | 28 ++++++++++--
 drivers/tee/optee/optee_private.h |  9 +++-
 drivers/tee/optee/smc_abi.c       | 36 ++-------------
 5 files changed, 155 insertions(+), 42 deletions(-)
