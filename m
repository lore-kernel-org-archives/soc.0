Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E6B305046
	for <soc@lists.linux.dev>; Tue, 19 Aug 2025 12:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755606408; cv=none; b=U0ioajyNdWt285cBr+IcQ+K3D+pL1hKk3+MPRycSS0UcJSwxp08PsMAyU8JYnb4+2fdDU3kjsdSsuAPBU2C84Via/6CB0bjgXzFaV5McUqLI013tmIV9g/CsAHzriVdfnQPl0QmYxBmUgllGDxlBoSCsMoJGMyfrutJq18SmtM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755606408; c=relaxed/simple;
	bh=Vlqa1gfi8PbIVJ0ZFQ+7x7C5YgAYhufkg+Cs5+SorG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gb/9Nh3YSSNSSbKvy+qLAJ6AAF8DSb2YeQhDibYC8q7VZXSurwiFpxhKPp+sfUoeUJ9D/3WZ6ANjPKKchYUvKRYDqwGZU/fxJui7pAYbstlo61j4/rjSiBzUj8bDwTGQV8C/f9YI98N+FIkfuXbHdodOexgPmJHwe4Wh67MdSt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YE5cMEuk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YE5cMEuk"
Received: by smtp.kernel.org (Postfix)
	id 9BF91C113D0; Tue, 19 Aug 2025 12:26:47 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C1E0BC4CEF1
	for <soc@kernel.org>; Tue, 19 Aug 2025 12:26:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C1E0BC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-333f7ebc44dso46222101fa.0
        for <soc@kernel.org>; Tue, 19 Aug 2025 05:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755606404; x=1756211204; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RH/C3wXmNI2h8jF1q3m0CdjAwRtlpdk2fFUGk3Jm2jU=;
        b=YE5cMEukt+DFil65uBEZ3t3zQedtNGAlpjeZjZMOEOpVqSlycGfay38D8LfL+aDKjq
         PC8Cgy/XDePGOR07ybZjYmGnD5N++D6Ms0fRrrOa6Vm6L2viNiET6arofevqLhZ2LUon
         SZFC8D3mDFfP46rgK+VyRlFO1Ql3iiS5Tg3EwEJnbF4Dwv8I6zW4c+WipDlBwa+ckzjk
         yN9+w5U//yFqJ4OkxfpYNW0LCL7D4F6pabMILnhtJXuM+I6rbfK9jWPrcQY2BcWDb8t5
         e0qUrZLkcppnggHLD1UT9u67RPygMUHDVQmgGT9oxdg3p7mC9BCHSdty82O1VNdbDUdG
         u2Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755606404; x=1756211204;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RH/C3wXmNI2h8jF1q3m0CdjAwRtlpdk2fFUGk3Jm2jU=;
        b=GvPX+9lj0vNQlOFwUYqTeWk429d2gZhgXQJVt1RT2w/Z+ehjig8eAog6h+xjtTrA45
         /FbhDTjvL/HaRQN494YQsR+ouL92RotvIpjtUnlPUUXx1mqp6REbk6I+F8jkJUI/QNUz
         JpN/TNtpwXJUdebduM3adBUDrEus5BFIs9t2BeOpMlt0ke9lmPA9wEj7mqPIlq51DF9h
         N8aBbHeOhBGDNl/zFUPwTGiYyBFcXwV1Vgb4Gc3o9AYnF6Yy+udjXsC/NzTMrRTRpPI2
         yX82fikGXL82BhaLdW/qnSesNnt0QW5slKvvA4yYRLsQi0cPCjPbacndZ4xa/1Al65Bk
         U38A==
X-Forwarded-Encrypted: i=1; AJvYcCXpIJtOF7bQdv+J6daZ76Pi/XDQMdJ4ulybKZd/rWzFbexrTPUvlE2CxPndwyVgExfllSg=@kernel.org
X-Gm-Message-State: AOJu0YyVFCdu22YPQLbdA+QWN2UNPFw1nfWw/EljQboh8oLTQYasYGD0
	yrlFNtzNnODqk25QF9NX2CbyOAMCAXJGunwlh7Pm4RuYjXWnORDtvbs5TFMXC2+mW/k=
X-Gm-Gg: ASbGncvdzSbJx8sxBCtLErRXAsXvplFsuHsFn+/v4zZgL4n4uRIPzDTFG/6IAoYuT/F
	vO+YE3kLaWRW9tKc1SgcHAYMKDHszplZ/SHRSkIFBOWfhqh7D/73yulDHeUtgT6v4geaWOv9BL3
	1wyrckVdkqWG9gjlrwIDuWzcGmMhCkeBtbAQjscaO/wCoDNpUgRZCQyY+mfnxc4GRlmD0GHlyDs
	uuLLpc7D6Bb4dleb6z1ivpLikztlguS8nspGnvqJfa9ARz0bRuQIppe+lPkJaUSbtvcPXKsMqv/
	BNoHcco5tSTsDIA5x71SEpmiEbZA3mYm8kFwdA2OpWyVCMkzXLGFx7oGOk3YzRNBHs4If/koO6D
	uVmYE36jh8mJQc1SG9YL3lg==
X-Google-Smtp-Source: AGHT+IEopm7tKy//PR6tAZKXugwig1BvugMkJB89GGGoq3IMTwHV3jdUe5FZw58ERsomp4iOogHlRA==
X-Received: by 2002:a05:651c:54d:b0:333:ad65:c512 with SMTP id 38308e7fff4ca-335317ae048mr6645961fa.13.1755606403774;
        Tue, 19 Aug 2025 05:26:43 -0700 (PDT)
Received: from rayden ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3340a43a051sm22503801fa.18.2025.08.19.05.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:26:43 -0700 (PDT)
Date: Tue, 19 Aug 2025 14:26:41 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE fixes for v6.17
Message-ID: <20250819122641.GA3486750@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers

Please pull these two small patches fixing a NULL pointer dereference and
memory leak in the TEE subsystem.

Thanks,
Jens

The following changes since commit 038d61fd642278bab63ee8ef722c50d10ab01e8f:

  Linux 6.16 (2025-07-27 14:26:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/tee-fixes-for-v6.17

for you to fetch changes up to 50a74d0095cd23d2012133e208df45a298868870:

  tee: fix memory leak in tee_dyn_shm_alloc_helper (2025-08-04 14:28:04 +0200)

----------------------------------------------------------------
TEE fixes for v6.17

- Fixing a memory leak in the error path for tee_dyn_shm_alloc_helper()
- Fixing a NULL pointer dereference in tee_shm_put()

----------------------------------------------------------------
Pei Xiao (2):
      tee: fix NULL pointer dereference in tee_shm_put
      tee: fix memory leak in tee_dyn_shm_alloc_helper

 drivers/tee/tee_shm.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)
