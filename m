Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89A82E7648
	for <soc@lists.linux.dev>; Fri, 14 Nov 2025 07:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763105795; cv=none; b=Oz+vQEOKGwSmd2/yHb+WL0jqjKZHu0cRYFHZ9w5NiFzT8Y0ZvC1k1vxUS+Znd+8vZLdyPaEqUb9vyHvhpBimyQu97Ux+Ng1LryRh3YFwcOezF5TAcrHTwD7iDPiN6bRA5/5qQfNa2swTZjCbRxLgVKgxaYanH1Q3HhjO/vFMJlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763105795; c=relaxed/simple;
	bh=aAj2e5XscWNr4ZxyHET1EVwLMREoaXZIzEE6T4sgWyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mGQMhNICtqJNlNYybR0jEcStOnfQVM8OEw9U/pvydJ7Pnc/Li+mrCtl/xWyfP7YxXZdYlHkshMnIXR44d8tqUDXkmQSK/z55Y/zdvMJAaZkGXQ47EmyaEwV6zW8QGcCi6zmmtRC6cR+Okgmg5XaGLAsL1qFoIrX1Puh05fyQeuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qw4m91hS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qw4m91hS"
Received: by smtp.kernel.org (Postfix)
	id 716C5C4CEFB; Fri, 14 Nov 2025 07:36:35 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 800E9C116B1
	for <soc@kernel.org>; Fri, 14 Nov 2025 07:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 800E9C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640a503fbe8so2821709a12.1
        for <soc@kernel.org>; Thu, 13 Nov 2025 23:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763105792; x=1763710592; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yz/684pSy+bY02PwcaHx+E+9NyXhxklBLKKFKYytCFk=;
        b=qw4m91hSsYtNBHDX1cpk4CJIPm0Txwv7DcBa0zZaurY+s7NNA5C2LwKq3DMC4Gf0ww
         NIt0ZUjNOb4hM2QW9XW3wKOWm/Ot+L9Y5G/Vo9CcQ8JtcCG87CbWpT5F67IF9ooK96Je
         MlisIrq3oZ+3/IJ1C7Z1Nu4fxgGHpwdzZaHSTu5kzO2GbQNqflo9QF8Sc6mkyXGvoWtF
         95EZt3i3mva0ojQOsYkJCDVL+oZ0gcvnOtFzqPPFX5qZkFWcXOgCs/d9e3WpV2cXggLc
         u6MW/MJdK4yKILSjaCKZkoIkZ1o62BNWfI1sJJfN638jJ0V+nAQBW5y9J0xzTXqhf3xT
         yxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763105792; x=1763710592;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yz/684pSy+bY02PwcaHx+E+9NyXhxklBLKKFKYytCFk=;
        b=aXCKONwjec1SPo1awFtcTa9N9t4pyh432JavYvcPmmF+Gk4yB5MmYLSIb4oyM1BSRZ
         /1BeQN536WG8OqrTucZcXK2ga3iCdOOm0Ch/2w5/2Hcx21esJRBGdTKfK0De0H2DSSf5
         Qz15x3D6NTOfxsitu0T5r4zS/+fbuPpGwCn2F4t970gQgkzSdoYcQN58/noBUE73Sb8C
         WXBGCmdvGpiH0EoaqBy0HMlp7LMakSbtlioQHUIOwyBzQ/mCbg7mkakGWBpZyzBs/bL+
         rXd9YxDVOARPz4DyFI8sa0IcVe0nZ7ZC9Cwn7mb5rIGd07QK/Rtgj3obGIJl4FBRkO3p
         FAyg==
X-Forwarded-Encrypted: i=1; AJvYcCUT8LNesQu7R6xmOf3RJtdhPE/B37Br47s1RJ970jQF4klzY7UWBBLeuNO5uIhCkjyyjDc=@kernel.org
X-Gm-Message-State: AOJu0Yy8TtkdCPqbdoanao74Sz8v5COtKw/XzFyH818a0YNAFqwlNpPu
	MIsk/rt7LwkMTLKf2er1c+V1hiKltmkMtiCe5gOEget57lb4Ba5m/zSovDE5rZ92UtA=
X-Gm-Gg: ASbGncurw92SfQu9Z3QWN1ortAjch2UmzEuTQaeFcBNQeDy2j4ufr8O8BfvzrRrgn1z
	zuwVmVumhW9aWWT/sW5iWiu+6WaqOrPz3VVVy6mKWeKA7kTXTcvbrKu/71245nsX1MiDxp8YLeW
	BiGDB/5Y7/scHHrIzht1v+A+BSWY7Yg8RW+2yqyLgI5ph1OEChAM6/bP+IyJFJr/emCMt4twCdK
	0iCPj6MJMMa0cxPsuL6/zOWQz8DXvbnNGekkKr4ed0rvWiZzJOOPqaB7kxC4LUbKDjE8dCm2KTo
	E475OqPYWC2XF5pnknrPYFiJ3/BgA3CN5zAPLoKAyNlqjvsr15yQR8LTrnAxC7zM/UNl0qaJoZA
	cqhJMdnadNxXJe+aCrc3Wc6ebBFL7t+QurugKnn/wkDltQPLemrZgnmp4OK30MGp6pBuvLPmIzC
	o3dUGda4Zub0jroU8uYfUX+U9p3zHCmGUaUBjdJIo4RVWk2rEyw1JiilhY/Q==
X-Google-Smtp-Source: AGHT+IGSZ9Pfg9I1aYJchH6nzU/jmPshXQ7LpycBwmgkQ3vgmvK0r8raDtyAUd3OD4e0RW3jLmtaXg==
X-Received: by 2002:a05:6402:2694:b0:637:ee0d:383d with SMTP id 4fb4d7f45d1cf-64350e002a3mr1798322a12.3.1763105791806;
        Thu, 13 Nov 2025 23:36:31 -0800 (PST)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3d8775sm3093364a12.5.2025.11.13.23.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:36:30 -0800 (PST)
Date: Fri, 14 Nov 2025 08:36:27 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE fix for v6.18
Message-ID: <20251114073627.GA1362600@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small kernel-doc fix for the TEE subsystem.

Thanks,
Jens

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/tee-fix-for-v6.18

for you to fetch changes up to aaf46c6a6df6052881c2e75cba65aeb6f1cfa88a:

  tee: <uapi/linux/tee.h: fix all kernel-doc issues (2025-11-10 09:47:54 +0100)

----------------------------------------------------------------
TEE kernel-doc fixes for v6.18

----------------------------------------------------------------
Randy Dunlap (1):
      tee: <uapi/linux/tee.h: fix all kernel-doc issues

 include/uapi/linux/tee.h | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)
