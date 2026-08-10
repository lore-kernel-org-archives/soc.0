Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F67137204E
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 07:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786347558; cv=pass; b=iYsvCeEIzfNTNsU4jfDYO96fSGNE8l5OCC7UH1b04ItXaN/ttKwGpL7JwgCR2y/5NmS0NjR4vz/JgNIoj/Pr2wd2243iDo/E4Js9ZXSd0qCWK0+F1D8foHNnNpYFRpS+Steu8ovmjchdK5m3gunqCgVuMyjs0n1w0a+XKogAvgM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786347558; c=relaxed/simple;
	bh=DyAEe8OPwjjCcuLl+pfdHDYB9ECfg7u5y3yOLLSdnaE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=u9Epnw118HZFPsH0eGpx3w6Blp+cmci4V2tatLwfUlRu+PYAUjfLwtHsI9L/1Ablren+Lex6pc7kVQ4mSYjr8GE77h3ieUB2r0HKMPIGQRuN4L+Yx3sB4nLSp5xb2xFw/LTMEl18BXXhDz+p+Qvbi1d43MpWTCeCb+iMA8b3f4A=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=fU8aMZN7; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="fU8aMZN7"
Received: by smtp.kernel.org (Postfix)
	id 17D251F00A3A; Mon, 10 Aug 2026 07:39:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1786347555;
	b=DV/QCHze5IBLNvjaYxfICGCWinRaeO7WByXSBZA3Up22E+0wjC1wc+LdAwMNCSH+G9NY
	 +/fwlsRl8UWERh89hpbxqjqCduqA99RNWYowLz69ra0qYZn7WJM78Wt+yrscinHzpu6wG
	 xp6YG8oIdqLG8baTBPYNrUjb/SDfgUs+pJUgJlqmL6QDVFWFPKNwQF3XXC8FihBC84BTN
	 j+kxXKmlV2nucK1uJEDBi0ZSyhtM12ZpxbmUuORg21t2xJdjKga0Q1JL2uF0/wHxkW0f1
	 cP1vQ9BmFaQrXFozMLScWDblA6bhvgolujqN272AqsY0ootEQ3RmlTVsEm2/VJYH+XQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786347555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=x0hr8unAYinQKuZq1YaxgLfSO4H3IM1KbKSRWUiG5Qs=;
	b=ddgnbTNZ8+8iiyu5WpardfYVgNDhgmhOBWn3MRSwavIzC55QTaIspxNkmo8bxTBy972M
	 Y/PDCm8pLkkIMc0s4dsnpFy1n3Tc7e7XGLTmjYRZL+ri95ZqnBZpbkwnUA4UNKZviMREm
	 7/ipm9lkXtHCiZxaiqUefhP1nWbo27TpxGCz3ZO+Ln/ltg/XCtzlr36nnacHbAnoAegu/
	 DfGY5X0HH6Z14VIvu8BXIRUR0UH4lUApE2MocXk4xZ9VNfNCXDd4DxSGv9k4Ta/5INK+J
	 GacRaCCQ4zBX9PfVCWVDFQJnKsuDdtN7ItRFkMrrI6vxgEhP7JrROlW1q4WwCY4fddA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=fU8aMZN7;
	dmarc=none header.from=monstr.eu;
	spf=none smtp.mailfrom=monstr.eu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53E381F000E9
	for <soc@kernel.org>; Mon, 10 Aug 2026 07:39:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=fU8aMZN7
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 53E381F000E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=monstr.eu
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-668c1b780e5so2098357d50.2
        for <soc@kernel.org>; Mon, 10 Aug 2026 00:39:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786347552; cv=none;
        d=google.com; s=arc-20260327;
        b=pkfnu0PkU2Rkijy0t0uLaSVqzcOr7lc0CTbEu6IMe6TLfslgqndnsBPVlmmDa9ganO
         30sFzRidN8ZdCTNQ/qeyKxKt4ykopCkRt+MzyBON99PaP2yupzZO7VpkbnF6EENisiaB
         MS1EZoh9cx7B47IAjwCK+vH/NMU9iw3l0TRez+lNLfmRX2KFeBguZMl5slunQ6DIclDy
         Gb/G2PA489O0loYDvTDVBgPqznBU8vcq0OkTpyKwG/nw6bGj8gZmkUl+G8KZY6auaTVe
         CURTExS/TWp2gHIF+1PYiZTKT9sIdOT8NHI/TRAALyviNcEOu93OoEZI6T/Nbgu4GJH6
         NXYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=x0hr8unAYinQKuZq1YaxgLfSO4H3IM1KbKSRWUiG5Qs=;
        fh=USfxQ7v9YbbgbzUCK5rgK5xnF5L0usnYcuhWnAGI6mY=;
        b=J6HWYWJwHN2efmE3DZU/jJsex98twbl1Mf9OxfdPP0C2LReEzeagODAIfWlzb7xCp0
         YcpAMwaYnLLQqWIqr4IGA5s1phOQIR4qiovbX3VUDKet5L7EFKlaWW++imLSFj+kn8DV
         YLUNdZ7yGMkLzOD8XZ5sN8bPERXYBHn+jMfz0drR1dgfqNqRckbddiezE2GL1mix2Y6n
         ypkhRv0luFzAfJg1g40xr2zS+AcQjeIYxNtJsqKmnDjewWacVrlylllNiLo/tL+uI/Uc
         t7hWOCI0Vv5tdcKimP6woI8UYt4INRQYKpGtwPP1pMvdxYdwkDUz/36zUF0E2SwZ3O54
         QLFg==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1786347552; x=1786952352; darn=kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=x0hr8unAYinQKuZq1YaxgLfSO4H3IM1KbKSRWUiG5Qs=;
        b=fU8aMZN7XfeZkP16Ap/GL8XGkpbBdJin1QRUDVKx5WBy+QMjuCA5j5RKU/XiAHHAiY
         uVDAYImsZ5EaGxzPV5JNn+j+xD8goIonUZ/SJXYOlVicDnTpO/EPLdmGcKiRIJj+/b6T
         wfnqPHRF31g/0+d8/4d/0207MHr1ylBvlqnwIo2bp+SAuFL0pHsa1d4jWgPHRVtshu2y
         lhyvMxS9xixqko6YL78/ZUa1cRUzLnxIA+zZK0hVyHHfVL/vQi0PsJfPXAuMSvMVgzSk
         WljX975Du0XtKjW3S4q+fojHdfGLZMslxhxZ2V0ppWqNlPMgEjaDH5/N/VriTfMKN/aH
         muOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786347552; x=1786952352;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0hr8unAYinQKuZq1YaxgLfSO4H3IM1KbKSRWUiG5Qs=;
        b=NEjXY63Bt+nt57/wRWeIx5qmqFy8dRGFTcO1nAe4YBaxtDd4GTx1YYBnQ+I6x79XAw
         CVTpDO+hONnvFRSZswUKOk7jkTXEqb7dAlbdtXnls91QKhBJvUPZYoq5+AzAmavbMzCC
         c/t1I5ScKNLFnPJV0YIebAM0AH3GSKr/D6lkBqsrTh5hY3bwa6I7Nw+2roqqK9qlU93c
         elaR5oXSf/qw3Pi2RlzIlpYAeGDb6M8Boo7HbN/DI0bTRqcGdcVv/SRCkEQxKu0hwSmf
         e8vYCJ14JEWEhfk0E35kiz/Dj/q13fjYoH5M1jND0HtO4kFtOIlZhn9fpyDFR5c5VAI7
         p1mA==
X-Gm-Message-State: AOJu0YxKG652IgN33vX7V6WD4zTnu3PTmOwwtePa7TbK2mKviXMmHzWA
	P2IqpwlH3GLMEkyVnxhclQphIi6hHaMzKUivPOUKEIjyPywGUXd7/M/RnvvlR1cSwi5+Q+xnXqK
	fo4LRuXZ88r3IyEZVNAu5n6MLZR6MAOjldC5zu7PXPR1oINlGnW36724TuvE=
X-Gm-Gg: AR+sD11UIbD2pr0MY0YMFFLgSjg8QkVggjXAdkuRD6BkAPreNtShpZ+dyEqfEikN33T
	DlbS4EVVn5mNWeNidQ3slZTMCiqd75uY7cfQLrD5/KCN8ZQ0xtOZNIGRnVI4aDybSlpFtYVhKIo
	WfAvhrElxotjhiGOhH5NrwHxh3yPmQBc8IygrGl4ymHFU92ekWzunk3di47gUTZBNkNP9LUihUk
	kIKBQO/GikrVo3mAeNgf02HOUoVHWfGclz9M+SF0zyNO/0161lQeskZrE6ZCI1CFYNcLdkcc09v
	mrb6rijAyKCV0cdIvZ/W2VI69EaagWKbuYwSVB19ILXzPcRembndE1sCVh9aF0YYsdH5S/pGbKa
	Vy5lHacUQ45ah
X-Received: by 2002:a05:690e:484f:b0:667:f400:e822 with SMTP id
 956f58d0204a3-66ad70d7b43mr8102878d50.3.1786347551846; Mon, 10 Aug 2026
 00:39:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Mon, 10 Aug 2026 09:39:00 +0200
X-Gm-Features: AUfX_mwm-VSARJdjmBVxW3y3JAraNv39DE_9u5wiI1HnW3prEfrLSXtM1nRalxA
Message-ID: <CAHTX3dKTNZJjcCVeAKA4KX-JcoJct72S1t2XuycDhcuSvOMhgA@mail.gmail.com>
Subject: [GIT PULL] arm64: AMD/Xilinx SOC changes for v7.3
To: SoC Team <soc@kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

please pull these SOC changes to your tree. I have applied Jay's
patches last week to
see conflicts via Linux next but before creating tag I found that
there are missing links
that's why I have updated the top 5 patches today.

Thanks,
Michal



The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-7.3

for you to fetch changes up to 0e8860367da261116cd290bcd6a54d2e597a0c5c:

  firmware: xilinx: Clear firmware notifiers across kexec transitions
(2026-08-10 09:30:44 +0200)

----------------------------------------------------------------
arm64: Xilinx SOC changes for 7.3

firmware:
- Feature check improvements
- Clean up firmware and EL3 state on kexec

soc:
- Remove redundant dev_err()

----------------------------------------------------------------
Jay Buddhabhatti (5):
      firmware: xilinx: Use TF-A feature check for TF-A-specific APIs
      firmware: xilinx: Propagate actual error from feature check
      firmware: xilinx: Add support to clear EL3 PM state
      firmware: xilinx: Release all peripheral devices from firmware
      firmware: xilinx: Clear firmware notifiers across kexec transitions

Pan Chuang (1):
      soc: xilinx: Remove redundant dev_err()

 drivers/firmware/xilinx/zynqmp.c     | 108 +++++++++++++++++---
 drivers/soc/xilinx/zynqmp_power.c    |   5 +-
 include/linux/firmware/xlnx-zynqmp.h |  10 +-
 3 files changed, 103 insertions(+), 20 deletions(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs
