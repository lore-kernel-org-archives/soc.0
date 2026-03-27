Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884BD3EC2EF
	for <soc@lists.linux.dev>; Fri, 27 Mar 2026 13:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774617252; cv=none; b=dsS4bs/zBGgw/YdSmET3F8ZXXfOd65cY6oQaR5RuzNVt4qj8TD+p5McDtObNTB897fe2B0baMvhqj5PvQkOfgA1wcp2KArYrC3pMbL6RjGh6ICs9Iqt6SMK2dBNKKD8bYCErYMRycuI3nFvqexL2jjC4RjehZqiwPpBZqzQM1HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774617252; c=relaxed/simple;
	bh=YrSq98m0+IuN/dB5V3lvaa1Q5iX/J5mxrf1Ih/huEmo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ea/3fnrEHtb+feRchwU7Z8j2p+WvGngNPANWcPa9LJtiUCqFrAedG1TFHJK/Z+i1D5LRMk/zgcSMXp7tWHSym1H0p33F9IEqbYFMhZOGmH32z2CQHeZAhXy2UYN23M8n9Bg/szrKesjcVag/JIfuWn1Qmi/9d/MiaInibwHntKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oD6MJdsw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oD6MJdsw"
Received: by smtp.kernel.org (Postfix)
	id 8085FC2BCB0; Fri, 27 Mar 2026 13:14:12 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B0C8CC2BC87
	for <soc@kernel.org>; Fri, 27 Mar 2026 13:14:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B0C8CC2BC87
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59dcdf60427so2437290e87.3
        for <soc@kernel.org>; Fri, 27 Mar 2026 06:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774617250; x=1775222050; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kz8SaXeiyhxC27qAG3dP6iPPGTlVaK8A49rXAhagzVU=;
        b=oD6MJdsw4kix8cvjosTW9hu/4XzuA8WLXZ6aGg4pnJyoq4ORyI969zOwVT0cgvRT8R
         riUwEXDrvkOHtV/7ynitfdJh1DB3NPaM0JGs3gBNfP5l7TSbdG7wQzTLwAzDUk0W6FIi
         /jngvbGdxrSruYqIBjdn3slObkhUE5yNDBNOQ+lNdFzfVSUAmLlTZ0lMk3FL25mY1jq6
         gXsX6BITI2DPn8i6vbCwElzIWwioYy+J7QDw3hp+BwudmwABkMKbh/qQtWyCpZhbNY6F
         rNs0b49EXevCP2THUiTlixREczfPNysMtf244aLOVxlGulnz91iPcOpL452HXr84HWOD
         akIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774617250; x=1775222050;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kz8SaXeiyhxC27qAG3dP6iPPGTlVaK8A49rXAhagzVU=;
        b=OlMdiOi8OeyZaEoRpkiHh793dyFrptmZSayUvNtGnLyvXyV4dA/gavc7y2xat24Zbp
         45Xr/gISVxa9PuxhPeteglw/EhwFCUBkh5sJ6lAWH5kCqkZ0dO+kVrewJwP6HuCgihRF
         xqHZM4Rp0GptxzOG6DsbTBPq8sVd8/teR62qFQX3NZR7qR7QkJzPjwjcmhnzvIqZHD73
         zBMbpkx46eUzIVHPk7VCKcQE8Z1yBmQu0r6joiLennB/WOYaMG4Wz6SZQoMIKFQbiKTl
         MFCixJuFLulvcL69LofsPfvXSNTWMV4O69gm5cAy0cFL7I2knsWNA97kwrNCXJX05hQI
         /sKg==
X-Forwarded-Encrypted: i=1; AJvYcCXm/TH6Zze7Kpk1Q7L1uS7B0+LgsK5DI+8oTH7708wFwnClh6b/uYU9+ntZrDsFoz7Aw3E=@kernel.org
X-Gm-Message-State: AOJu0YxxSX6/64WOHCHg62jyoslm5SGx2Jb94kPnmhvYi/PP/QBufgv1
	LnTDzGtcXdZbNlNaCDz9sh2B4YhWXniE6Cz3+nQfpaWX4MwpbheU2nocHtSd4kMygsw=
X-Gm-Gg: ATEYQzxGGxcpGrZXi6EPqL5UYXjO3y7a0sUTxB9BDDfSYBHWfef+2G+g3kpHcDsDKSt
	e+hXu5LmOSVyJpAS9ErztYl7VP4VW2iWjHqFfVA24pf0bOhqaYpk5qs6BJ6vyNEJsJwS9JwR7iS
	R/8U1uYngAI84v12+dxEh1jSQJCzCpDr8QqPqwsY8cW8usQoM+Kg17lsuiPjm5gZD50QeGfCMHu
	H4Bj3Zcje9QJhQe7l7RMlutY0WJ9x6u+Fbomn2uKrWFwbWU36x3LF0VMiFpCL6CXdn+UUxogr9a
	683Ie/HSYwCcI4pfUxEiOWDHJXZQV4SlieWjDXSO3mR7sMAU4//PwTGy6+aVXPYxfkJBPBp/t/C
	akRIQq9pQLFMrGlbi69AJXMLXMY0jW1XVdsLvON6QrBT2MuiH+68Sc5nVK/1z7nny0mqqIXrLx4
	HRDkbgihTj9D2KamNO1IYzPSN5rc+gkKxke6vBkWMOf+vtAo2BOFroNOuKnRI2KmToekailCWBh
	B8rxFEgh4XvyDGVIZg=
X-Received: by 2002:a05:6512:3c87:b0:5a1:18b4:6c47 with SMTP id 2adb3069b0e04-5a2ab59d4d3mr790105e87.0.1774617249654;
        Fri, 27 Mar 2026 06:14:09 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a063efd5sm1345298e87.12.2026.03.27.06.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 06:14:08 -0700 (PDT)
Date: Fri, 27 Mar 2026 14:14:07 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE update for 7.1
Message-ID: <20260327131407.GA3248701@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello soc maintainers,

Please pull this small patch cleaning up kernel-doc comments in tee_core.h.

Thanks,
Jens

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/tee-for-v7.1

for you to fetch changes up to e416e7fa417b2d2604c1526a2f9cc38da7ced166:

  tee: clean up tee_core.h kernel-doc (2026-03-13 08:22:54 +0100)

----------------------------------------------------------------
TEE update for 7.1

Clean up tee_core.h kernel-doc to eliminate build warnings

----------------------------------------------------------------
Randy Dunlap (1):
      tee: clean up tee_core.h kernel-doc

 include/linux/tee_core.h | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)
