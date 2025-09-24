Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBC730C36D
	for <soc@lists.linux.dev>; Wed, 24 Sep 2025 16:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758732779; cv=none; b=Ioxii25M1wNBx0QEPOH0cq0X5bNqyjV5sFPLd0EyKRfn0eXQNih/8ZSD6xhqUaB5hBdqsM0NrzFq4HL2b+xBbclr/fwNNrc+5kRUhKHUkeO4OP46zkum/3BdPjHUSsETqqXWZy306+iN2+QLZIBPlrJLzA4z8ayz1/f3wV1uM24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758732779; c=relaxed/simple;
	bh=UrMcgnvepEFw09AKY27xiaGcVJTODrGC0uo1csSp3i0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hhUgv2jqUL2cuZujNYrvuRQKCThZG89wOtK3Pa5HSH2dlX7TNO3x6C6dQ3NqBhW+A1/kKP643Mw+GCzqIbFVHyU0Tv/arvwklkLmNES6gsz6glxsIrmQ956D/7nI+/4mnN4ajEJhhxJv2EWdiFH7OZye9D1DZm8HRRflQ3bexF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GY83kEdd; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GY83kEdd"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45f2acb5f42so7044265e9.1
        for <soc@lists.linux.dev>; Wed, 24 Sep 2025 09:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758732775; x=1759337575; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GzTtM9WAsK07z8tZ50EdByhyU/vMqn0St2F82RyVOyM=;
        b=GY83kEddM72ETc7fWTp/uHFrTU3/9fsRPqJNQ7kFwoCBqhRV6jpvlQNPzufs56XXJR
         vhv3+V05/TSJPq2Wp8Zp4CfVs7fJUbcYNXAhbgADavIh1Tjd5TybPINx2M7K6+sftyMV
         6sihoy3jBMTpaZYK8rSM/l1fz2bDwha6E9he1Cfr1J92VI5Z6ij2FCVnDeXd4fQt5dUe
         sGuEv/Yjx959wk93J3LdlLI8hqj0DiBfFCJ6Npzwi9t9p8XEqijVxeaL1/pxf1edz1wZ
         JusFo6uUbvIaypZPO5hOolJ+2NPlnRiuELBaWuZdtPPlIEPZUj4ji/8Ver09J4k/SM17
         p5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758732775; x=1759337575;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzTtM9WAsK07z8tZ50EdByhyU/vMqn0St2F82RyVOyM=;
        b=sLCHQgTOsRWkec1U23uMRlWw4JS9UK+KwtR/0Tk7HSEBV4hlzdDjRu9B9DtQqCxmdu
         RUxSdD/YxN/PmMbRwg+b3NMVsvDN/cZ3yrhlFj0JVTyfeGt0uvGCO1g5AK5u6TOMUEFb
         NgRwBaoNb2WkHp6zoyol+vbMS61GNxmDXayZeRhwgrwGDW+9RkmYk+tcbox9WeAwP8B1
         SvhFNusaLd5aCTyWtGz6TOdzcdYXPo9d17UxxbrLybSBBI5l2iRAUz/WTxFlE036KUAx
         Ue9eA4bUBszYmbpvSoh/YlolzI1240mXoLZq2RDLTYU37ytnz8wZQCLaBLgdgIIfMOGX
         xM5g==
X-Gm-Message-State: AOJu0Yxrdj/sHF8RheCBJ9wkzR19HPr6BZ4qWxbbtjlhyiNgEYOZ6l06
	ZdL2jMF3eGk/JYu3GDjcKqVH3vi1ALr9PR8y77/PM/+RqoymZOpFS0JFt+Lzsagqj5w=
X-Gm-Gg: ASbGncvqYBB0dMskO8SkQsW8abe3pPPN8QX+qFaG3vNM0jFSE5CxDeZ3PBfg06Xzz3K
	BJ1bLXYYANQMs/4sD5MUFZNBjZU5n6RGqJF59fcZz8iDoAQFRHTUoIVW+fh0BFqXbu4Di4bFjjk
	ZcdRQeZ+/v8WJoj2+xTSzIWmwh452p6gIzNLCa9F0NQ7SLGAa6+AzkoofTpwuMylKWvbgAF8MYY
	+hxYejHSYEIT7t9DcdM+nTzY7olxoIIzC4yLvEMPghk+VpirpaoD96s0d6POXafbI3vSL70mBDS
	zLnjoNf71DFLVbAVsMEszH64cCzUgAwG7td4vH1pkuFSR+afkv9qLjJl+O2SEMo0jwj7B66I6s4
	cK67D2cYTfmHvwSVAF+y3aw95/7+yPJjbR0gX7fJVBoadQwFPc431QXAv9V3P7tDoNLJf0mX1iq
	E57bWDA8vmvw==
X-Google-Smtp-Source: AGHT+IHV6Of+qXakfqJ0XhbATMb2AIuLl9e0wcQPO7/GLftVgSTayzqBT8eCMUUPgRnR+4vlJm1a1w==
X-Received: by 2002:a05:600c:45c6:b0:46b:2fd3:b55f with SMTP id 5b1f17b1804b1-46e32c2f45amr3319005e9.4.1758732775255;
        Wed, 24 Sep 2025 09:52:55 -0700 (PDT)
Received: from radijator.localnet (93-138-236-234.adsl.net.t-com.hr. [93.138.236.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3f02f332c31sm22789020f8f.45.2025.09.24.09.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 09:52:54 -0700 (PDT)
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <dujemihanovic32@gmail.com>
To: soc@lists.linux.dev
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <duje@dujemihanovic.xyz>
Subject: [GIT PULL] PXA1908 DT changes for 6.18
Date: Wed, 24 Sep 2025 18:52:52 +0200
Message-ID: <4685744.LvFx2qVVIh@radijator>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi SoC maintainers,

Here's the first batch of PXA1908 DT changes for 6.18.

Regards,
Duje

The following changes since commit 76eeb9b8de9880ca38696b2fb56ac45ac0a25c6c:

  Linux 6.17-rc5 (2025-09-07 14:22:57 -0700)

are available in the Git repository at:

  https://gitlab.com/pxa1908-mainline/linux.git tags/pxa1908-dt-for-6.18

for you to fetch changes up to efab3844c6f18327886c5c2e0e40acccaf976a89:

  arm64: dts: marvell: samsung,coreprimevelte: Add USB connector (2025-09-2=
0 14:08:32 +0200)

=2D---------------------------------------------------------------
PXA1908 DT changes for 6.18

Rollup of hardware support which has accumulated since support for the
SoC and coreprimevelte board was merged. This most notably includes
eMMC, PMIC, backlight and touchscreen. A few QoL fixes are also
included.

=2D---------------------------------------------------------------
Duje Mihanovi=C4=87 (9):
      arm64: dts: marvell: samsung,coreprimevelte: Add backlight
      arm64: dts: marvell: samsung,coreprimevelte: Correct CD GPIO
      arm64: dts: marvell: samsung,coreprimevelte: Enable eMMC
      arm64: dts: marvell: pxa1908: Add PWMs
      arm64: dts: marvell: samsung,coreprimevelte: Add vibrator
      arm64: dts: marvell: pxa1908: Move ramoops to SoC dtsi
      arm64: dts: marvell: samsung,coreprimevelte: Drop some reserved memory
      arm64: dts: marvell: samsung,coreprimevelte: Fill in memory node
      arm64: dts: marvell: samsung,coreprimevelte: Add USB connector

Karel Balej (3):
      arm64: dts: samsung,coreprimevelte: add PMIC
      arm64: dts: samsung,coreprimevelte: add touchscreen
      arm64: dts: samsung,coreprimevelte: add SDIO

 .../marvell/mmp/pxa1908-samsung-coreprimevelte.dts | 266 +++++++++++++++++=
+---
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi       |  46 ++++
 2 files changed, 278 insertions(+), 34 deletions(-)



