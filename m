Return-Path: <SRS0=xfTU=FR=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4E84E7AD77
	for <soc@archiver.kernel.org>; Tue,  3 Oct 2023 17:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 775C7C433C8; Tue,  3 Oct 2023 17:18:45 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6BFF0C433C9
	for <soc@kernel.org>; Tue,  3 Oct 2023 17:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6BFF0C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1c723f1c80fso8980485ad.1
        for <soc@kernel.org>; Tue, 03 Oct 2023 10:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696353523; x=1696958323; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p/Pj0lt9hCfSD4N+KqQXF0RTWOozDuEYDrepCdOvld8=;
        b=mTccdL3l5Uvj48TpiBS+JC62Gv40dKIUOm82XOcJsH0G+Rkz5FZtbevW3Gr8JVb3lJ
         Lf21pjRJp78imdAhUFmxICuQfVq/e1AAcsj+LVphp7h38qyYGKQ6/TiUDDBUDloWOhiX
         tvnAT/bAvixa5L3S+Kqiprd4+4iUwbX/L1pU5BxcIHXD9BKF8OQCPnwJq9XE+thXQ0uv
         gScZhG67vS+FQm3Iz4YnZFItFopD7a4ouVS6eIGAnOLrjhQwPiRKc8yKFIGQ85y6Vgdc
         XhtTjgl2VnMluMi1v0juJJXDrhWmAE3uMfDGed0VNEfZoD9dmJLmNNBBf9AUbmM69HiF
         PE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696353523; x=1696958323;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p/Pj0lt9hCfSD4N+KqQXF0RTWOozDuEYDrepCdOvld8=;
        b=P50zS9lm7tMm3Q2Z9WBRzfTllc4zeGkT12yz2upAYy4ElouuYKwtzKrL0N4j203Zln
         Uso6P7SW8W0VmT/vkyUjbgUyksOYUD+PtZp4vJr09rfiVPd9Bsb0Waz+ARjNjs3V5Abq
         JOlCENit4rPfrL21wd+wIFP5rDjbWGr/O1hH1Y+a5sp6d4ceezGkCAPhSEcY1AqFcsQX
         jaLIAAC7CFiHAtcWTFK6oA5YPEep0LaueHyVnR8Yzqhk+RsQQDxDpY+i4tsTwMol5Jmw
         qnI8YERtq0QMmCUGvwNMC/BnyKwFBBrhdnTu1mUM7QindP+YCAM3p7bSExgDwJXeSe4D
         CSsA==
X-Gm-Message-State: AOJu0YziRWP17NjTkHwEjfoSauSwux5z2+jiO+UH3Z73/C9+ajcl/d52
	jFXJo7Nq3GraKUVGkG5w49lZkw==
X-Google-Smtp-Source: AGHT+IF58FaGoQFqY9KeEFCKEPSiO70wCn4vIXbxjOXbc+BnUiGWSpchqcrEqXsw1PsbGYXu+jFjlA==
X-Received: by 2002:a17:902:f807:b0:1c7:495c:87f7 with SMTP id ix7-20020a170902f80700b001c7495c87f7mr209978plb.22.1696353523640;
        Tue, 03 Oct 2023 10:18:43 -0700 (PDT)
Received: from rayden (h-46-59-78-111.A175.priv.bahnhof.se. [46.59.78.111])
        by smtp.gmail.com with ESMTPSA id q3-20020a170902788300b001ae0a4b1d3fsm1849620pll.153.2023.10.03.10.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 10:18:43 -0700 (PDT)
Date: Tue, 3 Oct 2023 19:18:35 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] AMDTEE fix for v6.6
Message-ID: <20231003171835.GA669924@rayden>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small AMDTEE driver fix addressing a possible
user-after-free vulnerability.

Note that this isn't a usual Arm driver update. This targets AMD instead,
but is part of the TEE subsystem.

Thanks,
Jens

The following changes since commit 2dde18cd1d8fac735875f2e4987f11817cc0bc2c:

  Linux 6.5 (2023-08-27 14:49:51 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git/ tags/amdtee-fix-for-v6.6

for you to fetch changes up to f4384b3e54ea813868bb81a861bf5b2406e15d8f:

  tee: amdtee: fix use-after-free vulnerability in amdtee_close_session (2023-10-03 19:13:53 +0200)

----------------------------------------------------------------
AMDTEE fix possible use-after-free

----------------------------------------------------------------
Rijo Thomas (1):
      tee: amdtee: fix use-after-free vulnerability in amdtee_close_session

 drivers/tee/amdtee/core.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
