Return-Path: <SRS0=Z+Dw=L6=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD6DC10F1A
	for <soc@archiver.kernel.org>; Thu, 25 Apr 2024 07:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EE9A1C2BD11; Thu, 25 Apr 2024 07:28:40 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0AEFDC113CC
	for <soc@kernel.org>; Thu, 25 Apr 2024 07:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0AEFDC113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a58872c07d8so331888366b.0
        for <soc@kernel.org>; Thu, 25 Apr 2024 00:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714030118; x=1714634918; darn=kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpPWV8/b/XqJko0DAoRlntqCOk7cVDc9gpPuKjkpYCM=;
        b=Dv0FxtH3YEd2EQSLepJ6TMXYaTgKGvoEUEl2mLr1gkg41p1uyXaaGsMu4AQQ4ag4YW
         16o1ZWbQPHXNoDXMETt+GBOTK9oJ0wgJe3ek4x4UTs9NoRHGewT2BomBRe8kXhUG58ER
         mnvvkSS1/M9YtLj/809x9U7amzXf4H7+8I6gDP3WVKGXHOCVwIB3PMB6QC0dbPYOnenq
         cV3Oo8s6WTcyU3VUO8YNcFGzOrg4QFtaB0VO9oJ2oOn/Go+pHD81SPYT4mBva7/r4ctC
         PsuNh7dCcWopU9IvVkiy80SpJbP8qpv3ds645RaFtmPmz7RL4vQkfBEWWxLVbhxuxziE
         hNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714030118; x=1714634918;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tpPWV8/b/XqJko0DAoRlntqCOk7cVDc9gpPuKjkpYCM=;
        b=nWnxgnxxPYqnHW66RUyfUO0zUqQlhk7GGhrkQkwlJMTUbqC9poDAYDvaDzwaGw3AW+
         J8YrHUr2dvtb7WQp+DmsHPD9Qwj6U38SvqsB5K9QSjOxX9LjqcSObP+rH3Lh1RjtGbCj
         wJVM0DYsRPlKouBbJSUKIPhqNlwaqmWDQZo3ow8bTg/bgCt/GDT+cHvnimRoXJycWVQU
         4SzvL6W6wPAFFFN4gPd+UZ2IDlPECMjkYxyv31QrQrDzWoX24aiXU1/0W3KjDJvvjUsJ
         nkS/tM0W4qkoHwJNG/tpPvkt7s5TDxfD3NGoOhoQ5tlAIdYw4NM0Pyu0Ok9yF43uLDZr
         eGtw==
X-Forwarded-Encrypted: i=1; AJvYcCWUfejWIrG1W5Fd4rXkWy6dWPlSpdjv48b2mrn2jJAUfzmre14Q+cNfXsNX30qQx2pMDaVrq3M8NYE3TPQNQA==
X-Gm-Message-State: AOJu0YzxvRZIgEmr1l8uAEp11L8VDujiF4XCHu7YQD3khhBvey7FU4Ef
	9Bsq3pd07o7zgY+tiQFgWkXnd+StZrfIrP2edN6I/0pthbtHoZU+XwY/ibGItKM=
X-Google-Smtp-Source: AGHT+IH/B4NfXYRFXAK+21wuV74gKyOJSZMgMpeCfpp6SmwlzduowNdL32OCakM1TBQGncLa8MqbCQ==
X-Received: by 2002:a17:906:15cf:b0:a55:b10c:8f6d with SMTP id l15-20020a17090615cf00b00a55b10c8f6dmr2088208ejd.29.1714030118220;
        Thu, 25 Apr 2024 00:28:38 -0700 (PDT)
Received: from rayden (h-217-31-164-171.A175.priv.bahnhof.se. [217.31.164.171])
        by smtp.gmail.com with ESMTPSA id h3-20020a170906260300b00a559965b896sm6592772ejc.202.2024.04.25.00.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 00:28:37 -0700 (PDT)
Date: Thu, 25 Apr 2024 09:28:35 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE convert platform callback for v6.10
Message-ID: <20240425072835.GA3258167@rayden>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello arm-soc maitainers,

Please pull this small patch converting the platform remove callback to
return void for the OP-TEE driver.

Thanks,
Jens

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git/ tags/optee-convert-platform-remove-callback-for-v6.10

for you to fetch changes up to 5c794301eb4e5373822e8898661bacdc7f46ba14:

  tee: optee: smc: Convert to platform remove callback returning void (2024-03-25 11:51:06 +0100)

----------------------------------------------------------------
OP-TEE Convert to platform remove callback returning void

----------------------------------------------------------------
Uwe Kleine-König (1):
      tee: optee: smc: Convert to platform remove callback returning void

 drivers/tee/optee/smc_abi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
