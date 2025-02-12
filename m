Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518A21FF7D8
	for <soc@lists.linux.dev>; Wed, 12 Feb 2025 23:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739401412; cv=none; b=QZ9AqLBnJNVX/Zko38OOkp5AvuB9Pqn0KNDochtrHVeBmN5Eo6O3tVfDsHwNKz6xw1IAEX03J3iMNcYJuKobIW00MMo/Y86fxfIuHknfwMNCtLWqbACvyiefEwfUnvOYD1jwgaD65VJHlcuQ3Akp0ReRGV7an5Rn2uJPMCQNMKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739401412; c=relaxed/simple;
	bh=sbLB0G4UU8OIWbiXmTp9xCjIjmQlpgTLNINEQ4EesX8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=s+q57l1cGcyZNCtijpJBc3ljesMgbFo6xPST4SpUhxhPgTFnx+61aYLCDc8Jpt3675cSNHu/m1WHdhZGob5f1pSe5euFGL7yJDDGGhJMPT/8DEvI/kNLtDXaBe3ZsAOJUWJ9XEn49ewD3gIw0etE6sIsUxQGTafnBOy0WejeV5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SOsTQrxO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SOsTQrxO"
Received: by smtp.kernel.org (Postfix)
	id D130CC4CEE4; Wed, 12 Feb 2025 23:03:31 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D4CE3C4CEDF
	for <soc@kernel.org>; Wed, 12 Feb 2025 23:03:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D4CE3C4CEDF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-545054d78edso179838e87.1
        for <soc@kernel.org>; Wed, 12 Feb 2025 15:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739401408; x=1740006208; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CtYv2rniHzU2vFxcS+ho+Kqs7Bqn1dNRU/Z0HDfV2JA=;
        b=SOsTQrxOUf29tm+THlfDnmFtxxz2up4DScT5jnqZlgrho+O+ZOmF3JapkyHYM+BgeY
         IJCXa65Q6iIVO9brcdK8RfzZFfpDyBjr1/4S6NYWpYZslztydLGM5RZj6IjyYArxTa/i
         8SUcI9eGGXgR0iZbbyb+nfOYn42sqqVVPTHnGRNh4xfTRDAdHrHJGr10gtLALEYnzMMT
         sku03xgYQOHnFgCXCiEX5rMJwYCz59fPd1IurG1SXrwasXhpMI7gCgzbbT5BOQAoTRuY
         cPV4TLFDPDIAd8r6kRsJvLB67DUUrOQgJeysdSxn4u66d1IkbqjXXaQ6HAtjm0BqjEaB
         7qSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739401408; x=1740006208;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CtYv2rniHzU2vFxcS+ho+Kqs7Bqn1dNRU/Z0HDfV2JA=;
        b=KguzJFDjYLlqv+tbwY2LXlQ0F6c6swI6v6OnEc+uIE/jt+wpeZ7KKHveMDbuyofIH4
         /KkFxTxY1gGrBxHXu7pr5j9J92T6bhHVqGWwIu5iAa72ytRTHZL0hFNvzqM37Tug9Pti
         pG+P/VdGMYDM9XoK9FL3iQx5mnEODz37waRmQymAOS5OiTa52NCXJSW3EdWCT9PT/3kZ
         Hsr4rmQZl3VE+WuBYYCuC1aE59ggLCKnbG1rUnpZ/AQplqv4GslqKZpe46Wi4bXnuPVp
         Is4x9pkp8vVx7meeuuILv1WNrtLM66/6yS3oC15G+zEO1JVrzvjF7duTxoUUzUaxbAIk
         lzlQ==
X-Gm-Message-State: AOJu0YzDW5pnequXB2docaei0yVed2fmIJIB3oy7DNuCilvNQr9LFR0B
	DAfff2tOJMdqRpNmcdW7qH08/xMkHdgThYCQt+6tuyKm6xFoydoHLOiX73p2s5AiAJg2IAVavJZ
	OnoNZIhA0s1am2L/GLjTxZCpNgVc74SeElXAzHGT9m4aRgJGSbv0=
X-Gm-Gg: ASbGncvnpVeWHui/91ayJf/chCqiHtwbXBCT1Ek9QuM520Csm8W9vDK+b1FxgPokk97
	L4DuN5Qw7TTIptrjSean95Lrw/qb6pI1sONt3VXbi8X9PDYU9qcUJHLo2n8LCIJq1kJcBN5dv
X-Google-Smtp-Source: AGHT+IGU0fNR7NGIV+pbYdtHPL9rPB+ylJt6zDhg8rnyzbzqbNCMjZDubeVHgGqXHbtCDIdN6Kp3dOr2G2KQTqiizIo=
X-Received: by 2002:a05:6512:2215:b0:540:2da2:f282 with SMTP id
 2adb3069b0e04-5451818959bmr1293353e87.42.1739401408383; Wed, 12 Feb 2025
 15:03:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Feb 2025 00:03:17 +0100
X-Gm-Features: AWEUYZltIBKIZ_wEzfLw9-I-1IuesZzqcfiOlS0C4ntJaByiJ_E_JlkAr-QVxBY
Message-ID: <CACRpkdbi_A_RCufEZSk0cEoQ_H-s0VLGUzJ9zPQECSvsUP7-dQ@mail.gmail.com>
Subject: [GIT PULL] IXP4xx DTS updates for v6.15
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC maintainers,

here are some minor IXP4xx DTS updates that need to land upstream.

Please pull them in, details in the signed tag!

Yours,
Linus Walleij

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/ixp4xx-dts-soc-for-v6.15

for you to fetch changes up to 3dceb794c09d5f2c474628de45f146b59a8d985d:

  ARM: dts: ixp4xx: Add Netgear WG302 v1 GPIOs (2025-02-12 23:56:31 +0100)

----------------------------------------------------------------
Some minor IXP4xx updates for v6.15:
- Assing the right NPE for EthA
- Fix up erroneous PCI mappings on WG302
- Add LEDs and keys on GPIO to WG302

----------------------------------------------------------------
Linus Walleij (3):
      ARM: dts: Properly assign NPE to ethA
      ARM: dts: ixp4xx: Fix up PCI on WG302
      ARM: dts: ixp4xx: Add Netgear WG302 v1 GPIOs

 .../dts/intel/ixp/intel-ixp42x-netgear-wg302v1.dts | 40 +++++++++++++++++++---
 arch/arm/boot/dts/intel/ixp/intel-ixp4xx.dtsi      |  2 +-
 2 files changed, 36 insertions(+), 6 deletions(-)
