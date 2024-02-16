Return-Path: <SRS0=Y6T7=JZ=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C474C48BC4
	for <soc@archiver.kernel.org>; Fri, 16 Feb 2024 14:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2B1F1C43394; Fri, 16 Feb 2024 14:27:06 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 02E68C433C7
	for <soc@kernel.org>; Fri, 16 Feb 2024 14:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 02E68C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-563b7b3e3ecso2141239a12.0
        for <soc@kernel.org>; Fri, 16 Feb 2024 06:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708093623; x=1708698423; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YX3KVONGaKL/+cfVdIf5qOfUj2ReaxP0KFNOM/lKY8g=;
        b=PU6ud5hUPL88j/nkhgVT0ETrDmhC87j09vV/KiRfi8iPzDEefonuf9d++HubDqvdlT
         z9Ol2ijhfzNzhf5gMV8SIZ2He4Rq+Ft+dcQn1XInPa5s4LXc8TFyR0gVYxJmStBBvP3/
         7KaP7m4wBVttzTJKGtduvfzbu0xRsVjKU518Ek/jj8rY6ogni6CcrjcM6SsWAPfSEG5W
         uUXNcx38O7HFRX5T0yBM2sQ1SNpZYX3qeeM27JCJmI0vfICPrbmKT5ScmnOTawDthZYY
         p0IHK7k2v0qhcCL9OYxQmnqvdx50kbNXSn+gtdQoYAMWOuR+WFKS3DQ1wjdQS2G3OdHA
         gPrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708093623; x=1708698423;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YX3KVONGaKL/+cfVdIf5qOfUj2ReaxP0KFNOM/lKY8g=;
        b=v5SP+9ysfidEfw7b2tR7hDuxK9VMjFB+kwpQx8K1WJB6wc79F7aFs6VBAFB0X8xi7d
         gYX4MavR/0dpiOmIznA/bCpldXyCf+ap4Gf+F8QRf6McUPw4YupeSZVimBSjVeFWoB1F
         ZbPVj3B9dLgJXqW/ABntiMQwmCp6yOCEeQziLxZp5FC0q1PDM9kFXiEyWyR91EqxShAB
         T3TPnUEiEfEIfa2aK+L4AtAipsKj2Xbpr7bFd0DFFUDBFfgAjwiBUM1PJWc17zD2KtRU
         BDprPMpD34ke5YnF0lJF+iOTc7tb7ufQm932w0f8a8H4gIehZb9qMPPS1253XyL5nf/l
         8DKw==
X-Forwarded-Encrypted: i=1; AJvYcCUw/f0xq6Qzw4xf5eULZLtN4KgugLUJCrP+FoU/Z9WE+836g1RIYjP4Lmi0swo9QUT04wElWWNcokRE7nDCig==
X-Gm-Message-State: AOJu0Yytoq0RRGYVyiqqszF6pYvqyq9PkWuBk2hcJiYqWvbQFyLDxoLc
	khIOVkbnA8KTG8k/ZyJudqP2faqnZyyfexr5QD/cRWABYYPOB8prWA0y0dH7hpc=
X-Google-Smtp-Source: AGHT+IHugTV6Jok5OHz7GlnSz+q/H3J1cRw1PJgwcuyGVl2rBOMyj1xn3Mds6N5/PpVu/nAw3txNPQ==
X-Received: by 2002:a17:906:d86:b0:a3d:7559:6ed1 with SMTP id m6-20020a1709060d8600b00a3d75596ed1mr3539918eji.4.1708093623188;
        Fri, 16 Feb 2024 06:27:03 -0800 (PST)
Received: from rayden (h-217-31-164-171.A175.priv.bahnhof.se. [217.31.164.171])
        by smtp.gmail.com with ESMTPSA id p19-20020a170906b21300b00a3dad483948sm1249648ejz.182.2024.02.16.06.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 06:27:02 -0800 (PST)
Date: Fri, 16 Feb 2024 15:27:00 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] Make tee_bus_type const for v6.9
Message-ID: <20240216142700.GA3863398@rayden>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maitainers,

Please pull this small patch making tee_bus_type const.

Thanks,
Jens

The following changes since commit 41bccc98fb7931d63d03f326a746ac4d429c1dd3:

  Linux 6.8-rc2 (2024-01-28 17:01:12 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git/ tags/tee-bus-type-for-v6.9

for you to fetch changes up to 1d044941d53855ca06e4fa34936ff7273c8641dd:

  tee: make tee_bus_type const (2024-02-15 08:28:24 +0100)

----------------------------------------------------------------
tee: make tee_bus_type const

----------------------------------------------------------------
Ricardo B. Marliere (1):
      tee: make tee_bus_type const

 drivers/tee/tee_core.c  | 2 +-
 include/linux/tee_drv.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
