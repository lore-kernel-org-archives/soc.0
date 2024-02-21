Return-Path: <SRS0=MIRM=J6=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC7CC48BC3
	for <soc@archiver.kernel.org>; Wed, 21 Feb 2024 13:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD11CC433F1; Wed, 21 Feb 2024 13:29:50 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CD977C433C7
	for <soc@kernel.org>; Wed, 21 Feb 2024 13:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CD977C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-607d9c4fa90so68470137b3.2
        for <soc@kernel.org>; Wed, 21 Feb 2024 05:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708522188; x=1709126988; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DtwVTvyoQkxShn++5SDPuuLiYErVyFQetBQ3L5BxpTg=;
        b=fjHSi3/aV0WegMWJmiCVpLShYg4XxBGVnb4PS4FdIrhp6UtCcBE93GUO1yrsFhIlEE
         yWUZAYfebeGs3zy+Ej7a89EDMFYi9jvmpJ9BJSh0T4Ft5gt1b/iWyv+H0Fw931Jx2efh
         3BaPsKWBvQveyRbqnULDxFxtIFPH4Usccy5jH6fJsP/Z/U7+EQxa2uwO3ewOB7YhORDH
         WylznjePX64ocyI8ziGhcnl8sJJXWhx2Z6WPvLwf8bvoXT5whpP4eFPFzR51JfbqML1K
         IWuwexhBoMgJ7wv92dXhy1UeQYmDMV8S+cqC5bQj/Zhss4+oJeo6rz8NBRei1yvHsH3z
         ZsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708522188; x=1709126988;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DtwVTvyoQkxShn++5SDPuuLiYErVyFQetBQ3L5BxpTg=;
        b=G/tsRlA93MShqmJd+/fGxdVZBq1ftpjR/blR/DmsTR9cefyhs9VHtASyRaj+9x/vTr
         xLGeybbyZ/CSh3teONrHB0dPrpe0jm9kuc3goIVhq6a3TU/gAyfZ6wBrsleqpRdugnIC
         OVJIViV0uACmI1FmZ13GrIvHDQJhNW+gH0BiVk2Kfu1Ai90y8/iSYmsV7vWXyIGNv923
         lDLWvkCANuet7SiLeupTuOycvafIx8CO/I4Prdh710N7bC2kkKC4TML4GugmEQk5tjdl
         1YAuj7+Yziu64M6r/E8AzcWWi+EcPEY2q7AC2EuMcEAwiJzPVaItd+pjjNlLPbmRbOMG
         6XcA==
X-Gm-Message-State: AOJu0YybdC6tGZBrHsGxI8iNOaaSlfJYcGp2yyCx4Tqjg6WQvcelDsvP
	ZAgpQCFtqbAVRGhvkhPaipbpNAbTvwqPIpJwogyFbK7NBUCSf8LQz+3iVN0qdekGhtuwdvzBLkB
	4KZJhljyc+jRX9o+gif7/hw9YRMnWfvG7SoEL3Ff7hmDzvS0JSlI=
X-Google-Smtp-Source: AGHT+IHQZrZbYUlacSuu/Y2MAU2ewYpL3PduGAEq9hHypOhXTm/Ti6gaTRt6A9fvg0XnNYY6PtIvsMyb91ZDrS08YM4=
X-Received: by 2002:a81:7386:0:b0:607:786c:c3c2 with SMTP id
 o128-20020a817386000000b00607786cc3c2mr17152206ywc.19.1708522188589; Wed, 21
 Feb 2024 05:29:48 -0800 (PST)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 14:29:37 +0100
Message-ID: <CACRpkdYQv9cyCZyjgQB4FTrxek9Hfu4EZ3syfHqHF7P6gzddvA@mail.gmail.com>
Subject: [GIT PULL] Gemini DTS updates for v6.9
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC folks,

these are some Gemini DTS updates for the v6.9 kernel.
Details in the signed tag!

Please pull it in.

Yours,
Linus Walleij

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/gemini-dts-v6.9

for you to fetch changes up to 5ee18186a0595a2327b71e5964ebf52834bbd047:

  ARM: dts: gemini: Fix switch node names on Vitesse switches
(2024-02-21 14:22:53 +0100)

----------------------------------------------------------------
Gemini DTS changes for the v6.9 kernel:

- Fix the node names of the DSA switch in DIR-685.
- Fix the node names of the Vitesse DSA switches.
- Fix up the Wiligear compatible strings
- Use KEY_RESTART where applicable.

----------------------------------------------------------------
Linus Walleij (4):
      ARM: dts: gemini: Fix switch node names in the DIR-685
      ARM: dts: gemini: Fix wiligear compatible strings
      ARM: dts: gemini: Map reset keys to KEY_RESTART
      ARM: dts: gemini: Fix switch node names on Vitesse switches

 arch/arm/boot/dts/gemini/gemini-dlink-dir-685.dts | 30 +++++++++++------------
 arch/arm/boot/dts/gemini/gemini-dlink-dns-313.dts |  4 +--
 arch/arm/boot/dts/gemini/gemini-sl93512r.dts      | 16 ++++++------
 arch/arm/boot/dts/gemini/gemini-sq201.dts         | 16 ++++++------
 arch/arm/boot/dts/gemini/gemini-wbd111.dts        |  6 ++---
 arch/arm/boot/dts/gemini/gemini-wbd222.dts        |  6 ++---
 6 files changed, 39 insertions(+), 39 deletions(-)
