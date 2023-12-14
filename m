Return-Path: <SRS0=A5Nd=HZ=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26C0C4332F
	for <soc@archiver.kernel.org>; Thu, 14 Dec 2023 13:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 65F71C433CA; Thu, 14 Dec 2023 13:22:42 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5FA2EC433C7
	for <soc@kernel.org>; Thu, 14 Dec 2023 13:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5FA2EC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a1ca24776c3so123251766b.0
        for <soc@kernel.org>; Thu, 14 Dec 2023 05:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702560159; x=1703164959; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6kFNgqKRDC3NjWVK8VqrRNN6lgWk3KBU/xIa7c195zw=;
        b=ElZZnsyerJe0YuOG/jKO5krE0S7l2gffZn9EvLG6PgakAUF03t/42m23Hh6du1hCqe
         u2MwLF+oLM+2mfdv73J/JBB3FdhKYJv+XwlyxDZMYNAChpDV8XMY0AvchZ3MmwUMOZdR
         DaJ0dTqz1QiAWsRuFSLCun2MlCxnFS/Hc5GuJRXroJa8dK+62rn0q1FmwrygGQZK3YzV
         IHGT15w6DTwAcyQPSHI9l31PyCCxx5e3hmj+LCLi9dtYh1GiSlK7ZaGmXJ6xucLKZ40D
         igF72eKTXHVIbJxaGZgRgb22Tb6NKK9Th2sQGZTwla3Svy+q58+LD2iuFTlXxvS6ORSp
         NOzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702560159; x=1703164959;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6kFNgqKRDC3NjWVK8VqrRNN6lgWk3KBU/xIa7c195zw=;
        b=o3NSlxtyUT1mO647xc3u+6T/cYiWxt3MSr9PIBZd0fvYWlRjZyZJpAZgw+UaDZTMsr
         AfOmKfbv036VUAF8dti5/c3H0YYZZFY0vvdl1LP0h4R+Iwd+xclV3RcmGsOQ7K7pIFxq
         cu+m1undrCyqC7vy5stTNlPwD2sUZbxJ385gHVVd6iK03cGGHTRQS4w7OL+XFxnFk3E6
         PT869S0lRTrOa9oPhVMMFmBLXBcmJ6lX1d3s6WPBz/z7YAlUFKfInaSJsFyv7UjbPu0t
         JJ6YlfHAGKyCuweXjt/NonINAvjz+tBn+IAw1lLeEWLLnYqlRNdqLnaTGkVtlqMgkCxq
         MGUQ==
X-Gm-Message-State: AOJu0YxYT/H2RS9fjUrXr2eZKsoc74TgA+1MGJi+hfcZjBtD54reulqJ
	qI37NOEVoJRmJWyWVPVIro32sQ==
X-Google-Smtp-Source: AGHT+IE+g9e4kcr5bsiUNaytYbmJ3YVNdtcal3YY4PO91GdiuKEU4m0lMHkZrYuFRLn0lXzE+X5jgQ==
X-Received: by 2002:a17:907:8d8:b0:a1c:7c86:8b79 with SMTP id zu24-20020a17090708d800b00a1c7c868b79mr8265198ejb.26.1702560159620;
        Thu, 14 Dec 2023 05:22:39 -0800 (PST)
Received: from rayden (h-217-31-164-171.A175.priv.bahnhof.se. [217.31.164.171])
        by smtp.gmail.com with ESMTPSA id vo10-20020a170907a80a00b00a1d17c92ef3sm9357935ejc.51.2023.12.14.05.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 05:22:39 -0800 (PST)
Date: Thu, 14 Dec 2023 14:22:37 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE cleanup for v6.8
Message-ID: <20231214132237.GA3092763@rayden>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull these two small patches for the OP-TEE driver that remove a
redundant custom workqueue and add a description of an argument of a
optee_handle_rpc().

Note that this pull request is made on top of optee-supplicant-fix-for-v6.7
7269cba53d90 ("tee: optee: Fix supplicant based device enumeration")
which was merged into v6.7-rc5, but in turn was based on top of v6.6. I
did it like this because the Tested-bys where provided in this context.

Thanks,
Jens

The following changes since commit 7269cba53d906cf257c139d3b3a53ad272176bca:

  tee: optee: Fix supplicant based device enumeration (2023-11-03 09:27:20 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-cleanup-for-v6.8

for you to fetch changes up to b19773a1c6c02f5efc35e9f506aeddd2c7d2ac29:

  optee: add missing description of RPC argument reference (2023-12-11 15:02:12 +0100)

----------------------------------------------------------------
OP-TEE cleanup

- Remove a redundant custom workqueue in the OP-TEE driver.
- Fix a missing description of an argument to optee_handle_rpc().

----------------------------------------------------------------
Etienne Carriere (1):
      optee: add missing description of RPC argument reference

Sumit Garg (1):
      tee: optee: Remove redundant custom workqueue

 drivers/tee/optee/core.c          | 13 ++-----------
 drivers/tee/optee/optee_private.h |  2 --
 drivers/tee/optee/smc_abi.c       |  1 +
 3 files changed, 3 insertions(+), 13 deletions(-)
