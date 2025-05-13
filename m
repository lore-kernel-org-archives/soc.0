Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2DF213259
	for <soc@lists.linux.dev>; Tue, 13 May 2025 10:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747132959; cv=none; b=qNdg+zUyPZLxvQQDwSW3UwLLphodehtAcZX5QDsPskb0vKDnN89u8kb3bCdvYqMYEDsiKaw+VGtQ83z5LvldVGvhGgU2Ts7yzABynhraaoMxwZkn+9ij8pkiRTXP358p4F8989EPsw/zgVK17yP9WyqtzpMQryZoDHN3tgYhDQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747132959; c=relaxed/simple;
	bh=fokGcLsIOmbEu4g9bN0T2DCQmHZHP4mgH0SmNKAFeX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G64YC1mJwgXNSEsPDr9L+IatOY8XVYDzSnUccuYNbX02oMDC4DIg7h7uDVOnTOne0faW1r7QXIHg5Sf3Om/wDiKZlFwE7Gmf/8+RUXrmeR8YdmmOzWXm3/SsSoB3IMK0t+JYlwrlaWwn6UKRuohpjlbfxswUJa3FFyr1Nph/TWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Le2Mgy9I; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Le2Mgy9I"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-442eb7edc80so379615e9.1
        for <soc@lists.linux.dev>; Tue, 13 May 2025 03:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747132956; x=1747737756; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMN9753UXJgMGlHWxPvLoZFYIWjOvZWc83VINEWUfQw=;
        b=Le2Mgy9IDg//2VWNx5ClSwHCiX3ibtYsDwiTHGlOVLWdPA2cRdjFuh36z3DuflecP3
         3May97flHJ6fKXd+0H9RuzAkfhDCqqq5jMe7X7f/F9upsDtovWC1eSItlh8dA1Y3ZJGs
         wdRBviwX/lMaWhtf5BGIgnrmsHaikYXL0IAw7VoPmnc+cs54esk5yBwpR/wEoMXvVBgF
         Q3n6PVnc4vbpEvQtbZA+h2tK1BaHpWTvn0nHPLYNrSsEqWUodWEsz+NNzhZcHlyMJj57
         n6wqgR8sXL4XLbjIJKx6YadSauII6lBtaVPj+T1toAfrTIr25pjeaeU9TbKEqEh0y4jo
         RL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747132956; x=1747737756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMN9753UXJgMGlHWxPvLoZFYIWjOvZWc83VINEWUfQw=;
        b=F+LiVvLO5745XcmtggeakWjpbNW+zfgfcevvLjrHELSU40QheQtZgngLb/dM+2Qu+y
         YpiapDPSXwAoYYFWG7GDjEuXS2ZGjBw2JbwuZ5qgQskCelGsUg96O0Lqfi5Jm7EsMHwM
         +dUgjJQ7uarqA+6cDDMIXvovCoD3kDjg/D7Yl6EbDOKcslTIoCiaE7g0hmh9TnNRjrh8
         OicwW6UqIdttCLcUcqU+RK2mxIRa0wav8ONk+je/Sl61qZwQ/UtWo20QUJinpG+dqPCC
         xQeUeOrGvephcJkLR+2ctP7Rc9A+XiKc+7Y5qYsm13hAEUSSx4s9eOI/umQCOuUZVl0r
         1jEA==
X-Forwarded-Encrypted: i=1; AJvYcCU3Ul96x0V0W8I4S5cRkNmhaXrvvJ5CwdDr/KqNvxtnvHbb82XoGfrlX65X8edcEsI+XNM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzT95bdDAA599wa/3612lQPpRi6pQ05FjeWAujm8aBbLM/AwTBN
	RiyNLAX0Zk3Yw5JA21+JRh7UcYtJ95j2ENJ20M9tCeReq31xwwakxPBDCqaNWG8=
X-Gm-Gg: ASbGncuT50o48xtYBGsJrprQryg3QWR+xKK28A87+djYywsBMHAgJU4t8SXxkHHPx7F
	MKp7HMfjtW/mGOzBK0a/tar97Jbdmigw61vtJXDRSJdyd21bCQ8C3/COAWCGfgG70ctTgPYN1I/
	WCvG/OJnfjHGARFS34fN4m3UpQ1DDXH1e/sJJdBtulFrHtuf7ymG66tC7sWnxW3vzr7KsyXuID8
	JD7BJ78ApjQ/bPC3bw29NjO6elRvo1Qd55hm1M+iKHaP8ixu81EXi7ioTqfQUWAuNjCk+wMzqpU
	6xbaZ01QxHWYYmxUxKwJrOSKsUVuMeY8fSlI6ZznKlhbDJJBo/Fn3CpDKIdzxz9h8/hMYnKuB6t
	jKBQF2mVF2zrXy6vUW51h1XQTdEyeNlFHhc3h6pk=
X-Google-Smtp-Source: AGHT+IHOq9wDUB3NBL4uBQAkPwUPPMBeYUkzKZZmYc5cIyQSuJLzw220X0/6E4ODrKyFjUwBurM/sg==
X-Received: by 2002:a05:600c:4451:b0:43b:c0fa:f9c4 with SMTP id 5b1f17b1804b1-442d6dc7d2dmr55868475e9.4.1747132955709;
        Tue, 13 May 2025 03:42:35 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ae10sm161002435e9.37.2025.05.13.03.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:42:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/3] drivers: soc for v6.16
Date: Tue, 13 May 2025 12:42:17 +0200
Message-ID: <20250513104216.25803-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513104216.25803-4-krzysztof.kozlowski@linaro.org>
References: <20250513104216.25803-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=fokGcLsIOmbEu4g9bN0T2DCQmHZHP4mgH0SmNKAFeX4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIyIKrgxxoL45QT+rnqkaHUKTJMI/avkjlenS0
 6TGXC02IjyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMiCgAKCRDBN2bmhouD
 146iD/913dxu6RKr/3+0K6a7kzNjVd3XSOvxOGAVerfPsGmLrafIx4WkeJZKcW+ZoP1t5T2yVyA
 rp9keyaj4tIq31VuHspm+cOMdMbQRIkTMljTgon42wZkGgyR3LXsIB1yZTNE7lMSNG7ZshzifrT
 H+jV2VClk3vKlLsFwIXqPXxbuRa2EYtOzGWnUmENVYTVdKCvFrI2XQAJM57uV8Sd/3qQzG5aMKQ
 YiEi/LpPAUj20FvndyobAeo25WUgexUqOsqDTya18cmCPcN66rR5q74U2mCofbp1ycm02O40yIX
 Nt7xgn5vJRLhU5B/JcCtc/e+XJZMCXhCMwRLlDZK6UAU1kRyjKt2+2IBoLSSwuhQ14L9RMVdaR2
 UKuqaWm59h9ycoECPfpEBeQfSQ9w9ufdSmPIYGUfLikJUrNIlP794mJrAuFBYIdsO85o5oKx3uq
 +3bOxfXbgybxiN3bRdCq4H0gJ7AcxeJ0X4sgqNnTzgvrSIJ1UITxKNgdUuvYCAMWqCRnCVUJV0Q
 9h9yt9KSz446lZvSJC6Ffujrv9f+MwtB0qdwTnD9jgeDlDBKfb7n62sqQdfLGYZb0Bde6R6WD21
 FXV5iODrDkbfepMG+0aNnrJs3SlZ03ILLrDzCpapG/mr2MKF1wPecv9p+h3ez/DPd6E9TlMGnL/ bipdi70bq+2havQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi,

PowerPC soc driver was on the lists in 2021 and never picked up....

Best regards,
Krzysztof


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/soc-drivers-6.16

for you to fetch changes up to d47f1233374597c348696c3da2142cc92a36fc90:

  soc: fsl: qe: remove unused qe_ic_from_irq function (2025-05-09 16:26:58 +0200)

----------------------------------------------------------------
VT8500 (and FSL) SoC drivers for v6.16

1. VT8500: Add SCC socinfo/hwinfo driver.
2. Cleanup unused function in PowerPC Freescale QE driver to have W=1
   builds warnings free.

----------------------------------------------------------------
Alexey Charkov (2):
      dt-bindings: hwinfo: Add VIA/WonderMedia SoC identification
      soc: Add VIA/WonderMedia SoC identification driver

Krzysztof Kozlowski (1):
      ARM: vt8500: MAINTAINERS: Include vt8500 soc driver in maintainers entry

Tom Rix (1):
      soc: fsl: qe: remove unused qe_ic_from_irq function

 .../bindings/hwinfo/via,vt8500-scc-id.yaml         |  37 ++++++
 MAINTAINERS                                        |   2 +
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/fsl/qe/qe_ic.c                         |   5 -
 drivers/soc/vt8500/Kconfig                         |  19 ++++
 drivers/soc/vt8500/Makefile                        |   2 +
 drivers/soc/vt8500/wmt-socinfo.c                   | 125 +++++++++++++++++++++
 8 files changed, 187 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
 create mode 100644 drivers/soc/vt8500/Kconfig
 create mode 100644 drivers/soc/vt8500/Makefile
 create mode 100644 drivers/soc/vt8500/wmt-socinfo.c
