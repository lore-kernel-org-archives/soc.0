Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DB12ECD22
	for <soc@lists.linux.dev>; Fri,  3 Oct 2025 12:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759494776; cv=none; b=Y/uinOrx1Eov4p0R3LWRZ+zQ/s3T2uvn3x0rlVWir1GJmOcuDD1oGYSpET2elHSx9FhGIAzSBgrGoyGssVodSR4rwEh4j5U7BKRceUnIuDdJLjUAxG8QCaaRSyDotgD/hVnaJ9MgbrN0UuatxB4nXvHeHBgmAeoiEN4zT1qaYhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759494776; c=relaxed/simple;
	bh=NIwuK7WSwOp7xXgXvN6lArOB3a1rRAMQT3rIRTG4LWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i8k4pyLrVSaOUBpxQIWBSVYcZu22Qb6G0tjvI6VkeRerSwgjk4r7lQCZ58cGQHWBChhpwZZ29qOh7djA98fnTKg7QheYtQuzNecB+/vJW73Db0YDk33cM88VIqrcEd288g8zo9rU0omHKMW5A86mTvvp6UEOUcBdovERbca3x0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KzaI6Kp8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KzaI6Kp8"
Received: by smtp.kernel.org (Postfix)
	id D11D7C4CEFC; Fri,  3 Oct 2025 12:32:55 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E76DAC4CEFB
	for <soc@kernel.org>; Fri,  3 Oct 2025 12:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E76DAC4CEFB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3b27b50090so405607566b.0
        for <soc@kernel.org>; Fri, 03 Oct 2025 05:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759494772; x=1760099572; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=17gCoEjvIQcUQufFQtAKqNf5Qc0ovnSmzCsZHusGb9k=;
        b=KzaI6Kp8BvXPRXSsl03Vl0dJ11eUPShxJkmBOK6F3U1X5DOE/I37H0WwliaFhGmLQn
         QzDmZDa80XPJn+EZK0tcbRlPXzTVxifxb1cvbow7VFe5sJkg9X7jDXJ3QzvFx7Vh1R6V
         8lSVleiXerAHfWuosG9MJe5ORAk4vkaqiHauOjkBLherH6QlD4jFEyfRFKRXALSHXfj3
         U6OzYfY30+UiEFHtQphceWIvfYZamApVtVYMTMQvD0jrMO7BAMl2ZL/erbcTLR7JYtBa
         OIvsh2POX7vknij91FYsR69JTZ5CEpW4a8rF7PcsSO6tyyyrvrF93SMqrwToCvc069vM
         dyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759494772; x=1760099572;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=17gCoEjvIQcUQufFQtAKqNf5Qc0ovnSmzCsZHusGb9k=;
        b=uVRVbQ8OPgwL0jVAZmQ/AzFRuxcQ5FVnDw7H7aDLpVCrPvAdsBrGHkgUA5noApZnTi
         aIokmalTK+WoW6UwwP2njCLwqhDwkLopvLmiOuAtghweKW/PC8zliE7cVH8FwIbcQjXU
         9Qf0XE1gqwgRE/QDNxlCY/GT7oak67ie8nX5DmD5YRaMvmfQ8H5f0NBmpbebC3QLEbEM
         gtGMpg8DdeSqsqp4Bh0jTVUZRf6BqoIyYGP0dQRJ9ity5TCtuJofBd2mh5f+X39K9Xep
         IhFmDfZd4g1s4GnNKBMa0G0yNvIvgMKxEeBaVQbwqmagtXfYhCgMHS+bVOljTiulBK6B
         7Pcw==
X-Forwarded-Encrypted: i=1; AJvYcCWHEM+nQ3G58dXXfw3Wcs3SracnTnAC8bcIlPfi14ETykZBwrEgsdRVIusnSnqUHMgUpN0=@kernel.org
X-Gm-Message-State: AOJu0YyyrwLDtK/FVOKo+5gMQE8ft83j1OJx7aWCVuDe3pTZSNIKKi8j
	Wl8RaSTssLnT1OQRk7qNv0P+2ml5Zknd1HoDYe1URv5lc9jYdMiuxJkYuR740VnkMbg=
X-Gm-Gg: ASbGnctszCxldy6ecuh9y89yynG1naw4tYlxzHNAXWawcVdg7q3j1M09c7XVXQS11Dz
	cvhbbG7RyFwaWXmPAXdoq6lDJDhFr93b2nj3b0te0aXYECPC0oD5VRLeczA50N1Bx2Av852rvJm
	H3KVPHvqrGGSRPBMd4SbJd3sx4vADLMRqfy9cxnUO4yoaGSAdNfHhpf51xasv3igUiOr4/LgC4C
	JuSqRnfYubX/1dRqMO1wZuyC2rT5tx485RakQyWBGTUaP1iL8JVgNyTp83/6OZ0l8AS8/wdM4aA
	KlIFWOhbjGjVAOolgEbnGv5H/JUx2Owbo4nwMOFyIYYEeEheKMXZYJHI4RJpZJM59eCJZG3XTwv
	Ie7zW3wUDcPzG8G4bNitnZgaNqZ+PPYRlURwo28SSYjECnjoTIpYuRvwJ7oy0ugccOUhB/6Lhf7
	zm0Z2UFsGOUHYdKx7VQHl1bzHJB7E=
X-Google-Smtp-Source: AGHT+IEoFFTeRxLCKlCPFN/zmcwyyLcUjEt0wTRNto+jUB9IZ+gep75jgaZbEeIo6QfYakU8Sdy8iw==
X-Received: by 2002:a17:907:961e:b0:b48:730:dbaf with SMTP id a640c23a62f3a-b49c25514acmr373047366b.25.1759494772108;
        Fri, 03 Oct 2025 05:32:52 -0700 (PDT)
Received: from rayden (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652aa62csm427437866b.19.2025.10.03.05.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 05:32:51 -0700 (PDT)
Date: Fri, 3 Oct 2025 14:32:49 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE QTEE fixes for v6.18
Message-ID: <20251003123249.GA1063437@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull these small fixes for the TEE QTEE driver introduced in v6.18
merge window.

Thanks,
Jens

The following changes since commit dcc7a571a3665a16581b5b18ca6b113f60a9a41a:

  Documentation: tee: Add Qualcomm TEE driver (2025-09-15 17:34:06 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/tee-qcomtee-fixes-for-v6.18

for you to fetch changes up to 3b63efa21bc6acc1a0fadd1dd0f0e1988a4c0177:

  tee: QCOMTEE should depend on ARCH_QCOM (2025-10-02 08:31:10 +0200)

----------------------------------------------------------------
TEE QTEE fixes for v6.18

- Adds ARCH_QCOM dependency for the QTEE driver
- Fixing return values for copy_from_user() failures
- Guarding against potential off by one read

----------------------------------------------------------------
Dan Carpenter (2):
      tee: qcom: prevent potential off by one read
      tee: qcom: return -EFAULT instead of -EINVAL if copy_from_user() fails

Geert Uytterhoeven (1):
      tee: QCOMTEE should depend on ARCH_QCOM

 drivers/tee/qcomtee/Kconfig | 1 +
 drivers/tee/qcomtee/call.c  | 2 +-
 drivers/tee/qcomtee/core.c  | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)
