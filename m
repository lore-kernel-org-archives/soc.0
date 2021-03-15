Return-Path: <SRS0=d50f=IN=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B688DC433DB
	for <soc@archiver.kernel.org>; Mon, 15 Mar 2021 11:37:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7571E64DE7; Mon, 15 Mar 2021 11:37:38 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F105E64E61
	for <soc@kernel.org>; Mon, 15 Mar 2021 11:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F105E64E61
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=jens.wiklander@linaro.org
Received: by mail-lj1-f171.google.com with SMTP id z25so15782876lja.3
        for <soc@kernel.org>; Mon, 15 Mar 2021 04:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=iXyQ5uLBIQL0Ohz4oY8OpYihmmqLiQTm4jdm3uoravc=;
        b=dRPtWgBvIWeoaCmPztmKyFm5CjYlz6alSoMcVYp41t+L5GdZOmdjXxA9WiJrkhdvsG
         telcqa3jVXiHhvDOT2x5126NMG/uJVWYaJK6yRNp7dQWVmVaboGPh8OehP1eYzAfrlQk
         tfdj9HRh4WjIz6k3z1hCvISs7oJ1VybKH7N3HmAT+qjpO/tO/xKww4MNIRhRXSPN8K8S
         pTyr4w0PVhLaJssNLzzYozRfp6fsuLu3uHR9lfGttTlIWx5vbTBTVfXG7/ulgiknpjVi
         Eui8uYSyxZV7d7Rz9hZ6nBmAs8HXPuDWnTel66UiPXq1AVpatg3qcfWY2yTqU2bxE9P/
         jXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=iXyQ5uLBIQL0Ohz4oY8OpYihmmqLiQTm4jdm3uoravc=;
        b=Ciyc+uPWHH62uS2zvM3y0d8IVB1PqUSNnU9OI+r1hlwT/AuDRPsYxeM9D02cwltKlR
         bVwqce3WxVKlP4l3wEdx/Qk9FyHNoJGMQvCbw28CqYcVyVw7Ob9lNbwS6sXuh79RsIyc
         IVE5VQF8BXh3JhGTXlFqIdWD+8InbCUiZ9ENp8rglp9GtkPPLW4Xu+PHIKT4eynZJ242
         VSAU9nvQ4LVEzfapKk8ACcWQCK03YZ7wbiybA6J8ZtXlxmedu/ke0WSYWSIN3hdHyLqD
         OwX6HTNQyOX2O0nRRtzQXxBVGh+zwIzydb9C03gXhQLT7g+DK394bhIxwtYTIAcTG62h
         Nppg==
X-Gm-Message-State: AOAM532m1zvnaVNh/SFzDAW9DaC8mri39PKgKyLvnEJEAqy9B0HwVBvy
	idxcKGPu7XMxi4lbnr200iIzAg==
X-Google-Smtp-Source: ABdhPJycEH5h6oRqVsK08fMcRac8KL6vv0ODLk5w4mHbkb8jFh4XkKRq8OumBeqEPfsD9rSjoxRJMw==
X-Received: by 2002:a2e:a60a:: with SMTP id v10mr10686235ljp.267.1615808256341;
        Mon, 15 Mar 2021 04:37:36 -0700 (PDT)
Received: from jade (h-249-223.A175.priv.bahnhof.se. [98.128.249.223])
        by smtp.gmail.com with ESMTPSA id w5sm2639274lfu.179.2021.03.15.04.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 04:37:35 -0700 (PDT)
Date: Mon, 15 Mar 2021 12:37:33 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: op-tee@lists.trustedfirmware.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: [GIT PULL] OP-TEE tracepoints for v5.13
Message-ID: <20210315113733.GA1944243@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this patch adding tracepoints around calls to OP-TEE in
secure world.

Thanks,
Jens

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-tracepoints-for-v5.13

for you to fetch changes up to 0101947dbcc3204f08fb5b69a21dbd4b1535cad6:

  tee: optee: add invoke_fn tracepoints (2021-03-15 12:04:01 +0100)

----------------------------------------------------------------
Add tracepoints around calls to secure world

----------------------------------------------------------------
Jisheng Zhang (1):
      tee: optee: add invoke_fn tracepoints

 drivers/tee/optee/call.c        |  4 +++
 drivers/tee/optee/optee_trace.h | 67 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 drivers/tee/optee/optee_trace.h
