Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BDA315772
	for <soc@lists.linux.dev>; Thu, 28 Aug 2025 18:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756407162; cv=none; b=rnHJ0c/LAoN/+BJ/YF88uUcUaGXFl4tfDZ1wUmKmuhNwJxLYC60Kc8JsngIHkz54O9U73+TatJaIuNaUBIUwUKhByQ4yAk3K32MqRinidBwszYFCyU/7TqzH7HspZvUhdCd4HJEdAdSSZaI47IeaE1czs8HSTMO33E/p8avkbd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756407162; c=relaxed/simple;
	bh=f6iClZMo1Awkj9nM7rVP3osja0R7sgrBDFMdGTnjrdo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ctAxNrEHXWIfIfncBTlq8/y9oT7O9nmMis/ixfftbRjjXMCVduOdlAl/Bt2YIfwnNy7GxHoOpzKevKlMOlYD7ymfFPX/LVZi9rqpAYcETGTJg/SZ64vJ0DdZ2JI43alBiUl1oU8juHqH0sBaSSttUVAROVvdN4YmCiYYc6rVhWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d8YJhAXz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d8YJhAXz"
Received: by smtp.kernel.org (Postfix)
	id 720A2C4CEF4; Thu, 28 Aug 2025 18:52:42 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7FA11C4CEED
	for <soc@kernel.org>; Thu, 28 Aug 2025 18:52:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7FA11C4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55f48d61ea2so1677784e87.1
        for <soc@kernel.org>; Thu, 28 Aug 2025 11:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756407159; x=1757011959; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+Y+IcKar04FZc1GFw8b9dtYgfURpAIh1uHn9Vk64dg0=;
        b=d8YJhAXzTaqSVbWOxErmxn4OQjnRDs9yL5hPmjzK3t15G0sHl1hy8geyKjmTbJsODD
         uG05cp1FGgfq+O7n3DHLIA7U+W1pV9dUkMsByK7L1xFqsaLCvHFppB6AQ8tQbH3pin4A
         PAipyoshXzr72zFZFmMhfron2FiAiK+iw1KIgOsjDRT1M+dgXFral//f1gxMvHzc4hqY
         IHBD7yzBsGkQuRCl47HtfX7Tjbh7nARwFFMxFTx4bczXLrpOi1K6qEtxmfyY5ZqbJSW6
         k4NA6/xXvT3xQO7VdF0zPiD/EqKhNpgiNSWmrLMZlTsYKxw3eAhsmtJyIXkH4IbmgNhO
         +5jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756407159; x=1757011959;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Y+IcKar04FZc1GFw8b9dtYgfURpAIh1uHn9Vk64dg0=;
        b=lNbdpgXC5IXl8rGXXnqsHC6O6jmlKEry4ZNYh41bZDeYpXQWsGIHczEoK2qiRjCdxm
         MG1/td+xQ3Iqr+FRyaiDfh8MMROczlYAG3U/K18ND+ABhhs5Qk43J0SLQunvtVqdMtJv
         fLQvoyLXmF/Q9uqBqFt4oLooQwXpVLcma5CT3Ysht9iXe4nJWW5INhhq892Pz3lgTQtG
         stkhnBoByegLoiwRgCvxZa/TYDyxHUX5AvvU1u1J8+bC6b+UbeUaQrv8vx38AxOkRuLt
         FspdYmy/x4rS48Bz4RnlSUTgWEJX5LKXKvWPgd6swwZLiOPr0zeigEja3JajbgDUN0Sp
         E1Hw==
X-Gm-Message-State: AOJu0YzH+lDVsZuF1GlGif/X4b7tiCa9vrJ5TUn8GYzvJ2CE5DvF6YOW
	UdVi2zZmbDFadNe4elIcWOnCKTvrsIVFnptLcJlSbyBN0EKFSL75nN1YMi6blxLeul/rQsAgra0
	lthBLDyP27Fn0ugFJwdlQ4M8/dvPyJJTB7EU12o4lf/3hII3w4L44PWo=
X-Gm-Gg: ASbGnctaowL8WWqLRzuGiJ7Ats+ieYuiojK65JEjpT7E5ucfvzDzoflED0YuL4g44c7
	vQmX1+tTxQquJBagSSC2zCNUwfWVfapXuMeDMhlK3Mfa4x9SUDDsYRhMmgwZKILa5XBslovPpEz
	Kd0l8j/TTQ4TvLOPsNj3Uh266zcT9b5H+LT7ZmVWeG3XuK8K8vL3tYbmgQQOEZXxSJGAes+eeDA
	uINWh8Y2ZXaziVLaQ==
X-Google-Smtp-Source: AGHT+IEx3UntxBHvCtJM2iUoHNvbw7GSdp/b9rbJWabNIOs/rkdaufeKCKc3tzall8DSDrchtTbnG7iUoYBG9KgSc3k=
X-Received: by 2002:a05:6512:6282:b0:55f:4953:ae91 with SMTP id
 2adb3069b0e04-55f4953b230mr4834573e87.5.1756407159136; Thu, 28 Aug 2025
 11:52:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 20:52:27 +0200
X-Gm-Features: Ac12FXzN6CxVJT1Mqe_grYO8bbFDfmy1_1T7RUN8NAobiy7Zt2q_nB-I99oG-h4
Message-ID: <CACRpkdaGWVe7TNVz_L=gFh3AfzqnEq4rrOLo8x6gXUORA+MMpw@mail.gmail.com>
Subject: [GIT PULL] Ux500 DTS changes for v6.18
To: SoC Team <soc@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Two minor Ux500 DTS fixes from my git, details in
the changed tag.

Please pull them in!

Yours,
Linus Walleij

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-dts-v6.18

for you to fetch changes up to 9c66753641765cc2f5ee1528a23f3fd2fd77cb93:

  ARM: dts: ste-ux500-samsung: dts bluetooth wakeup interrupt
(2025-08-28 20:39:17 +0200)

----------------------------------------------------------------
Ux500 DTS changes for v6.18

- Fix a GPIO hog name.

- Move custom wakeup GPIO to a proper GPIO IRQ
  line rising edge wakeup.

----------------------------------------------------------------
Alex Tran (1):
      ARM: dts: ste-ux500-samsung: dts bluetooth wakeup interrupt

Krzysztof Kozlowski (1):
      ARM: dts: st: ste-nomadik: Align GPIO hog name with bindings

 arch/arm/boot/dts/st/ste-nomadik-s8815.dts            | 2 +-
 arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dts | 5 +++--
 arch/arm/boot/dts/st/ste-ux500-samsung-codina.dts     | 5 +++--
 arch/arm/boot/dts/st/ste-ux500-samsung-janice.dts     | 5 +++--
 4 files changed, 10 insertions(+), 7 deletions(-)
