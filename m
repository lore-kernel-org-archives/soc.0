Return-Path: <SRS0=HfiA=UX=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B55C433EF
	for <soc@archiver.kernel.org>; Wed, 13 Apr 2022 05:20:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 50894C385AA; Wed, 13 Apr 2022 05:20:07 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7145EC385A4
	for <soc@kernel.org>; Wed, 13 Apr 2022 05:20:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7145EC385A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id u7so1502692lfs.8
        for <soc@kernel.org>; Tue, 12 Apr 2022 22:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=ca0htyBTZDClNQcS0BpnnySSwxIQpPspnwepfriH2zg=;
        b=JOIOBh/n+hVr/JanzyxVVF+Qm1MZZSnmB2+9zH9ZDQaD12D7XKvqwEqhFZmfnHq9KH
         HpN0BW542LZL1NwgfwcUnW/jOTSzccfLl2ZjWKndjHY+z8Djhq9iTmWCYJu1+cnKXVYk
         L/GYRex/oDwV+EpsyM93znh4JGx5R7ggELwuCV6wtnbwV1DwM6CNBRnK1LHsBRZC8OcF
         flD2WhEWdW3B2unyYHqTbuQU9LNDw8Rw/40bk7xMLq/aWZHhnSzOy//D5BuisYw75BGU
         IszKhyUmZJLbFoHuKELwAVsfUrej7LqPAiRg5kYXVV67Rqprfig2BQ/QjmWtJl5zownc
         EHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=ca0htyBTZDClNQcS0BpnnySSwxIQpPspnwepfriH2zg=;
        b=1N7/cJ0FPEEm6/7sFduzK/aTtZOw5AIfqmmpwnZLvafEI73MZyjZ+FvKqQON8NYowG
         Q1XnXbLlmqDMb6dov3NKtY8P6KX8zvd+Ck3DCWjBPw+RGJow5/Cl6QgsPgy0cCgswtZT
         DrwmlTDKhJLXbru1TzKMPQ/EPmlpNmCbFjzeYv9IA1MgJU0+kFfcZW5fUMciAb3tXBsm
         6HCWttjis9zExcunDnx+69vvplVXq8ydjSbEL7ei8E5Ae9pqYbcXJght+EqD4dHt4t18
         DkWr6/zh3cyNhjRK/gwcCKrDFpVzKyTMAu7iyCg9IPfOmqccz6H5vSOICE83du1fK/fk
         dIMQ==
X-Gm-Message-State: AOAM531YRblruqe74pVDZw0qKDGuMCDhUa1AVCDQCncb+vIK6tflG0en
	HKUKOW8X+CqZDAtZkcfKInv5YA==
X-Google-Smtp-Source: ABdhPJwpIiCQxFPp7E79MGXcRSajv7a3kTj8WKIJPwkZ1nV5/rQhPlPMTlX/5paOpqG9h/YTAq2J+A==
X-Received: by 2002:ac2:4290:0:b0:464:f225:1a37 with SMTP id m16-20020ac24290000000b00464f2251a37mr20940630lfh.140.1649827204493;
        Tue, 12 Apr 2022 22:20:04 -0700 (PDT)
Received: from jade (h-79-136-84-253.A175.priv.bahnhof.se. [79.136.84.253])
        by smtp.gmail.com with ESMTPSA id c3-20020a19e343000000b0046bbd85a014sm465772lfk.25.2022.04.12.22.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 22:20:03 -0700 (PDT)
Date: Wed, 13 Apr 2022 07:20:01 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [[GIT PULL] OP-TEE fix for v5.18
Message-ID: <20220413052001.GA49798@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small OP-TEE driver fix for the error handling path in
the FF-A probe function.

Thanks,
Jens

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-fix-for-v5.18

for you to fetch changes up to b5e22886839ae466fcf03295150094516c0fd8eb:

  tee: optee: add missing mutext_destroy in optee_ffa_probe (2022-04-05 08:56:26 +0200)

----------------------------------------------------------------
OP-TEE fix missing mutex_destroy in probe error handling path

----------------------------------------------------------------
Dongliang Mu (1):
      tee: optee: add missing mutext_destroy in optee_ffa_probe

 drivers/tee/optee/ffa_abi.c | 1 +
 1 file changed, 1 insertion(+)
