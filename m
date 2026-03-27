Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DEF2957B6
	for <soc@lists.linux.dev>; Fri, 27 Mar 2026 13:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774617555; cv=none; b=GLsVvu/6MMjQiAeGhH9xRjpFFScJwdjDsaPqC9x461INeXI3MOCt38dvtZgfEfsA8sc2Yi2Lmka9ZZ7xmy2HrdPyKBlPy50bQJmxuqH0wvdvIhtJFrUW+3Tjd0A4udUBkaHQGFPRWQJauJOj1q8JaY0y5a80+yE760OCfou2GHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774617555; c=relaxed/simple;
	bh=i9qygRuM/xKd0U1GultvW3Xaf67NxSGnnJA65i7/THc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OrJq6K0fFA8wu7w38+wwWos0gvea2wgQhCAPNI9jssqTGQ5kg1g4HJt/SRCjjLXFI8Loth7tA8QayuDhH++MQ8dURzL0swcojF0m3vY4OuGoMxCAy77a+fVS3f/gdhBLUp3BB+1pJ5+FYxWX0IFhAzoSrtmF9aL5+/9P9CikL2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u1udthRX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u1udthRX"
Received: by smtp.kernel.org (Postfix)
	id DBCC5C19423; Fri, 27 Mar 2026 13:19:14 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4888C2BC9E
	for <soc@kernel.org>; Fri, 27 Mar 2026 13:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E4888C2BC9E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a2a75393e2so970140e87.2
        for <soc@kernel.org>; Fri, 27 Mar 2026 06:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774617552; x=1775222352; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lNPO0O5wBEOqvcK8fttMdKDC05vxT3rrIFTuOlOpTto=;
        b=u1udthRX9CUIjy4wRZnGwPdLG4vJl1/66vdWuUaBpVsEJietUxGIFzhZTGEsTq918k
         d2vrT5jS9ayAhjANl+DUHMTzrNoIRVc1HeHELd2SiSAbK3zz1UC7qmeI0zWNNWAtOB3A
         b0uTaPUNoemGCg8q8Hoi3L2WP6QALiZdkg0/zluhgOpR++/hS/0prykM4Id+R9USrRDm
         +J3EIH5OvxW06LZnhwBVUqCVwsuwWs/fE+50ui+pELlVF1OhjQc4QkanVOt5JPFpUYxd
         v1EtjIeqCvfSGv+2IyoOrPlLsbq7XhiUHWKU5nVXbpBT5Rn/pA+BRTFRpF3l4cp7j7w6
         lZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774617552; x=1775222352;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNPO0O5wBEOqvcK8fttMdKDC05vxT3rrIFTuOlOpTto=;
        b=o4H0Z6uTg5Veb4fX14wHwtYzBXrUZRvZ9rqSRkSwhFTHo+BUL9UPu71G/bzaQDFSN4
         RZu/iMVjtShvxjcpkjL9XzeU0HaE7cf71Bdktra1udtRPs3uCF1XEuruWeoldOwNkb0F
         Z34zmWwk5ujQKKba34CDeAX/Qc1KSqbl3Iqs8HteI77fGig4Ig9HdXkIiRMNPe1ynTy1
         0dvVZDK9PYvgOJASfNdLH3nqRP7pNDgmuorQRK4vR+2vQ+TRGx3qT0SE5otKd65a2t6/
         NiAf6rwantbrfkjRz8StZUwRJjpQC1a7DqXF5KgU2ncecttpton49qDdMAaKOa90b00l
         no1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRoIAHUF2y5RNhJbgOIELUcCFICFKNTg9AcI/tZhiP1yP7rsC2vSmhVtOF2F/kdJhUb2M=@kernel.org
X-Gm-Message-State: AOJu0YyQ5UDqO3biNaB5eXqoX5ZVCycHRfWi6xzyxD7AMdZSJykexw3a
	eoVoUyCa0AdiYY78Fk3He/h1xzNBcgSAq86zlBjPhm+x4sY7E2RorFsQ3v7T7h79cRI=
X-Gm-Gg: ATEYQzzNLqzYsAyL0sDDQQNJ385OITVPrmL+Hs5OgwP5VxRIGgaQmR5rZfVEw75/T91
	rv21w0urnC6NAEBnRBcGNw1TTSFjuxn0yAqyah5IRyBDqq1mbsttxyfQE6Ejo8gtt91XOGsYqHd
	O9u+qq1MRnZ4Mnc/ZK7Trcr9nh7fXWs+M3Tp8zckthcHwOX6HFZvZnPEF3dx/+xpSyt5OBjiEeJ
	tARTRslCgC9Uu+72lYTnDcuDpgNn2h1VOEF0RWeER7dBaYjD8MjgchSozj6McwBkLWMqNQk9yf/
	bFQa/F2thVli8g4TIAozXaW81NVZ9sDIUvucEUibzFGTTVM8JIA/+0JqSpbmbsALGr955YIfoCV
	m9djsp1jX88zEZOYDi/VY0M2gA1glXoqzta9CbxQu2ao8ZKLOSIol5C+hvynftknVVUw32O0sx/
	exOAYDVukvtroqzUDaGyk3W19cMnQwkCxplTK5/v2btYjSO0GHVAW4GYQKOUSprzAG2pEZWj+BH
	niMm334v9VAFDHkcOI=
X-Received: by 2002:a05:6512:3b8f:b0:5a2:a355:aa4e with SMTP id 2adb3069b0e04-5a2ab927773mr1250457e87.31.1774617551953;
        Fri, 27 Mar 2026 06:19:11 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a36b5af5sm1175274e87.49.2026.03.27.06.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 06:19:11 -0700 (PDT)
Date: Fri, 27 Mar 2026 14:19:09 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE update for 7.1
Message-ID: <20260327131909.GA3249645@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello soc maintainers,

Please pull this small patch simlifying the OP-TEE context matching logic.

Thanks,
Jens

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/optee-for-v7.1

for you to fetch changes up to 8c6e843f1c26a0b12720cab02f785c46450b6adc:

  optee: simplify OP-TEE context match (2026-03-04 08:33:31 +0100)

----------------------------------------------------------------
OP-TEE update for 7.1

Simplify TEE implementor ID match logic

----------------------------------------------------------------
Rouven Czerwinski (1):
      optee: simplify OP-TEE context match

 drivers/tee/optee/device.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
