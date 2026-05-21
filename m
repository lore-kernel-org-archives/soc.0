Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30769344024
	for <soc@lists.linux.dev>; Thu, 21 May 2026 14:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372863; cv=pass; b=Sbb51AYbCk5Fa7Rg4ZhcHWnUUBKYD6FXKsl2S0F0p0q4srnTOtZezMSOKAXZEmBc/gKaqQfovt65uJzIv2ccscGi3QP2s7zjPtxDvuVlA0ZPmEEOqOF8f/9ugaq2a3TA6IO3qjwr7NgaDZMQXUd9ZVcpxBj24pnmZRmrq876BwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372863; c=relaxed/simple;
	bh=gJrO2A9MJS6/fFlUZ2b09U6a+i/gEU7GOuJO2TOA51M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=peWeV0c30zpUlUP9OGEVJLDy5LcsXhxx25unbGWFi0r8y4cpUZIISY2ZsilM4Lh8AnqPHcYt6KRdELRCUsxby0b6/l1VgzwCPaJyHptKpUT0prdY7xghcbZ8cPSWFgZ98PBilYW38BSKaL8GOc7Xt0inX/AXke8EW3D6boWlUmo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mLYAAt5t; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mLYAAt5t"
Received: by smtp.kernel.org (Postfix)
	id D67761F000E9; Thu, 21 May 2026 14:14:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.167.47
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1779372861;
	b=Dw87hoGBs8nPw6kZkxstWDNJHjywkxb2x0RZsh/QR+JhZxjpUjon/vZTgukyJMFBb4/+
	 UAFSLewVMOYaWgm1jVSqXE6ay3Xk3GCqp7qqcJJJXN2Na4alBpTf59TrNVyZncjDsHlAX
	 Ucef2k4PDagzzxjVsTdoMXhsbEwcF8+JAMmvOxTTq+3jr11QhJZUzdzjgHdwdfeFS69NX
	 FGUcz1FKDeH4NLrtwqEE2Rs6jAOw+TFV+ebrhtBxSmbw0NrpuzzVHkM6ajiuJAMgtWLCT
	 W0KP1rJsVjtETi1ekdxDbKqqiCv8VfreBa/LIyyMKvUcqSCx2YJcVXSscbpBY9ImA8w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779372861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=JA1Rl/V+AEIvj3al/H+ZnQroSiQ2kKKMhl7jwi2o2AA=;
	b=YL2Yek9YxGWAP2VmVuRJaS3Zmj+57OXR9ugu0WihsHAU8cEkU6lbJZ5RXMAjQUajEbPo
	 wAOFPGs8pkDhT/Z9TWffe9w/I+LOv7rWCuVnpjCEUhZABp0PyjqSZb8bkVBSoFFXoxHbi
	 qZdeqlSnuVrwdt+8YDdGUoDubOGRVrSQ6X3OId9PjiuolQU4jQ9dr+qJGuKJn/lhMobGd
	 4vMHNCmPoD2j77G3ZpH7D8/U7S0AJkG6KmdVwLiKpuEeiuiSxH8ZpjUyz9mWkFw4xYkOD
	 vR1ryXbmOACDBQbR1qDog7tqBt1el8mBOgs5jq1Vl+rCtKEnaz3HL5WBDSGFi8MrLsg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mLYAAt5t;
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	arc=none smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 561F81F00A3B
	for <soc@kernel.org>; Thu, 21 May 2026 14:14:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mLYAAt5t
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 561F81F00A3B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a8ee4b703fso5848174e87.0
        for <soc@kernel.org>; Thu, 21 May 2026 07:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779372859; x=1779977659; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JA1Rl/V+AEIvj3al/H+ZnQroSiQ2kKKMhl7jwi2o2AA=;
        b=mLYAAt5tcNf1IEP8UkCX1PHEZPUNVodoHowRglZBb2CbYm0riqTNvRFvIpfFPBnEar
         jgWyji013ULtaTeZ/a9b9Kz6060JHrBdDHtNXRdNn5Zwl4nB4oPmw5lTPFIpvz8/Jc9O
         /ZQwDcsIbEpqJ5nCYZiYMmKiqnQHex2/TWUpJW0FLCh0xZq7v2QElYmWi5IAWB/5HWGr
         rDgtY3zgsoG8N6JBEHO1k4r/AvHzC8aXOM33UIZ+b5CVpE3ELLnxvOjjSRiCKyWG3Jad
         p5822BMQdyNmcasIZ+5dtSyJ4omQ8DZquT1mL7BYiEA/x5ikBm0fDnGi/U/RTqRTnlMA
         ftng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372859; x=1779977659;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JA1Rl/V+AEIvj3al/H+ZnQroSiQ2kKKMhl7jwi2o2AA=;
        b=aaX1cCe60ktxZz9bqduA/hzs0E4HV+mYEVIAInWdb0RcG5pcsj4qL1aKZ97UisUnE2
         WVkpw8c7D3WKmuUN9pfIfQZ4fBmZmg19VsJ8Sy0PyRFOaTuUFKAZzEZxEeonujYEQs30
         GpOZtTq45WIaLBe7tFXqbjl2Z6fD5Dbo7x7jPbJxVTvjlm2e/Q4ScYGx/yxP30ZKI7aL
         Q/GFiJoMhJf3M47PjB5RXXDWsjVpiP6PbbD130tWezZEojqzvQzgyZ2zVyJN3RDsd4rB
         +IkQ9B1KJWPnKr6WU6QDfCP+myJRXLDE9J70Nj/5jhECS1979zwuJuHHUxMVNJ4OnZ9F
         hixA==
X-Forwarded-Encrypted: i=1; AFNElJ8NA+nRmEYheAGs0sU+JgnPwow+Xtw4h/H3bi1CcRl0OAut+augwV6KomJCpoGszukstj4=@kernel.org
X-Gm-Message-State: AOJu0YyEkM4rGnhjyfHuT+Pw38CIGsz6/OxJSLdOSkYeZ7zl6bI4RdFu
	BwoGd6dzhgOUPGUvD/nGZanf44b/n2vTZ7G/rEkDk2PAOO+a69iuxvyi/P3y2D0fdvNd2hr+8Nk
	0VjcV
X-Gm-Gg: Acq92OEcxYLFUdqndnrPhhmpcHoMYLLZPR5ayl5vZwdkl6PAKDZfzQ467XV+p4aR7bT
	G29zrWBsvzGsom0954hf3diEx2/Ros0BAisI7eJQCnM/7RRG4tWXRQhhk8TfYRW37ikTXKRS59f
	UgOhbHkz9hVX+RNod+lzI+3GYrq1NI3N5YhK6pqRy85yUPpBSM5hheVR/qduTA/6aR9pFbD6UjJ
	GAId13fpC4KPz12IVtsvCvopZZZcbojUawGb4LQF3qGYj+Z/LC6XMVMuAUueIvYq6/JjkNs7NDx
	wLM8171glJSuXktlq4ezKxOpr7VpMNrbzhRK6XD6a82/9TbnvAPoM2LypuyGYTQrPnRvVEewtoC
	vgUB3ogr078+rFdkzmlNwLV9Kh2FgD9Alnj/S7MEfm7KFOrKfaLSXBE8+hNF9I0yd4JMcx1atqw
	M+UorXX//gdC4VRcjUp/v9ONo5PvSIGhy35xbtWqjQGLWJkH6kzcnbu8HViOJGBknxW6b43tp9H
	Dxn2J3rSmgfjfJkEnuw
X-Received: by 2002:a05:6512:ba9:b0:5a8:f24b:d511 with SMTP id 2adb3069b0e04-5aa2ba8c089mr1395165e87.26.1779372858502;
        Thu, 21 May 2026 07:14:18 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa2efb66cbsm306094e87.0.2026.05.21.07.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:14:17 -0700 (PDT)
Date: Thu, 21 May 2026 16:14:10 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE fix for v7.1
Message-ID: <20260521141410.GA1708231@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello soc maintainers,

Please pull this patch fixing a use-after-free race in the OP-TEE driver
where a client exiting prematurely could free a request still being
processed by the supplicant.

This is basically a resend of
https://lore.kernel.org/op-tee/20260316071210.GA2470832@rayden/

Thanks,
Jens


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/optee-fix-for-v7.1

for you to fetch changes up to 387a926ee166814611acecb960207fe2f3c4fd3e:

  tee: optee: prevent use-after-free when the client exits before the supplicant (2026-03-02 14:36:50 +0100)

----------------------------------------------------------------
OP-TEE fix for v7.1

Prevent possible use after free in supplicant communication.

----------------------------------------------------------------
Amirreza Zarrabi (1):
      tee: optee: prevent use-after-free when the client exits before the supplicant

 drivers/tee/optee/supp.c | 107 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 74 insertions(+), 33 deletions(-)
