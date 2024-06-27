Return-Path: <SRS0=+Zca=N5=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3697C2BD09
	for <soc@archiver.kernel.org>; Thu, 27 Jun 2024 12:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F695C32786; Thu, 27 Jun 2024 12:51:17 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A0833C2BBFC
	for <soc@kernel.org>; Thu, 27 Jun 2024 12:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A0833C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a729da840a8so93012366b.1
        for <soc@kernel.org>; Thu, 27 Jun 2024 05:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719492675; x=1720097475; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/8RdIwO1AqgATS1rruwHtz31wW4pIJuBMnKzZU+n75c=;
        b=R4N/ezaMZe7xnKb/nuwGtWUnn3Rlmoge0UehKv9ktucSSFjwhZ4hO9zvqyBUhpHtBg
         BhtoU2Q9O5K1P2UKEzHkRgShyeH0ghqRMQfNby1N595t7RjqIrCf+39YwgpeyOyYiuR3
         2KQ8vI2XW2NxDY3cfT102CoSi9GAPPkeAQHTP1CTqzoDZ7BHIPo2i6IZL7VCB1Iu+j3B
         KYVQWG0f95tGhLJ7Bo1t72MntRKHgYwQKPyg9aLgpZyN3bE+D+qTck4PZpyZfeVsT3Gp
         dk4BpI4z9JZN6yN+yZvEEwy//GHMzsH90tU4Cgaym6koIpO098i/fAGur4kRbxM92Al2
         z1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719492675; x=1720097475;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/8RdIwO1AqgATS1rruwHtz31wW4pIJuBMnKzZU+n75c=;
        b=dCtQq15MvdmDBbSdS//+ITY+oaSiwYDct2CvPt8mjrRMYzMbYcGhghpTNlzT6UsVjb
         QdbIq0Tar4zrSis6ORi3AjQaAOovNfT4hptN0vqHIKDCgayjAwYhY4sph/VOZG+BeBSR
         6NfNEmeNJ8w/AYAAU4jPsfhjX57sv4XCOpx6obK2Qn4QUJfEDZyToWAcz4rTHfYMCQWR
         bqL6nLJVA2M7kiP6ckjvHZk/RJvaAkEOqXRuD34DtQ9p41itqcul1YcWdIOQvr2aIrlJ
         lzUH81/5rRA4xc9MzA8++LmQIu5iiXSWXC3UUNKSc69omLESi8DUl9BfIGR0P2DAoZWj
         H4NA==
X-Forwarded-Encrypted: i=1; AJvYcCXPTcxhtjSDiFdcOYeB6jpvNmufekKDSIumR1Gw42fsCJfPZKQ0w680PkTHEYI1BEZTZgNWqjXKeJmuj28NGQ==
X-Gm-Message-State: AOJu0YyKUjurb5IXbQn7livh+uv+0/owav0FzCGhdgVY4KEe+fkhIxZr
	VbmbfKC7CKKiH08lxUZqmBPj51BoWyqGrrkxbtnnS77cfCXQtNx8A7EgzQEyqPs=
X-Google-Smtp-Source: AGHT+IFB8SbhGNvYE/lAYWgisgvNl1xeZNFWFNCj05aBH7pV/cycVghwpgIH6UIUzmGlcNfVH9hzqg==
X-Received: by 2002:a17:907:36c6:b0:a72:9ebe:29da with SMTP id a640c23a62f3a-a729ebe44ffmr112781066b.35.1719492674604;
        Thu, 27 Jun 2024 05:51:14 -0700 (PDT)
Received: from rayden (h-217-31-164-171.A175.priv.bahnhof.se. [217.31.164.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d71f54csm57247166b.71.2024.06.27.05.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 05:51:14 -0700 (PDT)
Date: Thu, 27 Jun 2024 14:51:12 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE fix for v6.11
Message-ID: <20240627125112.GA2674988@rayden>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small patch fixing a few missing-field-initializers warnings
in the optee driver.

Thanks,
Jens

The following changes since commit a38297e3fb012ddfa7ce0321a7e5a8daeb1872b6:

  Linux 6.9 (2024-05-12 14:12:29 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git/ tags/optee-fix-for-v6.11

for you to fetch changes up to e0556255a53d6d3d406a28362dffd972018a997c:

  tee: optee: ffa: Fix missing-field-initializers warning (2024-06-27 10:27:31 +0200)

----------------------------------------------------------------
Fix optee missing-field-initializers warning

----------------------------------------------------------------
Mark-PK Tsai (1):
      tee: optee: ffa: Fix missing-field-initializers warning

 drivers/tee/optee/ffa_abi.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)
