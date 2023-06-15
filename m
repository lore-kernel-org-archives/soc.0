Return-Path: <SRS0=Yf9c=CD=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BB4EB64D9
	for <soc@archiver.kernel.org>; Thu, 15 Jun 2023 13:00:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2DB1EC433CB; Thu, 15 Jun 2023 13:00:55 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1841FC433C8
	for <soc@kernel.org>; Thu, 15 Jun 2023 13:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1841FC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f64fb05a8aso10545011e87.0
        for <soc@kernel.org>; Thu, 15 Jun 2023 06:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686834052; x=1689426052;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5TctcZvXGN43HwETUwBc1JHngngPXfmJv1grpN3Hs04=;
        b=kWH5wT1655+UGW6aDb53bxMa3hBYH17QrxPTsuS34rPkI7u4/If0ZBBvHfEtUeStHD
         pruKT02Tr8NLLGcgRr1TK7G2XHjFbZ8e2sdxJg3ERDs/kgZEEJYqLQeee++MYsEWpj1Z
         75Thz7oRqM3LRvJWI7ulD1ArHNj3llb7ylJ7HnmUn7o7mlcQp/Uvi6zY7D5dScmS0X03
         i3V6q7GBE7qQo3b1C3Kgs/oNgCVyOGWTDmUoUr25o1zw1xZuvPrS78pgq/q9ns7q2R9p
         FrsaTnnM0L7C/Ii0Ht5Xg64CoisL0wJ8Q2H4ZK1LZvVgtoXFqSranXUZHnqgqVUs2bga
         kgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686834052; x=1689426052;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5TctcZvXGN43HwETUwBc1JHngngPXfmJv1grpN3Hs04=;
        b=EKiV+pwvHAHFZ5yAHUux+wbr3lu4rFDi7tdzePvSGcqsLpNb+EKgCacTt4BuvWLaCj
         JyiuPURcJyGMPPjUfoiM9HaOPo+mNC1rmQEzgy1VWKJryDm5O0L2UURibcJ1U9aFT2QM
         XSgaImt9WUbmatLbe+IZgO0HOK9mDw6UEHd/8PIOpwxJpybJdG6akwurRkipRFmnDjlv
         vVECB6WUkvKpbzJzIwbvnARhTn4v/esMOLZjlVw64CWYYnU4/pv6JxZYyO/g7OVd1n4v
         cPIlfDZvXGyegYNwspD7eLaWen682GDldVLEpP/tpxOEAshO9AOJXK1QhBXJnYXuCdqP
         3BBA==
X-Gm-Message-State: AC+VfDweGXqsQTn0QJJ5oCcymy3PdcGhTtjyrRsNSGNCSjo/pXS8Ge14
	Dxlwql2qJgzgMSE7VWjCjQv+xw==
X-Google-Smtp-Source: ACHHUZ5WnNmjpeWjgFMIShPC0wbAbHETohuoX3sQ4DalX61hG477WQFaQIWdr0WyVeYjQBNyGwTjjA==
X-Received: by 2002:a19:7b05:0:b0:4f1:3eea:eaf9 with SMTP id w5-20020a197b05000000b004f13eeaeaf9mr10605445lfc.24.1686834051722;
        Thu, 15 Jun 2023 06:00:51 -0700 (PDT)
Received: from rayden (81-236-179-152-no272.tbcn.telia.com. [81.236.179.152])
        by smtp.gmail.com with ESMTPSA id d29-20020ac25edd000000b004e83fbba141sm1860644lfq.164.2023.06.15.06.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 06:00:51 -0700 (PDT)
Date: Thu, 15 Jun 2023 15:00:49 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] Use kmemdup() in OP-TEE driver for v6.5
Message-ID: <20230615130049.GA979203@rayden>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small patch to the OP-TEE driver that replaces
kmalloc() + memcpy() with kmemdup() at one place.

Thanks,
Jens

The following changes since commit f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6:

  Linux 6.4-rc2 (2023-05-14 12:51:40 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-use-kmemdup-for-6.5

for you to fetch changes up to 6a8b7e80105416cc7324fda295608ea2d3f98862:

  tee: optee: Use kmemdup() to replace kmalloc + memcpy (2023-06-15 08:49:55 +0200)

----------------------------------------------------------------
Use kmemdup() in OP-TEE driver

----------------------------------------------------------------
Jiapeng Chong (1):
      tee: optee: Use kmemdup() to replace kmalloc + memcpy

 drivers/tee/optee/smc_abi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
