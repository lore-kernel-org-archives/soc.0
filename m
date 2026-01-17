Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F30D2E0B58
	for <soc@lists.linux.dev>; Sat, 17 Jan 2026 12:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768653858; cv=none; b=sxUU/FIdmzh1eTpoqfWPtalk+EzkEdIbjixOOpz61QWOVgJIxyGMkPn9iBfma5+E1dJjm2rpDq+G2OOi9RtF3N8dBvRpqCMwUsx2wqZm6kPWm5jrdrOuceURjV2XPhZ0MiPLitcEl/pUI36VpWmBW45ioHdzz83sHUkFVoV9l48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768653858; c=relaxed/simple;
	bh=n4JJWeyyRHRel0WdxqW/ZjjXT6xmiabIOp8iCgMyRq0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pTc8H1uHOcr+IuKPFPTZ5uiVseWU+RtAGIIhZZxNzuzXVq4A5M4BntrIRndJGo42DeObMTHsY0+954+zp74lKTpSSbbtwxr4lBu4ROxGlIicPp0U17c4rXe+aynsCC57VgLcC5+XUiG9i7kOLWCv+AoazONFOxb7gF69vjlC7is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GYmpzFpn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GYmpzFpn"
Received: by smtp.kernel.org (Postfix)
	id 08EF0C19421; Sat, 17 Jan 2026 12:44:18 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 24759C4CEF7
	for <soc@kernel.org>; Sat, 17 Jan 2026 12:44:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 24759C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-655ae329d6bso2933089a12.0
        for <soc@kernel.org>; Sat, 17 Jan 2026 04:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768653855; x=1769258655; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tjASni1JbbDfnj9ABEBCCy+TcLbgU6NbFpe/N6dpxxY=;
        b=GYmpzFpngAhGTwQXtE+VkWFLmHwTuDO9ViUgrgHTPW1AYvjS3tKF2atOZSmiqfQusJ
         0qS/mEMO685hZThYlTcicLXQq1bzpgv/wbJD57/js3mFK5hvZ9cxZjVeHIdNlwTKdkAz
         HrbyAdpu5cK8vYCRmJcMw2BDgIQNE4u1NffgNTj3z0HTNhooeF8Bahj7F3YUrmWdC4pR
         7hGu8th7FmZ9lb+Si5dS4j7YR5gpD+ucK7ttBsD5Lv6/tCYq+IfJgbaUY4pGOy0eVAvM
         tLtOPJnjfQL5ftK0zFwxSzhk3Y6SiYylk6C5QLwAa5dM/eevjPeiM5rOPAkD+nZS6X5D
         HqkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768653855; x=1769258655;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tjASni1JbbDfnj9ABEBCCy+TcLbgU6NbFpe/N6dpxxY=;
        b=fm8iT3Yiq3nATOdjnR1kj+fWxIV1KGKrvLwW9dTvt0crL113jetljnHWoaYFQ5Z30L
         CoMsvTbqSrsLUt6DQphr0XM4E+ITP/pwZMTRgl1WGrozSVxQt4sRdLmVQbqvb7AW+CHl
         1k2he5eyJZkvqEDrtuiu/ymk2Yqhl6Qn5NkzzY/IFrC2W0y3UwM1BOrLAZUsTY2IDvDD
         K/50JY591bF333RRMOI2+QHyMk8uGWRIvGA17Olrv29Tz2BpIoAke13cGqj5Pz+03d7C
         P7OTTAL6gWJ7mjUys5RegxXP3w0EI3kUpJDPN3v9OWLS/KRO/PNNaTpNo999JzaTAa5F
         pfSw==
X-Forwarded-Encrypted: i=1; AJvYcCUx3ekZEMgW6lZ3OcYaNDEHNt6OjyETtOSHBAgs/uKpJ1oxu8gEFU64XyBAMRHRUXORkHI=@kernel.org
X-Gm-Message-State: AOJu0YyhnCnRNS89T1P50bJ3C5tz+N0r0cAYnymBytI2x0wdKqZHw4a+
	+3yPjPFl45KrfyOeVwonJ/MViaTACinBCTZt6q543ltLbC01bNYxLNsRW/i/iGclz14=
X-Gm-Gg: AY/fxX7Pv0SB26FdphFuNHkc6wunasFRHJHFX+XsI3CU4/y/Y20jjDPmsl6lOqxHkT8
	7By68oFDG0Gvgwq0sP1nIrWxEcxNo3+KPTxf8oevaiA9lWcZLCRoBGRCssrEOHGOMyTGogkaylV
	8eQneVWPVWyGuTYt/dKCqLwAkDoGi5SCqqxPZZ73yZ/tvKIXquEms6VE5jquTzKQIy6lTyneSuN
	wD8fbutuL+Su8WyXGMCdbwS4kqTVqFDUxhFGsq0EGKFmOMcBqWmrJhSn6zUminAE3D8wMxUMipg
	vkypJtdiyu90U/x3RobOcedPu5UNZLNVAGrpntCeHqpRi1G1jPNqqs7lpwpyYYW26P0GtndjEve
	MDefzED1rc9PIexfIK4qGXqOjOz4yvL9466FuF4cuUleci9Ggj9vmFKV2P7mI7u1L7g3bFAk9LW
	JGjHF/hiQxs6hXkPaLjwFRqkU77w1BKnuzt2X1JlTsMXDnHfGIiN+/tlbn3/1kntHohM7hNo1HR
	Si8EmE=
X-Received: by 2002:a17:907:7288:b0:b87:711f:97b9 with SMTP id a640c23a62f3a-b8796b241dbmr579955466b.31.1768653855366;
        Sat, 17 Jan 2026 04:44:15 -0800 (PST)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a31bffsm523837566b.68.2026.01.17.04.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 04:44:14 -0800 (PST)
Date: Sat, 17 Jan 2026 13:44:13 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE sysfs for 6.20
Message-ID: <20260117124413.GA262260@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull these two patches adding a generic TEE revision sysfs
attribute and implement support for OP-TEE.

Thanks,
Jens

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/tee-sysfs-for-6.20

for you to fetch changes up to c19faf5a62315d5e0e65dde49b7b59e30330b9c2:

  tee: optee: store OS revision for TEE core (2026-01-15 10:35:14 +0100)

----------------------------------------------------------------
TEE sysfs for 6.20

- Add an optional generic sysfs attribute for TEE revision
- Implement revision reporting for OP-TEE using both SMC and FF-A ABIs

----------------------------------------------------------------
Aristo Chen (2):
      tee: add revision sysfs attribute
      tee: optee: store OS revision for TEE core

 Documentation/ABI/testing/sysfs-class-tee | 10 ++++++
 drivers/tee/optee/core.c                  | 23 +++++++++++++
 drivers/tee/optee/ffa_abi.c               | 54 +++++++++++++++++++++++--------
 drivers/tee/optee/optee_private.h         | 19 +++++++++++
 drivers/tee/optee/smc_abi.c               | 15 +++++++--
 drivers/tee/tee_core.c                    | 51 ++++++++++++++++++++++++++++-
 include/linux/tee_core.h                  |  9 ++++++
 7 files changed, 163 insertions(+), 18 deletions(-)
