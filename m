Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD2026E16A
	for <soc@lists.linux.dev>; Fri,  9 May 2025 06:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773919; cv=none; b=Qxsbus+qh6vZDc9WT9zQ2ynMBlJC0dSgk5+5ASG4Eg844bufEhMV0gD1iOrambg8OwzBPWcKqnOUl4x6eEayxSMSGCe88e6tWyu5aIuQsLYBj/fMw4tpEcP8im69Yan6QhDRw3amx48dlAZwR0L4D5u19e9jp7OkOqUT0RBy+7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773919; c=relaxed/simple;
	bh=TFG0yZH9DngSMg6CI2IgJYe7USu76tZM73b0MECJA+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VBVy1ijvU4JlRZVDXLgUp5IoxpNMNBlvpAGWG4Ks+TnCjZVGwmtS5Mhq9ekG4ul5oW66AfN+QGggz+oel3C69ABSZm02f+W5/YhmOooSVusFsMgtP9uVm/cUP/gXJ9SV6oID7W37rNitBhAuTd7iOX0dgmHmMjpgN/NSmbzOaJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vRpbh487; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vRpbh487"
Received: by smtp.kernel.org (Postfix)
	id 9824EC4CEE9; Fri,  9 May 2025 06:58:38 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A8EABC4CEE4
	for <soc@kernel.org>; Fri,  9 May 2025 06:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A8EABC4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5499d2134e8so2287172e87.0
        for <soc@kernel.org>; Thu, 08 May 2025 23:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746773916; x=1747378716; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2EQXB9e14/EbThODKAnSR7YxD3dmoo2cX6xJNhO1H20=;
        b=vRpbh487c2dsC8xmSgu8JiCxaWo/1nZL0Yd1tHMrXAIauYCsXA3SXIY8z/+CC4lrBB
         0WfUkrAg5djk+uypxIa6t88VIRF1QooyLGWCnjajRbexa4RvcKTX9MVgMhQgUQg8H1NO
         Snk9UvhCyfwXEsTy7ZwqDJMqVeLdZyj9cfevXrkanaSnQZYYr2foOmLimtF78UjP5s3Z
         vMHbG4e56J2aOTfpb3G1S5TSfuK1zO8K/mdCDbcmdx6rcd0b5XBhk9XwFTeJVyTjKY1L
         KxnaJ0WpnCBZ9EcT54FDHB070SKcydxLjK+EtO3XUfarTKz97h2fDGZjmOCujEoBOFJo
         WutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746773916; x=1747378716;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2EQXB9e14/EbThODKAnSR7YxD3dmoo2cX6xJNhO1H20=;
        b=n4hGz1mMpN5DlA5uZl/67A1nQxqJqErvWh+cY+1vWQGXawpyCuh3loidXex3/Hf63b
         NEDhYDlhiwQk19LnO2J8OVOp64Nrpjx7ORHgfn5q8E/xc3gXUmSHJ+FaCURTrJNkV1+Q
         EEqDxpt6V+OnTasYrVRYEG1UJ0vQWQSazp4l0k02ErlyuljWem/cBIFUfJ0skU86l1aL
         r8FLHBEi5aOnO8ZMTP5BFEHd0uSoDLkJ9IPsH2s6nzrxRX6wlNgT90W8ggK3vgZqAxLu
         b1P0LS24z9j0NAikM9Dop5zIUgwD1rmQyk6eoFHxuuvsb933fJzPZIWtVtSsIZcphQey
         KF8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWQxeT2o5s04EEiFioylXcdOJUYwfPasXD0UiXRC8suMCT4+SGteYhHPOaNFZPahYqCpsc=@kernel.org
X-Gm-Message-State: AOJu0Yyma6D9Lrwnl5BorN8I1GpFMiHK3jBVWMOFuTj9OU2124TY6QHG
	52Jo/qJQJC6Bpoz0Cdvr1xlZgnymtAqAXBEw0xUMcArarnHPXGrwQVaHrFXwQUc=
X-Gm-Gg: ASbGncubXRutsmM1KkMyw5ZQIIUoNQnvWyi9eWxSaBLKJvcKowrFZujzKAbANW4nkKz
	h3COtyGwzz7mV8WghLyOhOl/up/9N1hv/fOckFJqOLI+11OXgK2iuch/hvP+nVGW90OLYTmE2Pk
	IBnOvExKqMZtDi2H7ro7QNydvQ066nCxZPgiJCXy8XmArsIy/ryQxYb6i6nYFTj+nSJFOyPZVsS
	QrqJDa+RWDO1shcJ6kZ+UGzLMKTrz3pMq0mDkWfimLhM2w1jE5si86M1G5EiG3uyrEPe/pN9DTh
	kilcqjl0fpEdwO1Vz4JIfUp607AEYwncYIN/NQ7YyGbARVUbBRBApjlHrmfYYnv0iJpms7RcNRU
	a1OrLxfE=
X-Google-Smtp-Source: AGHT+IH3EkxXTq0TXiCz+ScAzpBkCWHAoFqCnNrQw3x3DaNWfM/7rQYlSCeVQemX43yijXhghECcYg==
X-Received: by 2002:a05:651c:150c:b0:30b:9813:b011 with SMTP id 38308e7fff4ca-326c4627e6bmr12199731fa.28.1746773915667;
        Thu, 08 May 2025 23:58:35 -0700 (PDT)
Received: from rayden (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-326c339a324sm1893081fa.4.2025.05.08.23.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 23:58:35 -0700 (PDT)
Date: Fri, 9 May 2025 08:58:33 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] AMD-TEE updates for 6.16
Message-ID: <20250509065833.GB4188600@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull these two small patches for the AMD-TEE driver.

Thanks,
Jens

The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

  Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/amd-tee-for-v6.16

for you to fetch changes up to 136deca59b1613c22aebfb0c8508dd02363c7142:

  amdtee: Sort header includes (2025-04-29 10:57:57 +0200)

----------------------------------------------------------------
AMD-TEE driver updates for v6.16

- Sort header includes
- Use pr_fmt

----------------------------------------------------------------
Mario Limonciello (2):
      amdtee: Use pr_fmt for messages
      amdtee: Sort header includes

 drivers/tee/amdtee/core.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)
