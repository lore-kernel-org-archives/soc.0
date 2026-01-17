Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6C52E0B58
	for <soc@lists.linux.dev>; Sat, 17 Jan 2026 12:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768653328; cv=none; b=WesEVQ8o0iH+jALttxTfMyxhVU61HDInDFznFPP7OqLg1OyzD0syThMRFsd6NFEM7qsMsRYUwj5QsJe4nitsoX/KurI7MlrzVURmYFFR5lT59A4tM4L+GC0wannWFQMzrcJQwEj0tARfvaaQNMFo3eXHHWcDg9XiMCM/+KWBtxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768653328; c=relaxed/simple;
	bh=HnoP6K2m2/Cocr1GjXp1mGc7hNj0ofaa7tMbPJpUW2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FiVINxcSyAODxY+0Ru8BEkBr9uySTJulR5RNtQZ57ZBAh9a6gwimtXi7Tg699MVusQO3OD6cCXq1o/MmMHVDBt/BEQk2SrCXMzZWGNFirThkm642qAGvjmUDu3H+IU7MxXe5rAtMJHL/B9iEhERZKhOxtLVyAgcyrWHxjU3sgRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L5J+SvRv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L5J+SvRv"
Received: by smtp.kernel.org (Postfix)
	id F38E4C19423; Sat, 17 Jan 2026 12:35:27 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 19F20C4CEF7
	for <soc@kernel.org>; Sat, 17 Jan 2026 12:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 19F20C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b87677a8abeso494883466b.1
        for <soc@kernel.org>; Sat, 17 Jan 2026 04:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768653325; x=1769258125; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OHB8mTWtkxvrvN+Vq3yTEJeDBWydoCoOf+W6FRB8+g8=;
        b=L5J+SvRvDKY61a3HAstm23mOXx40HdAJH0O6TDv8vwNuLPoTwXIZn3zHHl2SqonJmP
         4zefe8BsQd8ppI/0pwpM88LBbe9LD23suXPBr8YT44HLVHb0ReW9tbCEy9WCrdgf+92S
         PoQfm2QccPFBOkGHqBRg225fsSFfIBsQEYE+kcrAG43G2Ggi/5V4HASKy1thEjEe1Fr+
         41P138VhQmd0o4cCQWjRP3gcNQ/BKAlqWcTCwW1zJpE4p8BsNgoy0BDXe32f8KPTBxAE
         0vYyk8VsHCYH3O7HgPWzwQqi2yKGLr0rIrQcil8LDlhHaioVnR0thGvfP7xJePw1WjsU
         571g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768653325; x=1769258125;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OHB8mTWtkxvrvN+Vq3yTEJeDBWydoCoOf+W6FRB8+g8=;
        b=gZSJAhCHY0FnAJeNMnx/RrAaYNrPUYYoVx3CJ8a8KuByw9FU4auQAk1qcT+4PgqcLu
         eDQG8OIIH52THIMqt94xklT8X+t69qWhcZgW+q5iGnk1V877mFi3yQ4teVv+DXBLxjhj
         br97+IGtdmNT9GPJUZ//LJyTdgerrTVxJkSWHHIeXNZB7huCWqSZUnUQ1dmcMsUr5Pk4
         Yadousc03NuuO7akmXxFmOKZXzdQGYYasrsGqz+kvLhYfm1w3DZUilzpYLUJHIbiiiMf
         YBjTLXDo8EQfQ17n+8ry1LuwZP2hOQy8YAewtGzfg9kLwAwfwrFohxHOle6VU6ceHc9I
         Rklw==
X-Forwarded-Encrypted: i=1; AJvYcCVyliqfW1pdSM6ItE3XLg6J3CbBPoPqEWia4oLvJCPAYNUkiIbQHa5dUqGrkNxZrQZIuP0=@kernel.org
X-Gm-Message-State: AOJu0YxezAF1OgCL/bRbPdmoFCJXm+EFX5WcraQQKrtJLWu5Ka158uq/
	BpngeN/F14zs/FqR1X9eGBfYK86a2VJpEmTZRoXrKDTT2ogYXvDWFY4emn69QASD20Y=
X-Gm-Gg: AY/fxX4tJjAYMe4yuJdnl5iLzZ/KujnJif6p3vfBSGWKtmbZ3qirFp9QYMrEUePst4q
	/27sf/90htQdz/Eh/VTzESyxThieuBfZ5P7Zo/WuoT1Y7N9RkFfoz9eZc2uDmdboa2ExFK+2XIn
	JUwp9P8SfG+Pe3PhaUdIZp1i845xY+PUuw7O+bhJrSsrJmZwfVPKG9TnyLJ4rUnMe7dRBt8gBA9
	6FKi9NZKl2WdKeqCIw4etGP0AUnDuz8STViFrLl5UeKtp8ik1l25xVa0hm39FI6NS3b9fjqQNfJ
	x+1vihVQwwCMiswfWHKJXux78EgrrAuKL8unSUo0NhmifJSbVGCUbvIf+Vkfa00AG/6sXeUrNzs
	TI7aZjMsQjwmvcH737eDQ+nAiFPUKPpuZwDGKhqf+VVbfEiOz45vBzLMTjGTVZu7TjBFYVh4Xg5
	qABIuYZ8GRs5gfUwDZPpo2ZnoU5nzWbeCcw/DBeC3ZtN7GNsLm5uZ524PvbAFpTXr+vGCNNWWdF
	Iz1lVoBypceqS01qg==
X-Received: by 2002:a17:907:5c9:b0:b87:20eb:a66d with SMTP id a640c23a62f3a-b87932eb188mr453397666b.65.1768653325226;
        Sat, 17 Jan 2026 04:35:25 -0800 (PST)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879513e735sm530465166b.13.2026.01.17.04.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 04:35:24 -0800 (PST)
Date: Sat, 17 Jan 2026 13:35:22 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] AMDTEE update for 6.20
Message-ID: <20260117123522.GD255115@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small patch removing unused return variables in a
couple of functions in the AMDTEE driver in the TEE subsystem.

Thanks,
Jens

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/amdtee-update-for-6.20

for you to fetch changes up to a0db08f47c836251fbaccf711e12fe8428235465:

  tee: amdtee: Remove unused return variables (2026-01-14 10:20:51 +0100)

----------------------------------------------------------------
AMDTEE update for 6.20

Remove unused return variables

----------------------------------------------------------------
Thorsten Blum (1):
      tee: amdtee: Remove unused return variables

 drivers/tee/amdtee/call.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
