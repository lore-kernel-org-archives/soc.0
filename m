Return-Path: <SRS0=cXzf=XN=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A16BC43334
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 13:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 66539C341C6; Fri,  8 Jul 2022 13:46:12 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7A65EC341C0
	for <soc@kernel.org>; Fri,  8 Jul 2022 13:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7A65EC341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id m16so4128868ljh.10
        for <soc@kernel.org>; Fri, 08 Jul 2022 06:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=ftCQgL1IH5y3XBplqV417/ir/b+4fi5ovTGrT24Sbrg=;
        b=XvzotjOmwUMkwmQCk6CPPiN8GmYCTOGrvE+49z1IZJ4hG+aLC//O1xUhtGVYz3N/+v
         WzV2qHB5lsvqxhvw4OXHvOEK4m+FSIYo+ADgxoeKmQngq/wQemhmN6OWKnQLbcC5wbh4
         Y43Vzaw6/xC99ARj/8JpAqatDCHqXRFkhT1ojY+C0F81cDeYq3E4IZnEj/P0r2Q6MFoT
         kYkY2zaHx6zz6eIg7lKHhDDGJgY7OX+ILHAqzd0ibBfjpIH9fk+/AHK+FvY8JDrMPb3f
         dKtKulWGrNxNW/7gYhkvQI1XLGj1uK7e5UEZxOh21vCQdJWHEzKkxZfj3ctpyqlDZlUq
         fMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=ftCQgL1IH5y3XBplqV417/ir/b+4fi5ovTGrT24Sbrg=;
        b=fCnC5H/03G8ppRQJ1OTbW/6RK4Dh5BVUkkUPRK0yLLpCqM4E4hXE/yxQpLiJnnlCMg
         e4QkrPERwfeFLorLkBmm9EDThmGJs+OtcWf/vgSJqpVR2N71xPp1kpDB/4sgwoBgtH/Y
         44T+kF4bhwXpi9VlbimsXNAq8VzOqCGvx8HDo0fk4bimf2VuflJUjhthTP3Xhki5pmGB
         N4v3g/jEC9+WHSpvxmKTsoi4KxDKH/LUhKUAbjsSwRFyysWEMwGKMj0HIdEWiSBLsZQu
         UKacQbGjsnn0rTiivnD0MK2jOhWLwH48iMxOHwseGKgnncRrIrzQGD/lhPMOf+/VtQx8
         OGlA==
X-Gm-Message-State: AJIora+WcX+S4BUUBcuiIW0aumOwnkdGNOtU9MHXQ6Y+k77lcXA16y4O
	1kKPkkHJjitHw7KYuuCHeXCL3A==
X-Google-Smtp-Source: AGRyM1saYxhEp3LUGYaX461stWYeGJkKo1DfCNWmUKpN2FBs85Vqv9mvQUqJqW133/eB7oRP6K9qsQ==
X-Received: by 2002:a2e:b8c2:0:b0:25b:6b0c:34e with SMTP id s2-20020a2eb8c2000000b0025b6b0c034emr2047024ljp.397.1657287969517;
        Fri, 08 Jul 2022 06:46:09 -0700 (PDT)
Received: from jade (h-79-136-84-253.A175.priv.bahnhof.se. [79.136.84.253])
        by smtp.gmail.com with ESMTPSA id u10-20020a05651220ca00b0048957b0c58fsm583953lfr.47.2022.07.08.06.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 06:46:09 -0700 (PDT)
Date: Fri, 8 Jul 2022 15:46:07 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE Fixes for v5.19
Message-ID: <20220708134607.GA901814@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull these small fixes in the TEE subssytem. The OP-TEE driver
patch fixes an error which was introduced during the merge window. I'm
not sure if the error really can be triggered, but it would be nice to
have it fixed before the release.

Thanks,
Jens

The following changes since commit b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3:

  Linux 5.19-rc2 (2022-06-12 16:11:37 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git/ tags/tee-fixes-for-v5.19

for you to fetch changes up to e5ce073c8a1e01b215a5eb32ba48f8d17ded3bd5:

  tee: tee_get_drvdata(): fix description of return value (2022-07-08 10:51:24 +0200)

----------------------------------------------------------------
Fixes for TEE subsystem

A fix for the recently merged commit ed8faf6c8f8c ("optee: add
OPTEE_SMC_CALL_WITH_RPC_ARG and OPTEE_SMC_CALL_WITH_REGD_ARG").
Two small fixes in comment, repeated words etc.

----------------------------------------------------------------
Jiang Jian (1):
      optee: Remove duplicate 'of' in two places.

Marc Kleine-Budde (1):
      tee: tee_get_drvdata(): fix description of return value

Yang Yingliang (1):
      optee: smc_abi.c: fix wrong pointer passed to IS_ERR/PTR_ERR()

 drivers/tee/optee/optee_smc.h | 2 +-
 drivers/tee/optee/smc_abi.c   | 4 ++--
 drivers/tee/tee_core.c        | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
