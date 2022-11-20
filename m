Return-Path: <SRS0=rXPd=3U=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C811DC4332F
	for <soc@archiver.kernel.org>; Sun, 20 Nov 2022 23:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C7EFC433D6; Sun, 20 Nov 2022 23:00:23 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AADC9C433C1
	for <soc@kernel.org>; Sun, 20 Nov 2022 23:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AADC9C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id f201so11694572yba.12
        for <soc@kernel.org>; Sun, 20 Nov 2022 15:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kLayFs5CC1rVfNtAMtC/BNMXcr8JalgIsdTUxlYLYjU=;
        b=sYpX4DWcqpkZxHWRV50kw3JFBml1XsqZNDc1V59CGFbMh1BJQHCi70h2B8DFlZVA8G
         6MBvFcIT9N3fVQDoQzeoPbO8Hr06mjOOOoz2qVfhDksD6my3tXslYc5DnuW7fMnIKsNu
         ZtDCnXqULNv9vNl0oAXWhe88iZqv8gVp1ji1nRxgGHxrdkMUpGJFfmasvyg+wBdLFJHg
         I0nItFC8TkDcojUKyaGN4RlND0HA9O7QsOKR4s1EF7Hs0Pa5IP8jcKC2ub9KLYant3yO
         uSoX1kK6auNbvPy81KUBCft4AKqTrnai68EjNr+DU0UCeV+HVxb44Y72OnV6QVwvzJoa
         W+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kLayFs5CC1rVfNtAMtC/BNMXcr8JalgIsdTUxlYLYjU=;
        b=FT8Ag/3LjGiLsMBqJnuQQPK/UTxSdPq+6XOb+u7nUeQwPPY+rgBAD6D/FoGm28jBiY
         nbEXb6JfhR0PUUkPE0p/gBnWoc+uJbcSqg9vuujquek2kXl8o6AFdy+Vw7lYCdzO1K/O
         DUxXnvDX4u5/2OmNVRZ0BYyfXd32X++9NMuY5Zp7ikSerTbPdFDW4JTu4PpT+oiskLzp
         p7dOfLL0elCUkDvR9EpYpfL1bOggMqRP6L7CaG6bCvzZQX6pdidQhGW19I8HylK7umGQ
         xhltx2tDLRaIW+RfI5Fh7gXraDkRGR8TPhje73W3YJWLm9ABPaIAy8TroYmUO04w4BHU
         uJYg==
X-Gm-Message-State: ANoB5pkoMEKNOoWHBsQQ9RIA4BLL1TqF+FAZ1DOfaFMD5eNItBFe7/IC
	W8cz+2Kp8WKsktugaVxkCKESY16H9kFfC7x8foESsT8RjwX9Gw==
X-Google-Smtp-Source: AA0mqf7MlsgUSUABcqArtUFCxFSgdKs3hMTo4vrGjsKRURWQKtJ/bTzYzDQq6pD2RRDpoCPU21EC5z39Ua/jIQhzjsQ=
X-Received: by 2002:a25:cb42:0:b0:6da:32d3:c2e3 with SMTP id
 b63-20020a25cb42000000b006da32d3c2e3mr14558982ybg.66.1668985217398; Sun, 20
 Nov 2022 15:00:17 -0800 (PST)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 21 Nov 2022 00:00:06 +0100
Message-ID: <CACRpkdYNwyZ1FDM07MkUfYyYGtXFQfy1xP9Utc5+K2+gn_ZW9g@mail.gmail.com>
Subject: [GIT PULL] IXP4xx updates for v6.2
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, arm-soc <arm@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC folks,

here are some small updates to IXP4xx for v6.2.
Details in the signed tag!

Please pull it in.

Yours,
Linus Walleij

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ixp4xx-for-v6.2

for you to fetch changes up to dc6e328a8d28e1c0c6e4f19e90cca17bb8fc126b:

  ARM: ixp4xx: Remove unused static map (2022-11-20 23:47:06 +0100)

----------------------------------------------------------------
IXP4xx patches for v6.2:

- Dropped the final static mappings.

- Fixed some errors in the MAINTAINERS file.

----------------------------------------------------------------
Linus Walleij (1):
      ARM: ixp4xx: Remove unused static map

Lukas Bulwahn (1):
      MAINTAINERS: adjust ARM/INTEL IXP4XX ARM ARCHITECTURE to ixp4xx clean-up

 MAINTAINERS                      |  2 --
 arch/arm/mach-ixp4xx/ixp4xx-of.c | 25 ++++---------------------
 2 files changed, 4 insertions(+), 23 deletions(-)
