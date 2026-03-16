Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC056279324
	for <soc@lists.linux.dev>; Mon, 16 Mar 2026 07:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773645135; cv=none; b=Df1iTxfShPhD5SM9a504a0UxEdtW8LRIVIH/3fR+ucP93fL1SafWvxpRa//J42LQxt06y1bc4ub41oDTKbftWEnwlhhNcih64gOjVHKAnxhiCjgHeRBSBH7z8YP/r4XgiLMlbowa5fmorrBzqAxM3WjhuZkt2k0KZ5kMmISaJhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773645135; c=relaxed/simple;
	bh=gU3Vwbv6Cllx1JMnyE2sAgxfdvCb3m7inq0xMeA+qFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jZ/0Qbpfr+MoQFl6njPjyV3jH7rpvjhowgTZ1/fKvg223ULD+3/tRyqhhaGReIei636CICTVL2Q6Ysvx0gQTqJhEKusSIEhDW1WyuzInQ4Aj9aBRFQE7/MHEBi9eBbqoOKboZ0J7utdj9425bv3nXGcgg/Ax5fKpQK8/mgiiaHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WBby+rM0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WBby+rM0"
Received: by smtp.kernel.org (Postfix)
	id 7788EC2BC9E; Mon, 16 Mar 2026 07:12:15 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E914C19425
	for <soc@kernel.org>; Mon, 16 Mar 2026 07:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8E914C19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a0fc5e2c59so4749905e87.1
        for <soc@kernel.org>; Mon, 16 Mar 2026 00:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773645133; x=1774249933; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eq6ELLjGNJ8R4s2BpmTpbSt0Wq3B9jPYaS+2zlsM9NA=;
        b=WBby+rM08TaKfjaEco0JlzANHC6k1GPByc5eT2/GRigjUq5kmQeDh2iPq1j/sx+fre
         ztLKmSwwcp0drIvMI1vphRm0ZFXKFwr7bGK1Eq7LvZJPUlE3sqFgMUPgL/SFhxqed45P
         XwU9lDKbRHpTK0RmVNMdSeadvra0CdlZeCy1Nnf3r+jK1w6QLK5+99chQtrbqS5G2vtD
         31TYMQ0t9id3KGNn6g1rlK56ub+NpETTDJE4YVHGzVrs+KruVst7Qm+WnRSSfGwItW0D
         RN74p5JFwk7C2t1q/KGBUGf5bpNU2Vg4gs9zA/SwcpkgoSMVMKxJsrfQtgS81j37uE7D
         qbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773645133; x=1774249933;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eq6ELLjGNJ8R4s2BpmTpbSt0Wq3B9jPYaS+2zlsM9NA=;
        b=JwAVfDVOnP1TwRPkG3SX1B3dGn54ob95/J3y/koF8LJO0zYL5p8G+AsTMb3EDPKq2T
         8I0i+8tvTsE6a7pA+rZzlUW/UmxEpiAaCIBGV47VafWr5Wo6aP3BEUMkrOTVWSUurJ/N
         4Zjm/8pqle2lhkQepUHef6Kb+SjrgdkTD8UNAJLzMysmpx6/nX/ly73zWTW/zTDxrwOl
         EkxhDZeYP0x6QemVDs0cvA5DvD4j5l/S/BKVty/7aITmur+nnhHjf41WA9EUMeD0HmNU
         ZnmKG52mLJupVuF2nIlMwclG0siN+zNdNjbaAs5IPyA0xKiWTViv6rJ38E4/7+u2NFNy
         StTg==
X-Forwarded-Encrypted: i=1; AJvYcCXRFtdjqW0pruIpRzN5SLVRBC9n866Q0ticisjsDoiJJYAm2JT5sVOCMnsZAxnXjon7Ihk=@kernel.org
X-Gm-Message-State: AOJu0YwANAomO+8+0EYcdfIQ20zk4n/jYnYRsCFgZlUP2BDzINRfPWPo
	t1DFTCO9NV5As4WDe2tq1tHBbMUHFjTszeiCwatF8eYMxiFZxsbbnAJs6uD7CNd8vrQ=
X-Gm-Gg: ATEYQzxyLOI+7VPgREirzT5y57XVOe66Gk7TV+5UqApRzyfEPkiRtwGcPJAs7JbOmIJ
	Apjk1nU/FUtbAaWWu4EaTUvrUq9toMRjrEL3XJOJUOrykk/bphaIjFJZXSY125Jtnr4QTGXkp+5
	3SELdQkJt3Tvi1hsT4y3KV3GtpoXmHc8O31RGqlBXIfjr4/h+xnm+404bNDAsdXGWp9x75mf0QZ
	z5StAnptxKqCcvIVa1kmxykU4kZOIPAeQTOXFKvoMBn4DVIUvF9gLj5xC1wvS0VsOuZmdbB28dO
	w5C0gb8ZUOLj97zwiLWozaH6Ohik0m0p/TE+USH9BtapfeD57tfU7sDdtRZ7s0DwYhw1b7tlmZs
	/GicTy6urSYCEzLLCJ+sxizIhRnM12Z3hfGvRJBlRrbnQnXCUJYwBmKehTlTqxc1R2VwnmUE1xH
	vlQH0nF3npsnZYd/q9qNXaKhY1j1+HNhIbes7V8BjebGu/fOXKf8EDc0ktJP1pXjYFaIK8MHRi2
	EoO0yjsSy71/toHxH4=
X-Received: by 2002:a05:6512:2244:b0:5a1:8b9:6d12 with SMTP id 2adb3069b0e04-5a162afb89emr4516634e87.24.1773645132499;
        Mon, 16 Mar 2026 00:12:12 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15981e963sm2810529e87.64.2026.03.16.00.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 00:12:11 -0700 (PDT)
Date: Mon, 16 Mar 2026 08:12:10 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE fix for 7.0
Message-ID: <20260316071210.GA2470832@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this patch fixing a use-after-free race in the OP-TEE driver
where a client exiting prematurely could free a request still being
processed by the supplicant.

Thanks,
Jens

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  gitolite.kernel.org:pub/scm/linux/kernel/git/jenswi/linux-tee tags/optee-fix-for-v7.0

for you to fetch changes up to 387a926ee166814611acecb960207fe2f3c4fd3e:

  tee: optee: prevent use-after-free when the client exits before the supplicant (2026-03-02 14:36:50 +0100)

----------------------------------------------------------------
OP-TEE fix for v7.0

Fix a use-after-free race between client and supplicant by serializing
request access with the supplicant mutex.

----------------------------------------------------------------
Amirreza Zarrabi (1):
      tee: optee: prevent use-after-free when the client exits before the supplicant

 drivers/tee/optee/supp.c | 107 ++++++++++++++++++++++++++++++++---------------
 1 file changed, 74 insertions(+), 33 deletions(-)
