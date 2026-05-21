Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274AC221F0C
	for <soc@lists.linux.dev>; Thu, 21 May 2026 14:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372153; cv=pass; b=P4dGxJYRaOlpw3dtXI9MRsI+q8tCx+76miFito3rGeOUw1djVZeyhE3XSGI/pdFSxvf6CsDbxXlySgwo2hm4Wpqb+teSYpO3cf5a47r+IqM67q6zHgCBtRTwooPMWLOYd88vUCgwYGM0+1Mc95ghWG3BagxDHa1y35BHtWcf15w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372153; c=relaxed/simple;
	bh=NYUei8B/o0vof4v/I+CljGVxaiChR/G+Jh3Lv+Z+8o4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SD4IiC5Gs7CbBcj01JoSVzqdSTdX0wlQuaoIlxNa2QwE889DtA594BnWYxQsKWe7Xc79haHl0hskKS/3lulGMYW5gm37TN1DkigEDUoNA+PToIQkW6SsbgcSU7f6D3Z29a1zpyRcxE6jXZBD1dBg5wrfgs9gk+TWLLj9VmfPyoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B1UL6Mp4; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B1UL6Mp4"
Received: by smtp.kernel.org (Postfix)
	id D3D041F00A3C; Thu, 21 May 2026 14:02:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.208.177
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1779372151;
	b=k9EZgQeOwiix9ZuRrtiLIz2vfARUNyXliwoE7epuB9rCCIZ1IOC9E9L0yD++qfK7EooG
	 RtaGQRPRKEjCutAmLH6yi0JozzSNVRwto3Ij8FemGJzhE0tbBUn8JLXogMR92UnwtWJOr
	 C/KMvtzF6sCV7TIVb7kOMv0Y5tZn7k99GwWkDMvrmE/WLd1j6G2QqYflA5YRueGDd03Oe
	 udkNde4fkDR5Yc5E+wXM4+pLFXwTCLj7rAFEaqgOg3GsEcTXhPqqb/TU7iQ0BzFAXOXOq
	 s3aPWqntO1B/8u/odTN0XTNDgq6+jmEs6jKgueBvgGzEGWfo9XXY3tdSoOPrEx3PChQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779372151;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=O4EDYvNhidqTpiXQIIrbD6SRTj3Qr1KMzIp666/F87M=;
	b=nQ/zgJsmFuyktUyjzaohLHaaq/u9tXRlawZWKIDt2BLTKHYYpzWt4nHDH91HhaDZFQd4
	 Gnfv4NoknuQxtT271aZsdNT9PiaehZAVoZLO2w0gzzUP1ppxl2O8TaICq1U+xZD0ATdgn
	 LmPLmt58tGjpg6mSWrckwRLeZ2hMNANWIeZ6lpBxqPM4Sp0CG7YqAKBvyMy4TDArmIfmj
	 HKXrEiu7yt9isbP/m//VG/ZhmZ49/pbCVpa46FSLs96e2YqutUV4f5aYbTLP7i2bBfFwa
	 0doh+GZMT57emLQxdf0dFmx/n8QN2hj2aeYZTLcpFR2ZfbWg3GzBUFLc7+PfBIscHiA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=B1UL6Mp4;
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	arc=none smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C1CB1F000E9
	for <soc@kernel.org>; Thu, 21 May 2026 14:02:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=B1UL6Mp4
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 3C1CB1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39389398838so59223781fa.3
        for <soc@kernel.org>; Thu, 21 May 2026 07:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779372149; x=1779976949; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O4EDYvNhidqTpiXQIIrbD6SRTj3Qr1KMzIp666/F87M=;
        b=B1UL6Mp4MPp0zxjEMoRe2J97qwBr3+fjZy6k2evAegR4Taa7W5lP1frAhvD7z+42Yg
         7LFm0IIRzXwc3+f5EMZxt9M82E7zbnENI1yKRJ5xO4YzSwkxKdMjcwdcIwBLrZQtQJxl
         Mv+xS7duVcHzi/F0N6vRE1xBTRVpjwrICML7uWAhEAjO8FGnog/C+QIDvJY4GBOCJihC
         JRBI/+jMNlEEb3V76WYTHM/pcmy0drXUR8kCrlxhwnr/Fzmi8JVCov/D0nyBw+ntCHY/
         +HqAklLc/yZp0BdiIuxosm98szVmpKvKAEyrYqHGO5GleSsmtu4qJm1DSopzy/7XWyuJ
         YiPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372149; x=1779976949;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4EDYvNhidqTpiXQIIrbD6SRTj3Qr1KMzIp666/F87M=;
        b=iQGpQv3Ny6fELjKXCU47UexbUsrcK4BfC4+Vo1jVXc7VMgOqD5k4yKNDhqbVOMdBEE
         wYq/weUWu+2Ai3MMW0hTM9dHJjLJxziCXqv6VrhbmRmlook2TWACtu+AowQICMmntN/e
         tpC6TR3MRz8gJMCE1OuMH60lPwh3z53W4bUxRHEQomFpG+5sCnm8aenOOcVV4uleCuNx
         D5Qm6FxGbBZZXf4r33glo+Vu98LIWGzfpxIYM7x3WD/h1zSCHcE0CBTbLxbrSALYnoeS
         hihoStsEVN0b3mUOcEGF35by8mdvgyNxOB0Nau7FWfur4NOp/iO1SvF0sFTHhPT8mwRe
         zCrA==
X-Forwarded-Encrypted: i=1; AFNElJ8rFJBZnuIGIObEY4N3pRfdRY5Nm+m3pd30ctYAnlQ7HKDEsJtOZRrBI5yDKInaaApsE1g=@kernel.org
X-Gm-Message-State: AOJu0YxyC6yAW10ib04ttYQpLmTi3puRr8JMB9cOrs7D3ZXczMzeXaX7
	jkO1jBnKjEkkCwFeN24wNPLdmSoKxMVpJM/fof4AwPq4TSGosxLrRcSqTGde/DmRQL4=
X-Gm-Gg: Acq92OEKvtIEKACv6CG1Fd8isbCyDcvbDOOkqV/1R3wQRXLOJysnR+bsAeg7+2sXvqw
	LUnU3TrJ7QDQf2y+o8oLwxlDAaP9UOrqQCOO3HoP7FXv6TAcbSfzX13KLo5u/KUnK83aWTU9eFK
	uOXSu+VRdgt0qbbEBe6VlfLprUhEsIfn3FgPFHsxUOQBIvaNGuYHi9kVDoK3SnF8PjbuW3zCeYE
	yVXTGppABiTyexxdUUOAi0fhpBWvVYGcuNXUCHy0trsVRge7/6Xy+7U/ferhEaM8vx26O77TB/m
	BPd9VEmFkCzW4E2oGa1DrVVOTLq4b+ilqd5L4fR3StsuV4H8KJow8nx37lmPSPNPrG21ZibHTsP
	36MIW8KxUpklftTWkn1XrrF78FzD6+zzG39tBKFpWbGSQPcrnFaFw1cxa0R5N6hVaDsagMdxPti
	1GCUxtclnL5+ZJOvFdnMfeJjUFn4Z9+jK5Kzk8Ok3D/AuW4EQE3UFWQKvlhyEmhC3nDXRLk6gxl
	1yiueBS7UCDAz0DN5Mf
X-Received: by 2002:a05:651c:b0f:b0:394:3edb:eb85 with SMTP id 38308e7fff4ca-395ca169770mr13907641fa.4.1779372149002;
        Thu, 21 May 2026 07:02:29 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395d09df4ccsm2850791fa.5.2026.05.21.07.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:02:27 -0700 (PDT)
Date: Thu, 21 May 2026 16:02:19 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE fixes for v7.1
Message-ID: <20260521140219.GA1707515@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello soc maintainers,

Please pull these small fixes for the TEE subsystem.

Thanks,
Jens

The following changes since commit 028ef9c96e96197026887c0f092424679298aae8:

  Linux 7.0 (2026-04-12 13:48:06 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/tee-fixes-for-v7.1

for you to fetch changes up to 6fa9b543f6b4ed15ff72af266b29f316643de289:

  tee: fix params_from_user() error path in tee_ioctl_supp_recv (2026-05-20 08:49:09 +0200)

----------------------------------------------------------------
TEE fixes for v7.1

Fixing:
- params_from_user() cleanup in error path in tee_ioctl_supp_recv()
- possible tee_shm leak in error path in register_shm_helper()
- padding in struct tee_ioctl_object_invoke_arg

----------------------------------------------------------------
Arnd Bergmann (1):
      tee: fix tee_ioctl_object_invoke_arg padding

Georgiy Osokin (1):
      tee: shm: fix shm leak in register_shm_helper()

Qihang (1):
      tee: fix params_from_user() error path in tee_ioctl_supp_recv

 drivers/tee/tee_core.c   | 56 +++++++++++++++++++++---------------------------
 drivers/tee/tee_shm.c    |  2 +-
 include/uapi/linux/tee.h |  1 +
 3 files changed, 27 insertions(+), 32 deletions(-)
