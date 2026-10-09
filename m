Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981793A48CA
	for <soc@lists.linux.dev>; Fri,  9 Oct 2026 06:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791526329; cv=pass; b=Jx2j3fm3bkQ7V61O/BGgHFsX/h+19+6hc+JHnN7IXr8YdysDDbPGaNDABZ5y1kKxwvEGAi1T6KkeAXz/H0Urb2gQ3WU9fvOlXQjYROuXM3oMHRO32hbgFPEm5D7yEpm/a0M8oNZZeESacWe7zxX19qU3JUSCYcpzyin51zl+hXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791526329; c=relaxed/simple;
	bh=tg2QofSCyaJDcYUtEt5EAVAkBKw3MjWFZYJz+vdP4TM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QlNl3H0zxV9h+Un4MQLCCvUhdujhVdW7MP2Bn8cA0YGKa/4O/aaWJZDoCdBpcayTLULIbfSvgiQV4ujb2n4VQWfOTK77wFVuYOaJ7AZCxdDZvoVM2/nAh3WjgUI0RnmwWDltXta3AxRd6D8Dxl70iFY5EWUYqSvMhB5D4zEMfW0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VuotUGyq; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VuotUGyq"
Received: by smtp.kernel.org (Postfix)
	id 38C5F1F00893; Fri,  9 Oct 2026 06:12:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791526328;
	b=SUaqfovTQLdOwecmIZm/SpkciwZVMgnWUuMPhCpuHGjy5KAm+TkaisqBp7LIsiHiaTSv
	 hSSfUXYiZ/bLZ9GOegITBQAYET0XBXtiGZjYCtp0MDs+UmYowTfRB9OG/3J3XvL4hvLVM
	 b7oD8xnlCH2U0T7mvwVeReZmz1nuEUmIYGbE0BH2IK2j0Irna4bFdvJP1d6VsM9EbgWa8
	 kyj67gCSwPINetqr0BD7l0K6ahN1yGoSqxNKNF6q3bu3HINbVyHCc1oath3ekbroIyAVo
	 tzmf9HpiodfYIbWuBV/6eezYh0wiwoa4LEaN76PPSWEfHRTYACP2ihAuw8fk2/auQeA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791526328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=hisN95+6a7XvPzB2QIk2WRzBl1FPATS6t+0EeJt3NAI=;
	b=H2hFeQndAPWoASEY2MiU7uOZFAWhh3fzW569Nuz6tSTd1snbeT3fbpsvRMpvtp5aXZFd
	 bxzPIYKQyFT1wp9yGAnxmZH6LgnIqfHA5YnMnETm834NRrc3tzNUcdiZcAC1mdhvhmmLR
	 NOn7bDVbv+C5nKwTjm34lfNMLd7++Z1ZbcwR7KPlAFPeO7BHC8TrgzTW/CQqRP+/YuVmV
	 zOeRjZrfTQTRHwQ0AKh31WjMfawBFtigSByZUzJwCikNCvoDRLQzVKSZ+fNv4nzlrWD4e
	 JBaUrF7eHb31XAZnlZqLayyP/rDnNKPJbGlA+/3g1EGTXlwNY5SCtVRRQHXqRGlHPpw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=VuotUGyq;
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 034A91F000FF
	for <soc@kernel.org>; Fri,  9 Oct 2026 06:12:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=VuotUGyq
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 034A91F000FF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49ff680331aso64517985e9.3
        for <soc@kernel.org>; Thu, 08 Oct 2026 23:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1791526325; x=1792131125; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hisN95+6a7XvPzB2QIk2WRzBl1FPATS6t+0EeJt3NAI=;
        b=VuotUGyqlfgvKfJ5Jmw4veU3IwT7n9b3e0WRsubtDmBzao0rrhGlGKoHZ8/IP2pgOa
         qmPaUJJuE3QK3vfCWewOv3/i5nxoiEUeQisxFSJO+NXOBNNl3p5EoEB8Chvjr6zgb05C
         /TZn7N4dS4U+461GVJbAqF/BzYpKjBI5rVMHhEObDhD9C/ob3nBBwJCdVnG71kSLeS2C
         C3BCVeNuPYJA6YSwXZlFtm7Rbz2EMDIkB0Xt403j7nS5JeM4OtH93nHYhSPHNU0Em525
         4JTV4w3TWhDrn+20bDCWt9Lnb//fFLr2lIPEJEjKSR87MAPrP071JWxP1kP4WZ68j4jB
         0o0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791526325; x=1792131125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hisN95+6a7XvPzB2QIk2WRzBl1FPATS6t+0EeJt3NAI=;
        b=UyRgpALtuEGfnbGmgKvVgnLJGviW/4MUiaLPipkgMuRRmXtgpNskmBzRTz6yf+8gvQ
         knV9fwjQ9n332d4BA5CxgbF6l31H7dSPHKIU2s5bau0p31de1ARMSNhcnvAh8Bn4L87N
         rF0akbKbDZuq8BUh/aaIvNT79x8YJ4PZkN3PiInpee7xWf9WZDvUqjEKQ+w/MwmDgBI6
         AzWO13La+JlSJwjHse2m8ULWLrs+Nmiu/monFL5edXL9Ul/suWpVn1bgZROvvKoSGI4Z
         ahurbIabZl9l5YuKg9kdHaIPmrsMPqlm7+ABn/7MFDI/sy9bMbRsuU3HFGSYwZRCnZxQ
         cubA==
X-Gm-Message-State: AFuF++n2xwGdkThBWgcuYCH1rxVCBOQh08YFccryqtppphYCXGirodT/
	7lmmQQovQgOHWwub/ZG9BBU2FkD5kqSskmqynpyX1vgjEtHrIRz5PyZJ4yFU/csYIkWOJIMLSSe
	If1Ct
X-Gm-Gg: AYBFou0VpOKRvAhpRXgKYCXr5ZlcE8a6d8yG49f4exLueBwzakY9aClWcgru1cZ4KiH
	IvVjacuLXr3goaBOdwHQRoeI5CvjBNAVSSd9jh4pAZXzzea0VEfRS0zALBpX0my6+PDuAe5+gZD
	9RFh422D6XuJYauiAIKdXLjn0NfUrRWq4N3Msowgp70yjbzMGeHr5P34HQYbU2+TSF3/vIZhopm
	WXNi3w264E2IdsoHDn07t7+7FF37r3kKhxrTkSMeklVvvvagW2seDUgWUpb7oHjlUlPcMYsDORH
	J8GRSqYV+I1oBD/MLe84mpFUoMr8L3KNJL2w7FDFlEqfgYgVN+tkNBdXKAKnMRPxsjq+AQl3yWu
	kMAG7YhJlNt97ukyUR5pjctEL8frmpWwq3mCyj0B52AcHiaDn3AoJgLUiuHFsFc27zxEjF0sPzU
	VkZiUfMw4lG8uBvf7KElcCodBXmgBBqY7kacRv/g7gdj7TvSetjJtPElCo3ANHkSdMSSiH+s4aD
	6nw85J6Py0LNYVQEyqPlMFgTj7cFZef8DODj6aNT2w=
X-Received: by 2002:a05:600c:4747:b0:4a1:77db:45d9 with SMTP id 5b1f17b1804b1-4a18e47aa9amr13922655e9.6.1791526325310;
        Thu, 08 Oct 2026 23:12:05 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([82.208.30.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18eb4485dsm39001075e9.2.2026.10.08.23.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 23:12:04 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev
Subject: [GIT PULL] Microchip AT91 SoC updates for v7.4
Date: Fri,  9 Oct 2026 09:12:02 +0300
Message-ID: <20261009061202.29652-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-7.4

for you to fetch changes up to b847099fdcc855b04b017a67bd6d3097ce277175:

  soc: atmel: Convert to of_machine_device_match() (2026-09-20 16:26:50 +0300)

----------------------------------------------------------------
Microchip AT91 SoC updates for v7.4

This update includes:
- replace __ASSEMBLY__ with __ASSEMBLER__ to avoid confusion
- use of_machine_device_match() instead of open-coding it

----------------------------------------------------------------
Geert Uytterhoeven (1):
      soc: atmel: Convert to of_machine_device_match()

Thomas Huth (1):
      ARM: at91: Replace __ASSEMBLY__ with __ASSEMBLER__

 arch/arm/mach-at91/pm.h | 2 +-
 drivers/soc/atmel/soc.c | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)
