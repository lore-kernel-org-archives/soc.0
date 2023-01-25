Return-Path: <SRS0=cWTr=5W=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC96FC27C76
	for <soc@archiver.kernel.org>; Wed, 25 Jan 2023 07:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7FD53C4339B; Wed, 25 Jan 2023 07:55:57 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 86003C433D2
	for <soc@kernel.org>; Wed, 25 Jan 2023 07:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 86003C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id u72so1306532ybi.7
        for <soc@kernel.org>; Tue, 24 Jan 2023 23:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qZeT9N7/YDOfGF0619aZTvv6j4BJZybuuI/JW5FqfqY=;
        b=LCjqzQmaoSiwmL7PKK0GQ8JawwEXQFjcrhfAPpH1T9zecBBwCL4mdn7Zt4i7CjF22Z
         iVetzGhLmUVZcSwMyo0cDbpob6FT5zjkhkXAcLEw97Ollw4QyhLV2m0te8LidzJXmb2u
         sOkMVwXzN1d87hh74o3r+7t1VRJcIw9QbQfl1EBWqunstN77Frpi1iKZ4YUfGX2B94Mk
         0z8+QAb16+1iVhDX+MahyaH2VnY4gIKhi9/1t0QaTlEP9uRdS2ppFTU621alknO3TDnU
         DfrMSrM9u5/Iyfw79crCM+c/RLdMKEc13p7iHSBmzthnccZW+cUJrtvgvmzbRbVOVfRO
         VclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qZeT9N7/YDOfGF0619aZTvv6j4BJZybuuI/JW5FqfqY=;
        b=JGEo0mBkWZR/hrqPDam0VKOZrsasQzctc00hZh1e8JvmutPthkdFHu2cm0gl9vgnyD
         a/aZeQv4FzwZ9nUeQleXDsMUUw6eFwqtjiJHZEPWg1hIKnMzVkz+kMvJ2Oj5f0IwXcNc
         HxX34bnkYe7GGd4l5potCDBqJwK7/JcT8HVP21cQ2sQJT8VUgPLxAjFE3ljlTcnFICEm
         7wmoQLHMoKu492k0fLrBWanxJsLAUx1bV5MlZDTGwbqdRLKkC2ZMKcw4eFCslFbWBngR
         g1ALBSf4By1SaCE3gBT4g2HDp2AAed3x7RTsoYtgyf0Ifj1QtDPIWLQWGs8HoeI24+BP
         TCSQ==
X-Gm-Message-State: AFqh2kq/aBIr8wOB0BoIp+xnQD8LtgSNvGawbShYY9EFALaRiQizjdJq
	Vjsi2EaflGtePwx0OR4BsCWMatjqsXBi+WY7FoXDT9p3k5HMSxxz
X-Google-Smtp-Source: AMrXdXt0iVKgdS/CZLnaz+LOmuIUS38xfLcSbGl68UVjInq7AXCpqLPhqRmsiMsEzwlCuuMstHy7Yp9nUeh5t/RASK8=
X-Received: by 2002:a25:5303:0:b0:7e4:fa1:b33 with SMTP id h3-20020a255303000000b007e40fa10b33mr2857416ybb.460.1674633355142;
 Tue, 24 Jan 2023 23:55:55 -0800 (PST)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 25 Jan 2023 08:55:44 +0100
Message-ID: <CACRpkdb=dDD-y91jdEM01iuioJVDgDwMgS8F46iN84vw_V8BvA@mail.gmail.com>
Subject: [GIT PULL] Gemini DTS updates for v6.3
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Hans Ulli Kroll <ulli.kroll@googlemail.com>
Content-Type: text/plain; charset="UTF-8"

Hi SoC folks,

here are some Gemini DTS updates that are ripe for merge.
I was waiting for the USB dependencies to be queued first,
and not they are in Greg's tree so please pull in these DTS
changes!

Yours,
Linus Walleij

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/gemini-dts-v6.3

for you to fetch changes up to 776e8ee7a3cb8a6a15067ca4b287ac4a3640ea87:

  ARM: dts: gemini: Enable DNS313 FOTG210 as periph (2023-01-25 08:49:32 +0100)

----------------------------------------------------------------
Gemini DTS additions and fixes for the v6.3 kernel cycle:

- Fix a schema warning by pushing down flash address/size to
  each device tree.

- Use RedBoot partition parsing properly on Wiliboard devices.

- Fix the FOTG200 USB block version.

- Activate device mode on the DNS-313 now that we merged the
  necessary USB changes.

----------------------------------------------------------------
Linus Walleij (5):
      ARM: dts: gemini: Push down flash address/size cells
      ARM: dts: gemini: wbd111: Use RedBoot partion parser
      ARM: dts: gemini: wbd222: Use RedBoot partion parser
      ARM: dts: gemini: Fix USB block version
      ARM: dts: gemini: Enable DNS313 FOTG210 as periph

 arch/arm/boot/dts/gemini-dlink-dns-313.dts | 19 ++++++++++++++++++
 arch/arm/boot/dts/gemini-wbd111.dts        | 31 ++++--------------------------
 arch/arm/boot/dts/gemini-wbd222.dts        | 31 ++++--------------------------
 arch/arm/boot/dts/gemini.dtsi              |  8 ++++----
 4 files changed, 31 insertions(+), 58 deletions(-)
