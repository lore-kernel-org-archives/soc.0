Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25F22571BE
	for <soc@lists.linux.dev>; Tue, 11 Nov 2025 19:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762889200; cv=none; b=YEUrVFXK6jG08PDX5kcz4x/6YJo9ggMYZ5tey0ZzJQfUYTWA8caK2JnOUTwyAxyGlf4ooHrb7Po72fzvN7fbUA2B6RYSj/eYJHTDWagVa7j4NTpIhZQzbtsltw9L4W1ZE6dOxFbydLX6Br7ZpkKFkKJgWkw0ODXEQFkIbesZWuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762889200; c=relaxed/simple;
	bh=f5tl5Jvq2Hy4zPlmf7aG3KhINJQaIW2CKTgzdHwDxdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=apjbwdEs3Tf2NpFs+dK1AMRRq4AjWfwj/qqzADx5QyX201fi8QtI+8AqBhCHj9BoWz1MuClqgQJg1MpWLH/gzZNljPzpyiV0T/46/IlWQma7SGJWZYnF3+q+G+lh7ceaZmPCIPYe/ngGQl4kXk0QXlRnik/YAqUsYHjwuCyX5gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZAlgTqFa; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZAlgTqFa"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b8c0c0cdd61so46473a12.2
        for <soc@lists.linux.dev>; Tue, 11 Nov 2025 11:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762889198; x=1763493998; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R3hXO0kohcojDK5N1gDQnbb7SNR3dS5AVJdqaUadyUo=;
        b=ZAlgTqFaTrBHPxQ6z7RXN1mGT+OuEBpwhApexJOVibgetKtcR1JE4cO1Z20HYipTsS
         ac2vvP6F1WPN+wyS2+F+uRx51lJipK3NEEV4euYo+1W7hjfSSf6/hN/G82CmP8nhNz84
         Ubuq+apyYaOMp/MuJ29Tz47xSZaST+zp9Amm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762889198; x=1763493998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3hXO0kohcojDK5N1gDQnbb7SNR3dS5AVJdqaUadyUo=;
        b=dKatbVr4qqp5V2HR/PS+y5e0Tb6W+idPHpLXYQXVnutLAnm0XBv4I26oG0W2LjxkeK
         9Dj1R4mZmh5uxs5Ou7ZdVrHr+1hlgtlrwI5NaYdFDzgOILf9G6vA7BVmw54/Pv9uTH6n
         z85YjmI7EshU9k+obSMBIBhvH3kChIIXQT39xJS7Hcyfa8s2tfL3ovFg00B0+VkkBb2H
         2teranvYfaSoNTd7ltZGxqBRUlTOLWVJ7fB/QH/6r99kbDmVKKmyfrFxJS+6srbwJAZX
         EYjWxim9hmOGNDu4vmBelxKcN5yRAczv7+i1W/2JteqpBoQaa2Us0j29BCOzhHq/sSBn
         pz3g==
X-Forwarded-Encrypted: i=1; AJvYcCWtIB+Q/SFJVuIgVuSFM/WEhqVWfukR70/t3bJCu9gq3X+jVCgGwwRJNrFUPYAXp3uEK/Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YwcjwyLPFj9rnEHzVbTGcx3AjrK+ZrOI+9YezEXE/8omqlxr7vJ
	dgOcVDyrwezdiaTwuYBxNSLt0mttn5ulmFx1lNXpXY+P3fadTrgWT94fzqSkChrAww==
X-Gm-Gg: ASbGncsWhg/Lzak1dgBqS2fxCSBWx+pcc0dmamY+fbvUG5u6XT7GCbFE+n1nlE6L/mi
	bSpUkKckl+bPNxdwTRnx1oPpHLwLG0wKyrmCVtw0+OPNaRd06in6O3IggWsk30fbgg1UD3M0hGJ
	zn5yIxMBxLg3jsacA38ffJCjKOJYj9od3HE3QM7ICQMnXH7GT28Ty9mFyKwOtkk2WlBQuTebRoJ
	ajZA9OxSo6ock6IdRAobUHsYubVpej9Kih4r3NbF5m0KNSQfrRnLScOYL0KYt/wDxXEm5wSTaWH
	HwP8wzOYUmU+encOpyr1M9F8txfmkrfi75JWiU53cTdXaW/EZ1N0ZWe8fjNjyECxFNjOznY7HDH
	oeBILSunnBRfc+tnWe5g/ZjFB3GTQfNpCODDN/QzgvKMa81vMjiLQQgl4LFhHDoY5+sc+o954Bq
	z7UTFyDAfs5lmWDjFG3ReCzAvOLljBJBRJpLzOSQrCIUQQopCteetjjJ3ZmpU=
X-Google-Smtp-Source: AGHT+IGzawljQPfuMSEdjKEu2O+TbUwNMNOGAm74gscUESQKCa416kMewGM3RhTWM1GA5ootFgKOLg==
X-Received: by 2002:a17:902:f684:b0:26a:8171:dafa with SMTP id d9443c01a7336-2984ed49524mr5944105ad.21.1762889198163;
        Tue, 11 Nov 2025 11:26:38 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:ba9f:d4c6:9323:4864])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dcd0974sm4861075ad.90.2025.11.11.11.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 11:26:36 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org,
	Roy Luo <royluo@google.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	William McVicker <willmcvicker@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Drew Fustini <fustini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	soc@lists.linux.dev
Subject: [PATCH 0/4] arm64: google: Introduce frankel, blazer, and mustang boards
Date: Tue, 11 Nov 2025 11:22:03 -0800
Message-ID: <20251111192422.4180216-1-dianders@chromium.org>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


This series adds barebones device trees for Pixel 10 (frankel), Pixel
10 Pro (blazer), and Pixel 10 Pro XL (mustang). With a yet-unreleased
bootloader these can boot to a UART command prompt from an initramfs.

The end result of the device trees introduced in this series is really
pretty simple, so it's expected that most of the discussion in the
series will be about compatible strings, file organization, dts/dtso
organization, etc.


Douglas Anderson (4):
  dt-bindings: arm: google: Add bindings for frankel/blazer/mustang
  dt-bindings: serial: snps-dw-apb-uart: Add "google,lga-uart"
  arm64: dts: google: Add dts directory for Google-designed silicon
  arm64: dts: google: Add initial dts for frankel, blazer, and mustang

 .../devicetree/bindings/arm/google.yaml       |  87 +++-
 .../bindings/serial/snps-dw-apb-uart.yaml     |   1 +
 MAINTAINERS                                   |   1 +
 arch/arm64/Kconfig.platforms                  |   6 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/google/Makefile           |  10 +
 arch/arm64/boot/dts/google/lga-b0.dts         | 391 ++++++++++++++++++
 .../arm64/boot/dts/google/lga-blazer-mp1.dtso |  22 +
 .../boot/dts/google/lga-frankel-mp1.dtso      |  22 +
 .../boot/dts/google/lga-mustang-mp1.dtso      |  22 +
 .../boot/dts/google/lga-muzel-common.dtsi     |  17 +
 11 files changed, 561 insertions(+), 19 deletions(-)
 create mode 100644 arch/arm64/boot/dts/google/Makefile
 create mode 100644 arch/arm64/boot/dts/google/lga-b0.dts
 create mode 100644 arch/arm64/boot/dts/google/lga-blazer-mp1.dtso
 create mode 100644 arch/arm64/boot/dts/google/lga-frankel-mp1.dtso
 create mode 100644 arch/arm64/boot/dts/google/lga-mustang-mp1.dtso
 create mode 100644 arch/arm64/boot/dts/google/lga-muzel-common.dtsi

-- 
2.51.2.1041.gc1ab5b90ca-goog

