Return-Path: <SRS0=wGpy=7G=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259CBC6FD1F
	for <soc@archiver.kernel.org>; Tue, 14 Mar 2023 18:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DE4A6C4339C; Tue, 14 Mar 2023 18:44:45 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CEF48C433D2
	for <soc@kernel.org>; Tue, 14 Mar 2023 18:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CEF48C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id g18so17039086ljl.3
        for <soc@kernel.org>; Tue, 14 Mar 2023 11:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678819483;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=casSMFcL0bdZR+xSUTOixiwe/HQpvarVg0OsB5EQ+uk=;
        b=VRpHVUdw+PX4ki5MVpyNIHdTyQpnV3Ir5ZB50XU6IH/DDNGW7NxjO35C+DzY1gk3N0
         jLZq9ThnO3zmbJLXfx2vZMd8AkJkXkpT/4i11CfrAZ35z2dL0PEqAgIwi2dTaP3sqvJ4
         J1xHqHAeny4frccIkAdv1klekcIsNK7/KYaQ2jwDC1YeAAsxGBX5ifW3oJDC9rPI1d7c
         tiLw3qXcYfYsKHtAH3ZQCDY2ECrhohAiCwUxF9oQPkSSBUp+fw+Z697LudO6uFmT8Wug
         XBH34yp7U7AuGcrn7li1Foy60UyQOQI30GSkp1VJ7mpQrFC7L0WY/7tNqe1PsEWDMP+g
         BgRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678819483;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=casSMFcL0bdZR+xSUTOixiwe/HQpvarVg0OsB5EQ+uk=;
        b=xslDTj6N9GtR9oDaQ/F7BDXseoCUkKfQQ182zTpXBGmMI3l9zs5OmBNPxkHhuMGy8n
         eI5YY8LPhNDPPdzG0HW2Kbh9yD6H65nkSJZigO7ZWU2/HSyuWYjcubK+pr3s3TZffA0Q
         dHVsNRbWmBqKf4NT/q590PunR2CZvpHJ9znN/Awr6wWnsHFseJHEr/GKxddjhqYjS2Hw
         iqayb2gi6O9Th8gf1SlbdWoJenj1BVqdbVTL9qd7Kk+R+i1/u6Uu2Ss2HZcFu8F7U+jh
         3BpIFYKhcbXd0AqEW8gof91LuucbH1DoPBveKFVvtkg1R5bcgzafW+8724rKfA1FJX3N
         3j2Q==
X-Gm-Message-State: AO0yUKU48Ijvs3+Ho7cJhfcOlHElz0R1hjsnTFdy/wqxDWcwK/pJiBKn
	6yIhGdFE9909rXbxs6PEYk8GdA==
X-Google-Smtp-Source: AK7set8fdhwduFhySycSkVXxE4FxmLfgk8tR4QH2xestJ2syywoI84QbAvcsPzKtOicz8X3tBczWpA==
X-Received: by 2002:a05:651c:b26:b0:295:a3a1:4ab2 with SMTP id b38-20020a05651c0b2600b00295a3a14ab2mr31741ljr.15.1678819482794;
        Tue, 14 Mar 2023 11:44:42 -0700 (PDT)
Received: from rayden (h-46-59-78-111.A175.priv.bahnhof.se. [46.59.78.111])
        by smtp.gmail.com with ESMTPSA id f7-20020a2eb5a7000000b00295b80aa93csm551046ljn.110.2023.03.14.11.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 11:44:42 -0700 (PDT)
Date: Tue, 14 Mar 2023 19:44:41 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] Fix spell error in OP-TEE driver for v6.3
Message-ID: <20230314184441.GA2936721@rayden>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small patch fixing a spell error in an error message in
the OP-TEE driver.

Thanks,
Jens

The following changes since commit eeac8ede17557680855031c6f305ece2378af326:

  Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git/ tags/optee-fix-for-v6.3

for you to fetch changes up to 172fa6366c0c84eda31f1bc34e6c3e4698786215:

  tee: optee: Fix typo Unuspported -> Unsupported (2023-03-14 11:57:03 +0100)

----------------------------------------------------------------
Fixes a spell error in an error message in the OP-TEE driver

----------------------------------------------------------------
Jules Maselbas (1):
      tee: optee: Fix typo Unuspported -> Unsupported

 drivers/tee/optee/call.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
