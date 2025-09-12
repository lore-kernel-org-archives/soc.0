Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8942676E6
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 09:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757668579; cv=none; b=nqyuoxQAjZSNW6LdW3EcS9+VxyG6DFMOedANbLKAhSwryhMXvgUgcPjW8cBMBcuva53NaNt2bE2s6iHNOGlDgVMw38xJlaOedKrGyxIqBLxKAUPU8S9v+SjCp+xigHJvnTwFNAeADL4i11wNo/ZGqiUd2uMn6kI+CsF0JDxnu8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757668579; c=relaxed/simple;
	bh=HFeSznzv0BKvTF0ZWJ7i2VPmGG3984gaKtB2uNS9LUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CLNBm5UlDdpz6c9PdTcX4AEJG8abWDbctH3kUdRrSzroWCpI4hYGH0/G1MgCMCyZOE2Q52mFvPrzOonZqOxJ1ePXFq8yPxuEE9skGCQSPtyH1bVV63dpKbo4LPCro43X8mrvdFihr7Vc8IvS8tPKzACq+Et5a6uGlHmIUd0y32k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OSwUADNS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OSwUADNS"
Received: by smtp.kernel.org (Postfix)
	id 4043EC4CEF7; Fri, 12 Sep 2025 09:16:19 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 130C7C4CEFB
	for <soc@kernel.org>; Fri, 12 Sep 2025 09:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 130C7C4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb7322da8so317969966b.0
        for <soc@kernel.org>; Fri, 12 Sep 2025 02:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757668574; x=1758273374; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZlgUHzzUxcsBtMaCAdoxtWQY7ynJqMN0gA8+gbW0228=;
        b=OSwUADNSGnPeg5PEpPYREISYsOBAAAT1cJ1pZPRDYSaU/rAeIiWZIsRqlC2zUvR7ll
         JDgMqakeif8XQCZZcx2b2rwT8XkmvWxM43UIBjvuAit7CJHNlbfDqGPC0S2T4B6CNs54
         yFU+txXCz6OEk9IFWOuQQLLG5fankt+mMpXQBVK6qmoebLdaXONqT5yXrwtzZmp3mF8/
         +XSKvMiZ65+1BUrBRtP/Jj7jV47wvVfTydt9KrSDUq6evPRhfDgS0E9s5tSGy309XP3y
         66VS03FFd4ikm3o11l6fgL6KDNuCcuBuXyKSrIdkYapSX+3nMTmhaUwz1ejajnp+8pHf
         1AKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757668574; x=1758273374;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlgUHzzUxcsBtMaCAdoxtWQY7ynJqMN0gA8+gbW0228=;
        b=GhH2mu1+EVXaLh2yQTRTu8NE7/n9nG5fDYl1oOhTMSGLIsVjcwQDOlx/iJcTLGkXdT
         To5G1eAnNRVLWpTdGXlkyJORIIEBVcR2D51gEjPcztUQoZZGLQHzKs+P//JAJzdlg1Qy
         AU0ljImqVQ9fEKx6RWTrrk7a6hukgTCvd6fSQBGwQNAfzEc4n5vBIS6F2A+4nAHjJk0F
         ZrAHXflTMTwXUIX+j9Utb+5L2mMG4tYpx5d/NHY+7jbeYi8hhMSm9HX33MRqYbTgQwr+
         NFPonHgIcS3SYhbH5nvSizV3tRWYXuehseF9oNDZVhua1i6GpNNMuCcVr6SXMxXer/yc
         LGBg==
X-Forwarded-Encrypted: i=1; AJvYcCX56FqZvVjARB5SlOMLAfDVcOyzMxqxX9/LvG6+sLidaQ0lABne36jUFb4oyg16n/F/CKs=@kernel.org
X-Gm-Message-State: AOJu0YwVvsOf87mr8bviez7rgH9ep+tqctTlZORo4Sac6/aUc7QzRRDO
	NIWanf9+CctRrG0fOkqRHnJbFRcMhyKz7lASiAeUmWjJRD3TdvQ+bJxCc/EfnEaYtH4=
X-Gm-Gg: ASbGncvllcC55v4Ttt9QmlVwB7EgA5/enE8Xf3jn55VTl8eT2ZBieAP6T9dIJdI975O
	v9H7F6JNwovY5WyPHrkQHqJFmDpflykXaL+hrc7w1A3BU2BAN9VQpMR++YUQiEuLq4JzyuBX9z3
	bLvh/cE0ZuBPnx14+4YahhHA/CoR2J9dYTm4B7eVLZvkvVVh4g2PQzTXIlmAdPL72nu24Rd9IsE
	o1PxB9XHs6MavrwRt0nx+LZe5OLw02RmQz/Sch3Xv9pEkaX2x7peIYO8NBWIaSoHp1gamKT5rT1
	LiX+2PGzM4fLcXmO5Ck0BDUsj+pvBL0mQFSVMuT0KtCV+O24QXidsIv1ATk92hAxxe4Z+Ov/rUN
	bIzbxxiDOrkyDYODGlKAokO4UNbF4wmIPMl2fBPZPQgghqiJdDArY9cZm2FwUPcocD5pVxUmNFX
	g=
X-Google-Smtp-Source: AGHT+IHW8XMyz6nqW7u3TYUw66sukf98+XYt67qdK2NQa7FJLPadrkYMrrqcrPARFvnU1xfgiv01KA==
X-Received: by 2002:a17:906:794c:b0:b04:302c:fe14 with SMTP id a640c23a62f3a-b07c35c2af1mr200439466b.21.1757668574166;
        Fri, 12 Sep 2025 02:16:14 -0700 (PDT)
Received: from rayden (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334eb58sm319624566b.100.2025.09.12.02.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 02:16:13 -0700 (PDT)
Date: Fri, 12 Sep 2025 11:16:11 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE use SHA-1 library for v6.18
Message-ID: <20250912091611.GA1442659@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small patch for the TEE subssytem. It simplifies the
code by using the SHA-1 library instead of crypto_shash.

Thanks,
Jens

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/tee-sha1-lib-for-v6.18

for you to fetch changes up to dfb2a4f76ff7f60d6e2a55b6a973dd42930adf50:

  tee: Use SHA-1 library instead of crypto_shash (2025-08-13 14:29:49 +0200)

----------------------------------------------------------------
Use SHA-1 library instead of crypto_shash

----------------------------------------------------------------
Eric Biggers (1):
      tee: Use SHA-1 library instead of crypto_shash

 drivers/tee/Kconfig    |  3 +--
 drivers/tee/tee_core.c | 55 +++++++++-----------------------------------------
 2 files changed, 10 insertions(+), 48 deletions(-)
