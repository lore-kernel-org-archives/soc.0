Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794151307;
	b=HFLbIgk1Hi5aVW/4l+f6K273zwHHNJ8e6P1h96yyqYnlPuPtPesE3LaDZikaCop1B1bA
	 QLHCqW6MQY+F2fyY9bToAOCSgE1e7ae/CTng/N4BKMM/2/35XOZIP1cHvg79WCwXCFKkT
	 uw1jsPbw5GJn9Tssqwa7jJtRfNFxhc8BdqioYLt8lhII4KUXbW8qon8nlu469p7Ev7X5Y
	 Hj8FsV+lYUywp/mAHRJQtt+2RlWkira05mEwOq/G9Kv4bizepG8cDkETDkwnfa7SHStoq
	 jSwWWY3FGzD8jpSGubNSFHtZaBmUk7ujrmn8wiKLFWwMeyWDHSHiNNmxLIcsj5OITeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794151307;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=lKCjL7p+zgW33BiYzxPBThwXq3MND07dMD37nZ771vM=;
	b=bSNwQFeIcXPg2F9jbSaf3IiJHuy07NtCG/W61z3RdwV3tmWYtNuoGvaS30M78EwbRBcV
	 w20mJJ27wiS3bTbUWwUX+j3mHlbJKhKfD/c0XXiDwNrYvjW0yIzLM6sp+e1ZUUkOeMqsr
	 mGvV5mT6XKatWnO5P3cTaxD7tYM3pvDAM2KAodJfQROQHYoYote4lI5t5h8+ULrxNyG2w
	 3mBctJcYBZrB122EJJEwMzN+pky/bvl6XPdy4UvgvbK5ek+ovx37AC+AHZyPSbL3nVsxZ
	 6QoVLorHq0GXfw0zXoNQGT9/cgcLSqFUjhD+V0bTojglnF8EYEXoiGPRBime7zFOWpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hswlQr3K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300BA606A31C
	for <soc@lists.linux.dev>; Sun,  8 Nov 2026 15:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hswlQr3K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDCF61F0089F
	for <soc@lists.linux.dev>; Sun,  8 Nov 2026 15:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794151306;
	bh=lKCjL7p+zgW33BiYzxPBThwXq3MND07dMD37nZ771vM=;
	h=From:Date:Subject:To:Cc;
	b=hswlQr3KNt8NG4/kvlgIzs3B4PAintguleytdN2UpZfULCAAo8tTYwDghejA65Kou
	 RNnSqd26q1dfcnEwMFY6hzzfTxgJNeI2J+mTg3vSJrklPFQSdTtYv946PuS1S0manb
	 cywIxnbrvKQBm+jjQefB6jJMIQUni/UZeIu9Cp2FHj6mVy4C6ztlf315UFxLncz9OT
	 CnAvkdBQgNAwJY5zQGMrT9Kq2Kwl9RYaB/VQnul2lPY65EwweJjDfyykNhzN8bCdyC
	 6xNksy/6jkLV7hrryjoeht8+N/wtDaEMggd6y1qNJSLD0gyXP74utYRHrqcfADFHeH
	 m8e2IZHQm4kBg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bffd1e177fso113138e87.0
        for <soc@lists.linux.dev>; Sun, 08 Nov 2026 07:21:46 -0800 (PST)
X-Gm-Message-State: APuU4Z/4P/loKonfzAPU0HsRH76w640eZejXHKbgP+ZERtJCq49tK3CI
	kIlSqdfqIYjV6y3ypGsE6BrpLAut+23+FwGiuUZ2LD5/s/zTdmz2Czxse0xO8gGTAzHFV1l8yvi
	15D6gT13YL6mBQ7lkS1cKVTy+/nSHu04=
X-Received: by 2002:a05:6512:690:b0:5bf:c27b:8e52 with SMTP id
 2adb3069b0e04-5c14c03b28cmr381749e87.65.1794151305742; Sun, 08 Nov 2026
 07:21:45 -0800 (PST)
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 8 Nov 2026 16:21:34 +0100
X-Gmail-Original-Message-ID: <CAD++jL=Jiy8tRd9KjMQHAd==HkfdofeU5NPoRRejvWQgexKdAw@mail.gmail.com>
X-Gm-Features: AclHuK8mYwR23FTGYPto6xZ1otnl6J7UrOuU8x3OE6Nm5XuQ4RCbP7Hvsyt3DXE
Message-ID: <CAD++jL=Jiy8tRd9KjMQHAd==HkfdofeU5NPoRRejvWQgexKdAw@mail.gmail.com>
Subject: [GIT PULL] configs: TEO cpuidle governor defconfig for ARM64
To: soc@lists.linux.dev
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC maintainers,

this selects the TEO cpuidle governor as the default for the
ARM64 defconfig.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/soc-v7.5-teo-arm64-cpuidle

for you to fetch changes up to 52e0398e1d0f456f0df93d217e54a6aee8ba730f:

  arm64: defconfig: Enable the TEO cpuidle governor (2026-11-08 16:16:28 +0100)

----------------------------------------------------------------
This selects the TEO cpuidle governor as default for
ARM64 systems.

----------------------------------------------------------------
Linus Walleij (1):
      arm64: defconfig: Enable the TEO cpuidle governor

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
