Return-Path: <SRS0=sUSC=3S=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BECEC433FE
	for <soc@archiver.kernel.org>; Fri, 18 Nov 2022 12:18:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 167DAC433B5; Fri, 18 Nov 2022 12:18:22 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 26DECC433D6
	for <soc@kernel.org>; Fri, 18 Nov 2022 12:18:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 26DECC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id c1so7921147lfi.7
        for <soc@kernel.org>; Fri, 18 Nov 2022 04:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Ww17wU4XE60JKwlSWPDqz6kaKQUbc+gNj6D8T4n4z4=;
        b=CdY/jY/lkuKG4qpVE/hau8sU8G4Fp0U67Bd1POFH63wYcEEr4QC5XOtFacbi/JmPh6
         1cyEbTu2K1gszHlDzuAmf5mzVChCUI51QLJf7ZwJNDrqI5IrpPC/GFX68kAbt+ZxYTzy
         CrZRyZ0p7SLj63O673/r6AgATQhGhfecN2iEc9INPQG1BS8jIKX3EjUJDDUrWlai8XEA
         ixl1/ONMpwZR0ys43aqa+khwmT/JNJHqIcwkJmKqkZXI2lAU/XMGhMrFEBQ6yiwoXJ8g
         kpGbBKNxVQnl68AjB8mhZrD/GIiG5YLaLd87C9P5ZMpOg5+zXFzrgNuFCI87vakJ1086
         ywhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ww17wU4XE60JKwlSWPDqz6kaKQUbc+gNj6D8T4n4z4=;
        b=X0YKX+UI0N4UBMi08w1RM6LfuUU1cqCmE5SSHEItcZbwRt3aPFNtVy7W37bzX+/y6Z
         eGd7bvHOuHfWGq2E/10M1s+rKoDxJyhDczWnmpV9gIAPziw1K+Bgz7U+TlY7ka5TpqRC
         Y7PEqy+u569rMJKy6xAuLSMqJSDagt35c5fnFD60aRuwnae2IS7Er+xXh4FWVyh6MzIx
         dIW6xGDPgfDgg8jVsDebE00HjNjqBRsOoGIQOZOCpbCJrao4Taj/QKDU9VCe6i5MNUmx
         HEaRUvcH4D146cPr5VYo8S7pjb4LZlp7GG5hHl+s6AJW+f11N3LeAHrMDWgBfH8vigLC
         BBQQ==
X-Gm-Message-State: ANoB5pltwGs3Bag5jL65endR9/20bPbI5iBcD68QJ4vioecJ0a+IWMdE
	dibJA/A3CTzY49wy132ZInm4Gw==
X-Google-Smtp-Source: AA0mqf7CHdPGUaTnQbcS7YC27XSAfVUWm39zaCxrwZQ4k+ZwVIgfeoyEov9b5E5kvT+xXnoC7xrpjQ==
X-Received: by 2002:a19:5e58:0:b0:4a7:5a63:71e1 with SMTP id z24-20020a195e58000000b004a75a6371e1mr2441034lfi.399.1668773899111;
        Fri, 18 Nov 2022 04:18:19 -0800 (PST)
Received: from jade (h-79-136-84-253.A175.priv.bahnhof.se. [79.136.84.253])
        by smtp.gmail.com with ESMTPSA id bt26-20020a056512261a00b004ab2cb8deb5sm640880lfb.18.2022.11.18.04.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 04:18:18 -0800 (PST)
Date: Fri, 18 Nov 2022 13:18:16 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] Add __init/__exit annotations OP-TEE driver for v6.2
Message-ID: <Y3d4CHWl3Ofx5OrX@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small patch which adds __init/__exit annotations to the
OP-TEE driver module.

Thanks,
Jens

The following changes since commit 4fe89d07dcc2804c8b562f6c7896a45643d34b2f:

  Linux 6.0 (2022-10-02 14:09:07 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-for-6.2

for you to fetch changes up to bd52407221b4702af690456b2b6006fa6440e893:

  optee: Add __init/__exit annotations to module init/exit funcs (2022-10-11 11:20:16 +0200)

----------------------------------------------------------------
Add missing __init/__exit annotations to OP-TEE driver

----------------------------------------------------------------
Xiu Jianfeng (1):
      optee: Add __init/__exit annotations to module init/exit funcs

 drivers/tee/optee/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
