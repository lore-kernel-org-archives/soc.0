Return-Path: <SRS0=ZQjm=FJ=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB4CCE7A81
	for <soc@archiver.kernel.org>; Mon, 25 Sep 2023 09:21:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C71FBC433C9; Mon, 25 Sep 2023 09:21:58 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D55E0C433C7
	for <soc@kernel.org>; Mon, 25 Sep 2023 09:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D55E0C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d865854ef96so4016286276.2
        for <soc@kernel.org>; Mon, 25 Sep 2023 02:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695633717; x=1696238517; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N7arRfZeBtT497ax2pL4SYDLXkrDcIcThCXauWvah8w=;
        b=NnrJCg4vF/OIH9YQg8AaXdEzZ9nB5OsNupczw68MMHZB5nWF4Pof9h8m66ZTErkZEd
         kOieVSspvG0EgKQ0Kc8rqF3JzGLu86ZPcg8OPrgRQKos/rzQnJEfmTf0LRc2tlvg3xvQ
         Wv0CSMnCssPHwd0Mko3jLaKEDHVtIk+vCaXzrLowy3cxJqWHct3bhv/G/D9av1OgkQ3M
         3N/UpOm7kyYRtorXkSXruzIgtxBGZRcnlyhWQ3szNnmx8N9PGYv6R+nWC86KXKGFIJeK
         xd5cctV6H5ZxBTX9EBfZLgVIbMfEP8q02w3dR/Xo4M4Jjr2c8k/WRKiQCn+QUplPJRpH
         XGDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695633717; x=1696238517;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N7arRfZeBtT497ax2pL4SYDLXkrDcIcThCXauWvah8w=;
        b=d86+SBUgaMInVHeY76EAu5f5JRk9TUNjdZu38AiDOEgVRSgxqyso0hmFCX/L/i9c4X
         87YqL5Gp2QtvDRTjMmtKlCKTGZ0SgiQaGMV9HVLffEc2ls2oRdNzgXN2oQPWN1YHnp5o
         mG+zGmhUDbT/5N2jLw0y9ANWbUu7RMG4YtUt7sVnp8eHjJW1SAt7fPHer0cdr/k2leY4
         917JwkkDIq0Apu84C0Oer8ZqP4PiHNsVgIwcsqIoVRxfVHJ9JQFhPhp9joBorWfwZ/P8
         M6Q6Dpd5lFwrxB9ii3L+4y4BVc3oUGganLf24Qfiz/iZ2ItkPSFswd57wZCXmRrmKLoa
         8HFQ==
X-Gm-Message-State: AOJu0YxwgQX/qNnZm6wbe/nIuN5wsy1/h9SZ7m9myrIpJaoMHNMM3lW1
	aJgrVsOWAj82F/j8zLLB49O2EHibdBmdcwKL5uU7VaI6faj9h3/8iAE=
X-Google-Smtp-Source: AGHT+IHBy0xil4yXUo4nkohG8CJeFTHkseROgR9cppE/mWegSpZxQWeWOdf2+72IKLQ1kxo1nthvEQmHna2GXgBl1v0=
X-Received: by 2002:a25:d795:0:b0:d80:c94:3ea6 with SMTP id
 o143-20020a25d795000000b00d800c943ea6mr5491473ybg.34.1695633716792; Mon, 25
 Sep 2023 02:21:56 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Sep 2023 11:21:46 +0200
Message-ID: <CACRpkdZc5Yzsos2+gRPtCT-+ohmaV69ew5YFJLakD+9VFkrkfQ@mail.gmail.com>
Subject: [GIT PULL] Ux500 DT updates for v6.7
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi ARM SoC folks,

please pull in the following fixes from Krzysztof for Ux500
device trees.

Yours,
Linus Walleij

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-dts-for-armsoc

for you to fetch changes up to 374a69427f2e6a675cb0ec871d9cfb8152008a3f:

  ARM: dts: st: href-tvk1281618: correct touchscreen syna,nosleep-mode
(2023-09-25 11:11:50 +0200)

----------------------------------------------------------------
Ux500 device tree updates for v6.7:

- Two fixes from Krzysztof fixing up DT properties
  on the touchscreen.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      ARM: dts: st: href-tvk1281618: fix touchscreen VIO supply
      ARM: dts: st: href-tvk1281618: correct touchscreen syna,nosleep-mode

 arch/arm/boot/dts/st/ste-href-tvk1281618-r2.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
