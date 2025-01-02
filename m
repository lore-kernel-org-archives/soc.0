Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03641B218C
	for <soc@lists.linux.dev>; Thu,  2 Jan 2025 14:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735826469; cv=none; b=duMme+LJA20858i9SrVBQi0VsA1m0V9SLRqSbFKFRYuhPGlstuVbiun8dEaKHqex3Hm3Fy7rl5PJlmLdi7nwmnSQPvp88TLCn5vp2xBqlBIFZ80JEVKMtxSXhXEJf7NLvuZsv8ituTvXWQ+Y3l57GvXOiaQ3MI+lRs5/qMKlxVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735826469; c=relaxed/simple;
	bh=W3/GfAo64XPaE4xoK8QaNNhU1Y/fYnCUkOUtAG/8LTQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S6jzaqpVeYWmRPzvEO4L8aIh+CM2q64K03CV8Oi6F8OT+5cVtZ32rN+z4ITnlZdqqpqbECn7x9trsp62pBjKZ9/ixcUUd6j4yzNTtqa5Zvb/g8TUBsLYqMDuuVsds18LyiNFBwtn3xMCIcpojKS91xcvFDT4J551QR39gHdfVYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CqaZu+be; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CqaZu+be"
Received: by smtp.kernel.org (Postfix)
	id 6B0C6C4CEDD; Thu,  2 Jan 2025 14:01:08 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 536C3C4CED0
	for <soc@kernel.org>; Thu,  2 Jan 2025 14:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 536C3C4CED0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-303548a9361so108176511fa.0
        for <soc@kernel.org>; Thu, 02 Jan 2025 06:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735826465; x=1736431265; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3D5rqGNCvbRJ4hYiEuXj6p4HPwRzVxlrwUz5xjCiIFk=;
        b=CqaZu+bexem/23KyFyQlUdBwI3gX3Ub0avEYVBk0gP6rl44Y6G1ITi58RDta196HS6
         +VeNXzSA3PqiHNuvEz/+yC/HUDMpwmUQZZZqoQKaI6FCwgSKXXnd1MRiz466YCcaI/yh
         /t9E1hbtR0XMJrJ2Gf20Ye54k6Gd2lEoyAeLQLesj3rZ5iXUZyABcQpl84eDlcbs3cu+
         j5h46yN6e3TAZcjj17Eg/MoqFjEAQZR/17GOfc51yOTggMzNgxy4P4OxIHvY1h8OV1Sb
         SpCkfmTgDekgqUCsnqC0ajhULJbJPQgKE+tbFsNYKrglVHPaoCiBgRRVSr5lryK+Ex8d
         N9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735826465; x=1736431265;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3D5rqGNCvbRJ4hYiEuXj6p4HPwRzVxlrwUz5xjCiIFk=;
        b=BUHS8KUR3Rv+TrcpwtsdJtPMMtgH8jOOwx9Fe8lHwB5YI1pdMFeInAn8jImlYGR0wl
         ts9M1VxolV04fIquOfUoGAYhfmL4pCoFyzCDF+g90oSTCxMW+m+/PdkTErWaDTapQKvb
         OeGq8jLf0cGJ08alL+ZS2lDqTGsaYq+Sb1lyiYf3+PrVnh4hiLijSk1cys40RWXfsDQK
         D7Fvxx5AcT010jPmZHB7V2vGaDehvt4u92sH/OA9n8h1VLkF88M3NYkrsJ7eWr1XdKS1
         yw0cNmwQvmsKGLfLIXcgcBp3xuqFxdgQ56HsDMM19idzorSCzUvQRcmvdpyScvjcFepD
         DdZg==
X-Forwarded-Encrypted: i=1; AJvYcCWp2IOmIvECahhu58tkLP/naYKJfwgRYS7H+fdYfUJQrTY+cCF62T4cuGbWDAP0LK4wzA4=@kernel.org
X-Gm-Message-State: AOJu0Yy1/C8DIQ2qhc+4AE2w+9r/BzcqywgUDaDhmTErhjS2up4dLYe4
	sXkVIq7ibW3ED3919xhBYvPw5KPeVF+4YFhBe/7To4dYRZv3rmNDTdvam2h0r6w=
X-Gm-Gg: ASbGncshQgWbQM0Qav4r2rYZDEYJRn3K2CvxoC35wIuu3M1S5v6jDXzuMEYmsjiKYa/
	BZtTIOOiaSX3LwT4dYlQHng5LcqTHiQ+lVyl+nhF4iFiDkAX2S/JdNJEHq1V0F0qlqVGdyNAuct
	7OIV1XHKd/8gnt7isT7g3MhuuJFTkQlm3bvfauff3ZrU50xNeme5S4HwmwxfRRpR260ulz21mvr
	JoFkg+AH6ITgpYX+wz8FLZ5c1IP0SEgfpSBh41BmDs4HTEBS8x0/6fnH0ifoXmbB7p8v606SROt
	jEJstjj8v39PmRGsSkSqkic=
X-Google-Smtp-Source: AGHT+IGvnLgUMveuDNfuUC8lZzaU5FknKOwS+Z6ZHbx1q7am/OzV/TM9FYiznx9GkJ3saRU3fK52SQ==
X-Received: by 2002:a05:651c:b28:b0:300:81c:5679 with SMTP id 38308e7fff4ca-30468609005mr138204361fa.31.1735826465312;
        Thu, 02 Jan 2025 06:01:05 -0800 (PST)
Received: from rayden (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045acd7b0asm43412671fa.0.2025.01.02.06.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 06:01:04 -0800 (PST)
Date: Thu, 2 Jan 2025 15:01:02 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE fix for v6.14
Message-ID: <20250102140102.GA3082088@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small patch fixing a version print in the optee driver.

Thanks,
Jens

The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/jens.wiklander/linux-tee.git/ tags/optee-for-v6.14

for you to fetch changes up to 1ff7d092dce0b2273dce4b8d33fa5856679dd25b:

  optee: fix format string for printing optee build_id (2024-12-17 11:22:46 +0100)

----------------------------------------------------------------
Fix format string for printing optee build_id

----------------------------------------------------------------
Sahil Malhotra (1):
      optee: fix format string for printing optee build_id

 drivers/tee/optee/smc_abi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
