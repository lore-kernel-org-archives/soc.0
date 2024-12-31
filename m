Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF03E19DF7D
	for <soc@lists.linux.dev>; Tue, 31 Dec 2024 13:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735651736; cv=none; b=r0TActMmTaUWYdKtPytmG40VYLxirGxQsDnJOjOKoXqL23EP18LPddHEvMkEie1twLlP4lTJTIRDBnkFgV0aIJcZBLUsYnYojDKhAykOg/XHeejIyMq9FigE4XKGmOvfVkXcxb+L6tmz6sAta78dV1vFlbJ+YnfzDhsOi5cgoJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735651736; c=relaxed/simple;
	bh=D2pRNKYsrKKdiNFDaa/QaCWwVRW42upleo2dsDGtluI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LNHNxXGdUrw5z/hSCFtUEi1MLA7KQm4Q37Xiesp6yIqjFVA0O7ag8mlziZO1snq72zX1sBW/g/dUc8019kp+Zjshob1G0/qJea7zAQzdXE78XAIKdNffQ8UU+BOu/LO7as0vG7GJywXWOa2xImuXF8SS1AAqIiyRs09jfdKiGjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m5ojwffK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m5ojwffK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436203f1203so14900065e9.2
        for <soc@lists.linux.dev>; Tue, 31 Dec 2024 05:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651733; x=1736256533; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYNiZ0uM9L1Qo8OSCmn3VQhqRIp5B4k8bbGv0il9/gY=;
        b=m5ojwffKhnRf5fXNEQdzNuJAy+mOvlMuSboX9nxeKJ/sYo3lyayj8kh0qzwgLnlVeq
         yxWHBdiEC2L85LbGUEc5JbRXz9ramGmIk5V+rTU5qHXFhRsUxLoslmfr44arqDM5hRnS
         7Wmva8NMaSHre/4gzscj7e0Yjjsl4LsGc8QDSHwz1vC/BJxeXBp5JOsxOryeG54mmjzz
         ogT/6fc3Mz3bKvTpEMnKGtyLrURdURSjXaOaUDlvX8HlP+p9w51kpG2D+S9kRIHk8C9C
         zV1Q9Ukn7LpWTTVY0QHci31wuIaRgcsHl3THxYEp6rATuW+nGiqQz5Ld10BixlrvUVyw
         Nnng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651733; x=1736256533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XYNiZ0uM9L1Qo8OSCmn3VQhqRIp5B4k8bbGv0il9/gY=;
        b=jWs8oiK4CNgt703CX1A5Q3toFfvQu+OWMOjpwNPqeCF7aYDHeTp7+psEa3LnJf/I92
         A9QcFapNBaW6JnQIV81yhBd0zIOdTxoGVS33mRbjXO+Ebc/Ce06gXPl76hyc5UecXNpg
         UamSWd7mNmCGRoI+l8WNoOYKgABQPBm6uVr4pf06Jym4divwX3/iPpnAZS9mfrHr6ZFT
         YPyWpUdaTMG6i5lWWzd2Bxo8vhk2UhnLf8iGsG4TooYp4TIiuKaVm2KUvoNHHmfbX8cb
         zr7aQ3zFv4lIJE78FAiEjebfrzVFGigEZZHYke5DoeT+tcgf1KuNiX8Nl3I660I8NYjJ
         hdww==
X-Forwarded-Encrypted: i=1; AJvYcCXs+ApWex+vkV+xgNJ6FwM5nWjj2UzaHf3XFn0folDQ0uyG69UEX3TsidIgQ/I8l2ZemMA=@lists.linux.dev
X-Gm-Message-State: AOJu0YySP7hR8b+KygSsX8FgNpw+p5m/xIRVMSbbMpJgs5Ac1UO7s75q
	EptiZ8cy2+RmmJeOsvCpanrljT9Cwx3G1DoM6DrYZFMMRFVEL2g9QPTMsuiftMKcJLjiY7uZVm5
	o
X-Gm-Gg: ASbGnctLmax5j+j0PZkQx+QTKZq19eShIFkJn6Gg7U+AhLvxlJ+nNRRts+qrG8bmFyO
	xv0ILnKSCOrH2f2Qo/QYS/RzAEGZdq7/pLSFWM0/Zuo9fzMddyr2kS3+Q04hF9hVmgcD2/X+L4c
	NoWC5vXkPysVGXW3rNCErB1fGCvEqhN26G9OqjzGP8LIfjVhaCr9O8+MlyhHbe43Z8Eyz3yvGsD
	K3m2ji5QmiosVO0guxwfdyEtduokQtiCKrNTQFqzPbA4Ajjm5RzHV+7W+wGUSTEASKiCYw=
X-Google-Smtp-Source: AGHT+IGxcLjjJ2Ts4fNwEdwg4O9n0E9Qk22ILcZAS8AdPDo1ohnP4lUp59rmKLtvInjoLjQjwTMaIQ==
X-Received: by 2002:a7b:c85a:0:b0:436:90d4:9db with SMTP id 5b1f17b1804b1-43690d40b0fmr73267585e9.2.1735651732938;
        Tue, 31 Dec 2024 05:28:52 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8334aasm32800220f8f.41.2024.12.31.05.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:28:52 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] ARM: dts: various for v6.14
Date: Tue, 31 Dec 2024 14:28:46 +0100
Message-ID: <20241231132847.135814-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241231132847.135814-1-krzysztof.kozlowski@linaro.org>
References: <20241231132847.135814-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Few cleanups for two platforms which were not picked up by maintainers.

Best regards,
Krzysztof


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-cleanup-6.14

for you to fetch changes up to ba9dfa76ebb030df6b605e16239a8052c3c02171:

  ARM: dts: socfpga: remove non-existent DAC from CycloneV devkit (2024-12-29 11:02:50 +0100)

----------------------------------------------------------------
Minor improvements in ARM DTS for v6.14

1. Marvell: Use un-deprecated hp-det-gpios (no ABI impact expected).
2. SoCFPGA: Drop spidev devices which are not properly described in DTS,
   but are using some other compatibles.  This was part of wider tree
   effort to fix such incorrect hardware descriptions.

   Important: Dropping this device node will have user-visible impact:
   spidev device will not register.

----------------------------------------------------------------
Conor Dooley (1):
      ARM: dts: socfpga: remove non-existent DAC from CycloneV devkit

Geert Uytterhoeven (1):
      ARM: dts: marvell: mmp2-olpc-xo-1-75: Switch to {hp,mic}-det-gpios

 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_socdk.dts | 6 ------
 arch/arm/boot/dts/marvell/mmp2-olpc-xo-1-75.dts            | 4 ++--
 2 files changed, 2 insertions(+), 8 deletions(-)
