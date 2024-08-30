Return-Path: <SRS0=Rehj=P5=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE223CA0FF5
	for <soc@archiver.kernel.org>; Fri, 30 Aug 2024 13:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7EAB4C4CEC9; Fri, 30 Aug 2024 13:49:06 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 461D8C4CED1
	for <soc@kernel.org>; Fri, 30 Aug 2024 13:49:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 461D8C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5334b0e1a8eso2423999e87.0
        for <soc@kernel.org>; Fri, 30 Aug 2024 06:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725025743; x=1725630543; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LETBKrNTMx/qRYGsYwmTT2y35IIkSX7YPBVTINMNG0w=;
        b=vRdJccW9LQZs3jKDmsQNlx6PRXIq0fkZ9Vb+DGngOKDZm/S+HgP908IqzLHnGVrJu5
         BFZcH0vw9kz3ykXRAymN5wYVmnPhU/C9KEVK5W0iq34GueUiV7OYUwazINVHvla+HFWA
         NubIz9UxenuGCyfp+CH5Jpz/K52GBRB1Li7zwLRkiu9x5mNwQmL7CphHKeG0zanLLLUE
         J2htHFedkHf4kQzYLjPN8Ev6/IcCP+y0ARcGheKcnzMngOmkitx8DFcpIqgYehde18bN
         +asFp+q2r8m336ZHnd1m/+b4avY43A4pbA8bQTTaIRwo/OP14XjMHt18NYRh1vcBSjnd
         E4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725025743; x=1725630543;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LETBKrNTMx/qRYGsYwmTT2y35IIkSX7YPBVTINMNG0w=;
        b=sys2aToKdMtOy7j2fwQkZZVLzWRX7mQbWLLQr65j87lM9+kX/Sa1f9HzrfBGz/lot5
         06+koLxLiPBMYNcuunmknC10mrJSiSkXBut55OGySR28QXcxva7DN9TxT4rLXFmIyEmq
         Fz5ku2zWFCuvT+OidLwaQr24sfijWRVHzsCJ9MF2+SzKl5ckRBH0eOTYoJSHLPsrKU7M
         jZjMB2+LnVTtFOscna9K99LaIHgLck2fgOtXcl8Dw2p4EgYAk38tBeKCz69wRzZM6vNL
         4THA4EdNZemfLQYzLNZV4WDN+JRdeOcAX3gj1Bt2McLL6EdDIy0zCVjXyXOotFkvPs0i
         MT/w==
X-Gm-Message-State: AOJu0YwpPN3gJ4S8ojm/IgZd81+1a7+fzF/4OdjjPDnCoi1xEvMnaEIs
	2us4wES76svMeQBSsjaqdEDYzRGS2Xm85YfRF02xQWIgcBJ61TJs2STQJPKhhD06O9yq6Jbbupp
	ZcJ7/PWMSIVYc812Y7C/+HDh8tCIgkwb+nd5M0rg4s87D2k58dGM=
X-Google-Smtp-Source: AGHT+IEry4ylM+kFNI1CMFprpQIBayR0RdwoIafnCRolNtBT/ZSsiWciaMMcEsIAyNanuMEXL0QTWOqPt1CkrH60j5M=
X-Received: by 2002:a05:6512:a8c:b0:52e:9fda:f18a with SMTP id
 2adb3069b0e04-53546b8dc0cmr1568619e87.44.1725025742222; Fri, 30 Aug 2024
 06:49:02 -0700 (PDT)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 30 Aug 2024 15:48:51 +0200
Message-ID: <CACRpkda244rFHnnXPDPOhmKiJsRP08tNCcfFzpH5zR2cx1DFpw@mail.gmail.com>
Subject: [GIT PULL] Versatile SoC changes for v6.12
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi ARM SoC folks,

some nice patches from Krzysztof for v6.12, details in the
signed tag. Please pull it in!

Yours,
Linus Walleij

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
tags/versatile-soc-for-v6.12

for you to fetch changes up to 2f05726171f8d03eef58bc26b49e4994a66c0c5f:

  soc: versatile: enable compile testing (2024-08-30 15:40:11 +0200)

----------------------------------------------------------------
Some long due cleanups and modernizations of the Versatile
SoC drivers from Krzysztof:

- Put OF handle
- Use devres to avoid memory leaks
- Enable compile testing

----------------------------------------------------------------
Krzysztof Kozlowski (4):
      soc: versatile: integrator: fix OF node leak in probe() error path
      soc: versatile: realview: fix memory leak during device remove
      soc: versatile: realview: fix soc_dev leak during device remove
      soc: versatile: enable compile testing

 drivers/soc/Makefile                   |  2 +-
 drivers/soc/versatile/Kconfig          |  4 ++--
 drivers/soc/versatile/soc-integrator.c |  1 +
 drivers/soc/versatile/soc-realview.c   | 20 ++++++++++++++++----
 4 files changed, 20 insertions(+), 7 deletions(-)
