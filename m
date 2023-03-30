Return-Path: <SRS0=PxlP=7W=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DB7C761A6
	for <soc@archiver.kernel.org>; Thu, 30 Mar 2023 12:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98EE9C4339B; Thu, 30 Mar 2023 12:48:09 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7FC14C433D2
	for <soc@kernel.org>; Thu, 30 Mar 2023 12:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7FC14C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id g19so11238728lfr.9
        for <soc@kernel.org>; Thu, 30 Mar 2023 05:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680180486;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z8BnzNIV5QaTnXxje77gqnD2tyqzJVL2db5IGcVwrkQ=;
        b=MTeX7MdmiyulECxHRl3ebRisItQd1EqB6NSVqFp1AqzpDS8Ejkz/2RD6KwDH2i7QuC
         X0biN/wiQEMXQz+XTaDhSH/oH+jNE243sUI3awFae0cktxCe9V4kf9LkwGrrnGD1vm+C
         q0d6jeL0MhJ+LD2N8DkWKId2Y5+IqMN9YnwqK3dSoW4uyX4x5O+V0Om+jBrCI+tY4Pmh
         wa6NA/HqXUPXXQWCCaxSXJZznUk/SV/cHI/yr2ckxCnTq2EptG5vMscJ40KTsmVbWcY/
         0Yw5eK606LvEq/GYoXAsgkqXVvO6Q1sAg66ZU3ufMXP1BCF0RZ4/O9umfeu48IKZlzKa
         kQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680180486;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8BnzNIV5QaTnXxje77gqnD2tyqzJVL2db5IGcVwrkQ=;
        b=qCBphdesjp8HbDnLWNdWTUIv9HHmy+D0mOf69P0gxe6N6BAhTL3Es8186ONnHOgHl/
         31tKeFyhsPi1R4vF1Y7hgoNM8X0WOYQnRnXF1lrLel9ymbnrzUAUk9RzZ3/POGlaRGCU
         SX1+3aFx7sinUKpNDZEbrhBahqR+kdZfksJtaS4pVuBeB/tgSy58O0b6vLjV+EES4TGi
         iETDhTuXs6g9VUW/5VkvMuRAjs9VDDPVVbyDBiahJjh12yTy3O8rCWTM/7hCtBgfRCcB
         Exc8C0IxerRbi0XfB8IuGfI2bMhqUGO5HA8fTvxdxGtadA2jWLQd/tV0G62o6ep8EDCu
         ajOA==
X-Gm-Message-State: AAQBX9dyvyn3EBUIRiTNhiCmFRwvm7MlPTB5EipfJiD9rKQZY4uzSnQB
	zQI03tM4i6NAZ87/w5uYouIOvQ==
X-Google-Smtp-Source: AKy350b1WoCfXUnD84zNy/Fw40IKjYtj9G/5moSb9CG5XfqjIlP8mQnq8R5Sxg/tR6+EY5DgMrMmQQ==
X-Received: by 2002:ac2:4358:0:b0:4ea:fafd:e679 with SMTP id o24-20020ac24358000000b004eafafde679mr7747330lfl.36.1680180486345;
        Thu, 30 Mar 2023 05:48:06 -0700 (PDT)
Received: from rayden (h-46-59-78-111.A175.priv.bahnhof.se. [46.59.78.111])
        by smtp.gmail.com with ESMTPSA id o22-20020ac24356000000b004d57fc74f2csm5819230lfl.266.2023.03.30.05.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 05:48:06 -0700 (PDT)
Date: Thu, 30 Mar 2023 14:48:04 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE fix for v6.3
Message-ID: <20230330124804.GA1943242@rayden>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small fix of a call to virt_to_page() in the TEE
subsystem.

Thanks,
Jens

The following changes since commit eeac8ede17557680855031c6f305ece2378af326:

  Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git/ tags/tee-fix-for-v6.3

for you to fetch changes up to 8671133082176d1388e20ac33d61cf7e3b05adf5:

  tee: Pass a pointer to virt_to_page() (2023-03-30 08:34:52 +0200)

----------------------------------------------------------------
Add explicit cast to (void *) for virt_to_page() argument

----------------------------------------------------------------
Linus Walleij (1):
      tee: Pass a pointer to virt_to_page()

 drivers/tee/tee_shm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
