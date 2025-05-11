Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E19518B492
	for <soc@lists.linux.dev>; Sun, 11 May 2025 16:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746981439; cv=none; b=dEtWfEuY+45SyU6/qe4YOp3k8CuraxmUp6BaHcKPx54VEW8cHJOjJHSYgmobn2+qnuYOIZDIIVceRbgVzJ0P6+Jc/u79iiZlqP2lsmjQ0M4F2FDemGs/Pmk0CxrciBaia5NjfJsXXudXI4fLIxR8R6AmnJKcvd5K7bBSa614+Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746981439; c=relaxed/simple;
	bh=v2rgd5xQW/L8uOvlqVSBY8k/lEKYRobz4m5B20mQsPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hr2RomYOzNCbFpwdUrcMNqLtGgghK2NdUXQuvmzACLBMXe6YyKLCIj5uKdiNiaoN2kF505OJHQsq63OVAWzkDpQaHHWuM4qUP2ZkbQqpbE5fEUUIcFu//iKhP0E25dcA7gbm5FoEFw2lu+1QNexIHvAXRAsmLthIC2fC0ILlRwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=1+MOsmGT; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="1+MOsmGT"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b1fcb97d209so4140988a12.1
        for <soc@lists.linux.dev>; Sun, 11 May 2025 09:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746981435; x=1747586235; darn=lists.linux.dev;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ozKqR8KiFMnJ8RNfvHlmDOW/X82IjMy0+nGHj+kzslY=;
        b=1+MOsmGTu9zA5byccyKcL0sWWNRnSeD25hZJ+OcEY6++wcQ2GiulXv+VBTJ4RkZjWh
         Zchk09fvf9Z0a91HNaCLVR2euSkGJz+4DY3MhTv2dFZbS792kk5lWOt8p0UykZAv7A2f
         uzUbhdJh2xZObm5vPPbN6tjokZ8QIub6BGOGe+xyhv+GovI2W6CLTOLCP+CZ62mkAkGZ
         OK0cNBGtzLH/+7EkTPh/xcaspGre5TZ2q37yVE9RBYR6LjO8C9vaLeXFFQav8mG1p2SZ
         qMVbpjX4Xhv/oNObvGef8Y9qFV/Iy+8qieGJwuszt0gu2ga/lJgrrqLv3tWzatfaG1z9
         /U8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746981435; x=1747586235;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ozKqR8KiFMnJ8RNfvHlmDOW/X82IjMy0+nGHj+kzslY=;
        b=puUpjXJGLl1kjzu1FIt3f2ol4FLpA1V7fDZSacKNMJ7TiRP1T+8LrnCHdmBjbPyvji
         +OaGje7yH+2m3syG5GQR7Tm3IfmsIhJSc1yWHElRXdCR5+JsU0rQHEg4beB9CuzZ5rhs
         2u/pRjK99bwX+PN7g/cueCnNvZTFlhRWRh0JPfaM6/5R4cDDUDlsAok75Adew/D/Wj86
         57zbFFkRgBjPDO9M7p1PrjBYLW0h/6k51loomnkkdtGE64yp6jUjme5/WhKiArAOqPx3
         rgXhBMj6PHNl+c9MJzDEKK7iLLbS4QFwHTuap/7MALJzSMmHQfzt4UrrC5nnftwwqQZP
         SpFg==
X-Gm-Message-State: AOJu0YzSc+ESHMoP0U+d0f9JY+a5l1rlbcgSowyQVPDPgpBhbzGVAJiV
	PD971E//v4bp0cyR6c2kHeyO46+6Xwrzjm1nN8znZdHIFysz/mU28qcaMr+06SiAJO55i/FMM3R
	liVP4OtuT
X-Gm-Gg: ASbGnctcGTbnjCO3a7CupxDHH2NbD2FW+akzC1FUp9AXUA5r/gdF/ktUPlZzwZVBaJK
	Ihf1WAsHmQu4d5wd9f0aMAyJoAf3B+brWC9HDOXj3QY3pRFozhC04Rx7d7RWnP32p8zwVC7+EV1
	ib1uPBoBywMymvUEmzw99P4E53cvBaLNUgh/lmSCrMJhC542Kx8P1CaUuSImhmUnonk17bLrWJb
	Z9rnk+IYDqG+qQIP636pjxWq6CuJxKbZetHEKaGwk4A0E6EmJgYlVn6Mwx9TUxxVxacaOynOtmy
	uMfJvwvXTYf1azz5bYaLijU8RdAvRxjEABbPgb2zH4Bshq999A==
X-Google-Smtp-Source: AGHT+IFPEY8g82RGp5yhOqpGmRIP7cEY2ruWZiZR0/cuOw+7hTLUKHCqDioAZJqYRH9/2X6lupqZlg==
X-Received: by 2002:a17:903:3d06:b0:216:4676:dfb5 with SMTP id d9443c01a7336-22fc93dc352mr153833875ad.21.1746981435274;
        Sun, 11 May 2025 09:37:15 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7544d86sm48146985ad.47.2025.05.11.09.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 09:37:13 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: omap updates for v6.16
Date: Sun, 11 May 2025 09:37:10 -0700
Message-ID: <7hecwvrtmx.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.16/dt-signed

for you to fetch changes up to 550e5608c25e0a886da1182386a6477f49caf2b7:

  ARM: dts: am335x: Set wakeup-source for UART0 (2025-05-08 06:15:58 -0700)

----------------------------------------------------------------
ARM: dts: omap updates for v6.16

----------------------------------------------------------------
Andreas Kemnade (2):
      ARM: dts: omap4: panda: fix resources needed for Wifi
      ARM: dts: omap4: panda: cleanup bluetooth

David Heidelberg (1):
      ARM: dts: nokia n900: remove useless io-channel-cells property

Sukrut Bellary (1):
      ARM: dts: am335x: Set wakeup-source for UART0

 arch/arm/boot/dts/ti/omap/am335x-evm.dts          |  2 +-
 arch/arm/boot/dts/ti/omap/omap3-n900.dts          |  2 --
 arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi | 39 ++++++++++++++++++++++++++++++++++++---
 arch/arm/boot/dts/ti/omap/omap4-panda-es.dts      | 32 --------------------------------
 4 files changed, 37 insertions(+), 38 deletions(-)
