Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C4C33937F
	for <soc@lists.linux.dev>; Mon,  3 Aug 2026 15:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785772290; cv=none; b=jcq8Xp3/eLl8uf5V46aSET/wNLf2S1V7bR4baHolu5rEnkhCHAz6WKAAlHyVA6dbFAKAJneLmPcAR6zMuysDL+GFuyRsnQaRN3W0bDRy3NL9luGwLDxmqDQvwLDjUnu8cRm8KksxR+ORb4d7rs7V6OuK9eV9SFyI+1O8tm4Hamo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785772290; c=relaxed/simple;
	bh=ejXH5qcZOvvG6iZ5Sfwx1s3pa6RHFrtsgRq250OohG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P1mRKNhjSwPF2/cb2DJBQ4s473BEr7bLjzPNvMI+KEnjGLxt+YggC+dhSbU7rg3cthm8UgYqjcS06oce6D9S4UpClLFZOmXA4a5IsTV07HUheJSfJ0n0thhwHM8qnLyTfRVhIRaU70RTGgqx5+sqYirk8ej+tZd3GgBrC0qd94k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=IBzVnYOi; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="IBzVnYOi"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2caced6038eso624465ad.0
        for <soc@lists.linux.dev>; Mon, 03 Aug 2026 08:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785772288; x=1786377088; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ocbZUo7zpFmSLPbwfUgNYrUI1VbSx+D5BmbZxXmpAkw=;
        b=IBzVnYOiVUSbdzvC9UPi/MS1QYNPvDFDg/L9wr54AcK7AvV8GEnLb2QrMo3g3ZQnNZ
         7h2ku3e39N+BpDpedQ/ZsRE+kIR08ESOvovTSvkI1l5Q0d2tpczMI9Vt4GfFVk6bATk1
         2qAGwwjYgU6PZvseSEOI9bd4wW8ltFqfdK7vV+gqMQC6D7PkmCVvY9M7+RvYYaxTi0Cv
         66cIX253dQnLuNDxTud+i4UkpK7AlAyJX+Ch8rw/Jot+hJRZf2wcdgtLtGAYqVfrgcIa
         V+C1fZ17uAA4e3+iYCL5MUYEKtHHoY60ZclLLD2gSeL4Ra6lGdPjwiGjd++pFmqqSyaY
         4XUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785772288; x=1786377088;
        h=content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ocbZUo7zpFmSLPbwfUgNYrUI1VbSx+D5BmbZxXmpAkw=;
        b=TZzD0T7oa8n+2AT6MYz6ZC2g4lo5GTDJadd7qi8VuuTOyRFArQIbhM6x8MlAMBXiet
         qg7iuNQUiU3XneROJ8RjhRSt5Eu2wqMfpVaz9PB1AGeinDJwgM/nkPUxJ5AlLXVtUwXZ
         mYFimhHRi4h9qsHd4VDZyi8acVto5lv0pZSQPVMrJfpGTIisFnQ0feCjRFTOhRqXH2TM
         oZ7B1yVKkpjLTQZLZnWvYXh4rJKOY8kSXHe70pVyJ/DYre2AcDZFZlClleINPmfiEkAS
         Yskl45KgwxRR48p4O+GbQQEpjfeYrV65icWzyQVmMgArJJPDdrn3KL7aIY3qQ4m7SArt
         mi/A==
X-Gm-Message-State: AOJu0YxhvWwmUDD5grZ80ffKwbkzZnZezKjJE9VMnrnX8EeqYkctkgSM
	J68XBd2Q5KnzA2QxOzPawnJPiWvXSLv6ubDtdyPbaDfb9tuDPRn+BC9bGo+gKWl7iLwno8RHQ+F
	+eDzp2sgKVQ==
X-Gm-Gg: AR+sD13hGJbjF6t1pyQwlmL5H5dZYcuAI0zkmmT0188B3tVaDxrV3UbzwGjTBbO4dOs
	w2lqGreEy2rZYA5Q5Q27sHXUrkk7XjCm53LlvVBIk+9BNmdDzcEJ7vAia9azlZkl6qlwf0bcbk9
	eKF11ewSIK94to+HQhDN8Hnzy5ql7qMtFpC2mqVYnQZ3+X0zyGYmIL28wG1Zzj4dpFY89GsS6JJ
	fnABjhHKoDaOY1MWAI7s3XY1zVZWBAiJwXk9APZmJBl3j0N8t1vApkhh1Zm96n48RXgtQzIjOiU
	Jqsb8EcAG9mL2MQuKlrbr9ww8qOKEOCLbE/x0R5bL76yqBEuonjnwcdLCd+GCJ6x5s2yxoFgN97
	rY1yc6FQBxKgNkzMkLp5YFqB+xFHqJ7CndriPKWYPatpOTHTpy5hU9qXV3/gX3+okNjk5+JlmAL
	wtgC85XgmdQwe4O2EAxA4144FTlF6Hw0w+BT93nIdo5D7N/+1bIxHL7+SBxg==
X-Received: by 2002:a17:902:c40d:b0:2cf:8aa7:7810 with SMTP id d9443c01a7336-2d08aa1b175mr521585ad.2.1785772287919;
        Mon, 03 Aug 2026 08:51:27 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2d04b15d27asm39967845ad.78.2026.08.03.08.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 08:51:27 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: OMAP updates for v7.3
Date: Mon, 03 Aug 2026 08:51:27 -0700
Message-ID: <7hbjbjjj7k.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.3/dt-signed

for you to fetch changes up to 36d3d0f740d75dc0274b72720c044f476ff0e242:

  ARM: dts: ti/omap: embt2ws: use mulit-led for RGB LED (2026-07-06 11:40:17 -0700)

----------------------------------------------------------------
ARM: dts: OMAP updates for v7.3
- DT support for PRU-ICSS on AM3/4/5
- minor fixes & cleanups

----------------------------------------------------------------
Andreas Kemnade (1):
      ARM: dts: ti/omap: embt2ws: use mulit-led for RGB LED

Krzysztof Kozlowski (2):
      ARM: dts: ti: Add specific compatibles for SCM conf nodes
      ARM: dts: ti: omap: Correct indentation

Roger Quadros (3):
      arm: dts: ti: Add device tree support for PRU-ICSS on AM57xx
      arm: dts: ti: Add device tree support for PRU-ICSS on AM437x
      arm: dts: ti: Add device tree support for PRU-ICSS on AM335x

Thomas Richard (1):
      ARM: dts: ti: var-som-om44: Add USB Ethernet controller node

Vidhu Sarwal (1):
      ARM: dts: ti: Fix typos in comments

 arch/arm/boot/dts/ti/davinci/da850-lcdk.dts                |   2 +-
 arch/arm/boot/dts/ti/omap/Makefile                         |   4 +++
 arch/arm/boot/dts/ti/omap/am335x-icev2-prueth-overlay.dtso | 156 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi                   |  15 ++++++++--
 arch/arm/boot/dts/ti/omap/am3517-evm.dts                   |   2 +-
 arch/arm/boot/dts/ti/omap/am4372.dtsi                      |  11 +++++++
 arch/arm/boot/dts/ti/omap/am437x-idk-evm.dts               | 103 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi                   |   2 +-
 arch/arm/boot/dts/ti/omap/am57-pruss.dtsi                  |  11 +++++++
 arch/arm/boot/dts/ti/omap/am571x-idk.dts                   |   8 ++++-
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts          |   2 +-
 arch/arm/boot/dts/ti/omap/am572x-idk.dts                   |  10 ++++---
 arch/arm/boot/dts/ti/omap/am574x-idk.dts                   |  10 ++++---
 arch/arm/boot/dts/ti/omap/am57xx-idk-common.dtsi           |  61 ++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/dm8148-evm.dts                   |   4 +--
 arch/arm/boot/dts/ti/omap/dm814x.dtsi                      |   2 +-
 arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi               |   2 +-
 arch/arm/boot/dts/ti/omap/dm816x.dtsi                      |   2 +-
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi                     |   4 +--
 arch/arm/boot/dts/ti/omap/motorola-mapphone-common.dtsi    |  10 +++----
 arch/arm/boot/dts/ti/omap/omap2430.dtsi                    |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-cm-t3x30.dtsi              |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-n950-n9.dtsi               |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-overo-common-lcd35.dtsi    |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-overo-common-lcd43.dtsi    |   2 +-
 arch/arm/boot/dts/ti/omap/omap3.dtsi                       |   2 +-
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts          |  13 +++++++--
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi                    |   2 +-
 arch/arm/boot/dts/ti/omap/omap4-panda-es.dts               |   2 +-
 arch/arm/boot/dts/ti/omap/omap4-var-som-om44.dtsi          |  14 +++++++++
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi                    |   6 ++--
 31 files changed, 428 insertions(+), 42 deletions(-)
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-icev2-prueth-overlay.dtso
