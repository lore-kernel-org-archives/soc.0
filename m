Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F7823AE87
	for <soc@lists.linux.dev>; Fri,  7 Mar 2025 16:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741364618; cv=none; b=MDQ/+KwnU1qA5uBffc7bNZq/+GsP6BKksMQmetc1fxH7zhoRcoESXESsE4ci/ugDPQkJYz5ws8UJCpEwyEtKiYk9ioFWHUiFOj4GIzBRxBE+uO8gSxXLFhKRU4PMDIqz9E8poYqtlU86N3SVxlejIywG33+k14M8ISf3KkSCoSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741364618; c=relaxed/simple;
	bh=Ebh93M29DAva+ZMx0lDQQUsg/qaAZb/Ns4nX0Wj0rgY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=RwKB/5caoxKisalxdE8ACreMoSdHDs6GRI0/x73jFk6wTEtuucFZivY+Qj/AuaOnZJVUgaJnofRPawSe7D65jUvXP4ZCfp1ybTnEuhOk1iLUBFiIyEuKrPehy7Y2m8BfD+H9kesxzE3MDU9OmBcd2jhcVwIp0/Lb2OL6kE3PuoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/ptZ3wb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/ptZ3wb"
Received: by smtp.kernel.org (Postfix)
	id 7B7BCC4CEE7; Fri,  7 Mar 2025 16:23:37 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 84743C4CED1;
	Fri,  7 Mar 2025 16:23:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 84743C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-390cf7458f5so2037495f8f.2;
        Fri, 07 Mar 2025 08:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741364614; x=1741969414; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aTCtr0i4SG/QE/FNq50+gRW/p2tQeowoOyJAzQbTUXg=;
        b=h/ptZ3wbpiRW/l77bB3wvgUL+NEmg6tD/ipDim28CW8RjLNGOQa01nAs3Z1KO0hQf9
         VtsYrzwY9sDsrCboU/GzEfxuxH6J98loW4+syC2mRc8mtDvgCDEbdQ84w5eYfYUNmJyn
         moTUY9j+CmqS91DBg3cZ2283tr/ocFnt/SnTT+VOLXcen9jbw8HH8PFK9jwjFdz36BET
         bldRmKb55/nJ2PunoOClPPa+iAvQ7iFU8eXFw0127PNsihiZNmCJUMD3fXMab1HSBXhJ
         1ThuumKXt7W3RAPMPA4AEDI6hCOTUNQYjItxvZukc8g0qCI+S3aVfiF7isaFFcHEwhs9
         om6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364614; x=1741969414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTCtr0i4SG/QE/FNq50+gRW/p2tQeowoOyJAzQbTUXg=;
        b=whXHz+7ScXhMoCQGaaUIts55uz2h27KRdSOeWvK6F2N83iDi8JJpmx0kebw8I140LO
         rYuJ+MNY2l9XcLVslsqXyYQnysx2uOYmYWo13cs98NYuVuMqOP+ldsqXFds17caCKvXK
         O3akD+G9DZg2IHhdbF9NGpVTrYDxrBwn+WQH2u+TpuLrau0ROyYRIpcih1j5Bn5WOh7E
         yYC4AmvA4BhM8cTwKLZqKSgH9XB3pG1iaRs8v2ZBkqzPeRoprTpjD+qSD+avXO5ZaSGd
         VQVGHNxyB/wmxAJXGVnNIdqbACPxJ3zbt/AXkAfVIw49tEVb+DGxYgPO/gtOeJ7vWDUw
         5mcA==
X-Forwarded-Encrypted: i=1; AJvYcCXoLDqH67Hrq+pon0fcI0qn6LG+/adBySPqUO8zPmQkWGpn/nSyRYGi9oitllPzf+vljBc=@kernel.org
X-Gm-Message-State: AOJu0Yy/cKc6NSv0xTSEdwYydzZ6SgoeJ7ZwRvigPidpn3XvUSHwBEvg
	Kux+H2cA9ult6ZFCDevfxQwHdgqhqXLal69y1C9yuP02N8aHT1N9DLtJ5g==
X-Gm-Gg: ASbGncserN3txAsM6Tz/7W1A3wakEQ+HvPM2kXJscx6pdpc7Pn+92XZ9/hCBKenAZMZ
	3vRoSyHbVgKzSIXWQ9c19pB0VyWbLDa3HcQ6zX7HOqZ1BRd6E+U1Xddg5YL4Aqt41aFkNPqil46
	KW9h0qzRsd7EkI6L66sU2D1Cagg6XNAjW3b6cjldq4AKnDjasIL3a77wLpHHbnxrTQePRKvFVUU
	+XdOTWlIfSGBVOsKrW/qh3HXP6lfAwToyKFREtKAu8cBjIs77RqwR4sLRj6tawjzoX+zt+hf5bk
	yAiSm8sHGNQaF/8rq/a6JawYEe7m3/xF16jh/G46POb4lQ9zlPueuzoWz3iGrf6Aw0uJCQru18o
	Aavg+GYm64nQ03Rd1NUxE5KkDoGtsUn7Z+1YF
X-Google-Smtp-Source: AGHT+IEd+gRoPQ8KmABrlOREXez4/oLZ8nyQy5Gl1xM5wK9QbkF5BtSw7zOZUYVrcxnENMVPZJZadg==
X-Received: by 2002:a05:6000:2ac:b0:390:eb6f:46bf with SMTP id ffacd0b85a97d-39132d08dc1mr3526643f8f.5.1741364613735;
        Fri, 07 Mar 2025 08:23:33 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfdfe61sm5910609f8f.38.2025.03.07.08.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:23:32 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] soc/tegra: Changes for v6.15-rc1
Date: Fri,  7 Mar 2025 17:23:27 +0100
Message-ID: <20250307162332.3451523-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.15-soc

for you to fetch changes up to 5e63dfe213d01cdf0bb2786ae3d5ac613182a433:

  soc/tegra: pmc: Use str_enable_disable-like helpers (2025-03-06 19:12:37 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.15-rc1

A simple cleanup patch to use str_yes_no() instead of an open-coded
version.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      soc/tegra: pmc: Use str_enable_disable-like helpers

 drivers/soc/tegra/pmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
