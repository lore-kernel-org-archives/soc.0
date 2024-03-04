Return-Path: <SRS0=IwX1=KK=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB81C5478C
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 13:27:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 525C3C433A6; Mon,  4 Mar 2024 13:27:32 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D647C433F1
	for <soc@kernel.org>; Mon,  4 Mar 2024 13:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5D647C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a36126ee41eso682146466b.2
        for <soc@kernel.org>; Mon, 04 Mar 2024 05:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709558849; x=1710163649; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Il7WGqFl44AfF17lTuHv5NBgNOasTcj9Ggen1b7rvc=;
        b=s1pTHZHLJJtKeBSGdtoM1V3UMERfAYNAoPJ/qMQlcsEgmO91mppnGc3K/U6TH+TMIj
         gp3XndY7bXvZowaDAbAt0DcaaU8S4H2W8XtjCrOPY9856SHN8BjRrpvQtI05vvsJp1SX
         kGBjneE1i2mwfzh1Opkh+jHJsjzeZ3TdCs6Lz+/wwP2hOe2DnhlMmOX9RaDTxjkxs5/C
         BRhNZZ5ehlfhwOFA55W/yFUHbLh15L3oAsalmSlXmTobphOY5CjCRsRXpha1f1NUFgQ2
         qirAOkWURcQwUeWDAXubZEAqdlO9lZdmgqkQ7iwhII8s2dvRxk/TPUjTNi8KBkrrqLyi
         1IMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709558849; x=1710163649;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Il7WGqFl44AfF17lTuHv5NBgNOasTcj9Ggen1b7rvc=;
        b=SqbS6lO64zf1sw3/Pf2n+z1ual9OB1zaygP9EuAxyCqir8s4iZ4ZQaWab/WUJS1poP
         B/y69BWCOBq1KglVNljtWEoexBjT4RfeK4eRm7dyfel7DlnVLqwNKljYX+GlBhM+cXKR
         qwlJ1awcgANBdXlNd+dKQjsrIBfdjgdd4Js8XpikWtABt4DVovtkCILC1PGfhG6iWFyo
         kylH0sefFUTY9R6rrwi0GJwIEh81iAIeog2IFv5W5Y/mkYrdmdNI5VqzbAVl/E+S27Qu
         EKB+/ljJ07z990XKRc/o4V9O+UrpLtdlW+LxEV82YM+MSF+vHQvVoBHhWZH/HPbjONq4
         DymQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6ShRf+VFj7GG4eNywszlCoOemhoJcU9+C27TYxPTA8QDlAqfJzSaf+Xc/uzVNE6gdLdpILrxW3ILjRWPy2Q==
X-Gm-Message-State: AOJu0YzFwp45p3Lk0ZybinytmXjWel5XVmI+YQuPEadiicWGCtVna3tF
	iqJTt3VsAF8jWsoVxY4drWTLnRljxeRdGTIYXHio48+1pePKaW+Lhvr+w1O6YI0=
X-Google-Smtp-Source: AGHT+IEyllblhYtJQrtPvZ3Qg5J5x6MA5AQO1G5GPdXsMuXDvx7aa+s+I01lireZgZtMHmj5nurMeA==
X-Received: by 2002:a17:906:1906:b0:a44:7db8:a343 with SMTP id a6-20020a170906190600b00a447db8a343mr6236750eje.76.1709558849464;
        Mon, 04 Mar 2024 05:27:29 -0800 (PST)
Received: from rayden (h-217-31-164-171.A175.priv.bahnhof.se. [217.31.164.171])
        by smtp.gmail.com with ESMTPSA id x11-20020a170906710b00b00a4434e9938asm4803437ejj.84.2024.03.04.05.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 05:27:29 -0800 (PST)
Date: Mon, 4 Mar 2024 14:27:27 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [GIT PULL] OP-TEE fix for 6.8
Message-ID: <20240304132727.GA3501807@rayden>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small fix for a panic in the OP-TEE driver that can occur
in the error path when registering devices on the TEE bus.

Thanks,
Jens

The following changes since commit 41bccc98fb7931d63d03f326a746ac4d429c1dd3:

  Linux 6.8-rc2 (2024-01-28 17:01:12 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git tags/optee-fix-for-v6.8

for you to fetch changes up to 95915ba4b987cf2b222b0f251280228a1ff977ac:

  tee: optee: Fix kernel panic caused by incorrect error handling (2024-03-04 09:49:03 +0100)

----------------------------------------------------------------
Fix kernel panic in OP-TEE driver

----------------------------------------------------------------
Sumit Garg (1):
      tee: optee: Fix kernel panic caused by incorrect error handling

 drivers/tee/optee/device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
