Return-Path: <SRS0=ONAo=6Y=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE033C64EC7
	for <soc@archiver.kernel.org>; Tue, 28 Feb 2023 19:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AC8C6C433EF; Tue, 28 Feb 2023 19:42:22 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8CCE9C433D2
	for <soc@kernel.org>; Tue, 28 Feb 2023 19:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8CCE9C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id i9so14695665lfc.6
        for <soc@kernel.org>; Tue, 28 Feb 2023 11:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CU51/xRqo0gCQSPRwoSaK4v3RgM9oPo21XTP6YwhidI=;
        b=yNpxTDhlgy1P6lSm1oufFnRV2trLMxYPixpNT/OpkLpbpJPGOlpkPLrSKKyBkUoO0H
         k4yNle3XfENu2W7/bPCyB5QVGO6gmIunpSxfm8Jt/izwxysIffUcEQvLFiki8UCRIDt2
         iy0ayKlH0C2+PhYY7t3MwibImgXgdLXFNuoxFD5CvRyCMy5jskjMD7LcfgAVY+hKAHo2
         xoYBCtUNQflDtH4l+UNQBxjCqomNfzgn9P7dCP0FHy1ksQmAc1ve9Ts6B0cQuLWG5pwK
         lDmxRhsSj4uSL5orMIZ0WbW3PM/VAH5B4kmJ1mBlMp9i/JY/P0LxVoH0IfsnBexAVGXs
         g8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CU51/xRqo0gCQSPRwoSaK4v3RgM9oPo21XTP6YwhidI=;
        b=hhpOoPVW11xRLK6EVAhHviCrI9oDl/sTmJns+jVdguXpwdlDtUQwsT1khpTvVe5lyo
         Ufl1iJ6A3niIWH4CaGsxrKd1h3TBMlYPLSIHkYIS+4Dt5Zuem9wR4pzOOWdbQ7xXtwZT
         NidC6uqu+TS0qbVmaSKL1q7VBtmf8UM18M6DmCnOe30IIZ8o+IErWefGhfUY3UlaAM0/
         m96uBOEt0H5eHfOXucEJpgpdX+gJyOmiPT7TrIx9UVnwOJ6/L+XyFJdiB83aR6EZNiBO
         maO0925iooBjJWcdSguwrOMiwTz2otlLNlgMWuMXj9IM0f4JYMotmVTTqW7wUaHnfa8w
         4f/Q==
X-Gm-Message-State: AO0yUKVPfkTnQRa82Avmj1eX5TRckLXWrwsUYFZ8uyzWZjLJdFgxiPXb
	uO86jeCP45OlB8p8w0w4swXhkQ==
X-Google-Smtp-Source: AK7set9UI7KQg0PSFsYEjv7ZRTqyk2Ng3E3ZUnkqe/sBq1ZyTCuVK9BhzZO6iQqN5+c7DbLrAxLplA==
X-Received: by 2002:a19:7012:0:b0:4d8:6577:d2bf with SMTP id h18-20020a197012000000b004d86577d2bfmr870791lfc.37.1677613339333;
        Tue, 28 Feb 2023 11:42:19 -0800 (PST)
Received: from rayden (h-46-59-78-111.A175.priv.bahnhof.se. [46.59.78.111])
        by smtp.gmail.com with ESMTPSA id c24-20020ac244b8000000b004b40c2fccfdsm1442158lfm.59.2023.02.28.11.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 11:42:18 -0800 (PST)
Date: Tue, 28 Feb 2023 20:42:17 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] Fix race condition in AMDTEE driver
Message-ID: <Y/5ZGX0lSTnZz27E@rayden>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this fix for the AMDTEE driver in the TEE subsystem.

Note that this isn't a usual Arm driver update. This targets AMD
instead, but is part of the TEE subsystem.

Thanks,
Jens

The following changes since commit c9c3395d5e3dcc6daee66c6908354d47bf98cb0c:

  Linux 6.2 (2023-02-19 14:24:22 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git/ tags/amdtee-fix-for-v6.3

for you to fetch changes up to f8502fba45bd30e1a6a354d9d898bc99d1a11e6d:

  tee: amdtee: fix race condition in amdtee_open_session (2023-02-28 18:39:19 +0100)

----------------------------------------------------------------
AMDTEE fix race condition in amdtee_open_session()

----------------------------------------------------------------
Rijo Thomas (1):
      tee: amdtee: fix race condition in amdtee_open_session

 drivers/tee/amdtee/core.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)
