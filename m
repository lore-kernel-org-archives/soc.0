Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246752E1C7B
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 10:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672278; cv=none; b=kBJjmIA0yYh3w+cA+/v3s4vAY9QA1FL0mvrDFSWf/h3kCFPoYYUgIaDcqV/q6kKlnAbIvKVZ/EvJvg0xmnDgxQNNBdTXiEkMyuN84Y/GxbMZ6+LRMr/a/fSY+66drYk3B3sKOS6lSQsUS4SXE3vSA8wc64c575GJY/6kNmYp15M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672278; c=relaxed/simple;
	bh=vT8/LQIRmt2vHfU5/njcIHRp8dw/7DucV1ajqqMxloo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PyqHo0lJi9PM12unDhHLDigzJYbEDOHafNe6lR4Bie5ZiEsQxvpFGSnIq8Puo+uMtcqmL4Ks6IzdAvUEggHhvfQrdTtesGe9saQ0NpIPar4Geo72wE/MOQbHcUzIzgeoFfK0mv9SN2j+dEgghcEFRUTJaJ0SKTC7QKAipkJoeL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U61oHl86; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U61oHl86"
Received: by smtp.kernel.org (Postfix)
	id BB691C4CEF4; Fri, 12 Sep 2025 10:17:57 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A8726C4CEF1
	for <soc@kernel.org>; Fri, 12 Sep 2025 10:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A8726C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b0787fdb137so255269966b.0
        for <soc@kernel.org>; Fri, 12 Sep 2025 03:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757672275; x=1758277075; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lTzuzrwSKIoy0QCORxUKogHZpcF/Bu7LDHHnirDhYR8=;
        b=U61oHl863ZLzem328jrTLdZ7YrlHfr0Ylbseisndz0G36MhQM/4O5Z4n8c0BXdxKNk
         pUEJFFZlv6JD16SGsc2j6IngNJgVNm1Qoyn9HFF1juNRff5oZk9lBU9KASDIjDDiRnOV
         yFVgffbcY5wd0c8zGmS9bk6YwpgMGNv9AE2uFs8lxWJytKNmJHsOq03Pwg/1g5uX0EUG
         be4hN3uNIdZy8OEwfrJf71dz6j3tw5sWAZAA5FqNkxCjO8uaUrBfzc6nJ7vYq9SGSB5Z
         Zd7mBozcjpPcNx1nX+296r3Gs/XP+1hM3BqVhk7edubqA9xI+f1BOsWzwFV4EdpGLBqE
         2G3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757672275; x=1758277075;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lTzuzrwSKIoy0QCORxUKogHZpcF/Bu7LDHHnirDhYR8=;
        b=TwgUtKxQIK+LFdqNrmRsNPRXMi6ObOJVVlEDmPzKaR01dwdW9HjbSVczaXQRK8LweL
         VYoESOrDtMI1hSglt8UD8WgVBj/SO+C66IIH2UhBRXVC5scwGMZL45Am7EKtR3m+/w9J
         GO0QM18Y6nXgANkqhN0kXprjYtG5beStFKo6ZuLEZ8hHrgy96INqJZeqTRCWgWvvo5qs
         hIRG7EEKnHG6mlfLn10FcA4WLVXqSNytcQdIpwvYY64m+p2sU8Rlpp/l7k22hWS2gNNd
         W7TEHfFXPreRXtzuKqz0weM0YGa4UfLa50BG5pao4129cxK3AqECLD/xP5xWt4lR/1B1
         gJ1g==
X-Forwarded-Encrypted: i=1; AJvYcCUxSzhUeD4mKNOcNu/hfTMDwXca9kARJAZenscOVGkC+n/ZYR19uM2zskYUAL4IrIi5WDc=@kernel.org
X-Gm-Message-State: AOJu0Yyh4Vtszr2zzf29GFivx5tipSnSKQkZjZsDocIz5W4nI217AzUN
	J27RSJiPoXeSd0Z3IkIR9aEIB3fRTy51z4thFIwHEofatj3HONdz4CLr9iUJW9PttURcz9dXSMp
	L1Gz2Oyk=
X-Gm-Gg: ASbGncuRO/Z7oF7eG8ZubhkHXI/m99vNRCQTzkF8QeZgY6x9RjbI5j2zUtarc352Nu7
	+dNjCQgU5wvdEg0JM6s7n11jreyFZtzktLGpnes4KVrbKGMapqXt9l80kPNn4246Tp33OzyDEpB
	srB2rhaIW7JKR2eCixvLq+yaOhIUHybxC2mjh/Psu4Pn0rfT79MLdJzQ4ob28isrkzmYJtiayXg
	J8DdIBMxBTvowJKVnMf4S3TJ8vNG0MHgldfsnOETK1/xsg3iz3Y4pu0Reu17icYiOlUqCvj3oSJ
	SDXFzyTkw86qsybkUOfLgfYHYMSR+CMB/X8xl+b+RAxUOKaUswOtWGn0qNJZEEq4h/sRz4bON2b
	SDI6t1kLkwzK2eBXNfWq79Ir8+HY6IRLypaNK2c0c/QxfUDEusyZWYEhDF6ZKMDWS59DdhY5hRu
	4=
X-Google-Smtp-Source: AGHT+IHFwPpvM0RAZ0u7rHWSik54d2YaYUorN19OUt5HDkQV06Xun9QOHOryJK4lnOZ1tS+U/f++PA==
X-Received: by 2002:a17:907:7fa0:b0:aff:17a2:629 with SMTP id a640c23a62f3a-b07c353eb39mr226343866b.3.1757672274881;
        Fri, 12 Sep 2025 03:17:54 -0700 (PDT)
Received: from rayden (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334e4fesm343087566b.106.2025.09.12.03.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:17:54 -0700 (PDT)
Date: Fri, 12 Sep 2025 12:17:52 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org,
	Sumit Semwal <sumit.semwal@linaro.org>
Subject: [GIT PULL] TEE protected DMA-bufs for v6.18
Message-ID: <20250912101752.GA1453408@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this set of patches enabling protected DMA-bufs in the TEE
subsystem. There's a brief desciption in the tag below. All patches but
"dma-buf: dma-heap: export declared functions" are withing the TEE
subsystem. The dma-heap maintainer, Sumit Semwal, has acked the dma-heap
patch to be merged via my tree.

I believe I've addressed all comments from the reviews including providing
a demo as described in [1].

[1] https://lore.kernel.org/op-tee/20250911135007.1275833-1-jens.wiklander@linaro.org/

Thanks,
Jens

The following changes since commit c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9:

  Linux 6.17-rc2 (2025-08-17 15:22:10 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/tee-prot-dma-buf-for-v6.18

for you to fetch changes up to dbc2868b7b57fb4caa8e44a69e882dcf8e8d59bf:

  optee: smc abi: dynamic protected memory allocation (2025-09-11 11:22:43 +0200)

----------------------------------------------------------------
TEE protected DMA-bufs for v6.18

- Allocates protected DMA-bufs from a DMA-heap instantiated from the TEE
  subsystem.
- The DMA-heap uses a protected memory pool provided by the backend TEE
  driver, allowing it to choose how to allocate the protected physical
  memory.
- Three use-cases (Secure Video Playback, Trusted UI, and Secure Video
  Recording) have been identified so far to serve as examples of what
  can be expected.
- The use-cases have predefined DMA-heap names,
  "protected,secure-video", "protected,trusted-ui", and
  "protected,secure-video-record". The backend driver registers protected
  memory pools for the use-cases it supports.

----------------------------------------------------------------
Etienne Carriere (1):
      tee: new ioctl to a register tee_shm from a dmabuf file descriptor

Jens Wiklander (8):
      optee: sync secure world ABI headers
      dma-buf: dma-heap: export declared functions
      tee: implement protected DMA-heap
      tee: refactor params_from_user()
      tee: add tee_shm_alloc_dma_mem()
      optee: support protected memory allocation
      optee: FF-A: dynamic protected memory allocation
      optee: smc abi: dynamic protected memory allocation

 drivers/dma-buf/dma-heap.c        |   4 +
 drivers/tee/Kconfig               |   5 +
 drivers/tee/Makefile              |   1 +
 drivers/tee/optee/Kconfig         |   5 +
 drivers/tee/optee/Makefile        |   1 +
 drivers/tee/optee/core.c          |   7 +
 drivers/tee/optee/ffa_abi.c       | 146 ++++++++++-
 drivers/tee/optee/optee_ffa.h     |  27 +-
 drivers/tee/optee/optee_msg.h     |  84 ++++++-
 drivers/tee/optee/optee_private.h |  15 +-
 drivers/tee/optee/optee_smc.h     |  37 ++-
 drivers/tee/optee/protmem.c       | 335 +++++++++++++++++++++++++
 drivers/tee/optee/smc_abi.c       | 141 ++++++++++-
 drivers/tee/tee_core.c            | 158 +++++++++---
 drivers/tee/tee_heap.c            | 500 ++++++++++++++++++++++++++++++++++++++
 drivers/tee/tee_private.h         |  14 ++
 drivers/tee/tee_shm.c             | 157 +++++++++++-
 include/linux/tee_core.h          |  59 +++++
 include/linux/tee_drv.h           |  10 +
 include/uapi/linux/tee.h          |  31 +++
 20 files changed, 1670 insertions(+), 67 deletions(-)
 create mode 100644 drivers/tee/optee/protmem.c
 create mode 100644 drivers/tee/tee_heap.c
