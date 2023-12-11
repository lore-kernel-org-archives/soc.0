Return-Path: <SRS0=WmvE=HW=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8A6C4167B
	for <soc@archiver.kernel.org>; Mon, 11 Dec 2023 11:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B2771C433C8; Mon, 11 Dec 2023 11:58:23 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF53CC433C9
	for <soc@kernel.org>; Mon, 11 Dec 2023 11:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF53CC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d1e1edb10bso40556105ad.1
        for <soc@kernel.org>; Mon, 11 Dec 2023 03:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702295902; x=1702900702; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YpvWYxjWFurzRqzsLDAXQBY+VL4dQWNhgml/pHM61h4=;
        b=WJKIbrHlqqbMK82h8CM6MEBCj7y2Xe6mvqGTybHQlS7bgVa9ZPYxrKvcRiG5pJAFGv
         X/ne4AnEhUAM3WfWC6cNwQ4tTVDd9GawT+O8W32Mkogx9ToyMK5ARjZFL3Ue8U9aUK0o
         QefxVvrQbQZfltWliKTwwk524jDoiSu24bfC9oyRzsr4z/ZBXFq9MTrqMsZN6DIqI8gi
         jxbRgN9r7NyTyXZhFlW+KhCBtIztJI/2dA9mnC8UYgZNQGPZW6PviaEJnOJKgdarXGlc
         ToVPuz9XO1WZOAE7ajg/kgqw/XrqgspR7KWbuV1v9mI3wyjHtAGJKte5a3rQPeHnhkUt
         9uRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702295902; x=1702900702;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpvWYxjWFurzRqzsLDAXQBY+VL4dQWNhgml/pHM61h4=;
        b=u6oe9lHt1BpytruwMu6rYBt42bZYtJeUcgz2BwfMi9wUJt+zQ4I1iQioahndGxE3Xq
         BOjCxe0K42rI6rNGD04WyCnxCdRqk2D9Q5cDPzhUbEQPsH5FXiB8tAPmVtQZoLzT84Y8
         9+dY1xC/gbcAeRbPuXzyS7iFJSsMmmA9PHci+Q5YWTJTC+hKL6wwUqueQ9+UDfZH8VOB
         lWQbaKsENEmvHbDgckN1rq391BuuM4mdYCfHJGcfAGAT4VkUQbAtbH5ZuZiAyHLP7DA9
         zWmo9cqOQI2n531VxEdD1Ft5kDI9PVxM8GQlL9A48pUCwG4bw+SlwnAmFlmfbszw1akb
         +xMg==
X-Gm-Message-State: AOJu0YwnkqJBDZEp869EPwrmcealtGqzzGeJw6ECcSozhynVGaNAaIad
	h7pqc3/F2hqpnuUA2oeJ32+j+A==
X-Google-Smtp-Source: AGHT+IHFPlHWB9wdlQAUWE/h5+IeqqZ6sNNZVSere++9j8M/zONuplMC+AVS+J65oKa/uYbH54j09g==
X-Received: by 2002:a17:902:e789:b0:1d0:6ffd:e2d5 with SMTP id cp9-20020a170902e78900b001d06ffde2d5mr5193351plb.111.1702295902169;
        Mon, 11 Dec 2023 03:58:22 -0800 (PST)
Received: from rayden (h-217-31-164-171.A175.priv.bahnhof.se. [217.31.164.171])
        by smtp.gmail.com with ESMTPSA id z5-20020a170903018500b001cf65844874sm6468291plg.45.2023.12.11.03.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 03:58:21 -0800 (PST)
Date: Mon, 11 Dec 2023 12:58:15 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE kernel private shared memory optimizations for 6.8
Message-ID: <20231211115815.GA616539@rayden>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull these two patches that optmize how the OP-TEE driver private
shared memory allocated as dynamic shared memory.

Thanks,
Jens

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git tags/kern-priv-shm-for-v6.8

for you to fetch changes up to 225a36b96359aceaa9a6399f2dff99627397e637:

  optee: allocate shared memory with alloc_pages_exact() (2023-12-04 14:48:42 +0100)

----------------------------------------------------------------
OP-TEE kernel private shared memory optimizations

Optimize OP-TEE driver private shared memory allocated as dynamic shared
memory. Both to handle larger than one page allocations and for more
efficient memory usage.

----------------------------------------------------------------
Jens Wiklander (2):
      optee: add page list to kernel private shared memory
      optee: allocate shared memory with alloc_pages_exact()

 drivers/tee/optee/core.c    | 44 +++++++++++++++++++++++---------------------
 drivers/tee/optee/smc_abi.c | 45 +++++++++++++++++++++------------------------
 2 files changed, 44 insertions(+), 45 deletions(-)
