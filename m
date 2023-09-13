Return-Path: <SRS0=t6ZB=E5=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F4ACCA550A
	for <soc@archiver.kernel.org>; Wed, 13 Sep 2023 08:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DE22EC433CA; Wed, 13 Sep 2023 08:39:14 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C6A8AC433C7
	for <soc@kernel.org>; Wed, 13 Sep 2023 08:39:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C6A8AC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-502a4f33440so7671196e87.1
        for <soc@kernel.org>; Wed, 13 Sep 2023 01:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694594352; x=1695199152; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zvLDw+ksZq5rBFlvYEdzhLk43B1rOA0RI1tJreD8APc=;
        b=JvkdB+SEJGeUUYGK5HcpLE7Bohd3yW/r4wjsYYCtUEXIwRHMLX+5ijTfoBkPd5g1O7
         1uVdEA25Pdmzixx0s3PKzeXCQY1jBiO4is73ttur7Zz/9YDGpfaQ9sWMytmTGnXNdG7I
         bIooDO9myLTnQ5bubqpjvvkVu1sIZi5mSFMYeGuFtx0bq6dD/Ee1/aqNQYx7XRW3PWQF
         nJxpaH8tVmyWN2sRByvsTEw5+7JlEHR1Sioye/inRVRNU9T/0oEgNtIbD/LUXk8l1XDM
         j1B6lGOeQSYLZ6kIgiHcdnQpWprqcF4CWM8Ia+pdxAf4yY+xsKvkW19wdLtGXJt0l10b
         nmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694594352; x=1695199152;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zvLDw+ksZq5rBFlvYEdzhLk43B1rOA0RI1tJreD8APc=;
        b=FncgwlA5085ZsA5Jpv1UGfPIlQakz7K0TMo0bjH2yU2pbmByqWxy2QGPu159FRVKd4
         RarBGxpzwas9/Lv5fzSpE8GUtUe/MvNq2JYFJLMNkAYszTuDL/re5DVLGbZHq/E0C9Va
         5fY3YrTNi8IsucQTE9gQ09kEJkmQgRmjyhfDsnjhDWUkn+t3rY3Rz/yNPEkWVoy+i1/N
         RH9A7doY8v+1xA48mrihpRiDJTMKNTeBSeej6pxdShAybsJRhyR9i407dt68uFAjdP88
         8QWR9H1XGHwrzJPP+C40ARK1l+fhgXmbTPmKrPPGK37G9gr50WWEdYKNI4DZTWPp4oLc
         C6qw==
X-Gm-Message-State: AOJu0Yy4Txid6mHV54Yjk4fQi2Gm9Z9BxUWbIeEc+48DQWJLVd06qBNU
	8+xTr/IlCFpVw2DpUNqzGAr9NiVMgDRHwIPgrVU=
X-Google-Smtp-Source: AGHT+IEnqYzccHV7NjaZ5GV7Q/W3n1TllGCZhHHJfaxw1ZwznaGRru1QoxEH45p7p6HhLVN0AL2p9A==
X-Received: by 2002:a05:6512:3b2a:b0:500:a396:b2e4 with SMTP id f42-20020a0565123b2a00b00500a396b2e4mr2030412lfv.58.1694594351688;
        Wed, 13 Sep 2023 01:39:11 -0700 (PDT)
Received: from rayden (h-46-59-78-111.A175.priv.bahnhof.se. [46.59.78.111])
        by smtp.gmail.com with ESMTPSA id eo30-20020a056512481e00b005009aa86582sm2044604lfb.55.2023.09.13.01.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 01:39:11 -0700 (PDT)
Date: Wed, 13 Sep 2023 10:39:09 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE fix for v6.6
Message-ID: <20230913083909.GA473533@rayden>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small fix that removes a few unused function declarations
in the TEE subsystem.

Thanks,
Jens

The following changes since commit 2dde18cd1d8fac735875f2e4987f11817cc0bc2c:

  Linux 6.5 (2023-08-27 14:49:51 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git/ tags/optee-for-for-v6.6

for you to fetch changes up to 069969d6c5264d2348fd6cf0cedc00fd87ff3cee:

  tee: Remove unused declarations (2023-09-13 08:16:24 +0200)

----------------------------------------------------------------
Remove a few unused declarations in TEE subsystem

----------------------------------------------------------------
Yue Haibing (1):
      tee: Remove unused declarations

 drivers/tee/optee/optee_private.h | 2 --
 drivers/tee/tee_private.h         | 2 --
 2 files changed, 4 deletions(-)
